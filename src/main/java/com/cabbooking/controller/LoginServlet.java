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

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = AuthUtils.loginUser(username, password);

        if (user != null && !"admin".equals(user.getRole())) { // Ensure normal users only
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            response.sendRedirect("index.jsp"); // Redirect to Home Page
        } else {
            response.sendRedirect("login.jsp?error=Invalid username or password");
        }
    }
}
