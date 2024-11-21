package com.queryquest.servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/reset-password")
public class ResetPasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String token = request.getParameter("token");
        String newPassword = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!newPassword.equals(confirmPassword)) {
            response.sendRedirect("reset-password.jsp?token=" + token + "&error=Passwords do not match");
            return;
        }

        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/QueryQuest", "root", "0409");

            String sql = "SELECT * FROM Users WHERE reset_token = ? AND reset_token_expiry > NOW()";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, token);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                sql = "UPDATE Users SET password = ?, reset_token = NULL, reset_token_expiry = NULL WHERE reset_token = ?";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, newPassword);
                preparedStatement.setString(2, token);
                preparedStatement.executeUpdate();

                response.sendRedirect("login.jsp?message=Password reset successful. Please log in.");
            } else {
                response.sendRedirect("reset-password.jsp?token=" + token + "&error=Invalid or expired token");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("reset-password.jsp?token=" + token + "&error=An error occurred. Please try again.");
        } finally {
            try {
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
