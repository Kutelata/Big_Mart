package com.example.project.utilities;

import android.app.Application;

import com.example.project.entities.Product;
import com.example.project.entities.dto.EmployeeDTO;
import com.example.project.entities.dto.ProductDTO;

import java.util.ArrayList;
import java.util.List;

public class GlobalApplication extends Application {
    private static GlobalApplication instance;
    private EmployeeDTO mEmployeeSaveLogin;
    private List<ProductDTO> mProductCart;

    @Override
    public void onCreate() {
        super.onCreate();
        instance = this;

        mProductCart = new ArrayList<>();
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

    public List<ProductDTO> getProductCart() {
        return mProductCart;
    }

    public void setProductCart(List<ProductDTO> mProductCart) {
        this.mProductCart = mProductCart;
    }
}
