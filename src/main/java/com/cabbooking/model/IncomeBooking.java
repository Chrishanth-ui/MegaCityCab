package com.cabbooking.model;

import java.math.BigDecimal;

public class IncomeBooking {
    private int bookingId;
    private String customerName;
    private String pickupLocation;
    private String dropLocation;
    private BigDecimal fare;
    private String status;
    private String driverName;
    private String vehicleNo;

    // Constructor
    public IncomeBooking(int bookingId, String customerName, String pickupLocation, 
                         String dropLocation, BigDecimal fare, String status, 
                         String driverName, String vehicleNo) {
        this.bookingId = bookingId;
        this.customerName = customerName;
        this.pickupLocation = pickupLocation;
        this.dropLocation = dropLocation;
        this.fare = fare;
        this.status = status;
        this.driverName = driverName;
        this.vehicleNo = vehicleNo;
    }

    // Getters
    public int getBookingId() {
        return bookingId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public String getPickupLocation() {
        return pickupLocation;
    }

    public String getDropLocation() {
        return dropLocation;
    }

    public BigDecimal getFare() {
        return fare;
    }

    public String getStatus() {
        return status;
    }

    public String getDriverName() {
        return driverName;
    }

    public String getVehicleNo() {
        return vehicleNo;
    }
}
