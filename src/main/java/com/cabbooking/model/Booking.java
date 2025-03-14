package com.cabbooking.model;

import java.math.BigDecimal;

public class Booking {
    private int id;
    private String customerName;
    private String customerPhone;
    private String pickupLocation;
    private String dropLocation;
    private BigDecimal fare;
    private String status;
    private String driverName;
    private String driverPhone;
    private String vehicleNo;

    public Booking(int id, String customerName, String customerPhone, String pickupLocation,
                   String dropLocation, BigDecimal fare, String status, 
                   String driverName, String driverPhone, String vehicleNo) {
        this.id = id;
        this.customerName = customerName;
        this.customerPhone = customerPhone;
        this.pickupLocation = pickupLocation;
        this.dropLocation = dropLocation;
        this.fare = fare;
        this.status = status;
        this.driverName = driverName;
        this.driverPhone = driverPhone;
        this.vehicleNo = vehicleNo;
    }

    public int getId() {
        return id;
    }

    public String getCustomerName() {
        return customerName;
    }

    public String getCustomerPhone() {
        return customerPhone;
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

    public String getDriverPhone() {
        return driverPhone;
    }

    public String getVehicleNo() {
        return vehicleNo;
    }
}
