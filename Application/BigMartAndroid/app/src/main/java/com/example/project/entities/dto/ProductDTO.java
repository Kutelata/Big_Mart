package com.example.project.entities.dto;

import com.example.project.entities.Category;
import com.example.project.entities.Provider;
import com.google.gson.annotations.SerializedName;

import java.util.Date;

public class ProductDTO {
    public Integer id;
    public String name;
    public String image;
    @SerializedName("category_id")
    public Category categoryId;
    @SerializedName("provider_id")
    public Provider providerId;
    public Integer quantity;
    public Float price;
    public Integer point;
    @SerializedName("saleable_qty")
    public Integer saleableQty ;
    @SerializedName("created_at")
    public Date createdAt;
    @SerializedName("updated_at")
    public Date updatedAt;
    public String description;
    public Integer status;
    public Integer cartQuantity = 0;
}
