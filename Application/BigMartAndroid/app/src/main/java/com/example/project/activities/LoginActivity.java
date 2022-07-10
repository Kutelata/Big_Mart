package com.example.project.activities;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.example.project.databinding.ActivityLoginBinding;
import com.example.project.entities.Customer;
import com.example.project.entities.dto.ProductDTO;
import com.example.project.services.CustomerService;
import com.example.project.services.interfaces.ICustomerService;
import com.example.project.utilities.GlobalApplication;

import java.util.ArrayList;

public class LoginActivity extends AppCompatActivity {
    ICustomerService customerService;
    ActivityLoginBinding binding;
    EditText edtEmail, edtPassword;
    Button btnLogin;
    TextView tvRegister;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        binding = ActivityLoginBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        customerService = new CustomerService(this);

        GlobalApplication.getInstance().setCustomerApp(null);
        GlobalApplication.getInstance().setProductCart(new ArrayList<>());

        btnLogin = binding.btnLogin;
        edtEmail = binding.edtEmail;
        edtPassword = binding.edtPassword;
        tvRegister = binding.tvRegister;

        edtEmail.setText("nguyenngocthuy@gmail.com");
        edtPassword.setText("123");

        btnLogin.setOnClickListener(view -> {
            if (edtEmail.getText().toString().equals("") ||
                    edtPassword.getText().toString().equals("")) {
                Toast.makeText(this, "Các trường không được để rỗng", Toast.LENGTH_SHORT).show();
            } else {
                actionLogin(edtEmail.getText().toString(), edtPassword.getText().toString());
            }
        });

        tvRegister.setOnClickListener(view -> redirectRegister());
    }

    private void actionLogin(String email, String password) {
        customerService.getAll(listCustomer -> {
            if (listCustomer != null) {
                boolean result = false;
                for (Customer customer : listCustomer) {
                    if (email.equals(customer.getEmail())
                            && password.equals(customer.getPassword())
                            && customer.getStatus() == 1) {
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
            } else {
                Toast.makeText(this, "Có lỗi xảy ra!", Toast.LENGTH_SHORT).show();
            }
        });
    }

    private void redirectRegister() {
        Intent intent = new Intent(this, RegisterActivity.class);
        startActivity(intent);
    }
}