<%@ page import="com.membership.MemberDAO" %>
<%@ page import="com.membership.MemberDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
     //로그인 폼에서 받아온 파라미타 , LoginForm에서 받아옴
     String userId = request.getParameter("user_id");
     String password = request.getParameter("user_pwd");

     MemberDAO dao = new MemberDAO();
     MemberDTO memberDTO = dao.getMemberDTO(userId, password);
     dao.close();

     //로그인 성공 여부에 따른 처리
     if(memberDTO.getId() != null){
         //로그인 성공
          session.setAttribute("UserId",memberDTO.getId());
          session.setAttribute("UserName",memberDTO.getName());
          response.sendRedirect("LoginForm.jsp");
     }else {
          //로그인 실패
          request.setAttribute("LoginErrMsg", "아이디/패스워드를 확인하세요");
          request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
     }
%>