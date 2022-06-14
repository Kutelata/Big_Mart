package com.example.project.utilities;

import android.app.Application;
import android.content.Intent;

import com.example.project.activities.LoginActivity;
import com.example.project.entities.KhachHang;

public class GlobalApplication extends Application {
    private static KhachHang khachHang = null;

    public KhachHang getKhachHang() {
        return khachHang;
    }

    public void setKhachHang(KhachHang khachHang) {
        GlobalApplication.khachHang = khachHang;
    }

    public void checkAuthentication() {
        if (khachHang == null) {
            Intent intent = new Intent(this, LoginActivity.class);
            startActivity(intent);
        }
    }
}
