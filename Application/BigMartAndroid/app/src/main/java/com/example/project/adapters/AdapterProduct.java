package com.example.project.adapters;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.example.project.entities.Employee;

public class AdapterProduct extends ArrayAdapter<Employee> {
    private Context mCtx;
    private int mLayout;
    private Employee[] mArr;

    public AdapterProduct(Context context, int resource, Employee[] nhanViens) {
        super(context, resource, nhanViens);
        this.mCtx = context;
        this.mLayout = resource;
        this.mArr = nhanViens;
    }

    @NonNull
    @Override
    public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent) {
        View item = convertView;
        if(item == null){
            item = LayoutInflater.from(mCtx).inflate(mLayout, null);
        }

        return super.getView(position, convertView, parent);
    }
}
