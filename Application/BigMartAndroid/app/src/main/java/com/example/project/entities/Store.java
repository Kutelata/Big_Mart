package com.example.project.entities;

import com.google.gson.annotations.SerializedName;

import java.util.Date;

public class Store {
    private Integer id;
    private String name;
    private String address;
    private String phone;
    @SerializedName("employee_id")
    private Integer employeeId;
    @SerializedName("open_time")
    private Date openTime;
    @SerializedName("close_time")
    private Date closeTime;

    public Store() {
    }

    public Store(Integer id, String name, String address, String phone, Integer employeeId, Date openTime, Date closeTime) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.phone = phone;
        this.employeeId = employeeId;
        this.openTime = openTime;
        this.closeTime = closeTime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Integer employeeId) {
        this.employeeId = employeeId;
    }

    public Date getOpenTime() {
        return openTime;
    }

    public void setOpenTime(Date openTime) {
        this.openTime = openTime;
    }

    public Date getCloseTime() {
        return closeTime;
    }

    public void setCloseTime(Date closeTime) {
        this.closeTime = closeTime;
    }
}
