package com.example.project.services;

import com.example.project.entities.BaseEntity;

import java.util.List;

public interface IService<T extends BaseEntity>{
    List<T> getAll();
    T getById(int id);
    boolean create(T entity);
    boolean update(T entity);
    boolean delete(T entity);
}
