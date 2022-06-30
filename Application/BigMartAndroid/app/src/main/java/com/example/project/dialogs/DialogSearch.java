package com.example.project.dialogs;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.app.Dialog;
import android.content.Context;
import android.os.Bundle;

import com.example.project.R;
import com.example.project.activities.MainActivity;
import com.example.project.databinding.DialogSearchBinding;

public class DialogSearch extends Dialog {
    private DialogSearchBinding binding;
    private MainActivity mMain;

    public interface ISearch{
        public void searchProductName(String data);
    }

    public DialogSearch(@NonNull Context context) {
        super(context);
        mMain = (MainActivity) context;
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = DialogSearchBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        binding.btnSearch.setOnClickListener(view -> {
            mMain.searchProductName(binding.edtSearch.getText().toString());
            dismiss();
        });
    }
}