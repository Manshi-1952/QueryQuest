<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="/css/reset-pass.css">
  <title>Query Quest - Reset Password</title>
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
  <h2>Reset Password</h2>
  <form action="reset-password" method="post">
    <input type="hidden" name="token" value="<%= request.getParameter("token") %>">
    <label for="password">New Password:</label>
    <input type="password" id="password" name="password" required><br>
    <label for="confirm-password">Confirm Password:</label>
    <input type="password" id="confirm-password" name="confirmPassword" required><br>
    <button type="submit">Reset Password</button>
    <% if (request.getParameter("error") != null) { %>
    <div class="error-message"><%= request.getParameter("error") %></div>
    <% } %>
  </form>
</div>

<div class="footer">
  <p style="color: #aaa; font-size: 12px;margin-top: 20px;">&copy; 2024 Query Quest. All rights reserved.</p>
</div>

</body>
</html>
