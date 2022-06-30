package com.example.project.activities;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;
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
import com.example.project.R;
import com.example.project.databinding.ActivitySearchBinding;
import com.example.project.entities.Category;
import com.example.project.entities.Customer;
import com.example.project.utilities.CallAPIServer;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.util.ArrayList;
import java.util.List;

public class SearchActivity extends AppCompatActivity {
    ActivitySearchBinding binding;
    RelativeLayout rlCustomerInfo;
    EditText edtSearch;
    Button btnSearch, btnHistoryInvoice;
    TextView tvCustomerId, tvCustomerName, tvCustomerGender,
            tvCustomerBirthday, tvCustomerPhone, tvCustomerAddress,
            tvCustomerEmail, tvCustomerCreatedAt, tvCustomerUpdatedAt, tvCustomerStatus;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = ActivitySearchBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        rlCustomerInfo = binding.rlCustomerInfo;
        edtSearch = binding.edtSearch;
        btnSearch = binding.btnSearch;
        btnHistoryInvoice = binding.btnHistoryInvoice;
        tvCustomerId = binding.tvCustomerId;
        tvCustomerName = binding.tvCustomerName;
        tvCustomerGender = binding.tvCustomerGender;
        tvCustomerBirthday = binding.tvCustomerBirthday;
        tvCustomerPhone = binding.tvCustomerPhone;
        tvCustomerAddress = binding.tvCustomerAddress;
        tvCustomerEmail = binding.tvCustomerEmail;
        tvCustomerCreatedAt = binding.tvCustomerCreatedAt;
        tvCustomerUpdatedAt = binding.tvCustomerUpdatedAt;
        tvCustomerStatus = binding.tvCustomerStatus;

        rlCustomerInfo.setVisibility(View.GONE);

        edtSearch.setText("nguyenngocthuy@gmail.com");

        btnSearch.setOnClickListener(view -> {
            getListCustomer(edtSearch.getText().toString());
        });
    }

    private void getListCustomer(String customerEmail) {
        String api = CallAPIServer.prepareAPI("customers");

        Response.Listener<String> listener = response -> {
            Customer findCustomer = null;
            String json = response;
            Gson gson = new Gson();
            TypeToken<List<Customer>> typeToken = new TypeToken<List<Customer>>() {
            };
            List<Customer> customers = gson.fromJson(json, typeToken.getType());

            for (Customer customer : customers) {
                if (customerEmail.equals(customer.getEmail())) {
                    findCustomer = customer;
                    break;
                }
            }

            if (findCustomer != null) {
                rlCustomerInfo.setVisibility(View.VISIBLE);
                tvCustomerId.setText(findCustomer.getId().toString());
                tvCustomerName.setText(findCustomer.getName());
                tvCustomerGender.setText(findCustomer.getGender().toString());
                tvCustomerBirthday.setText(findCustomer.getBirthday().toString());
                tvCustomerAddress.setText(findCustomer.getAddress());
                tvCustomerEmail.setText(findCustomer.getEmail());
                tvCustomerCreatedAt.setText(findCustomer.getCreatedAt().toString());
                tvCustomerUpdatedAt.setText(findCustomer.getUpdatedAt().toString());
                tvCustomerStatus.setText(findCustomer.getStatus().toString());
            } else {
                rlCustomerInfo.setVisibility(View.GONE);
            }
        };

        Response.ErrorListener errorListener = error -> Toast.makeText(this, "Có lỗi xảy ra, không lấy được thông tin khách hàng!", Toast.LENGTH_SHORT).show();
        StringRequest stringRequest = new StringRequest(Request.Method.GET, api, listener, errorListener);
        RequestQueue requestQueue = Volley.newRequestQueue(this);
        requestQueue.add(stringRequest);
    }
}