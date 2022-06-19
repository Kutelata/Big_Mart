package com.example.project.entities;

public class Payment {
    private Integer id;
    private String name;
    private String note;
    private Integer status;

    public Payment() {
    }

    public Payment(Integer id, String name, String note, Integer status) {
        this.id = id;
        this.name = name;
        this.note = note;
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

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
