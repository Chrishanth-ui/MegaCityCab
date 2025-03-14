package com.cabbooking.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import com.cabbooking.utils.DatabaseConnection;
import javax.servlet.http.HttpServletRequest;


@WebServlet("/CancelBookingServlet")
public class CancelBookingServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Connection conn = DatabaseConnection.getInstance().getConnection();
            String sql = "DELETE FROM bookings WHERE status = 'Pending' ORDER BY id DESC LIMIT 1";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.executeUpdate();
            stmt.close();

            response.sendRedirect("booking.jsp?message=Booking cancelled successfully.");
        } catch (SQLException e) {
            response.getWriter().println("Database error: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
