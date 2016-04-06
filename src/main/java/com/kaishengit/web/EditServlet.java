package com.kaishengit.web;

import com.qiniu.util.Auth;
import com.qiniu.util.StringMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/edit.do")
public class EditServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1. 准备好AK和SK
        final String AK = "G3jWeQ4OOxUwAQJumftrS_jcAej9uBQLn1-oCoHD";
        final String SK = "fmiPh7SZ_UvRWRsntAihdOS67Pin9jeeNYR3aRBv";
        //2. 指定上传的空间名称
        final String bucketName = "demo20";

        //3. 创建Auth对象

        //4.定制七牛返回的JSON格式
        StringMap stringMap = new StringMap();
        stringMap.put("returnBody","{ \"success\": true,\"file_path\": \"http://7xs9b4.com1.z0.glb.clouddn.com/$(key)\"}");


        Auth auth = Auth.create(AK,SK);
        String token = auth.uploadToken(bucketName,null,3600,stringMap);

        req.setAttribute("token",token);
        req.getRequestDispatcher("edit.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String context = req.getParameter("context");
        System.out.println(context);

        req.setAttribute("context",context);
        req.getRequestDispatcher("editshow.jsp").forward(req,resp);
    }
}
