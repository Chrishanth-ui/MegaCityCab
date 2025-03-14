package com.cabbooking.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.cabbooking.utils.AuthUtils;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    
    // Handle GET requests (Redirect to register.jsp)
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("register.jsp");
    }

    // Handle POST requests for registration
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String number = request.getParameter("mobileNumber");
        String role = "customer"; // Default role is customer

        boolean isRegistered = AuthUtils.registerUser(username, password, role, name, number);

        if (isRegistered) {
            response.sendRedirect("login.jsp?success=Account created successfully. Please log in.");
        } else {
            response.sendRedirect("register.jsp?error=Registration failed. Try again.");
        }
    }
}
