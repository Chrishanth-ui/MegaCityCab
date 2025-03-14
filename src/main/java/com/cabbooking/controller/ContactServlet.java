package com.cabbooking.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.cabbooking.utils.DatabaseConnection;

@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Ensure request uses POST method
        if (!"POST".equalsIgnoreCase(request.getMethod())) {
            response.getWriter().write("❌ Invalid request method. Use POST.");
            return;
        }

        // Debug: Print received parameters
        System.out.println("Received request:");
        request.getParameterMap().forEach((key, value) ->
            System.out.println(key + " = " + (value.length > 0 ? value[0] : "empty"))
        );

        // Retrieve form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        // Validate form data
        if (name == null || name.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            subject == null || subject.trim().isEmpty() ||
            message == null || message.trim().isEmpty()) {
            response.getWriter().write("❌ Error: All fields are required.");
            return;
        }

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Get database connection
            conn = DatabaseConnection.getInstance().getConnection();
            if (conn == null) {
                response.getWriter().write("❌ Database connection failed!");
                return;
            }

            // Insert query
            String sql = "INSERT INTO contact_messages (name, email, subject, message) VALUES (?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, subject);
            stmt.setString(4, message);

            // Execute query
            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("✅ Data saved successfully!");
                response.sendRedirect("index.jsp");
            } else {
                response.getWriter().write("❌ Error: No data inserted.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("❌ Error saving data: " + e.getMessage());
        } finally {
            try {
                if (stmt != null) stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
