package com.example.project.entities;

import com.google.gson.annotations.SerializedName;

import java.util.Date;

public class Invoice {
    private Integer id;
    @SerializedName("created_at")
    private Date createdAt;
    @SerializedName("ship_at")
    private Date shipAt;
    @SerializedName("shipment_id")
    private Integer shipmentId;
    @SerializedName("payment_id")
    private Integer paymentId;
    @SerializedName("customer_id")
    private Integer customerId;
    @SerializedName("employee_id")
    private Integer employeeId;
    private Integer status;
    @SerializedName("address_ship")
    private String addressShip;
    @SerializedName("phone_ship")
    private String phoneShip;
    private String note;

    public Invoice() {
    }

    public Invoice(Integer id, Date createdAt, Date shipAt, Integer shipmentId, Integer paymentId, Integer customerId, Integer employeeId, Integer status, String addressShip, String phoneShip, String note) {
        this.id = id;
        this.createdAt = createdAt;
        this.shipAt = shipAt;
        this.shipmentId = shipmentId;
        this.paymentId = paymentId;
        this.customerId = customerId;
        this.employeeId = employeeId;
        this.status = status;
        this.addressShip = addressShip;
        this.phoneShip = phoneShip;
        this.note = note;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getShipAt() {
        return shipAt;
    }

    public void setShipAt(Date shipAt) {
        this.shipAt = shipAt;
    }

    public Integer getShipmentId() {
        return shipmentId;
    }

    public void setShipmentId(Integer shipmentId) {
        this.shipmentId = shipmentId;
    }

    public Integer getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(Integer paymentId) {
        this.paymentId = paymentId;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public Integer getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Integer employeeId) {
        this.employeeId = employeeId;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getAddressShip() {
        return addressShip;
    }

    public void setAddressShip(String addressShip) {
        this.addressShip = addressShip;
    }

    public String getPhoneShip() {
        return phoneShip;
    }

    public void setPhoneShip(String phoneShip) {
        this.phoneShip = phoneShip;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
