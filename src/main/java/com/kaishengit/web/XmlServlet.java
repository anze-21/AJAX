package com.kaishengit.web;

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

@WebServlet("/product.xml")
public class XmlServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/xml;charset=UTF-8");

        List<Product> productList = new ProductService().findAll();

        PrintWriter out = resp.getWriter();
        out.print("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
        out.print("<products>");
        for(Product product : productList) {
            out.print("<product id=\"" + product.getId() + "\">");
            out.print("<name>" + product.getProductName() + "</name>");
            out.print("<price>" + product.getPrice() + "</price>");
            out.print("<num>" + product.getNumber() + "</num>");
            out.print("</product>");
        }
        out.print("</products>");

        out.flush();
        out.close();


    }
}
