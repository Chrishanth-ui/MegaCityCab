<%@ page language="java" %>
<%
    // Invalidate session
    session.invalidate();
    // Redirect to index.jsp
    response.sendRedirect("index.jsp");
%>
