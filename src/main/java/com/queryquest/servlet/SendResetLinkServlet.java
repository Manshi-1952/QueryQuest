package com.queryquest.servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.UUID;

@WebServlet("/send-reset-link")
public class SendResetLinkServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");

        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/QueryQuest", "root", "04092002")) {
            String sql = "SELECT * FROM Users WHERE email = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, email);
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        String token = UUID.randomUUID().toString();
                        sql = "UPDATE Users SET reset_token = ?, reset_token_expiry = DATE_ADD(NOW(), INTERVAL 1 HOUR) WHERE email = ?";
                        try (PreparedStatement updateStatement = connection.prepareStatement(sql)) {
                            updateStatement.setString(1, token);
                            updateStatement.setString(2, email);
                            updateStatement.executeUpdate();
                        }

                        // Redirect to reset password page with token as a parameter
                        String resetLink = "http://localhost:8080/reset-password.jsp?token=" + token;
                        response.sendRedirect(resetLink);
                    } else {
                        response.sendRedirect("forgot-password.jsp?error=Email not found");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("forgot-password.jsp?error=An error occurred. Please try again.");
        }
    }
}
