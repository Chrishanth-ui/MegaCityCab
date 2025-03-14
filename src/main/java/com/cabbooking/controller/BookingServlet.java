package com.cabbooking.controller;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.cabbooking.model.User;
import com.cabbooking.utils.DatabaseConnection;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false); // Get session if exists
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp"); // Redirect if not logged in
            return;
        }

        // Retrieve logged-in user
        User user = (User) session.getAttribute("user");
        int customerId = user.getId(); // Assuming User class has getId() method

        String pickup = request.getParameter("pickup");
        String dropoff = request.getParameter("dropoff");
        String fareStr = request.getParameter("fare");

        try {
            double fare = Double.parseDouble(fareStr);
            Connection conn = DatabaseConnection.getInstance().getConnection();

            // Get a random driver ID
            String driverQuery = "SELECT id FROM drivers ORDER BY RAND() LIMIT 1";
            PreparedStatement driverStmt = conn.prepareStatement(driverQuery);
            ResultSet driverRs = driverStmt.executeQuery();
            int driverId = 0;
            if (driverRs.next()) {
                driverId = driverRs.getInt("id");
            }
            driverRs.close();
            driverStmt.close();

            // Insert into bookings table
            String sql = "INSERT INTO bookings (customer_id, pickup_location, drop_location, fare, status, driver_id) VALUES (?, ?, ?, ?, 'Completed', ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, customerId);
            stmt.setString(2, pickup);
            stmt.setString(3, dropoff);
            stmt.setDouble(4, fare);
            stmt.setInt(5, driverId);
            stmt.executeUpdate();
            stmt.close();

            response.sendRedirect("booking-success.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Database error: " + e.getMessage());
        }
    }
}
