package com.example.project.entities;

import com.google.gson.annotations.SerializedName;

import java.util.Date;

public class User {
    private Integer id;
    private String name;
    private String image;
    private String account;
    private String password;
    @SerializedName("role_id")
    private Integer roleId;

    public User() {
    }

    public User(Integer id, String name, String image, String account, String password, Integer roleId) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.account = account;
        this.password = password;
        this.roleId = roleId;
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

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }
}
