<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>

<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<html>
<head>
    <meta charset="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/ask-question.css">
    <title>Ask a Question - Query Quest</title>
    <style>
        .error-message {
            color: red;
            font-size: 0.9em;
            margin-top: 5px;
        }
    </style>
    <script>
        function validateForm() {
            // Clear previous error messages
            document.getElementById('title-error').textContent = "";
            document.getElementById('details-error').textContent = "";

            const titleInput = document.querySelector('#title-section input');
            const descriptionInput = document.getElementById('question-details');

            const title = titleInput.value.trim();
            const description = descriptionInput.value.trim();

            let isValid = true;

            // Validate title
            if (title === "") {
                document.getElementById('title-error').textContent = "Title cannot be empty.";
                isValid = false;
            } else {
                const titleWords = title.split(/\s+/);
                if (titleWords.length < 5) {
                    document.getElementById('title-error').textContent = "Title must have at least 5 words.";
                    isValid = false;
                } else if (!title.endsWith("?")) {
                    document.getElementById('title-error').textContent = "Title must end with a '?'.";
                    isValid = false;
                }
            }

            // Validate description
            if (description === "") {
                document.getElementById('details-error').textContent = "Description cannot be empty.";
                isValid = false;
            } else {
                const descriptionWords = description.split(/\s+/);
                if (descriptionWords.length < 8) {
                    document.getElementById('details-error').textContent = "Description must have at least 8 words.";
                    isValid = false;
                }
            }

            return isValid;
        }

        function clearForm() {
            document.querySelector('#title-section input').value = "";
            document.getElementById('question-details').value = "";
            document.getElementById('title-error').textContent = "";
            document.getElementById('details-error').textContent = "";
        }

        window.onload = function() {
            const titleInput = document.querySelector('#title-section input');
            const descriptionInput = document.getElementById('question-details');
            const discardButton = document.querySelector('.button-container button[type="button"]');


            // Remove error message on focus
            titleInput.addEventListener('focus', function() {
                document.getElementById('title-error').textContent = "";
            });

            descriptionInput.addEventListener('focus', function() {
                document.getElementById('details-error').textContent = "";
            });

            // Clear input fields on discard
            discardButton.addEventListener('click', clearForm);

        };
    </script>
</head>
<body>
<header>
    <nav class="navbar">
        <a href="index.jsp" class="nav-logo"><b><i>Query Quest</i></b></a>
        <ul class="nav-menu">
            <li class="nav-item">
                <a href="profile.jsp" class="nav-link">Hi, <%= username %></a>
            </li>
            <li class="nav-item">
                <a href="questions.jsp" class="nav-link">Questions</a>
            </li>
            <li class="nav-item">
                <a href="articles.jsp" class="nav-link">Articles</a>
            </li>
            <li class="nav-item">
                <a href="logout.jsp" class="nav-link">Logout</a>
            </li>
        </ul>
        <div class="hamburger">
            <span class="bar"></span>
            <span class="bar"></span>
            <span class="bar"></span>
        </div>
    </nav>
</header>
<main class="main">
    <div class="right sec">
        <form action="AskQuestionServlet" method="post" onsubmit="return validateForm()">
            <!-- Title Section -->
            <div class="section highlight" id="title-section">
                <h2>Title</h2>
                <p>Be specific and imagine you’re asking a question to another person.</p>
                <input type="text" name="title" placeholder="Enter your question title here">
                <div id="title-error" class="error-message"></div>
            </div>

            <!-- Details Section -->
            <div class="section disabled highlight" id="details-section">
                <h2>Details</h2>
                <p>Introduce the problem and expand on what you put in the title. Minimum 25 words.</p>
                <textarea id="question-details" name="description" rows="10" placeholder="Describe your problem here..."></textarea>
                <div id="details-error" class="error-message"></div>
            </div>

            <div class="button-container">
                <button type="button" onclick="clearForm()">Discard</button>
                <button type="submit">Post Your Question</button>
            </div>
        </form>
    </div>
</main>

<footer>
    <p>&copy; 2024 Query Quest. All rights reserved.</p>
</footer>
</body>
</html>

