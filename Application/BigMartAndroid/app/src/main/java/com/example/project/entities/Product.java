package com.example.project.entities;

import com.google.gson.annotations.SerializedName;

import java.util.Date;

public class Product {
    private Integer Id;
    private String Name;
    private String Image;
    @SerializedName("category_id")
    private Integer CategoryId;
    @SerializedName("unit_id")
    private Integer UnitId;
    @SerializedName("provider_id")
    private Integer ProviderId;
    private Integer Quantity;
    private Float Price;
    @SerializedName("saleable_qty")
    private Integer SaleableQty ;
    private Integer Status;
    private String Description;
    @SerializedName("created_at")
    private Date CreatedAt;
    @SerializedName("updated_at")
    private Date UpdatedAt;

    public Product() {
    }

    public Product(Integer id, String name, String image, Integer categoryId, Integer unitId, Integer providerId, Integer quantity, Float price, Integer saleableQty, Integer status, String description, Date createdAt, Date updatedAt) {
        Id = id;
        Name = name;
        Image = image;
        CategoryId = categoryId;
        UnitId = unitId;
        ProviderId = providerId;
        Quantity = quantity;
        Price = price;
        SaleableQty = saleableQty;
        Status = status;
        Description = description;
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

    public String getImage() {
        return Image;
    }

    public void setImage(String image) {
        Image = image;
    }

    public Integer getCategoryId() {
        return CategoryId;
    }

    public void setCategoryId(Integer categoryId) {
        CategoryId = categoryId;
    }

    public Integer getUnitId() {
        return UnitId;
    }

    public void setUnitId(Integer unitId) {
        UnitId = unitId;
    }

    public Integer getProviderId() {
        return ProviderId;
    }

    public void setProviderId(Integer providerId) {
        ProviderId = providerId;
    }

    public Integer getQuantity() {
        return Quantity;
    }

    public void setQuantity(Integer quantity) {
        Quantity = quantity;
    }

    public Float getPrice() {
        return Price;
    }

    public void setPrice(Float price) {
        Price = price;
    }

    public Integer getSaleableQty() {
        return SaleableQty;
    }

    public void setSaleableQty(Integer saleableQty) {
        SaleableQty = saleableQty;
    }

    public Integer getStatus() {
        return Status;
    }

    public void setStatus(Integer status) {
        Status = status;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
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
