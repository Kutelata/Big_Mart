package com.example.project.activities;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.example.project.R;
import com.example.project.databinding.ActivityProductDetailBinding;
import com.example.project.databinding.ActivitySearchBinding;
import com.example.project.entities.dto.ProductDTO;
import com.example.project.utilities.CallAPIServer;
import com.google.gson.Gson;

public class ProductDetailActivity extends AppCompatActivity {
    ActivityProductDetailBinding binding;
    ImageView ivProductImage;
    TextView tvProductId, tvProductName,
            tvProductCategory, tvProductUnit, tvProductProvider,
            tvProductQuantity, tvProductPrice, tvProductSaleableQty, tvProductCreatedAt,
            tvProductUpdatedAt, tvProductDescription, tvProductStatus;
    Intent intent;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_product_detail);

        binding = ActivityProductDetailBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        tvProductId = binding.tvProductId;
        tvProductName = binding.tvProductName;

        ivProductImage = binding.ivProductImage;

        tvProductCategory = binding.tvProductCategory;
        tvProductUnit = binding.tvProductUnit;
        tvProductProvider = binding.tvProductProvider;
        tvProductQuantity = binding.tvProductQuantity;
        tvProductPrice = binding.tvProductPrice;
        tvProductSaleableQty = binding.tvProductSaleableQty;
        tvProductCreatedAt = binding.tvProductCreatedAt;
        tvProductUpdatedAt = binding.tvProductUpdatedAt;
        tvProductDescription = binding.tvProductDescription;
        tvProductStatus = binding.tvProductStatus;

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

            if (productDTO != null){
                tvProductId.setText(productDTO.id.toString());
                tvProductName.setText(productDTO.name);

                tvProductCategory.setText(productDTO.categoryId.getName());
                tvProductProvider.setText(productDTO.providerId.getName());
                tvProductQuantity.setText(productDTO.quantity.toString());
                tvProductPrice.setText(productDTO.price.toString());
                tvProductSaleableQty.setText(productDTO.saleableQty.toString());
                tvProductCreatedAt.setText(productDTO.createdAt.toString());
                tvProductUpdatedAt.setText(productDTO.updatedAt.toString());
                tvProductDescription.setText(productDTO.description);
                tvProductStatus.setText(productDTO.status.toString());
            }
        };

        Response.ErrorListener errorListener = error -> Toast.makeText(this, "Có lỗi xảy ra, không lấy được danh sách sản phẩm!", Toast.LENGTH_SHORT).show();

        StringRequest stringRequest = new StringRequest(Request.Method.GET, api, listener, errorListener);
        RequestQueue requestQueue = Volley.newRequestQueue(this);
        requestQueue.add(stringRequest);
    }
}