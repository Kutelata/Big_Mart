package com.example.project.activities;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;
import android.widget.ListView;

import com.example.project.R;
import com.example.project.adapters.AdapterCart;
import com.example.project.databinding.ActivityCartBinding;
import com.example.project.entities.dto.ProductDTO;
import com.example.project.services.ProductService;
import com.example.project.services.interfaces.IProductService;
import com.example.project.utilities.GlobalApplication;

import java.util.List;

public class CartActivity extends AppCompatActivity {
    IProductService productService;
    ActivityCartBinding binding;
    ListView lvCart;
    Button btnPay;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        binding = ActivityCartBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        productService = new ProductService(this);

        lvCart = binding.lvCart;
        btnPay = binding.btnPay;

        getCart();

        btnPay.setOnClickListener(view -> redirectPayment());
    }

    private void getCart() {
        List<ProductDTO> productDTOs = GlobalApplication.getInstance().getProductCart();
        AdapterCart adapterCart = new AdapterCart(this, R.layout.item_cart, productDTOs);
        lvCart.setAdapter(adapterCart);
    }

    private void redirectPayment() {
        Intent intent = new Intent(this, PaymentActivity.class);
        startActivity(intent);
    }
}