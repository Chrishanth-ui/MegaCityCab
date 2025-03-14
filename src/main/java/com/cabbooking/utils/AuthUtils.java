package com.cabbooking.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.cabbooking.model.User;
import com.cabbooking.utils.DatabaseConnection;
import org.mindrot.jbcrypt.BCrypt;

public class AuthUtils {

    private static Connection connection = DatabaseConnection.getInstance().getConnection();

    // Register User Function (Modified to prevent duplicate usernames)
    public static boolean registerUser(String username, String password, String role, String name, String number) {
        try {
            // Check if username exists
            String checkUserSql = "SELECT * FROM users WHERE username=?";
            PreparedStatement checkStmt = connection.prepareStatement(checkUserSql);
            checkStmt.setString(1, username);
            ResultSet rs = checkStmt.executeQuery();
            if (rs.next()) {
                return false; // User already exists
            }

            // Hash the password
            String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt(12));

            // Insert new user
            String sql = "INSERT INTO users (username, password, role, mobile_number, name) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, hashedPassword);
            stmt.setString(3, role);
            stmt.setString(4, name);
            stmt.setString(5, number);
            return stmt.executeUpdate() > 0; 
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Login Function with Admin Role Check
    public static User loginUser(String username, String password) {
        User user = null;
        try {
            String sql = "SELECT * FROM users WHERE username=?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String storedHashedPassword = rs.getString("password");
                if (BCrypt.checkpw(password, storedHashedPassword)) {
                    user = new User(rs.getInt("id"), rs.getString("username"), rs.getString("role"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}
