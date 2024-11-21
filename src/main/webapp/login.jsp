<%-- ONE
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Query Quest</title>
</head>
<body>
<nav>
    <div class="container">
        <div class="logo">
            <a href="index.jsp"><i>Query Quest</i></a>
        </div>
        <ul class="nav-links">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="questions.jsp">Questions</a></li>
            <li><a href="articles.jsp">Articles</a></li>
            <li><a href="register.jsp">Register</a></li>
        </ul>
    </div>
</nav>

<h2>Login</h2>
<form action="login" method="post">
    <input type="hidden" name="action" value="login">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required><br>
    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required><br>
    <button type="submit">Login</button>
</form>

<header class="hero">
    <div class="container">
        <h1>Welcome to Query Quest</h1>
        <p>Your go-to place to ask questions and share knowledge</p>
    </div>
</header>

<footer>
    <div class="container">
        <p>&copy; 2024 Query Quest. All rights reserved.</p>
    </div>
</footer>
</body>
</html>--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet"  href="css/login.css">
    <title>Query Quest</title>
</head>
<body>
<div class="container">
    <div class="header">
        <h1>Welcome to Query Quest</h1>
        <p>Your go-to platform for knowledge exploration</p>
    </div>

    <div class="login-form">
        <h1 class="heading">Login</h1>
        <form action="login" method="post">
            <input type="hidden" name="action" value="login">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username"
                   required>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <div id="error-message" class="error-message">

                <%= request.getParameter("error") != null ? request.getParameter("error") : "" %>
            </div>

            <button type="submit">Login</button>
        </form>

        <div class="links">
            <a href="forgot-password.jsp">Forgot Password?</a><br>
            <a href="register.jsp">Don't have an account? Register here</a>
        </div>
    </div>

</div>
<div class="footer">
    &copy; 2024 Query Quest. All rights reserved.
</div>

<script>
    function hideErrorMessage() {
        document.getElementById("error-message").style.display = "none";
    }

    document.addEventListener("DOMContentLoaded", function () {
        const inputs = document.querySelectorAll("input");
        inputs.forEach(input => {
            input.addEventListener("focus", hideErrorMessage);
        });

        // Show error message if it exists
        const errorMessage = document.getElementById("error-message");
        if (errorMessage.innerText.trim() !== "") {
            errorMessage.style.display = "block";
        }
    });
</script>
</body>


</html>
