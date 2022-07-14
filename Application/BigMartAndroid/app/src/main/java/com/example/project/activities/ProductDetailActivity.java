package com.example.project.activities;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.example.project.R;
import com.example.project.databinding.ActivityProductDetailBinding;
import com.example.project.entities.dto.ProductDTO;
import com.example.project.services.ProductService;
import com.example.project.services.interfaces.IProductService;
import com.example.project.utilities.CallAPIServer;
import com.example.project.utilities.GlobalApplication;
import com.squareup.picasso.Picasso;

import java.util.List;

public class ProductDetailActivity extends AppCompatActivity {
    IProductService productService;
    ActivityProductDetailBinding binding;
    ImageView ivProductImage;
    TextView tvProductId, tvProductName, tvProductCategory, tvProductProvider,
            tvProductQuantity, tvProductPrice, tvProductPoint, tvProductDescription;
    EditText edtQuantity;
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
        tvProductPoint = binding.tvProductPoint;
        tvProductDescription = binding.tvProductDescription;
        edtQuantity = binding.edtQuantity;
        btnAddToCart = binding.btnAddToCart;

        intent = getIntent();
        int productId = intent.getIntExtra("productId", 0);

        btnAddToCart.setOnClickListener(view -> addProductToCart(productId, edtQuantity.getText().toString()));

        getProductDetail(productId);
    }

    private void getProductDetail(int productId) {
        productService.getProductById(productId, product -> {
            if (product != null) {
                tvProductId.setText(product.id.toString());
                tvProductName.setText(product.name);

                Picasso.get()
                        .load(CallAPIServer.prepareImageLink("Product", product.image))
                        .resize(80, 80)
                        .centerCrop()
                        .into(ivProductImage);

                tvProductCategory.setText(product.categoryId.getName());
                tvProductProvider.setText(product.providerId.getName());
                tvProductQuantity.setText(product.quantity.toString());
                tvProductPrice.setText(product.price.toString() + " VND");
                tvProductPoint.setText(product.point.toString());
                tvProductDescription.setText(product.description);
            } else {
                Toast.makeText(this, "Có lỗi xảy ra!", Toast.LENGTH_SHORT).show();
            }
        });
    }

    private void addProductToCart(int productId, String quantity) {
        productService.getProductById(productId, product -> {
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
                    Toast.makeText(this, "Thêm sản phẩm thành công!", Toast.LENGTH_SHORT).show();
                } else {
                    Toast.makeText(this, "Số lượng không đúng định dạng!", Toast.LENGTH_SHORT).show();
                }
            } else {
                Toast.makeText(this, "Có lỗi xảy ra!", Toast.LENGTH_SHORT).show();
            }
        });
    }
}