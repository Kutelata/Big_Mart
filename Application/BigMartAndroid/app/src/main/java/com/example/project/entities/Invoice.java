package com.example.project.entities;

import com.google.gson.annotations.SerializedName;

import java.util.Date;

public class Invoice {
    private Integer id;
    @SerializedName("shipment_id")
    private Integer shipmentId;
    @SerializedName("payment_id")
    private Integer paymentId;
    @SerializedName("customer_id")
    private Integer customerId;
    private Float total;
    private Integer status;

    public Invoice() {
    }

    public Invoice(Integer id, Integer shipmentId, Integer paymentId, Integer customerId, Float total, Integer status) {
        this.id = id;
        this.shipmentId = shipmentId;
        this.paymentId = paymentId;
        this.customerId = customerId;
        this.total = total;
        this.status = status;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public Float getTotal() {
        return total;
    }

    public void setTotal(Float total) {
        this.total = total;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
