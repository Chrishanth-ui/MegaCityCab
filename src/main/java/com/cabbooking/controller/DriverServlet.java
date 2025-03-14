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

@WebServlet("/DriverServlet")
public class DriverServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            addDriver(request, response);
        } else if ("edit".equals(action)) {
            editDriver(request, response);
        } else if ("delete".equals(action)) {
            deleteDriver(request, response);
        }
    }

    private void addDriver(HttpServletRequest request, HttpServletResponse response) throws IOException {
        saveOrUpdateDriver(request, response, false);
    }

    private void editDriver(HttpServletRequest request, HttpServletResponse response) throws IOException {
        saveOrUpdateDriver(request, response, true);
    }

    private void deleteDriver(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        try {
            Connection conn = DatabaseConnection.getInstance().getConnection();
            String sql = "DELETE FROM drivers WHERE id=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("drivers.jsp");
    }

    private void saveOrUpdateDriver(HttpServletRequest request, HttpServletResponse response, boolean isEdit)
            throws IOException {
        int id = isEdit ? Integer.parseInt(request.getParameter("id")) : -1;
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String vehicleNo = request.getParameter("vehicle_no");
        String status = request.getParameter("status");
        String vehicleType = request.getParameter("vehicle_type");
        String model = request.getParameter("model");
        int seats = Integer.parseInt(request.getParameter("number_of_seats"));

        try {
            Connection conn = DatabaseConnection.getInstance().getConnection();
            String sql = isEdit
                    ? "UPDATE drivers SET name=?, phone=?, vehicle_no=?, status=?, vehicle_type=?, model=?, number_of_seats=? WHERE id=?"
                    : "INSERT INTO drivers (name, phone, vehicle_no, status, vehicle_type, model, number_of_seats) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, name);
            stmt.setString(2, phone);
            stmt.setString(3, vehicleNo);
            stmt.setString(4, status);
            stmt.setString(5, vehicleType);
            stmt.setString(6, model);
            stmt.setInt(7, seats);

            if (isEdit) stmt.setInt(8, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("drivers.jsp");
    }
}
