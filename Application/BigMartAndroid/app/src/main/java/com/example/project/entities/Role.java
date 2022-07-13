package com.example.project.entities;

public class Role {
    private Integer id;
    private String name;
    private String resource;

    public Role() {
    }

    public Role(Integer id, String name, String resource) {
        this.id = id;
        this.name = name;
        this.resource = resource;
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

    public String getResource() {
        return resource;
    }

    public void setResource(String resource) {
        this.resource = resource;
    }
}
