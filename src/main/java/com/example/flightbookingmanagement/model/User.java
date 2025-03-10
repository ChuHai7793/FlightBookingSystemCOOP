package com.example.flightbookingmanagement.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class User {
    private int userId;
    private String role;
    private String email;
    private String password;
    private String phone;
    private String fullName;
    private String birthDate;
    private String gender;
    private String address;
    private String nationalId;
    private String nationality;
    private String membershipLevel;
    private BigDecimal wallet;
    private Timestamp createdAt;

    public User() {
    }

    // Constructors login
    public User(int userId, String role, String email, String password, String phone) {
        this.userId = userId;
        this.role = role;
        this.email = email;
        this.password = password;
        this.phone = phone;
    }


    public User(int userId, String role, String email, String password,
                String phone, String fullName, String birthDate,
                String gender, String address, String nationalId,
                String nationality, String membershipLevel, BigDecimal wallet, Timestamp createdAt) {
        this.userId = userId;
        this.role = role;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.fullName = fullName;
        this.birthDate = birthDate;
        this.gender = gender;
        this.address = address;
        this.nationalId = nationalId;
        this.nationality = nationality;
        this.membershipLevel = membershipLevel;
        this.wallet = wallet;
        this.createdAt = createdAt;
    }

    // Getters and Setters
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNationalId() {
        return nationalId;
    }

    public void setNationalId(String nationalId) {
        this.nationalId = nationalId;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getMembershipLevel() {
        return membershipLevel;
    }

    public void setMembershipLevel(String membershipLevel) {
        this.membershipLevel = membershipLevel;
    }

    public BigDecimal getWallet() {
        return wallet;
    }

    public void setWallet(BigDecimal wallet) {
        this.wallet = wallet;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    // ToString method
    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", role='" + role + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", fullName='" + fullName + '\'' +
                ", birthDate='" + birthDate + '\'' +
                ", gender='" + gender + '\'' +
                ", address='" + address + '\'' +
                ", nationalId='" + nationalId + '\'' +
                ", nationality='" + nationality + '\'' +
                ", membershipLevel='" + membershipLevel + '\'' +
                ", wallet=" + wallet +
                ", createdAt=" + createdAt +
                '}';
    }
}
