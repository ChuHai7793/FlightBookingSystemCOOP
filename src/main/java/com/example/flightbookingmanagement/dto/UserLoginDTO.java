package com.example.flightbookingmanagement.dto;

import com.example.flightbookingmanagement.model.User;

public class UserLoginDTO  {
    private int userId;
    private String phone;
    private String email;
    private String fullName;
    private String role;

    public UserLoginDTO() {
    }

    public UserLoginDTO(int userId, String phone, String email, String fullName, String role) {
        this.userId = userId;
        this.phone = phone;
        this.email = email;
        this.fullName = fullName;
        this.role = role;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
