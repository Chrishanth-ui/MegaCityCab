package com.cabbooking.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cabbooking.model.IncomeBooking;
import com.cabbooking.utils.DatabaseConnection;

@WebServlet("/IncomeReportServlet")
public class IncomeReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<IncomeBooking> incomeReport = new ArrayList<>();

        try {
            Connection conn = DatabaseConnection.getInstance().getConnection();

            String sql = "SELECT b.id, u.name AS customer_name, b.pickup_location, b.drop_location, " +
                         "b.fare, b.status, d.name AS driver_name, d.vehicle_no " +
                         "FROM bookings b " +
                         "JOIN users u ON b.customer_id = u.id " +
                         "JOIN drivers d ON b.driver_id = d.id " +
                         "WHERE b.status = 'Completed' AND u.role = 'customer'";

            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int bookingId = rs.getInt("id");
                String customerName = rs.getString("customer_name");
                String pickupLocation = rs.getString("pickup_location");
                String dropLocation = rs.getString("drop_location");
                BigDecimal fare = rs.getBigDecimal("fare");
                String status = rs.getString("status");
                String driverName = rs.getString("driver_name");
                String vehicleNo = rs.getString("vehicle_no");

                // Add data to IncomeBooking model
                incomeReport.add(new IncomeBooking(bookingId, customerName, pickupLocation, dropLocation, fare, status, driverName, vehicleNo));
            }

            request.setAttribute("incomeReport", incomeReport);
            RequestDispatcher dispatcher = request.getRequestDispatcher("admin/incomeReport.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
