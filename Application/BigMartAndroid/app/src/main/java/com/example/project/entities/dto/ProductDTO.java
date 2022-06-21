package com.example.project.entities.dto;

import com.example.project.entities.Category;
import com.example.project.entities.Provider;
import com.example.project.entities.Unit;
import com.google.gson.annotations.SerializedName;

import java.util.Date;

public class ProductDTO {
    public Integer id;
    public String name;
    public String image;
    @SerializedName("category_id")
    public Category categoryId;
    @SerializedName("unit_id")
    public Unit unitId;
    @SerializedName("provider_id")
    public Provider providerId;
    public Integer quantity;
    public Float price;
    @SerializedName("saleable_qty")
    public Integer saleableQty ;
    public Integer status;
    public String description;
    @SerializedName("created_at")
    public Date createdAt;
    @SerializedName("updated_at")
    public Date updatedAt;
}
