package com.example.project.utilities;

import android.app.Application;
import com.example.project.entities.Employee;

public class GlobalApplication extends Application {
    private static Employee _employee = null;

    public static Employee getNhanVien() {
        return _employee;
    }

    public static void setNhanVien(Employee employee) {
        GlobalApplication._employee = employee;
    }
}
