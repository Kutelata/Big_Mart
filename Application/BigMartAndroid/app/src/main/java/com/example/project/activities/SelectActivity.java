package com.example.project.activities;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;

import com.example.project.R;
import com.google.android.material.button.MaterialButton;

public class SelectActivity extends AppCompatActivity {
    MaterialButton btnEmployee;
    MaterialButton btnCustomer;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_select);

        btnEmployee = findViewById(R.id.btnEmployee);
        btnCustomer = findViewById(R.id.btnCustomer);

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