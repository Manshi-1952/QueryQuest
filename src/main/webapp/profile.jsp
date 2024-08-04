<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Query Quest - Profile</title>
    <link rel="stylesheet" type="text/css" href="css/profile.css">
</head>
<body>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>


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
        <!-- Personalized greeting message -->
        <h1>Query Quest!</h1>
        <p>Your go-to place to ask questions and share knowledge</p>
    </div>
</header>


<div class="main">
    <div class="left-column">
        <h2>Hi, <%= username %>!</h2>
        <!-- User Info Section -->
        <section id="user-info">
            <hr/>
            <h3>User Info:</h3>
            <%
                String url = "jdbc:mysql://localhost:3306/QueryQuest?useSSL=false&serverTimezone=UTC";
                String dbUser = "root";
                String dbPwd = "04092002";

                try (Connection connection = DriverManager.getConnection(url, dbUser, dbPwd);
                     PreparedStatement stmt = connection.prepareStatement("SELECT username, email, contact FROM Users WHERE username = ?")) {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    stmt.setString(1, username);
                    try (ResultSet rs = stmt.executeQuery()) {
                        if (rs.next()) {
                            String email = rs.getString("email");
                            String contact = rs.getString("contact");
            %>

            <p><b>Username:</b> <%= username %></p>
            <p><b>Email:</b> <%= email %></p>
            <p><b>Contact:</b> <%= contact %></p>

            <%
                        } else {
                            out.println("User not found.");
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("An error occurred while retrieving user information.");
                }
            %>
            <hr/>
        </section>

        <!-- User Activity Section -->
        <section id="user-activity">
            <h3>User Activity:</h3>
            <p><b>Questions Asked:</b> 0</p>
            <p><b>Answers Provided:</b> 0</p>
            <p><b>Articles Posted:</b> 0</p>
        </section>
    </div>

    <div class="right-column">
        <h3>Questions Asked:</h3>
        <ul>
            <li>Sample Question 1</li>
            <li>Sample Question 2</li>
            <li>Sample Question 3</li>
        </ul>
    </div>
</div>

<footer>
    <div class="container">
        <p>&copy; 2024 Query Quest. All rights reserved.</p>
    </div>
</footer>
</body>
</html>
