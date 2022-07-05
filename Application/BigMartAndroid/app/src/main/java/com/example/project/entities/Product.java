package com.example.project.entities;

import com.google.gson.annotations.SerializedName;

import java.util.Date;

public class Product {
    private Integer id;
    private String name;
    private String image;
    @SerializedName("category_id")
    private Integer categoryId;
    @SerializedName("provider_id")
    private Integer providerId;
    private Integer quantity;
    private Float price;
    @SerializedName("saleable_qty")
    private Integer saleableQty;
    private Integer point;
    private Integer status;
    private String description;
    @SerializedName("created_at")
    private Date createdAt;
    @SerializedName("updated_at")
    private Date updatedAt;

    public Product() {
    }

    public Product(Integer id, String name, String image, Integer categoryId, Integer providerId, Integer quantity, Float price, Integer saleableQty, Integer point, Integer status, String description, Date createdAt, Date updatedAt) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.categoryId = categoryId;
        this.providerId = providerId;
        this.quantity = quantity;
        this.price = price;
        this.saleableQty = saleableQty;
        this.point = point;
        this.status = status;
        this.description = description;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public Integer getProviderId() {
        return providerId;
    }

    public void setProviderId(Integer providerId) {
        this.providerId = providerId;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Integer getSaleableQty() {
        return saleableQty;
    }

    public void setSaleableQty(Integer saleableQty) {
        this.saleableQty = saleableQty;
    }

    public Integer getPoint() {
        return point;
    }

    public void setPoint(Integer point) {
        this.point = point;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }
}