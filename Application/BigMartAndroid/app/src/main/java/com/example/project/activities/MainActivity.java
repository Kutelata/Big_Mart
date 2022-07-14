package com.example.project.activities;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.PopupMenu;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import com.example.project.R;
import com.example.project.adapters.AdapterProduct;
import com.example.project.databinding.ActivityMainBinding;
import com.example.project.dialogs.DialogSearch;
import com.example.project.entities.Category;
import com.example.project.entities.dto.ProductDTO;
import com.example.project.services.CategoryService;
import com.example.project.services.CustomerService;
import com.example.project.services.ProductService;
import com.example.project.services.interfaces.ICaregoryService;
import com.example.project.services.interfaces.ICustomerService;
import com.example.project.services.interfaces.IProductService;
import com.example.project.utilities.CallAPIServer;
import com.example.project.utilities.GlobalApplication;
import com.squareup.picasso.Picasso;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity implements DialogSearch.ISearch {
    ICustomerService customerService;
    ICaregoryService categoryService;
    IProductService productService;

    ActivityMainBinding binding;
    Button btnSearch;
    Spinner sCategory;
    ListView lvProduct;
    ImageView ivOptionMenu, ivUserImage;
    TextView tvUserName;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        binding = ActivityMainBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        customerService = new CustomerService(this);
        categoryService = new CategoryService(this);
        productService = new ProductService(this);

        btnSearch = binding.btnSearch;
        sCategory = binding.sCategory;
        lvProduct = binding.lvProduct;

        ivOptionMenu = findViewById(R.id.ivOptionMenu);
        tvUserName = findViewById(R.id.tvUserName);
//        ivUserImage = findViewById(R.id.ivUserImage);
//
//        tvUserName.setText(GlobalApplication.getInstance().getCustomerApp().getName());
//        Picasso.get()
//                .load(CallAPIServer.prepareImageLink("User", ))
//                .resize(40, 40)
//                .centerCrop()
//                .into(ivUserImage);

        btnSearch.setOnClickListener(view -> showDialogSearch());
        ivOptionMenu.setOnClickListener(view -> showMenuOptionHeader());
        sCategory.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l) {
                String categoryName = (String) adapterView.getSelectedItem();
                getListProduct(categoryName);
            }

            @Override
            public void onNothingSelected(AdapterView<?> adapterView) {
                getListProduct("Chọn danh mục");
            }
        });

        getListCategory();
    }

    private void showMenuOptionHeader() {
        PopupMenu popup = new PopupMenu(this, ivOptionMenu);
        popup.getMenuInflater().inflate(R.menu.menu_header, popup.getMenu());
        popup.setOnMenuItemClickListener(this::actionMenuItemHeader);
        popup.show();
    }

    private boolean actionMenuItemHeader(MenuItem item) {
        switch (item.getItemId()) {
            case R.id.menuProfile:
                redirectProfile();
                break;
            case R.id.menuCart:
                redirectCart();
                break;
            case R.id.menuLogout:
                logout();
                break;
        }
        return true;
    }

    private void getListProduct(String categoryName) {
        productService.getAllProduct(listProduct -> {
            if (listProduct != null) {
                AdapterProduct adapterProduct;
                if (!categoryName.equals("Chọn danh mục")) {
                    List<ProductDTO> newProductDTOs = new ArrayList<>();
                    for (ProductDTO productDTO : listProduct) {
                        if (categoryName.equals(productDTO.categoryId.getName())) {
                            newProductDTOs.add(productDTO);
                        }
                    }
                    adapterProduct = new AdapterProduct(this, R.layout.item_product, newProductDTOs, productService);
                } else {
                    adapterProduct = new AdapterProduct(this, R.layout.item_product, listProduct, productService);
                }
                lvProduct.setAdapter(adapterProduct);
            } else {
                Toast.makeText(this, "Có lỗi xảy ra!", Toast.LENGTH_SHORT).show();
            }
        });
    }

    private void getListCategory() {
        categoryService.getAll(listCategory -> {
            if (listCategory != null) {
                ArrayList<String> categorySpinners = new ArrayList<>();
                categorySpinners.add("Chọn danh mục");
                for (Category category : listCategory) {
                    categorySpinners.add(category.getName());
                }
                ArrayAdapter<String> adapter = new ArrayAdapter<>(this, R.layout.spinner_item, categorySpinners);
                sCategory.setAdapter(adapter);
                sCategory.setSelection(0);
            } else {
                Toast.makeText(this, "Có lỗi xảy ra!", Toast.LENGTH_SHORT).show();
            }
        });
    }

    private void showDialogSearch() {
        DialogSearch dialogSearch = new DialogSearch(this);
        dialogSearch.show();
    }

    @Override
    public void searchProductName(String productName) {
        productService.getAllProduct(listProduct -> {
            if (listProduct != null) {
                AdapterProduct adapterProduct;
                if (!productName.equals("")) {
                    List<ProductDTO> newProductDTOs = new ArrayList<>();
                    for (ProductDTO productDTO : listProduct) {
                        if (productDTO.name.toLowerCase().contains(productName.toLowerCase())) {
                            newProductDTOs.add(productDTO);
                        }
                    }
                    adapterProduct = new AdapterProduct(this, R.layout.item_product, newProductDTOs, productService);
                } else {
                    adapterProduct = new AdapterProduct(this, R.layout.item_product, listProduct, productService);
                }
                lvProduct.setAdapter(adapterProduct);
            } else {
                Toast.makeText(this, "Có lỗi xảy ra!", Toast.LENGTH_SHORT).show();
            }
        });
    }

    private void redirectProfile() {
        Intent intent = new Intent(this, ProfileActivity.class);
        startActivity(intent);
    }

    private void redirectCart() {
        List<ProductDTO> productDTOs = GlobalApplication.getInstance().getProductCart();
        if (productDTOs != null && productDTOs.size() != 0) {
            Intent intent = new Intent(this, CartActivity.class);
            startActivity(intent);
        } else {
            Toast.makeText(this, "Không có sản phẩm trong giỏ hàng", Toast.LENGTH_SHORT).show();
        }
    }

    private void logout() {
        Intent intent = new Intent(this, LoginActivity.class);
        finish();
        startActivity(intent);
    }
}