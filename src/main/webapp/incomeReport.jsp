<%@ page import="java.util.List" %>
<%@ page import="com.cabbooking.model.IncomeBooking" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Income Report</title>
    <link rel="stylesheet" href="../adminAssets/style.css">
</head>
<body>
    <h1>Income Report</h1>

    <table border="1" width="100%">
        <tr>
            <th>Booking ID</th>
            <th>Customer Name</th>
            <th>Pickup Location</th>
            <th>Drop Location</th>
            <th>Fare</th>
            <th>Status</th>
            <th>Driver Name</th>
            <th>Vehicle No</th>
        </tr>

        <%
            List<IncomeBooking> incomeReport = (List<IncomeBooking>) request.getAttribute("incomeReport");
            double totalIncome = 0;

            if (incomeReport != null) {
                for (IncomeBooking booking : incomeReport) {
                    totalIncome += booking.getFare().doubleValue();
        %>
            <tr>
                <td><%= booking.getBookingId() %></td>
                <td><%= booking.getCustomerName() %></td>
                <td><%= booking.getPickupLocation() %></td>
                <td><%= booking.getDropLocation() %></td>
                <td>₹<%= booking.getFare() %></td>
                <td><%= booking.getStatus() %></td>
                <td><%= booking.getDriverName() %></td>
                <td><%= booking.getVehicleNo() %></td>
            </tr>
        <%
                }
            }
        %>

        <!-- Total Income Row -->
        <tr>
            <td colspan="4" align="right"><b>Total Income:</b></td>
            <td colspan="4"><b>₹<%= totalIncome %></b></td>
        </tr>
    </table>

</body>
</html>
