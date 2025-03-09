package com.example.flightbookingmanagement.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class PaymentInfoDTO {
    private String flight_code, departure_location, arrival_location;
    private Timestamp booking_date;
    private Date travel_date;
    private Integer price;

    public PaymentInfoDTO() {
    }

    public PaymentInfoDTO(String flight_code, String departure_location, String arrival_location, Timestamp booking_date, Date travel_date, Integer price) {
        this.flight_code = flight_code;
        this.departure_location = departure_location;
        this.arrival_location = arrival_location;
        this.booking_date = booking_date;
        this.travel_date = travel_date;
        this.price = price;
    }

    public String getFlight_code() {
        return flight_code;
    }

    public void setFlight_code(String flight_code) {
        this.flight_code = flight_code;
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

    public Timestamp getBooking_date() {
        return booking_date;
    }

    public void setBooking_date(Timestamp booking_date) {
        this.booking_date = booking_date;
    }

    public Date getTravel_date() {
        return travel_date;
    }

    public void setTravel_date(Date travel_date) {
        this.travel_date = travel_date;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }
}
