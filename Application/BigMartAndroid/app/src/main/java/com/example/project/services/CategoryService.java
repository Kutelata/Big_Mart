package com.example.project.services;

import android.content.Context;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.toolbox.StringRequest;
import com.example.project.entities.Category;
import com.example.project.entities.Customer;
import com.example.project.services.interfaces.ICaregoryService;
import com.example.project.utilities.CallAPIServer;
import com.example.project.utilities.VolleyResult;
import com.example.project.utilities.VolleySingleton;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.lang.reflect.Type;
import java.util.List;

public class CategoryService implements ICaregoryService {
    private Context mCtx;
    private String mApi;

    public CategoryService(Context mCtx) {
        this.mCtx = mCtx;
        mApi = CallAPIServer.prepareAPI("categories");
    }

    @Override
    public void getAll(VolleyResult<List<Category>> callback) {
        Response.Listener listener = response -> {
            String json = response.toString();
            Gson gson = new Gson();
            Type type = new TypeToken<List<Category>>() {
            }.getType();
            List<Category> categories = gson.fromJson(json, type);
            callback.onSuccess(categories);
        };

        Response.ErrorListener errorListener = error -> callback.onSuccess(null);
        StringRequest stringRequest = new StringRequest(Request.Method.GET, mApi, listener, errorListener);
        VolleySingleton.getInstance(mCtx).addToRequestQueue(stringRequest);
    }

    @Override
    public void getById(int id, VolleyResult<Category> callback) {

    }

    @Override
    public void insert(Category entity, VolleyResult<Category> callback) {

    }

    @Override
    public void update(int id, Category entity, VolleyResult<Category> callback) {

    }

    @Override
    public void delete(int id, VolleyResult<Category> callback) {

    }
}
