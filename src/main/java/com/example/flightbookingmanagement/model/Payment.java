package com.example.flightbookingmanagement.model;

import java.sql.Timestamp;

public class Payment {

    int payment_id, amount;
    String payment_status;
    Timestamp payment_date;

    public Payment() {
    }

    public Payment(String payment_status, int payment_id, int amount, Timestamp payment_date) {
        this.payment_status = payment_status;
        this.payment_id = payment_id;
        this.amount = amount;
        this.payment_date = payment_date;
    }

    public int getPayment_id() {
        return payment_id;
    }

    public void setPayment_id(int payment_id) {
        this.payment_id = payment_id;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getPayment_status() {
        return payment_status;
    }

    public void setPayment_status(String payment_status) {
        this.payment_status = payment_status;
    }

    public Timestamp getPayment_date() {
        return payment_date;
    }

    public void setPayment_date(Timestamp payment_date) {
        this.payment_date = payment_date;
    }
}
