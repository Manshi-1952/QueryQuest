<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="/css/forget-pass.css">
    <title>Query Quest - Forgot Password</title>
    <style>
        .error-message {
            color: red;
        }
    </style>
</head>
<body>
<div class="header">
    <h1>Welcome to Query Quest</h1>
    <p>Your go-to place to ask questions and share knowledge</p>
</div>

<div class="container">
    <form action="send-reset-link" method="post">
        <h2>Forgot Something?</h2>
        <p>Enter your email, and we'll send you a link to reset your password.</p>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br>
        <button type="submit">Send Reset Link</button>
        <% if (request.getParameter("error") != null) { %>
        <div class="error-message"><%= request.getParameter("error") %></div>
        <% } %>
    </form>
</div>

<div class="footer">
    <p style="font-size: 12px; color: #aaa;">&copy; 2024 Query Quest. All rights reserved.</p>
</div>

</body>
</html>
