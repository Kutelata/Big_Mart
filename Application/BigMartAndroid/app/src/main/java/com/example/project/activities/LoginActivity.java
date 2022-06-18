package com.example.project.activities;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.example.project.R;
import com.example.project.entities.Employee;
import com.example.project.entities.Product;
import com.example.project.utilities.CallAPIServer;
import com.example.project.utilities.GlobalApplication;
import com.google.android.material.button.MaterialButton;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.util.List;

public class LoginActivity extends AppCompatActivity {
    MaterialButton btnLogin;
    EditText edtUserName;
    EditText edtPassword;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        redirectRegister();

        btnLogin = findViewById(R.id.btnLogin);
        edtUserName = findViewById(R.id.edtUserName);
        edtPassword = findViewById(R.id.edtPassword);

        btnLogin.setOnClickListener(view ->
                actionLogin(edtUserName.getText().toString(), edtPassword.getText().toString()));
    }

    private void actionLogin(String userName, String password) {
        Intent intent = new Intent(LoginActivity.this, MainActivity.class);
        finish();
        startActivity(intent);
//        String api = CallAPIServer.prepareAPI("");
//
//        Response.Listener listener = response -> {
//            String json = response.toString();
//
//            Gson gson = new Gson();
//            Product product = gson.fromJson(json, Product.class);
//            TypeToken<List<Employee>> typeToken = new TypeToken<List<Employee>>() {
//            };
//            Log.e("Test:", product.getTest() + " " + product.getTitle());
//            List<Employee> lst = gson.fromJson(json, typeToken.getType());
//            boolean result = false;
//            for (Employee employee : lst) {
//                if (userName == employee.getUsername()
//                        && password == employee.getPassword()) {
//                    GlobalApplication.setNhanVien(employee);
//                    result = true;
//                    break;
//                }
//            }
//            if (result) {
//                Intent intent = new Intent(LoginActivity.this, MainActivity.class);
//                finish();
//                startActivity(intent);
//            } else {
//                Toast.makeText(LoginActivity.this, "Tài khoản và mật khẩu không tồn tại", Toast.LENGTH_SHORT).show();
//            }
//        };

//        Response.ErrorListener errorListener = error ->
//                Toast.makeText(LoginActivity.this, "Có lỗi xảy ra, đăng nhập thất bại!", Toast.LENGTH_SHORT).show();
//
//        StringRequest stringRequest = new StringRequest(api, listener, errorListener);
//        RequestQueue requestQueue = Volley.newRequestQueue(LoginActivity.this);
//        requestQueue.add(stringRequest);
    }

    private void redirectRegister() {
        TextView tvRegister = findViewById(R.id.register);
        tvRegister.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(LoginActivity.this, RegisterActivity.class);
                finish();
                startActivity(intent);
            }
        });
    }
}