package com.example.project.adapters;

import android.content.Context;
import android.content.Intent;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.PopupMenu;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.example.project.R;
import com.example.project.activities.MainActivity;
import com.example.project.activities.ProductDetailActivity;
import com.example.project.entities.dto.ProductDTO;

import java.util.List;

public class AdapterProduct extends ArrayAdapter<ProductDTO> {
    private Context mCtx;
    private int mLayout;
    private List<ProductDTO> mProductDTOs;

    public AdapterProduct(Context context, int resource, List<ProductDTO> productDTOs) {
        super(context, resource, productDTOs);
        this.mCtx = context;
        this.mLayout = resource;
        this.mProductDTOs = productDTOs;
    }

    @NonNull
    @Override
    public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent) {
        View item = convertView;
        if (item == null) {
            item = LayoutInflater.from(mCtx).inflate(mLayout, null);
        }

        ProductDTO productDTO = mProductDTOs.get(position);

        TextView tvProductName = item.findViewById(R.id.tvProductName);
        TextView tvProductPrice = item.findViewById(R.id.tvProductPrice);
        RelativeLayout rlMenuProduct = item.findViewById(R.id.rlMenuProduct);

        rlMenuProduct.setOnClickListener(view -> {
            PopupMenu popupMenu = new PopupMenu(mCtx, rlMenuProduct);
            popupMenu.getMenuInflater().inflate(R.menu.menu_product, popupMenu.getMenu());

            popupMenu.setOnMenuItemClickListener(menuItem -> {
                int idMenu = menuItem.getItemId();
                switch (idMenu) {
                    case R.id.menuProductDetail:
                        Intent intent = new Intent(mCtx, ProductDetailActivity.class);
                        intent.putExtra("productId", productDTO.id);
                        mCtx.startActivity(intent);
                        break;

                    case R.id.menuAddToCart:
                        break;
                }
                return true;
            });

            popupMenu.show();
        });

        tvProductName.setText(productDTO.name + "");
        tvProductPrice.setText(productDTO.price + "");

        return item;
    }
}
