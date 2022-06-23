package com.example.project.activities;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.widget.EditText;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.example.project.R;
import com.example.project.databinding.ActivityLoginBinding;
import com.example.project.entities.dto.EmployeeDTO;
import com.example.project.utilities.CallAPIServer;
import com.example.project.utilities.GlobalApplication;
import com.google.android.material.button.MaterialButton;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.util.List;

public class LoginActivity extends AppCompatActivity {
    ActivityLoginBinding binding;
    MaterialButton btnLogin;
    EditText edtUsername;
    EditText edtPassword;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        binding = ActivityLoginBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        GlobalApplication.getInstance().setEmployeeSaveLogin(null);

        btnLogin = binding.btnLogin;
        edtUsername = binding.edtUsername;
        edtPassword = binding.edtPassword;

        edtUsername.setText("vothithanhthao");
        edtPassword.setText("vothithanhthao");

        btnLogin.setOnClickListener(view ->
                actionLogin(edtUsername.getText().toString(), edtPassword.getText().toString()));
    }

    private void actionLogin(String userName, String password) {
        String api = CallAPIServer.prepareAPI("employees");

        Response.Listener listener = response -> {
            String json = response.toString();
            Gson gson = new Gson();
            TypeToken<List<EmployeeDTO>> typeToken = new TypeToken<List<EmployeeDTO>>() {
            };
            List<EmployeeDTO> employeeDTOs = gson.fromJson(json, typeToken.getType());
            boolean result = false;
            for (EmployeeDTO employeeDTO : employeeDTOs) {
                if (userName.equals(employeeDTO.username)
                        && password.equals(employeeDTO.password)) {
                    GlobalApplication.getInstance().setEmployeeSaveLogin(employeeDTO);
                    result = true;
                    break;
                }
            }
            if (result) {
                Intent intent = new Intent(this, MainActivity.class);
                finish();
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
}