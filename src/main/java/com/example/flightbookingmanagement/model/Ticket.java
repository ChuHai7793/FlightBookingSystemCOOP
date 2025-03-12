package com.example.flightbookingmanagement.model;

import java.sql.Date;

public class Ticket {

    int ticketId, userId, flightId,seat_number;
    Date travel_date;
    String status;

    public Ticket() {
    }

    public Ticket(int ticketId, int userId, int flightId, int seat_number, Date travel_date, String status) {
        this.ticketId = ticketId;
        this.userId = userId;
        this.flightId = flightId;
        this.seat_number = seat_number;
        this.travel_date = travel_date;
        this.status = status;
    }

    public int getTicketId() {
        return ticketId;
    }

    public void setTicketId(int ticketId) {
        this.ticketId = ticketId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getFlightId() {
        return flightId;
    }

    public void setFlightId(int flightId) {
        this.flightId = flightId;
    }

    public int getSeat_number() {
        return seat_number;
    }

    public void setSeat_number(int seat_number) {
        this.seat_number = seat_number;
    }

    public Date getTravel_date() {
        return travel_date;
    }

    public void setTravel_date(Date travel_date) {
        this.travel_date = travel_date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
