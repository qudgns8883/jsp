package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


public class HelloServlet extends HttpServlet {   //HttpServlet 상속  , public선언

    private static final long serialVersionUID = 1L;

    @Override  //doGet 오버라이딩
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      //메서드 실행 부
        req.setAttribute("message","HELLO SERVLET");
        req.getRequestDispatcher("/12/HelloServlet.jsp").forward(req,resp);
    }
    @Override  //doPost 오버라이딩
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req,resp);
    }

}