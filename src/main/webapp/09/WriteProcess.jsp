<%@ page import="com.model1.board.BoardDTO" %>
<%@ page import="com.model1.board.BoardDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="IsLoggedIn.jsp"%>
<%
     String title = request.getParameter("title");
     String content = request.getParameter("content");

     BoardDTO dto = new BoardDTO();
     dto.setTitle(title);
     dto.setContent(content);
     dto.setId(session.getAttribute("UserId").toString());

     BoardDAO dao = new BoardDAO();

     int iResult = dao.insertWrite(dto); //return result; 반환값이 숫자여서

     dao.close();

     if(iResult == 1){  //성공
         response.sendRedirect("List.jsp");
     }else { //실패
         JSFunction.alertBack("글쓰기 실패",out);
     }
%>