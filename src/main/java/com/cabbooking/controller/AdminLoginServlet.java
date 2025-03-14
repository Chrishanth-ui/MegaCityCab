package com.cabbooking.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.cabbooking.utils.AuthUtils;
import com.cabbooking.model.User;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Authenticate admin user
        User user = AuthUtils.loginUser(username, password);

        if (user != null && "admin".equals(user.getRole())) {
            HttpSession session = request.getSession();
            session.setAttribute("admin", user);
            response.sendRedirect("admin-dashboard.jsp"); // Redirect to Admin Panel
        } else {
            response.sendRedirect("admin-login.jsp?error=Invalid admin credentials");
        }
    }
}
