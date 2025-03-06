package com.example.flightbookingmanagement.dto;

public class SearchedTicketFormDTO {
    private String ticket_type,departure_location,arrival_location,leaving_date,adult_num,kid_num,baby_num;


    public SearchedTicketFormDTO() {
    }

    public SearchedTicketFormDTO(String ticket_type, String departure_location,
                                 String arrival_location, String leaving_date, String adult_num,
                                 String kid_num, String baby_num) {
        this.ticket_type = ticket_type;
        this.departure_location = departure_location;
        this.arrival_location = arrival_location;
        this.leaving_date = leaving_date;
        this.adult_num = adult_num;
        this.kid_num = kid_num;
        this.baby_num = baby_num;
    }

    public String getTicket_type() {
        return ticket_type;
    }

    public void setTicket_type(String ticket_type) {
        this.ticket_type = ticket_type;
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

    public String getLeaving_date() {
        return leaving_date;
    }

    public void setLeaving_date(String leaving_date) {
        this.leaving_date = leaving_date;
    }

    public String getAdult_num() {
        return adult_num;
    }

    public void setAdult_num(String adult_num) {
        this.adult_num = adult_num;
    }

    public String getKid_num() {
        return kid_num;
    }

    public void setKid_num(String kid_num) {
        this.kid_num = kid_num;
    }

    public String getBaby_num() {
        return baby_num;
    }

    public void setBaby_num(String baby_num) {
        this.baby_num = baby_num;
    }
}
