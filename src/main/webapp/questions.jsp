<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@ page import="java.util.List" %>

<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/question.css">
    <title>Query Quest</title>
    <style>

    </style>
</head>
<body>
<header>
    <nav class="navbar">
        <a href="index.jsp" class="nav-logo"><b><i>Query Quest</i></b></a>
        <ul class="nav-menu">
            <li class="nav-item">
                <a href="profile.jsp" class="nav-link">Hi, <%= session.getAttribute("username") != null ? session.getAttribute("username") : "User" %></a>
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
    <div class="sub">
        <div class="sub-nav">
            <h2 style="padding: 10px 20px 10px 5px;">All Questions</h2>
            <a href="ask-question.jsp" class="button">Ask a question</a>
        </div>
        <%
            // Database connection
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/QueryQuest", "root", "0409");

                String sql = "SELECT q.*, u.username FROM Questions q JOIN Users u ON q.user_id = u.id ORDER BY q.date_posted DESC, q.time_posted DESC";
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();

                while (rs.next()) {
                    int questionId = rs.getInt("question_id");
                    String title = rs.getString("title");
                    String description = rs.getString("description");
                    Date datePosted = rs.getDate("date_posted");
                    Time timePosted = rs.getTime("time_posted");
                    String postedBy = rs.getString("username"); // Retrieve the username from the result set
                    String category = rs.getString("category");
        %>
        <div class="card">
            <div class="card-header">
                <%= title %>
            </div>
            <div class="card-body">
                <p><%= description %></p>
            </div>
            <div class="card-footer">
                <span>posted by: <i><%= postedBy %></i></span> |
                <span>Category: <%= category %></span> |
                <span>Posted on <%= datePosted %> at <%= timePosted %></span>
            </div>
        </div>
        <%
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        %>
        <p>Error retrieving questions: <%= e.getMessage() %></p>
        <%
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
    </div>
</main>
<footer>
    <p>&copy; 2024 Query Quest. All rights reserved.</p>
</footer>
<script>
    const hamburger = document.querySelector(".hamburger");
    const navMenu = document.querySelector(".nav-menu");

    hamburger.addEventListener("click", mobileMenu);

    function mobileMenu() {
        hamburger.classList.toggle("active");
        navMenu.classList.toggle("active");
    }

    const navLink = document.querySelectorAll(".nav-link");

    navLink.forEach(n => n.addEventListener("click", closeMenu));

    function closeMenu() {
        hamburger.classList.remove("active");
        navMenu.classList.remove("active");
    }
</script>
</body>
</html>
