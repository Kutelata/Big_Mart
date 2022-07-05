package com.example.project.entities;

public class Category {
    private Integer id;
    private String name;
    private String image;
    private String status;

    public Category() {
    }

    public Category(Integer id, String name, String status, String image) {
        this.id = id;
        this.name = name;
        this.status = status;
        this.image = image;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
