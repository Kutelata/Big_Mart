package com.example.project.dialogs;

import android.app.Dialog;
import android.content.Context;
import android.os.Bundle;

import androidx.annotation.NonNull;

import com.example.project.adapters.AdapterProduct;
import com.example.project.databinding.DialogAddToCartBinding;

public class DialogAddToCart extends Dialog {
    private DialogAddToCartBinding binding;
    private AdapterProduct mAdapterProduct;
    private Integer mProductId;

    public interface IQuantity {
        public void inputQuantity(int productId, String quantity);
    }

    public DialogAddToCart(int productId, @NonNull Context context, AdapterProduct adapterProduct) {
        super(context);
        mAdapterProduct = adapterProduct;
        mProductId = productId;
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        binding = DialogAddToCartBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        binding.btnAddToCart.setOnClickListener(view -> {
            mAdapterProduct.inputQuantity(mProductId, binding.edtQuantity.getText().toString());
            dismiss();
        });
    }
}
