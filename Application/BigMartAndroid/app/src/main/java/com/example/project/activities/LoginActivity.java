package com.example.project.activities;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.example.project.databinding.ActivityLoginBinding;
import com.example.project.entities.Customer;
import com.example.project.utilities.CallAPIServer;
import com.example.project.utilities.GlobalApplication;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.util.List;

public class LoginActivity extends AppCompatActivity {
    ActivityLoginBinding binding;
    EditText edtEmail, edtPassword;
    Button btnLogin;
    TextView tvRegister;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        binding = ActivityLoginBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        GlobalApplication.getInstance().setCustomerApp(null);

        btnLogin = binding.btnLogin;
        edtEmail = binding.edtEmail;
        edtPassword = binding.edtPassword;
        tvRegister = binding.tvRegister;

        edtEmail.setText("nguyenngocthuy@gmail.com");
        edtPassword.setText("123");

        btnLogin.setOnClickListener(view ->
//                {
//                    Intent intent = new Intent(this, RegisterActivity.class);
//                    startActivity(intent);
//                }
                actionLogin(edtEmail.getText().toString(), edtPassword.getText().toString())
        );

        tvRegister.setOnClickListener(view -> redirectRegister());
    }

    private void actionLogin(String email, String password) {
        String api = CallAPIServer.prepareAPI("customers");

        Response.Listener listener = response -> {
            String json = response.toString();
            Gson gson = new Gson();
            TypeToken<List<Customer>> typeToken = new TypeToken<List<Customer>>() {
            };
            List<Customer> customers = gson.fromJson(json, typeToken.getType());
            boolean result = false;
            for (Customer customer : customers) {
                if (email.equals(customer.getEmail())
                        && password.equals(customer.getPassword())) {
                    GlobalApplication.getInstance().setCustomerApp(customer);
                    result = true;
                    break;
                }
            }
            if (result) {
                Intent intent = new Intent(this, MainActivity.class);
                startActivity(intent);
                Toast.makeText(getApplicationContext(), "Đăng nhập thành công", Toast.LENGTH_SHORT).show();
            } else {
                Toast.makeText(this, "Tài khoản và mật khẩu không tồn tại", Toast.LENGTH_SHORT).show();
            }
        };

        Response.ErrorListener errorListener = error -> Toast.makeText(LoginActivity.this, "Có lỗi xảy ra, đăng nhập thất bại!", Toast.LENGTH_SHORT).show();
        StringRequest stringRequest = new StringRequest(Request.Method.GET, api, listener, errorListener);
        RequestQueue requestQueue = Volley.newRequestQueue(this);
        requestQueue.add(stringRequest);
    }

    private void redirectRegister(){
        Intent intent = new Intent(this, RegisterActivity.class);
        startActivity(intent);
    }
}