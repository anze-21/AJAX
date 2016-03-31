package com.kaishengit.service;

import com.kaishengit.entity.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductService {

    public List<Product> findAll() {
        Product product1 = new Product();
        product1.setId(108);
        product1.setProductName("iPhone6");
        product1.setPrice(5888F);
        product1.setNumber(100);

        Product product2 = new Product();
        product2.setId(109);
        product2.setProductName("蓝牙键盘");
        product2.setPrice(198F);
        product2.setNumber(50);

        Product product3 = new Product();
        product3.setId(128);
        product3.setProductName("LED显示器");
        product3.setPrice(976F);
        product3.setNumber(20);

        List<Product> list = new ArrayList<>();
        list.add(product1);
        list.add(product2);
        list.add(product3);

        return list;

    }

}
