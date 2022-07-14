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
import com.example.project.activities.ProductDetailActivity;
import com.example.project.dialogs.DialogAddToCart;
import com.example.project.entities.dto.ProductDTO;
import com.example.project.services.interfaces.IProductService;
import com.example.project.utilities.GlobalApplication;

import java.util.List;

public class AdapterProduct extends ArrayAdapter<ProductDTO> implements DialogAddToCart.IQuantity {
    private Context mCtx;
    private int mLayout;
    private List<ProductDTO> mProductDTOs;
    private IProductService mProductService;

    public AdapterProduct(Context context, int resource, List<ProductDTO> productDTOs, IProductService productService) {
        super(context, resource, productDTOs);
        this.mCtx = context;
        this.mLayout = resource;
        this.mProductDTOs = productDTOs;
        this.mProductService = productService;
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
        TextView tvProductPoint = item.findViewById(R.id.tvProductPoint);
        ImageView ivMenuProduct = item.findViewById(R.id.ivMenuProduct);

        ivMenuProduct.setOnClickListener(view -> showMenuEachProduct(productDTO.id, view));

        tvProductName.setText(productDTO.name + "");
        tvProductPrice.setText(productDTO.price.shortValue() + " VND");
        tvProductPoint.setText(productDTO.point + " điểm");

        return item;
    }

    private void showMenuEachProduct(int productId, View view) {
        PopupMenu popupMenu = new PopupMenu(mCtx, view);
        popupMenu.getMenuInflater().inflate(R.menu.menu_product, popupMenu.getMenu());
        popupMenu.setOnMenuItemClickListener(menuItem -> actionMenuItemEachProduct(productId, menuItem));
        popupMenu.show();
    }

    private boolean actionMenuItemEachProduct(int productId, MenuItem item) {
        switch (item.getItemId()) {
            case R.id.menuProductDetail:
                passProductId(productId);
                break;
            case R.id.menuAddToCart:
                menuInputQuantity(productId);
                break;
        }
        return true;
    }

    private void passProductId(int productId) {
        Intent intent = new Intent(mCtx, ProductDetailActivity.class);
        intent.putExtra("productId", productId);
        mCtx.startActivity(intent);
    }

    private void menuInputQuantity(int productId) {
        DialogAddToCart dialogAddToCart = new DialogAddToCart(productId, mCtx, this);
        dialogAddToCart.show();
    }

    @Override
    public void inputQuantity(int productId, String quantity) {
        mProductService.getProductById(productId, product -> {
            if (product != null) {
                int convertQuantity = quantity.equals("") ? 0 : Integer.parseInt(quantity);
                if (convertQuantity != 0 && convertQuantity <= product.quantity) {
                    List<ProductDTO> productCarts = GlobalApplication.getInstance().getProductCart();
                    if (productCarts.size() != 0) {
                        for (ProductDTO item : productCarts) {
                            if (item.id == productId) {
                                item.cartQuantity += Integer.parseInt(quantity);
                                break;
                            }
                        }
                    } else {
                        product.cartQuantity = Integer.parseInt(quantity);
                        productCarts.add(product);
                    }
                    Toast.makeText(mCtx, "Thêm sản phẩm thành công!", Toast.LENGTH_SHORT).show();
                } else {
                    Toast.makeText(mCtx, "Số lượng không đúng định dạng!", Toast.LENGTH_SHORT).show();
                }
            } else {
                Toast.makeText(mCtx, "Có lỗi xảy ra!", Toast.LENGTH_SHORT).show();
            }
        });
    }
}
