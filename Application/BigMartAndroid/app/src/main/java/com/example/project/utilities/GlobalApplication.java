package com.example.project.utilities;

import android.app.Application;

import com.example.project.entities.Customer;
import com.example.project.entities.dto.ProductDTO;

import java.util.List;

public class GlobalApplication extends Application {
    private static GlobalApplication instance;
    private Customer mCustomerApp;
    private List<ProductDTO> mProductCart;

    @Override
    public void onCreate() {
        super.onCreate();
        instance = this;
    }

    public static GlobalApplication getInstance() {
        return instance;
    }

    public Customer getCustomerApp() {
        return mCustomerApp;
    }

    public void setCustomerApp(Customer customerApp) {
        this.mCustomerApp = customerApp;
    }

    public List<ProductDTO> getProductCart() {
        return mProductCart;
    }

    public void setProductCart(List<ProductDTO> mProductCart) {
        this.mProductCart = mProductCart;
    }
}
