package com.example.project.services.interfaces;

import com.example.project.entities.Product;
import com.example.project.entities.dto.ProductDTO;
import com.example.project.utilities.VolleyResult;

import java.util.List;

public interface IProductService extends IService<Product> {
    void getAllProduct(final VolleyResult<List<ProductDTO>> callback);
    void getProductById(int id,final VolleyResult<ProductDTO> callback);
}
