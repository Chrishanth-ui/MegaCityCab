<%@ page language="java" import="java.sql.*" %>
<%@ page import="com.cabbooking.utils.DatabaseConnection" %>

<html>
<head>
    <title>Database Connection Test</title>
</head>
<body>
    <h2>Testing Database Connection</h2>

    <%
        try {
            Connection conn = DatabaseConnection.getInstance().getConnection();
            if (conn != null) {
                out.println("<h3 style='color:green;'>Connection Successfully Established!</h3>");
            } else {
                out.println("<h3 style='color:red;'>Connection Failed!</h3>");
            }
        } catch (Exception e) {
            out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
            e.printStackTrace();
        }
    %>

</body>
</html>
