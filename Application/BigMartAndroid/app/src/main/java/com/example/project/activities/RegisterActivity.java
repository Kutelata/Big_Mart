package com.example.project.activities;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import com.example.project.databinding.ActivityRegisterBinding;
import com.example.project.entities.Customer;

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

        });

        tvLogin.setOnClickListener(view -> redirectLogin());
    }

    private void redirectLogin(){
        Intent intent = new Intent(this, LoginActivity.class);
        finish();
        startActivity(intent);
    }
}