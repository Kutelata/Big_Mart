package com.example.project.services;

import android.content.Context;

import androidx.annotation.Nullable;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.toolbox.StringRequest;
import com.example.project.entities.Customer;
import com.example.project.services.interfaces.ICustomerService;
import com.example.project.utilities.CallAPIServer;
import com.example.project.utilities.VolleyResult;
import com.example.project.utilities.VolleySingleton;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.lang.reflect.Type;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerService implements ICustomerService {
    private Context mCtx;
    private String mApi;

    public CustomerService(Context mCtx) {
        this.mCtx = mCtx;
        mApi = CallAPIServer.prepareAPI("customers");
    }

    @Override
    public void getAll(VolleyResult<List<Customer>> callback) {
        Response.Listener listener = response -> {
            String json = response.toString();
            Gson gson = new Gson();
            Type type = new TypeToken<List<Customer>>() {
            }.getType();
            List<Customer> customers = gson.fromJson(json, type);
            callback.onSuccess(customers);
        };

        Response.ErrorListener errorListener = error -> callback.onSuccess(null);
        StringRequest stringRequest = new StringRequest(Request.Method.GET, mApi, listener, errorListener);
        VolleySingleton.getInstance(mCtx).addToRequestQueue(stringRequest);
    }

    @Override
    public void getById(int id, VolleyResult<Customer> callback) {

    }

    @Override
    public void insert(Customer entity, VolleyResult<Customer> callback) {
        mApi = String.format("%s/createCustomer", mApi);

        Response.Listener listener = response -> {
            String json = response.toString();
            Gson gson = new Gson();
            Customer customer = gson.fromJson(json, Customer.class);
            callback.onSuccess(customer);
        };

        Response.ErrorListener errorListener = error -> callback.onSuccess(null);

        StringRequest stringRequest = new StringRequest(Request.Method.POST, mApi, listener, errorListener) {
            @Nullable
            @Override
            protected Map<String, String> getParams() {
                Map<String, String> params = new HashMap<>();
                params.put("name", entity.getName());
                params.put("phone", entity.getPhone());
                params.put("email", entity.getEmail());
                params.put("password", entity.getPassword());
                return params;
            }
        };

        VolleySingleton.getInstance(mCtx).addToRequestQueue(stringRequest);
    }

    @Override
    public void update(int id, Customer entity, VolleyResult<Customer> callback) {

    }

    @Override
    public void delete(int id, VolleyResult<Customer> callback) {

    }
}
