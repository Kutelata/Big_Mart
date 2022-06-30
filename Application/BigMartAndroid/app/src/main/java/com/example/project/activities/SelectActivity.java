package com.example.project.activities;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;

import com.example.project.R;
import com.example.project.databinding.ActivityLoginBinding;
import com.example.project.databinding.ActivitySelectBinding;
import com.google.android.material.button.MaterialButton;

public class SelectActivity extends AppCompatActivity {
    ActivitySelectBinding binding;
    MaterialButton btnEmployee;
    MaterialButton btnCustomer;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        binding = ActivitySelectBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        btnEmployee = binding.btnEmployee;
        btnCustomer = binding.btnCustomer;

        btnEmployee.setOnClickListener(view -> {
            Intent intent = new Intent(this, LoginActivity.class);
            startActivity(intent);
        });

        btnCustomer.setOnClickListener(view -> {
            Intent intent = new Intent(this, SearchActivity.class);
            startActivity(intent);
        });
    }
}