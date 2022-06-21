package com.example.project.activities;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.ListView;
import android.widget.Toast;

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

import java.util.List;

public class ProductListActivity extends AppCompatActivity {
    ListView lvProduct;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_product_list);

        lvProduct = findViewById(R.id.lvProduct);
        getList();
    }

    private void getList(){
        String api = CallAPIServer.prepareAPI("products");

        Response.Listener<String> listener = response -> {
            String json = response;
            Gson gson = new Gson();
            TypeToken<List<ProductDTO>> typeToken = new TypeToken<List<ProductDTO>>() {
            };
            List<ProductDTO> productDTOs = gson.fromJson(json, typeToken.getType());

            AdapterProduct adapterProduct = new AdapterProduct(this, R.layout.item_product, productDTOs);
            lvProduct.setAdapter(adapterProduct);
        };

        Response.ErrorListener errorListener = error -> Toast.makeText(this, "Có lỗi xảy ra, không lấy được danh sách!", Toast.LENGTH_SHORT).show();
        StringRequest stringRequest = new StringRequest(Request.Method.GET, api, listener, errorListener);
        RequestQueue requestQueue = Volley.newRequestQueue(this);
        requestQueue.add(stringRequest);
    }
}