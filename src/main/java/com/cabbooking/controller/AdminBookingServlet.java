package com.cabbooking.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.cabbooking.utils.DatabaseConnection;
import com.cabbooking.model.Booking;

@WebServlet("/AdminBookingServlet")
public class AdminBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Booking> bookings = new ArrayList<>();

        try {
            Connection conn = DatabaseConnection.getInstance().getConnection();
            String sql = "SELECT b.id AS booking_id, c.name AS customer_name, c.phone AS customer_phone, " +
                         "b.pickup_location, b.drop_location, b.fare, b.status, " +
                         "d.name AS driver_name, d.phone AS driver_phone, d.vehicle_no " +
                         "FROM bookings b " +
                         "LEFT JOIN customers c ON b.customer_id = c.id " +
                         "LEFT JOIN drivers d ON b.driver_id = d.id";

            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Booking booking = new Booking(
                    rs.getInt("booking_id"),
                    rs.getString("customer_name"),
                    rs.getString("customer_phone"),
                    rs.getString("pickup_location"),
                    rs.getString("drop_location"),
                    rs.getBigDecimal("fare"),
                    rs.getString("status"),
                    rs.getString("driver_name"),
                    rs.getString("driver_phone"),
                    rs.getString("vehicle_no")
                );
                bookings.add(booking);
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("bookings", bookings);
        request.getRequestDispatcher("admin-bookings.jsp").forward(request, response);
    }
}
