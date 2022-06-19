package com.example.project.entities;

import com.google.gson.annotations.SerializedName;

public class InvoiceDetail {
    private Integer id;
    @SerializedName("invoice_id")
    private Integer invoiceId;
    @SerializedName("product_id")
    private Integer productId;
    private Integer quantity;
    private Float price;

    public InvoiceDetail() {
    }

    public InvoiceDetail(Integer id, Integer invoiceId, Integer productId, Integer quantity, Float price) {
        this.id = id;
        this.invoiceId = invoiceId;
        this.productId = productId;
        this.quantity = quantity;
        this.price = price;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(Integer invoiceId) {
        this.invoiceId = invoiceId;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
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
}
