package com.example.project.activities;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.example.project.R;
import com.example.project.databinding.ActivityRegisterBinding;
import com.example.project.entities.Category;
import com.example.project.entities.Customer;
import com.example.project.utilities.CallAPIServer;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.util.ArrayList;
import java.util.List;

public class RegisterActivity extends AppCompatActivity {
    ActivityRegisterBinding binding;
    EditText edtUserName, edtPhone, edtEmail, edtPassword, edtConfirmPassword;
    Button btnRegister;
    TextView tvLogin;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        binding = ActivityRegisterBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        edtUserName = binding.edtUserName;
        edtPhone = binding.edtPhone;
        edtEmail = binding.edtEmail;
        edtPassword = binding.edtPassword;
        edtConfirmPassword = binding.edtConfirmPassword;
        btnRegister = binding.btnRegister;
        tvLogin = binding.tvLogin;

        btnRegister.setOnClickListener(view -> {
            if(edtUserName.getText().equals("") ||
                    edtPhone.getText().equals("") ||
                    edtEmail.getText().equals("") ||
                    edtPassword.getText().equals("") ||
                    edtConfirmPassword.getText().equals("")){
                Toast.makeText(this, "Các trường không được để rỗng", Toast.LENGTH_SHORT).show();
            } else if(!edtPassword.getText().equals(edtConfirmPassword.getText())){
                Toast.makeText(this, "Mật khẩu và nhập lại mật khẩu không giống nhau", Toast.LENGTH_SHORT).show();
            } else {
                Customer customer = new Customer(
                        edtUserName.getText().toString(),
                        edtPhone.getText().toString(),
                        edtEmail.getText().toString(),
                        edtPassword.getText().toString());
                createAccount(customer);
            }
        });

        tvLogin.setOnClickListener(view -> redirectLogin());
    }

    private void createAccount(Customer newCustomer){
        String api = CallAPIServer.prepareAPI("customers");

        Response.Listener<String> listener = response -> {
            String json = response;
            Gson gson = new Gson();
            TypeToken<List<Customer>> typeToken = new TypeToken<List<Customer>>() {
            };
            List<Customer> customers = gson.fromJson(json, typeToken.getType());

            for (Customer customer : customers) {
                if(customer.getEmail().equals(newCustomer.getEmail()) || customer.getPhone().equals(newCustomer.getPhone())){
                    Toast.makeText(this, "Email và số điện thoại đã tồn tại", Toast.LENGTH_SHORT).show();
                }else{
                    StringRequest stringRequest = new StringRequest(Request.Method.GET, api, listener, errorListener);
                }
            }

        };

        Response.ErrorListener errorListener = error -> Toast.makeText(this, "Có lỗi xảy ra, không lấy được danh sách khách hàng!", Toast.LENGTH_SHORT).show();
        StringRequest stringRequest = new StringRequest(Request.Method.GET, api, listener, errorListener);
        RequestQueue requestQueue = Volley.newRequestQueue(this);
        requestQueue.add(stringRequest);
    }

    private void redirectLogin(){
        Intent intent = new Intent(this, LoginActivity.class);
        finish();
        startActivity(intent);
    }
}