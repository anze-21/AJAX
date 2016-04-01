package com.kaishengit.web;

import com.google.gson.Gson;
import com.kaishengit.entity.Product;
import com.kaishengit.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/product.json")
public class JsonServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json;charset=UTF-8");

        List<Product> productList = new ProductService().findAll();

        PrintWriter out = resp.getWriter();
        out.print(new Gson().toJson(productList));
        out.flush();
        out.close();
    }
}
