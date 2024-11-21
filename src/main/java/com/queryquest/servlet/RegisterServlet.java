package com.queryquest.servlet;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private String url = "jdbc:mysql://localhost:3306/QueryQuest?useSSL=false&serverTimezone=UTC";
    private String user = "root";
    private String pwd = "0409";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String contact = request.getParameter("contact");
        String terms = request.getParameter("terms");

        if (terms == null) {
            request.setAttribute("errorMessage", "You must agree to the Terms & Conditions and Privacy Policy.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection connection = DriverManager.getConnection(url, user, pwd)) {
                // Check if email or contact already exists
                String checkQuery = "SELECT COUNT(*) FROM Users WHERE email = ? OR contact = ?";
                try (PreparedStatement checkStmt = connection.prepareStatement(checkQuery)) {
                    checkStmt.setString(1, email);
                    checkStmt.setString(2, contact);
                    ResultSet rs = checkStmt.executeQuery();
                    rs.next();
                    int count = rs.getInt(1);

                    if (count > 0) {
                        request.setAttribute("errorMessage", "User already exists with given details. Try logging in.");
                        request.getRequestDispatcher("register.jsp").forward(request, response);
                        return;
                    }

                    String insertQuery = "INSERT INTO Users (username, password, email, contact) VALUES (?, ?, ?, ?)";
                    try (PreparedStatement insertStmt = connection.prepareStatement(insertQuery)) {
                        insertStmt.setString(1, username);
                        insertStmt.setString(2, password);
                        insertStmt.setString(3, email);
                        insertStmt.setString(4, contact);

                        int rowsInserted = insertStmt.executeUpdate();
                        if (rowsInserted > 0) {
                            response.sendRedirect("login.jsp?message=Registration successful. Please log in.");
                        } else {
                            request.setAttribute("errorMessage", "Registration failed. Please try again.");
                            request.getRequestDispatcher("register.jsp").forward(request, response);
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Registration failed. Please try again.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}
