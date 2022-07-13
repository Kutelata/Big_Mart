package com.example.project.dialogs;

import android.app.Dialog;
import android.content.Context;
import android.os.Bundle;
import android.widget.TextView;

import androidx.annotation.NonNull;

import com.example.project.adapters.AdapterCart;
import com.example.project.databinding.DialogQuantityBinding;

public class DialogQuantity extends Dialog {
    private DialogQuantityBinding binding;
    private AdapterCart mAdapterCart;
    private Integer mProductId;

    public interface IQuantity {
        public void changeQuantity(int productId, String quantity);
    }

    public DialogQuantity(int productId, @NonNull Context context, AdapterCart adapterCart) {
        super(context);
        mAdapterCart = adapterCart;
        mProductId = productId;
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        binding = DialogQuantityBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        binding.btnChangeQuantity.setOnClickListener(view -> {
            mAdapterCart.changeQuantity(mProductId, binding.edtQuantity.getText().toString());
            dismiss();
        });
    }
}
