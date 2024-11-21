/*
package com.queryquest.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Time;
import java.util.Calendar;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.queryquest.util.DBUtil;

@WebServlet("/AskQuestionServlet")
public class AskQuestionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("user_id"); // Get the user ID from session

        System.out.println("User ID from session: " + userId); // Debug line

        if (userId == null) {
            response.sendRedirect("login.jsp"); // Redirect to login if not logged in
            return;
        }

        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String category = "General"; // Default category or handle as needed

        // Get current date and time
        Calendar now = Calendar.getInstance();
        Date datePosted = new Date(now.getTimeInMillis());
        Time timePosted = new Time(now.getTimeInMillis());

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DBUtil.getConnection(); // Get database connection
            String sql = "INSERT INTO Questions (user_id, title, description, category, date_posted, time_posted) VALUES (?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userId);
            pstmt.setString(2, title);
            pstmt.setString(3, description);
            pstmt.setString(4, category);
            pstmt.setDate(5, datePosted);
            pstmt.setTime(6, timePosted);

            int result = pstmt.executeUpdate();

            if (result > 0) {
                response.sendRedirect("questions.jsp"); // Redirect to questions page on success
            } else {
                request.setAttribute("errorMessage", "Failed to post question. Please try again.");
                request.getRequestDispatcher("ask-question.jsp").forward(request, response); // Forward to the form page with error
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("ask-question.jsp").forward(request, response); // Forward to the form page with error
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

*/


package com.queryquest.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Time;
import java.util.Calendar;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.queryquest.util.DBUtil;

@WebServlet("/AskQuestionServlet")
public class AskQuestionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("user_id"); // Get the user ID from session

        System.out.println("User ID from session: " + userId); // Debug line

        if (userId == null) {
            response.sendRedirect("login.jsp"); // Redirect to login if not logged in
            return;
        }

        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String category = "General"; // Default category or handle as needed

        // Get current date and time
        Calendar now = Calendar.getInstance();
        Date datePosted = new Date(now.getTimeInMillis());
        Time timePosted = new Time(now.getTimeInMillis());

        Connection conn = null;
        PreparedStatement pstmt = null;
        PreparedStatement updatePstmt = null;

        try {
            conn = DBUtil.getConnection(); // Get database connection
            conn.setAutoCommit(false); // Start transaction

            // Insert the question
            String sql = "INSERT INTO Questions (user_id, title, description, category, date_posted, time_posted) VALUES (?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userId);
            pstmt.setString(2, title);
            pstmt.setString(3, description);
            pstmt.setString(4, category);
            pstmt.setDate(5, datePosted);
            pstmt.setTime(6, timePosted);

            int result = pstmt.executeUpdate();

            if (result > 0) {
                // Increment the questions_asked_count
                String updateSql = "UPDATE Users SET questions_asked_count = questions_asked_count + 1 WHERE id = ?";
                updatePstmt = conn.prepareStatement(updateSql);
                updatePstmt.setInt(1, userId);
                updatePstmt.executeUpdate();

                conn.commit(); // Commit transaction

                response.sendRedirect("questions.jsp"); // Redirect to questions page on success
            } else {
                conn.rollback(); // Rollback transaction in case of failure
                request.setAttribute("errorMessage", "Failed to post question. Please try again.");
                request.getRequestDispatcher("ask-question.jsp").forward(request, response); // Forward to the form page with error
            }
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                if (conn != null) conn.rollback(); // Rollback transaction in case of exception
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("ask-question.jsp").forward(request, response); // Forward to the form page with error
        } finally {
            try {
                if (updatePstmt != null) updatePstmt.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
