package com.example.project.utilities;

import android.app.Application;
import com.example.project.entities.NhanVien;

public class GlobalApplication extends Application {
    private static NhanVien nhanVien = null;

    public static NhanVien getNhanVien() {
        return nhanVien;
    }

    public static void setNhanVien(NhanVien nhanVien) {
        GlobalApplication.nhanVien = nhanVien;
    }
}
