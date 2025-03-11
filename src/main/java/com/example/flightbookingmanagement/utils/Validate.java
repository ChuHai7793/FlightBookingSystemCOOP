package com.example.flightbookingmanagement.utils;

public class Validate {

    public static Boolean isValidPassword(String current_password,String correct_current_password,
                                       String new_password,String confirm_password) {
        return current_password.equals(correct_current_password) && new_password.equals(confirm_password);
    }

}
