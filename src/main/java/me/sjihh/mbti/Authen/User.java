package me.sjihh.mbti.Authen;

import me.sjihh.mbti.MBTI.MBTIData;

import java.util.Date;

public class User {
    private int userId;
    private String username;
    private String password;
    private String email;
    private Date registrationDate;
    private Date lastLogin;
    private boolean active;
    private int mbtiId;

    private MBTIData mbtiData;

    // Constructors, getters, and setters
    public User() {
        // Default constructor
    }

    public User(int userId, String username, String password, String email, Date registrationDate, Date lastLogin, boolean active, int mbtiId) {
        this.userId = userId;
        this.username = username;
        this.password = password;
        this.email = email;
        this.registrationDate = registrationDate;
        this.lastLogin = lastLogin;
        this.active = active;
        this.mbtiId = mbtiId;
        this.mbtiData = null;
    }

    // Getters and setters for each field
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getRegistrationDate() {
        return registrationDate;
    }

    public void setRegistrationDate(Date registrationDate) {
        this.registrationDate = registrationDate;
    }

    public Date getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(Date lastLogin) {
        this.lastLogin = lastLogin;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public int getMbtiId() {
        return mbtiId;
    }

    public void setMbtiId(int mbtiId) {
        this.mbtiId = mbtiId;
    }

    public void setMbtiData(MBTIData mbtiData) {
        this.mbtiData = mbtiData;
    }

    public MBTIData getMbtiData() {
        return mbtiData;
    }
}
