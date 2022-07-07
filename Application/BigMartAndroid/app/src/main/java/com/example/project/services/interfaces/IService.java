package com.example.project.services.interfaces;

import com.example.project.utilities.VolleyResult;

import java.util.List;

public interface IService<T> {
    void getAll(final VolleyResult<List<T>> callback);

    void getById(int id, final VolleyResult<T> callback);

    void insert(T entity, final VolleyResult<T> callback);

    void update(int id, T entity, final VolleyResult<T> callback);

    void delete(int id, final VolleyResult<T> callback);
}
