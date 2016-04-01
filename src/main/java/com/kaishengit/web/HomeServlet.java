package com.kaishengit.web;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/home.do")
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String msg = req.getParameter("msg");
        msg = new String(msg.getBytes("ISO8859-1"),"UTF-8");

        System.out.println("Hi,Maven Web App! " + msg);

        PrintWriter out = resp.getWriter();
        out.print("Hello,jQuery!");
        out.close();

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String username = req.getParameter("username");

        PrintWriter out = resp.getWriter();
        if("tom".equals(username)) {
            out.print("0");
        } else {
            out.print("1");
        }
        out.flush();
        out.close();
    }
}
