package com.example.project.entities.dto;

import com.example.project.entities.Role;
import com.google.gson.annotations.SerializedName;

import java.util.Date;

public class EmployeeDTO {
    public Integer id;
    public String name;
    public Integer gender;
    public Date birthday;
    public String phone;
    public String email;
    public String address;
    @SerializedName("role_id")
    public Role roleId;
    public String salary;
    public String username;
    public String password;
    public Integer status;
    @SerializedName("created_at")
    public Date createdAt;
    @SerializedName("updated_at")
    public Date updatedAt;
}
