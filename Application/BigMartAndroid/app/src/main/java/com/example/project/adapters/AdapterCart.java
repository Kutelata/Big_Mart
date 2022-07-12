package com.example.project.adapters;

import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.PopupMenu;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.example.project.R;
import com.example.project.activities.CartActivity;
import com.example.project.dialogs.DialogQuantity;
import com.example.project.entities.Product;
import com.example.project.entities.dto.ProductDTO;
import com.example.project.utilities.GlobalApplication;

import java.util.List;

public class AdapterCart extends ArrayAdapter<ProductDTO> implements DialogQuantity.IQuantity {
    private Context mCtx;
    private int mLayout;
    private List<ProductDTO> mProductDTOs;

    public AdapterCart(Context context, int resource, List<ProductDTO> productDTOs) {
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
        TextView tvCartQuantity = item.findViewById(R.id.tvCartQuantity);
        TextView tvProductPrice = item.findViewById(R.id.tvProductPrice);
        TextView tvProductPoint = item.findViewById(R.id.tvProductPoint);
        ImageView ivMenuProduct = item.findViewById(R.id.ivMenuProduct);

        ivMenuProduct.setOnClickListener(view -> showMenuEachProduct(productDTO.id, view, tvCartQuantity));

        tvProductName.setText(productDTO.name + "");
        tvCartQuantity.setText(String.format("Số lượng: %s", productDTO.cartQuantity));
        tvProductPrice.setText(productDTO.price.shortValue() + " VND");
        tvProductPoint.setText(productDTO.point + " điểm");

        return item;
    }

    private void showMenuEachProduct(int productId, View view, TextView textView) {
        PopupMenu popupMenu = new PopupMenu(mCtx, view);
        popupMenu.getMenuInflater().inflate(R.menu.menu_cart, popupMenu.getMenu());
        popupMenu.setOnMenuItemClickListener(menuItem -> actionMenuItemEachProduct(productId, menuItem));
        popupMenu.show();
    }

    private boolean actionMenuItemEachProduct(int productId, MenuItem item) {
        switch (item.getItemId()) {
            case R.id.menuChangeQuantity:
                showDialogQuantity(productId);
                break;
            case R.id.menuDelete:
                deleteProduct(productId);
                break;
        }
        return true;
    }

    private void showDialogQuantity(int productId) {
        DialogQuantity dialogQuantity = new DialogQuantity(productId, mCtx, this);
        dialogQuantity.show();
    }

    private void deleteProduct(int productId) {
        for (ProductDTO productDTO : mProductDTOs) {
            if (productDTO.id == productId) {
                mProductDTOs.remove(productDTO);
                this.notifyDataSetChanged();
                Toast.makeText(mCtx, "Xóa sản phẩm thành công", Toast.LENGTH_SHORT).show();
                break;
            }
        }
    }

    @Override
    public void changeQuantity(int productId, String quantity) {
        for (ProductDTO productDTO : mProductDTOs) {
            if (productDTO.id == productId) {
                productDTO.cartQuantity = Integer.parseInt(quantity);
                this.notifyDataSetChanged();
                Toast.makeText(mCtx, "Thay đổi số lượng thành công", Toast.LENGTH_SHORT).show();
                break;
            }
        }
    }
}
