package com.cabbooking.model;

public class Driver {
    private int id;
    private String name;
    private String phone;
    private String vehicleNo;
    private String status;
    private String vehicleType;
    private String model;
    private int numberOfSeats;

    public Driver(int id, String name, String phone, String vehicleNo, String status, String vehicleType, String model, int numberOfSeats) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.vehicleNo = vehicleNo;
        this.status = status;
        this.vehicleType = vehicleType;
        this.model = model;
        this.numberOfSeats = numberOfSeats;
    }

    // Getters and Setters
    public int getId() { return id; }
    public String getName() { return name; }
    public String getPhone() { return phone; }
    public String getVehicleNo() { return vehicleNo; }
    public String getStatus() { return status; }
    public String getVehicleType() { return vehicleType; }
    public String getModel() { return model; }
    public int getNumberOfSeats() { return numberOfSeats; }
}
