package com.example.project.activities;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.example.project.R;
import com.example.project.adapters.AdapterProduct;
import com.example.project.entities.dto.ProductDTO;
import com.example.project.utilities.CallAPIServer;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductDetailActivity extends AppCompatActivity {
    Intent intent;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_product_detail);

        intent = getIntent();
        int productId = intent.getIntExtra("productId", 0);

        getProduct(productId);
    }

    private void getProduct(int productId) {
        String url = String.format("products/%d", productId);
        String api = CallAPIServer.prepareAPI(url);

        Response.Listener<String> listener = response -> {
            String json = response;
            Gson gson = new Gson();
            ProductDTO productDTO = gson.fromJson(json, ProductDTO.class);
        };

        Response.ErrorListener errorListener = error -> Toast.makeText(this, "Có lỗi xảy ra, không lấy được danh sách sản phẩm!", Toast.LENGTH_SHORT).show();

        StringRequest stringRequest = new StringRequest(Request.Method.GET, api, listener, errorListener);
        RequestQueue requestQueue = Volley.newRequestQueue(this);
        requestQueue.add(stringRequest);
    }
}