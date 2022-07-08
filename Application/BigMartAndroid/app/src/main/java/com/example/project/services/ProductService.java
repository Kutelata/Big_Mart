package com.example.project.services;

import android.content.Context;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.example.project.entities.Product;
import com.example.project.entities.dto.ProductDTO;
import com.example.project.services.interfaces.IProductService;
import com.example.project.utilities.CallAPIServer;
import com.example.project.utilities.VolleyResult;
import com.example.project.utilities.VolleySingleton;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.lang.reflect.Type;
import java.util.List;

public class ProductService implements IProductService {
    private Context mCtx;
    private String mApi;

    public ProductService(Context mCtx) {
        this.mCtx = mCtx;
        mApi = CallAPIServer.prepareAPI("products");
    }

    @Override
    public void getAll(VolleyResult<List<Product>> callback) {

    }

    @Override
    public void getById(int id, VolleyResult<Product> callback) {

    }

    @Override
    public void insert(Product entity, VolleyResult<Product> callback) {

    }

    @Override
    public void update(int id, Product entity, VolleyResult<Product> callback) {

    }

    @Override
    public void delete(int id, VolleyResult<Product> callback) {

    }

    @Override
    public void getAllProduct(VolleyResult<List<ProductDTO>> callback) {
        Response.Listener listener = response -> {
            String json = response.toString();
            Gson gson = new Gson();
            Type type = new TypeToken<List<ProductDTO>>() {
            }.getType();
            List<ProductDTO> productDTOs = gson.fromJson(json, type);
            callback.onSuccess(productDTOs);
        };

        Response.ErrorListener errorListener = error -> callback.onSuccess(null);
        StringRequest stringRequest = new StringRequest(Request.Method.GET, mApi, listener, errorListener);
        VolleySingleton.getInstance(mCtx).addToRequestQueue(stringRequest);
    }

    @Override
    public void getProductById(int id, VolleyResult<ProductDTO> callback) {
        String newApi = String.format("%s/%d", mApi, id);

        Response.Listener<String> listener = response -> {
            String json = response;
            Gson gson = new Gson();
            ProductDTO productDTO = gson.fromJson(json, ProductDTO.class);
            callback.onSuccess(productDTO);
        };

        Response.ErrorListener errorListener = error -> callback.onSuccess(null);

        StringRequest stringRequest = new StringRequest(Request.Method.GET, newApi, listener, errorListener);
        RequestQueue requestQueue = Volley.newRequestQueue(mCtx);
        requestQueue.add(stringRequest);
    }
}
