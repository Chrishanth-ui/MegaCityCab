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

@WebServlet("/ConfirmBookingServlet")
public class ConfirmBookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String pickup = request.getParameter("pickup");
        String dropoff = request.getParameter("dropoff");
        String fareStr = request.getParameter("fare");

        System.out.println("DEBUG: Received Data - Pickup: " + pickup + ", Dropoff: " + dropoff + ", Fare: " + fareStr);

        if (pickup == null || dropoff == null || fareStr == null || pickup.isEmpty() || dropoff.isEmpty() || fareStr.isEmpty()) {
            response.getWriter().println("Error: Missing booking details.");
            return;
        }

        try {
            double fare = Double.parseDouble(fareStr);
            Connection conn = DatabaseConnection.getInstance().getConnection();

            // ✅ Ensure status updates from 'Pending' to 'Completed'
            String sql = "UPDATE bookings SET status = 'Completed' WHERE pickup_location = ? AND drop_location = ? AND fare = ? AND status = 'Pending' ORDER BY id DESC LIMIT 1";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, pickup);
            stmt.setString(2, dropoff);
            stmt.setDouble(3, fare);

            int rowsUpdated = stmt.executeUpdate();
            stmt.close();

            if (rowsUpdated > 0) {
                System.out.println("DEBUG: Booking successfully updated to Completed.");
                response.sendRedirect("booking-success.jsp");
            } else {
                System.out.println("DEBUG: No matching booking found to confirm.");
                response.getWriter().println("Error: No matching booking found. Please try again.");
            }

        } catch (SQLException e) {
            response.getWriter().println("Database error: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
