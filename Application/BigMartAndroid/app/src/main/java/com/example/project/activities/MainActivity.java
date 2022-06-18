package com.example.project.activities;

import androidx.appcompat.app.AppCompatActivity;
import androidx.cardview.widget.CardView;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Toast;

import com.example.project.R;

public class MainActivity extends AppCompatActivity {
    CardView cardCustomer, cardInvoice, cardProduct, cardLogout;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        cardCustomer = findViewById(R.id.cardCustomer);
        cardInvoice = findViewById(R.id.cardInvoice);
        cardProduct = findViewById(R.id.cardProduct);
        cardLogout = findViewById(R.id.cardLogout);

        cardCustomer.setOnClickListener(view -> {
            Toast.makeText(this, "ok", Toast.LENGTH_SHORT).show();
        });

        cardInvoice.setOnClickListener(view -> {

        });

        cardProduct.setOnClickListener(view -> {
            Intent intent = new Intent(this, ProductListActivity.class);
            startActivity(intent);
        });

        cardLogout.setOnClickListener(view -> {

        });
    }
}