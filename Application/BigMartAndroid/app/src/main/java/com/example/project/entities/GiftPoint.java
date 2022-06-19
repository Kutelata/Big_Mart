package com.example.project.entities;

import com.google.gson.annotations.SerializedName;

import java.util.Date;

public class GiftPoint {
    private Integer id;
    @SerializedName("customer_id")
    private Integer customerId;
    private String content;
    private Integer point;
    @SerializedName("created_at")
    private Date createdAt;

    public GiftPoint() {
    }

    public GiftPoint(Integer id, Integer customerId, String content, Integer point, Date createdAt) {
        this.id = id;
        this.customerId = customerId;
        this.content = content;
        this.point = point;
        this.createdAt = createdAt;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getPoint() {
        return point;
    }

    public void setPoint(Integer point) {
        this.point = point;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
}