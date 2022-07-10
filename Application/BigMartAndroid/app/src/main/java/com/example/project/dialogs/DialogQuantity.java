package com.example.project.dialogs;

import android.app.Dialog;
import android.content.Context;
import android.os.Bundle;

import androidx.annotation.NonNull;

import com.example.project.adapters.AdapterCart;
import com.example.project.databinding.DialogQuantityBinding;

public class DialogQuantity extends Dialog {
    private DialogQuantityBinding binding;
    private AdapterCart mAdapterCart;

    public interface IQuantity{
        public void changeQuantity(String quantity);
    }

    public DialogQuantity(@NonNull Context context, AdapterCart adapterCart) {
        super(context);
        mAdapterCart = adapterCart;
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        binding = DialogQuantityBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        binding.btnChangeQuantity.setOnClickListener(view -> {
            mAdapterCart.changeQuantity(binding.edtQuantity.getText().toString());
            dismiss();
        });
    }
}
