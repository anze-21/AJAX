package com.kaishengit;

import com.google.gson.Gson;
import com.kaishengit.entity.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Test {

    public static void main(String[] args)  {

        Product product = new Product();
        product.setId(102);
        product.setPrice(56F);
        product.setProductName("鼠标");
        product.setNumber(100);

        Product product2 = new Product();
        product2.setId(108);
        product2.setPrice(1099F);
        product2.setProductName("音响");
        product2.setNumber(60);

        List<String> names = new ArrayList<>();
        names.add("A1");
        names.add("A2");
        names.add("A3");

        List<Product> productList = new ArrayList<>();
        productList.add(product);
        productList.add(product2);

        Map<String,Object> map = new HashMap<>();
        map.put("product",product);
        map.put("start",5);





        Gson gson = new Gson();
        String json = gson.toJson(map);

        System.out.println(json);








    }

}
