package com.example.project.utilities;

import android.app.Application;
import com.example.project.entities.dto.EmployeeDTO;

public class GlobalApplication extends Application {
    private static GlobalApplication instance;
    private EmployeeDTO mEmployeeSaveLogin;

    @Override
    public void onCreate() {
        super.onCreate();
        instance = this;
    }

    public static GlobalApplication getInstance() {
        return instance;
    }

    public EmployeeDTO getEmployeeSaveLogin() {
        return mEmployeeSaveLogin;
    }

    public void setEmployeeSaveLogin(EmployeeDTO mEmployeeSaveLogin) {
        this.mEmployeeSaveLogin = mEmployeeSaveLogin;
    }
}
