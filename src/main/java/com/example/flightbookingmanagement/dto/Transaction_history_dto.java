package com.example.flightbookingmanagement.dto;

public class Transaction_history_dto {

    private String departure_location, arrival_location,booking_date,travel_date,price,status;


    public Transaction_history_dto() {
    }

    public Transaction_history_dto(String departure_location, String arrival_location, String booking_date, String travel_date, String price, String status) {
        this.departure_location = departure_location;
        this.arrival_location = arrival_location;
        this.booking_date = booking_date;
        this.travel_date = travel_date;
        this.price = price;
        this.status = status;
    }

    public String getDeparture_location() {
        return departure_location;
    }

    public void setDeparture_location(String departure_location) {
        this.departure_location = departure_location;
    }

    public String getArrival_location() {
        return arrival_location;
    }

    public void setArrival_location(String arrival_location) {
        this.arrival_location = arrival_location;
    }

    public String getBooking_date() {
        return booking_date;
    }

    public void setBooking_date(String booking_date) {
        this.booking_date = booking_date;
    }

    public String getTravel_date() {
        return travel_date;
    }

    public void setTravel_date(String travel_date) {
        this.travel_date = travel_date;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
