package com.example.project.activities;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;
import android.widget.ListView;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.example.project.R;
import com.example.project.adapters.AdapterProduct;
import com.example.project.databinding.ActivityMainBinding;
import com.example.project.entities.dto.CategoryDTO;
import com.example.project.entities.dto.ProductDTO;
import com.example.project.utilities.CallAPIServer;
import com.example.project.utilities.GlobalApplication;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.util.List;

public class MainActivity extends AppCompatActivity implements DialogSearch.ISearch {
    ActivityMainBinding binding;
    Button btnCart, btnSearch;
    Spinner sCategory;
    ListView lvProduct;
    TextView tvUserName, tvLogout;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        binding = ActivityMainBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        btnCart = binding.btnCart;
        btnSearch = binding.btnSearch;
        sCategory = binding.sCategory;
        lvProduct = binding.lvProduct;
        tvUserName = binding.tvUserName;
        tvLogout = binding.tvLogout;

        tvUserName.setText(GlobalApplication.getInstance().getEmployeeSaveLogin().name);

//        btnCart
        btnSearch.setOnClickListener(view -> {
            showDialogSearch();
        });

        tvLogout.setOnClickListener(view -> {
            logout();
        });

        getListProduct();
    }

    private void getListProduct(){
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

        Response.ErrorListener errorListener = error -> Toast.makeText(this, "Có lỗi xảy ra, không lấy được danh sách sản phẩm!", Toast.LENGTH_SHORT).show();
        StringRequest stringRequest = new StringRequest(Request.Method.GET, api, listener, errorListener);
        RequestQueue requestQueue = Volley.newRequestQueue(this);
        requestQueue.add(stringRequest);
    }

    private void getListCategory(){
        String api = CallAPIServer.prepareAPI("categories");

        Response.Listener<String> listener = response -> {
            String json = response;
            Gson gson = new Gson();
            TypeToken<List<CategoryDTO>> typeToken = new TypeToken<List<CategoryDTO>>() {
            };
            List<CategoryDTO> categoryDTOs = gson.fromJson(json, typeToken.getType());
            ArrayAdapter<CategoryDTO> adapter = new ArrayAdapter<CategoryDTO>(this, android.R.layout.simple_spinner_dropdown_item, categoryDTOs);
            sCategory.setAdapter(adapter);
            sCategory.setSelection(adapter.getPosition(myItem));

        };

        Response.ErrorListener errorListener = error -> Toast.makeText(this, "Có lỗi xảy ra, không lấy được danh sách sản phẩm!", Toast.LENGTH_SHORT).show();
        StringRequest stringRequest = new StringRequest(Request.Method.GET, api, listener, errorListener);
        RequestQueue requestQueue = Volley.newRequestQueue(this);
        requestQueue.add(stringRequest);
    }

    private void showDialogSearch(){
        DialogSearch dialogSearch = new DialogSearch(this);
        dialogSearch.show();
    }

    @Override
    public void searchProductName(String productName){

    }

    private void logout(){
        Intent intent = new Intent(this, LoginActivity.class);
        finish();
        startActivity(intent);
    }
}