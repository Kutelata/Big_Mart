package com.example.project.utilities;

import android.app.Application;
import com.example.project.entities.dto.EmployeeSaveLogin;

public class GlobalApplication extends Application {
    private static GlobalApplication instance;
    private EmployeeSaveLogin mEmployeeSaveLogin;

    @Override
    public void onCreate() {
        super.onCreate();
        instance = this;
    }

    public static GlobalApplication getInstance() {
        return instance;
    }

    public EmployeeSaveLogin getEmployeeSaveLogin() {
        return mEmployeeSaveLogin;
    }

    public void setEmployeeSaveLogin(EmployeeSaveLogin mEmployeeSaveLogin) {
        this.mEmployeeSaveLogin = mEmployeeSaveLogin;
    }
}
