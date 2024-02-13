package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/12/AnnoMapping.do") //애너테이션을 이용해 요청명을 처리선언 , wed.xml에 입력값
public class AnnoMapping extends HttpServlet {
    //직렬화된 클래스의 버전관리 식별자 , 경고표시로 명시적으로 선언
    private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("msg","@WedServlet 으로 맵핑함");//request영역에 msg속성에 데이터저장
        req.getRequestDispatcher("/12/AnnoMapping.jsp").forward(req,resp);
    }

}
