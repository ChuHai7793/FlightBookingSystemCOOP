package com.example.flightbookingmanagement.dto;

public class SearchedTicketDTO {

    private String airlineName,flight_code,flight_time,price;


    public SearchedTicketDTO() {
    }

    public SearchedTicketDTO(String airlineName, String flight_code, String flight_time, String price) {
        this.airlineName = airlineName;
        this.flight_code = flight_code;
        this.flight_time = flight_time;
        this.price = price;
    }

    public String getAirlineName() {
        return airlineName;
    }

    public void setAirlineName(String airlineName) {
        this.airlineName = airlineName;
    }

    public String getFlight_code() {
        return flight_code;
    }

    public void setFlight_code(String flight_code) {
        this.flight_code = flight_code;
    }

    public String getFlight_time() {
        return flight_time;
    }

    public void setFlight_time(String flight_time) {
        this.flight_time = flight_time;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }
}
