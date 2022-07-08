package com.example.project.activities;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.example.project.databinding.ActivityProfileBinding;
import com.example.project.entities.Customer;
import com.example.project.services.CustomerService;
import com.example.project.services.interfaces.ICustomerService;
import com.example.project.utilities.CallAPIServer;
import com.example.project.utilities.GlobalApplication;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.util.List;

public class ProfileActivity extends AppCompatActivity {
    ICustomerService customerService;
    ActivityProfileBinding binding;
    Button btnHistoryInvoice;
    TextView tvCustomerId, tvCustomerName, tvCustomerGender,
            tvCustomerBirthday, tvCustomerPhone, tvCustomerAddress,
            tvCustomerEmail, tvCustomerPoint;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        binding = ActivityProfileBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        customerService = new CustomerService(this);

        btnHistoryInvoice = binding.btnHistoryInvoice;
        tvCustomerId = binding.tvCustomerId;
        tvCustomerName = binding.tvCustomerName;
        tvCustomerGender = binding.tvCustomerGender;
        tvCustomerBirthday = binding.tvCustomerBirthday;
        tvCustomerPhone = binding.tvCustomerPhone;
        tvCustomerAddress = binding.tvCustomerAddress;
        tvCustomerEmail = binding.tvCustomerEmail;
        tvCustomerPoint = binding.tvCustomerPoint;

        btnHistoryInvoice.setOnClickListener(view -> getInvoiceHistory());

        getListCustomer();
    }

    private void getListCustomer() {
        int customerId = GlobalApplication.getInstance().getCustomerApp().getId();
        customerService.getById(customerId, customer -> {
            if (customer != null) {
                tvCustomerId.setText(customer.getId().toString());
                tvCustomerName.setText(customer.getName());
                tvCustomerGender.setText(customer.getGender() == 1 ? "Nam" : "Nữ");
                tvCustomerBirthday.setText(customer.getBirthday().toString());
                tvCustomerAddress.setText(customer.getAddress());
                tvCustomerEmail.setText(customer.getEmail());
            } else {
                Toast.makeText(this, "Có lỗi xảy ra!", Toast.LENGTH_SHORT).show();
            }
        });
    }

    private void getInvoiceHistory(){

    }
}