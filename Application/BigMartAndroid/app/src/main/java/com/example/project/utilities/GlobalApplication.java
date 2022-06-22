package com.example.project.utilities;

import android.app.Application;

import com.example.project.entities.Product;
import com.example.project.entities.dto.EmployeeDTO;

import java.util.List;

public class GlobalApplication extends Application {
    private static GlobalApplication instance;
    private EmployeeDTO mEmployeeSaveLogin;
    private List<Product> mProductCart;

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

    public List<Product> getProductCart() {
        return mProductCart;
    }

    public void setProductCart(List<Product> mProductCart) {
        this.mProductCart = mProductCart;
    }
}
