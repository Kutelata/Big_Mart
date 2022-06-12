package com.example.project.entities;

public abstract class BaseEntity {
    private Integer Id;

    public BaseEntity() {
    }

    public BaseEntity(int id) {
        Id = id;
    }

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }
}
