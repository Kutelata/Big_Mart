package com.example.project.activities;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
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
import com.example.project.entities.Category;
import com.example.project.entities.Product;
import com.example.project.entities.dto.CategoryDTO;
import com.example.project.entities.dto.EmployeeDTO;
import com.example.project.entities.dto.ProductDTO;
import com.example.project.utilities.CallAPIServer;
import com.example.project.utilities.GlobalApplication;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.util.ArrayList;
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

        sCategory.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l) {
                String categoryName = (String) adapterView.getSelectedItem();
                getListProduct(categoryName);
            }

            @Override
            public void onNothingSelected(AdapterView<?> adapterView) {
                getListProduct("Tất cả");
            }
        });

        getListCategory();
    }

    private void getListProduct(String categoryName) {
        String api = CallAPIServer.prepareAPI("products");

        Response.Listener<String> listener = response -> {
            String json = response;
            Gson gson = new Gson();
            AdapterProduct adapterProduct;
            TypeToken<List<ProductDTO>> typeToken = new TypeToken<List<ProductDTO>>() {
            };
            List<ProductDTO> productDTOs = gson.fromJson(json, typeToken.getType());
            if (!categoryName.equals("Tất cả")) {
                List<ProductDTO> newProductDTOs = new ArrayList<>();
                for (ProductDTO productDTO : productDTOs) {
                    if (categoryName.equals(productDTO.categoryId.getName())) {
                        newProductDTOs.add(productDTO);
                    }
                }
                adapterProduct = new AdapterProduct(this, R.layout.item_product, newProductDTOs);
            } else {
                adapterProduct = new AdapterProduct(this, R.layout.item_product, productDTOs);
            }
            lvProduct.setAdapter(adapterProduct);
        };

        Response.ErrorListener errorListener = error -> Toast.makeText(this, "Có lỗi xảy ra, không lấy được danh sách sản phẩm!", Toast.LENGTH_SHORT).show();
        StringRequest stringRequest = new StringRequest(Request.Method.GET, api, listener, errorListener);
        RequestQueue requestQueue = Volley.newRequestQueue(this);
        requestQueue.add(stringRequest);
    }

    private void getListCategory() {
        String api = CallAPIServer.prepareAPI("categories");

        Response.Listener<String> listener = response -> {
            ArrayList<String> categorySpinners = new ArrayList<>();
            String json = response;
            Gson gson = new Gson();
            TypeToken<List<Category>> typeToken = new TypeToken<List<Category>>() {
            };
            List<Category> categories = gson.fromJson(json, typeToken.getType());

            categorySpinners.add("Tất cả");
            for (Category category : categories) {
                categorySpinners.add(category.getName());
            }

            ArrayAdapter<String> adapter = new ArrayAdapter<>(this, R.layout.spinner_item, categorySpinners);
            sCategory.setAdapter(adapter);
            sCategory.setSelection(0);
        };

        Response.ErrorListener errorListener = error -> Toast.makeText(this, "Có lỗi xảy ra, không lấy được danh sách danh mục!", Toast.LENGTH_SHORT).show();
        StringRequest stringRequest = new StringRequest(Request.Method.GET, api, listener, errorListener);
        RequestQueue requestQueue = Volley.newRequestQueue(this);
        requestQueue.add(stringRequest);
    }

    private void showDialogSearch() {
        DialogSearch dialogSearch = new DialogSearch(this);
        dialogSearch.show();
    }

    @Override
    public void searchProductName(String productName) {
        String api = CallAPIServer.prepareAPI("products");

        Response.Listener<String> listener = response -> {
            String json = response;
            Gson gson = new Gson();
            AdapterProduct adapterProduct;
            TypeToken<List<ProductDTO>> typeToken = new TypeToken<List<ProductDTO>>() {
            };
            List<ProductDTO> productDTOs = gson.fromJson(json, typeToken.getType());
            if (!productName.equals("")) {
                List<ProductDTO> newProductDTOs = new ArrayList<>();
                for (ProductDTO productDTO : productDTOs) {
                    if (productDTO.name.contains(productName)) {
                        newProductDTOs.add(productDTO);
                    }
                }
                adapterProduct = new AdapterProduct(this, R.layout.item_product, newProductDTOs);
            } else {
                adapterProduct = new AdapterProduct(this, R.layout.item_product, productDTOs);
            }
            lvProduct.setAdapter(adapterProduct);
        };

        Response.ErrorListener errorListener = error -> Toast.makeText(this, "Có lỗi xảy ra, không lấy được danh sách sản phẩm!", Toast.LENGTH_SHORT).show();
        StringRequest stringRequest = new StringRequest(Request.Method.GET, api, listener, errorListener);
        RequestQueue requestQueue = Volley.newRequestQueue(this);
        requestQueue.add(stringRequest);
    }

    private void logout() {
        Intent intent = new Intent(this, LoginActivity.class);
        finish();
        startActivity(intent);
    }
}