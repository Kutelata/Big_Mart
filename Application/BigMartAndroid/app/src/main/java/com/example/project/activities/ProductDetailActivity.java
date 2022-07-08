package com.example.project.activities;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.example.project.R;
import com.example.project.databinding.ActivityProductDetailBinding;
import com.example.project.entities.dto.ProductDTO;
import com.example.project.services.ProductService;
import com.example.project.services.interfaces.IProductService;
import com.example.project.utilities.GlobalApplication;

import java.util.List;

public class ProductDetailActivity extends AppCompatActivity {
    IProductService productService;
    ActivityProductDetailBinding binding;
    ImageView ivProductImage;
    TextView tvProductId, tvProductName,
            tvProductCategory, tvProductProvider,
            tvProductQuantity, tvProductPrice, tvProductSaleableQty, tvProductPoint, tvProductCreatedAt,
            tvProductUpdatedAt, tvProductDescription, tvProductStatus;
    Button btnAddToCart;
    Intent intent;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_product_detail);

        binding = ActivityProductDetailBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        productService = new ProductService(this);

        tvProductId = binding.tvProductId;
        tvProductName = binding.tvProductName;

        ivProductImage = binding.ivProductImage;

        tvProductCategory = binding.tvProductCategory;
        tvProductProvider = binding.tvProductProvider;
        tvProductQuantity = binding.tvProductQuantity;
        tvProductPrice = binding.tvProductPrice;
        tvProductSaleableQty = binding.tvProductSaleableQty;
        tvProductPoint = binding.tvProductPoint;
        tvProductCreatedAt = binding.tvProductCreatedAt;
        tvProductUpdatedAt = binding.tvProductUpdatedAt;
        tvProductDescription = binding.tvProductDescription;
        tvProductStatus = binding.tvProductStatus;
        btnAddToCart = binding.btnAddToCart;

        intent = getIntent();
        int productId = intent.getIntExtra("productId", 0);

        btnAddToCart.setOnClickListener(view -> addProductToCart(productId));

        getProductDetail(productId);
    }

    private void getProductDetail(int productId) {
        productService.getProductById(productId, product -> {
            if (product != null) {
                tvProductId.setText(product.id.toString());
                tvProductName.setText(product.name);
                tvProductCategory.setText(product.categoryId.getName());
                tvProductProvider.setText(product.providerId.getName());
                tvProductQuantity.setText(product.quantity.toString());
                tvProductPrice.setText(product.price.toString());
                tvProductSaleableQty.setText(product.saleableQty.toString());
                tvProductPoint.setText(product.point.toString());
                tvProductCreatedAt.setText((product.createdAt == null) ? "" : product.createdAt.toString());
                tvProductUpdatedAt.setText((product.updatedAt == null) ? "" : product.updatedAt.toString());
                tvProductDescription.setText(product.description);
                tvProductStatus.setText(product.status.toString());
            } else {
                Toast.makeText(this, "Có lỗi xảy ra!", Toast.LENGTH_SHORT).show();
            }
        });
    }

    private void addProductToCart(int productId){
        productService.getProductById(productId, product -> {
            if (product != null) {
                List<ProductDTO> productCart = GlobalApplication.getInstance().getProductCart();
                int checkProduct = 0;
                if (productCart.size() != 0) {
                    for (ProductDTO item : productCart) {
                        if (item.id == productId) {
                            item.cartQuantity++;
                            checkProduct++;
                            break;
                        }
                    }
                }
                if (checkProduct == 0) {
                    productCart.add(product);
                }
                Toast.makeText(this, "Thêm thành công!", Toast.LENGTH_SHORT).show();
            } else {
                Toast.makeText(this, "Có lỗi xảy ra!", Toast.LENGTH_SHORT).show();
            }
        });
    }
}