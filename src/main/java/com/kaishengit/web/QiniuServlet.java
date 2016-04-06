package com.kaishengit.web;

import com.qiniu.util.Auth;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/qiniu.do")
public class QiniuServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1. 准备好AK和SK
        final String AK = "G3jWeQ4OOxUwAQJumftrS_jcAej9uBQLn1-oCoHD";
        final String SK = "fmiPh7SZ_UvRWRsntAihdOS67Pin9jeeNYR3aRBv";
        //2. 指定上传的空间名称
        final String bucketName = "demo20";

        //3. 创建Auth对象
        Auth auth = Auth.create(AK,SK);
        String token = auth.uploadToken(bucketName);

        req.setAttribute("token",token);
        req.getRequestDispatcher("uploadqiniu.jsp").forward(req,resp);


    }
}
