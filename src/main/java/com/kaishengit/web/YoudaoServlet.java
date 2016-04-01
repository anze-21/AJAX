package com.kaishengit.web;

import com.kaishengit.util.HttpUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/youdao.do")
public class YoudaoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        
        String word = req.getParameter("word");
        String docType = req.getParameter("doctype");
        word = new String(word.getBytes("ISO8859-1"),"UTF-8");

        String youDaoApi = "http://fanyi.youdao.com/openapi.do?keyfrom=kaishengit&key=1587754017&type=data&doctype="+docType+"&version=1.1&q="+word;
        String xml = HttpUtil.getText(youDaoApi);

        resp.setCharacterEncoding("UTF-8");
        if("xml".equalsIgnoreCase(docType)) {
            resp.setContentType("text/xml;charset=UTF-8");
        } else if("json".equalsIgnoreCase(docType)) {
            resp.setContentType("application/json;charset=UTF-8");
        }
        PrintWriter out = resp.getWriter();
        out.print(xml);
        out.flush();
        out.close();

    }
}
