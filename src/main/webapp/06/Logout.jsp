<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
     //1번 방법 : 세션에 있는 user 정보 삭제
     session.removeAttribute("UserId");
     session.removeAttribute("UserName");

     //2번 방법 : 세션 모든 속성 무효화
     session.invalidate();

     //속성 삭제 후 페이지 이동
     response.sendRedirect("LoginForm.jsp");

%>