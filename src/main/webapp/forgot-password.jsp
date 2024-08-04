<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Query Quest - Forgot Password</title>
    <style>
        .error-message {
            color: red;
        }
    </style>
</head>
<body>
<nav>
    <div class="container">
        <div class="logo">
            <a href="index.jsp"><i>Query Quest</i></a>
        </div>
        <ul class="nav-links">
            <li><a href="questions.jsp">Questions</a></li>
            <li><a href="articles.jsp">Articles</a></li>
            <li><a href="register.jsp">Register</a></li>
        </ul>
    </div>
</nav>

<h2>Forgot Password</h2>
<form action="send-reset-link" method="post">
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required><br>
    <button type="submit">Send Reset Link</button>
    <% if (request.getParameter("error") != null) { %>
    <div class="error-message"><%= request.getParameter("error") %></div>
    <% } %>
</form>

<footer>
    <div class="container">
        <p>&copy; 2024 Query Quest. All rights reserved.</p>
    </div>
</footer>
</body>
</html>
