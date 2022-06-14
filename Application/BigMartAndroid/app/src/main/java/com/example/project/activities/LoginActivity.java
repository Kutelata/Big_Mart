package com.example.project.activities;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.example.project.R;
import com.example.project.entities.KhachHang;
import com.example.project.utilities.CallAPIServer;
import com.google.android.material.button.MaterialButton;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.util.List;

public class LoginActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        redirectRegister();

        MaterialButton btnLogin = findViewById(R.id.loginbtn);
        btnLogin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                actionLogin();
            }
        });
    }

    private void actionLogin() {
        String api = CallAPIServer.prepareAPI("customers");

        Response.Listener listener = new Response.Listener() {
            @Override
            public void onResponse(Object response) {
                String json = response.toString();
                Gson gson = new Gson();
                TypeToken<List<KhachHang>> typeToken = new TypeToken<List<KhachHang>>() {};
                List<KhachHang> lst = gson.fromJson(json, typeToken.getType());
                for (KhachHang kh : lst) {
                    Log.e("-", kh.getTen() + " | " + kh.getEmail());
                }
            }
        };

        Response.ErrorListener errorListener = new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(LoginActivity.this, "Đăng nhập thất bại!", Toast.LENGTH_SHORT).show();
                Log.e("ERROR LOAD JSON", error.toString());
            }
        };

        StringRequest stringRequest = new StringRequest(api, listener, errorListener);
        RequestQueue requestQueue = Volley.newRequestQueue(LoginActivity.this);
        requestQueue.add(stringRequest);
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