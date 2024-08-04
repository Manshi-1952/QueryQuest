<%--
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>

<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

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
            <li><a href="questions.jsp">Questions</a></li>
            <li><a href="articles.jsp">Articles</a></li>
            <li><a href="logout.jsp">Logout</a></li>
        </ul>
    </div>
</nav>

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
</html>
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>

<%
//    HttpSession session = request.getSession();
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

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
            <li><a href="questions.jsp">Questions</a></li>
            <li><a href="articles.jsp">Articles</a></li>
            <!-- Display username link -->
            <li><a href="profile.jsp">Hi, <%= username %></a></li>
            <li><a href="logout.jsp">Logout</a></li>
        </ul>
    </div>
</nav>

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
</html>
