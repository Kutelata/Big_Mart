package com.example.project.entities;

public class Shipment {
    private Integer id;
    private String name;
    private String code;
    private Float price;
    private Integer status;

    public Shipment() {
    }

    public Shipment(Integer id, String name, String code, Float price, Integer status) {
        this.id = id;
        this.name = name;
        this.code = code;
        this.price = price;
        this.status = status;
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

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
