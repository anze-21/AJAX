package com.kaishengit.web;

import com.google.gson.Gson;
import com.kaishengit.entity.Message;
import com.kaishengit.service.MessageService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/message.do")
public class MessageServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String maxId = req.getParameter("maxId");

        List<Message> messageList = new MessageService().findByMaxId(maxId);

        Map<String,Object> map = new HashMap<>();
        map.put("data",messageList);

        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        out.print(new Gson().toJson(map));
        out.flush();
        out.close();

    }
}
