package com.example.project.activities;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.example.project.databinding.ActivityRegisterBinding;
import com.example.project.entities.Customer;
import com.example.project.services.CustomerService;
import com.example.project.services.interfaces.ICustomerService;

import java.util.Base64;

public class RegisterActivity extends AppCompatActivity {
    ICustomerService customerService;
    ActivityRegisterBinding binding;
    EditText edtUserName, edtPhone, edtEmail, edtPassword, edtConfirmPassword;
    Button btnRegister;
    TextView tvLogin;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        binding = ActivityRegisterBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        customerService = new CustomerService(this);

        edtUserName = binding.edtUserName;
        edtPhone = binding.edtPhone;
        edtEmail = binding.edtEmail;
        edtPassword = binding.edtPassword;
        edtConfirmPassword = binding.edtConfirmPassword;
        btnRegister = binding.btnRegister;
        tvLogin = binding.tvLogin;

        btnRegister.setOnClickListener(view -> {
            if (edtUserName.getText().toString().equals("") ||
                    edtPhone.getText().toString().equals("") ||
                    edtEmail.getText().toString().equals("") ||
                    edtPassword.getText().toString().equals("") ||
                    edtConfirmPassword.getText().toString().equals("")) {
                Toast.makeText(this, "Các trường không được để rỗng", Toast.LENGTH_SHORT).show();
            } else if (!edtPassword.getText().toString().equals(edtConfirmPassword.getText().toString())) {
                Toast.makeText(this, "Mật khẩu và nhập lại mật khẩu không giống nhau", Toast.LENGTH_SHORT).show();
            } else {
                String password = edtPassword.getText().toString();
                String encodePass = null;
                if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
                    encodePass = Base64.getEncoder().encodeToString(password.getBytes());
                }
                Customer customer = new Customer(
                        edtUserName.getText().toString(),
                        edtPhone.getText().toString(),
                        edtEmail.getText().toString(),
                        encodePass);
                createAccount(customer);
            }
        });

        tvLogin.setOnClickListener(view -> redirectLogin());
    }

    private void createAccount(Customer customer) {
        customerService.insert(customer, newCustomer -> {
            if (newCustomer != null) {
                Intent intent = new Intent(this, LoginActivity.class);
                finish();
                startActivity(intent);
                Toast.makeText(getApplicationContext(), "Đămg ký tài khoản thành công", Toast.LENGTH_SHORT).show();
            } else {
                Toast.makeText(this, "Đăng ký tài khoản thất bại", Toast.LENGTH_SHORT).show();
            }
        });
    }

    private void redirectLogin() {
        Intent intent = new Intent(this, LoginActivity.class);
        finish();
        startActivity(intent);
    }
}