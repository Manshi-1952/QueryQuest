
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.queryquest.util.DBUtil" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/profile.css">
    <title>Query Quest - Profile</title>

    <style>

    </style>
</head>
<body>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<header>
    <nav class="navbar">

        <a href="index.jsp" class="nav-logo"><b><i>Query Quest</i></b></a>
        <ul class="nav-menu">
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

<div class="container">
    <h1>Query Quest!</h1>
    <p>Your go-to place to ask questions and share knowledge</p>
</div>


<div class="main">
    <div class="left-column">
        <h2 class="greeting" style="margin-bottom: 10px"></h2>
        <!-- User Info Section -->
        <section id="user-info">
            <hr/>
            <h3 style="margin-bottom: 10px">User Info:</h3>
            <%
                Connection connection = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;

                int questionsAskedCount = 0;
                try {
                    connection = DBUtil.getConnection(); // Use DBUtil to get the connection
                    String query = "SELECT username, email, contact, questions_asked_count FROM Users WHERE username = ?";
                    stmt = connection.prepareStatement(query);
                    stmt.setString(1, username);
                    rs = stmt.executeQuery();

                    if (rs.next()) {
                        String email = rs.getString("email");
                        String contact = rs.getString("contact");
                        questionsAskedCount = rs.getInt("questions_asked_count");
            %>

            <p><b>Username:</b> <%=username%></p>
            <p><b>Email:</b> <%=email%></p>
            <p><b>Contact:</b> <%=contact%></p>

            <%
                    } else {
                        System.out.println("User not found.");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    System.out.println("An error occurred while retrieving user information.");
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (connection != null) connection.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
            <hr/>
        </section>

        <!-- User Activity Section -->
        <section id="user-activity">
            <h3 style="margin-bottom: 10px">User Activity:</h3>
            <p><b>Questions Asked:</b> <%=questionsAskedCount%></p>
            <p><b>Answers Provided:</b> 0</p>
            <p><b>Articles Posted:</b> 0</p>
        </section>
    </div>

    <div class="right-column">
        <h3 style="margin-bottom: 10px">Questions Asked:</h3>
        <ul>
            <li>Sample Question 1</li>
            <li>Sample Question 2</li>
            <li>Sample Question 3</li>
        </ul>
    </div>
</div>

<%--<div class="footer">--%>
<%--    <p>&copy; 2024 Query Quest. All rights reserved.</p>--%>
<%--</div>--%>

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

    window.onload = function() {
        const greeting = document.querySelector('.greeting');
        const currentHour = new Date().getHours();
        let message = 'Welcome';
        if (currentHour < 12) {
            message = 'Good Morning';
        } else if (currentHour < 18) {
            message = 'Good Afternoon';
        } else {
            message = 'Good Evening';
        }
        greeting.textContent = `${message}, <%=username%>!`;

    };
</script>
</body>
</html>

