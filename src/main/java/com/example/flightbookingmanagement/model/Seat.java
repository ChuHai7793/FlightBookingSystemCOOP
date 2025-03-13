package com.example.flightbookingmanagement.model;

public class Seat {
    private int seatNumber;
    private String status;

    public Seat() {
    }

    public Seat(int seatNumber, String status) {
        this.seatNumber = seatNumber;
        this.status = status;
    }

    public int getSeatNumber() {
        return seatNumber;
    }

    public void setSeatNumber(int seatNumber) {
        this.seatNumber = seatNumber;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
