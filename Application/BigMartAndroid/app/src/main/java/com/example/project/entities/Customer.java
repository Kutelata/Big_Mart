package com.example.project.entities;

import com.google.gson.annotations.SerializedName;

import java.util.Date;

public class Customer {
    private Integer Id;
    private String Name;
    private Integer Gender;
    private Date Birthday;
    private String Phone;
    private String Address;
    private String Email;
    private Integer Status;
    @SerializedName("created_at")
    private Date CreatedAt;
    @SerializedName("updated_at")
    private Date UpdatedAt;

    public Customer() {
    }

    public Customer(Integer id, String name, Integer gender, Date birthday, String phone, String address, String email, Integer status, Date createdAt, Date updatedAt) {
        Id = id;
        Name = name;
        Gender = gender;
        Birthday = birthday;
        Phone = phone;
        Address = address;
        Email = email;
        Status = status;
        CreatedAt = createdAt;
        UpdatedAt = updatedAt;
    }

    public Integer getId() {
        return Id;
    }

    public void setId(Integer id) {
        Id = id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public Integer getGender() {
        return Gender;
    }

    public void setGender(Integer gender) {
        Gender = gender;
    }

    public Date getBirthday() {
        return Birthday;
    }

    public void setBirthday(Date birthday) {
        Birthday = birthday;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String phone) {
        Phone = phone;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public Integer getStatus() {
        return Status;
    }

    public void setStatus(Integer status) {
        Status = status;
    }

    public Date getCreatedAt() {
        return CreatedAt;
    }

    public void setCreatedAt(Date createdAt) {
        CreatedAt = createdAt;
    }

    public Date getUpdatedAt() {
        return UpdatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        UpdatedAt = updatedAt;
    }
}
