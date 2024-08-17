package com.docker.app.controller;

import com.docker.app.model.entity.Product;
import com.docker.app.model.request.ProductRequest;
import com.docker.app.model.response.BaseApiResponse;
import com.docker.app.service.ProductService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/products")
public class ProductController {
    private final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @PostMapping
    public ResponseEntity<BaseApiResponse<Product>> addNewProduct(@RequestBody ProductRequest productRequest) {
        return null;
    }
}
