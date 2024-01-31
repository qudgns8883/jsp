<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2024-01-31
  Time: 오전 11:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
     <title>내장객체 - request</title>
</head>
<body>
<%
     response.setCharacterEncoding("UTF-8");//키깨짐을방지
     String id = request.getParameter("id");
     String sex = request.getParameter("sex");
     String[] favo = request.getParameterValues("favo"); //radio여서 배열로 받음
     //["eco", "pol", "ent"]

     String favoStr = "";
     if(favo!= null) {
         for(int i=0; i<favo.length; i++) {
             favoStr += favo[i] + " ";
         }
//         for(String s :favo){
//             favoStr += s + " ";
//         }
     }
     String intro = request.getParameter("intro").replace("\r\n", "<br/>");
     //replace("\r\n", "<br/>")   > \r\n를  <br/>로 바꿈      /r/n > 개행문자 줄바꿈.

%>
<ul>
     <li>아이디 : <%=id%></li>
     <li>성별 : <%=sex%></li>
     <li>관심사 : <%=favoStr%></li>
     <li>자기소개ㅐ : <%=intro%></li>
</ul>
</body>
</html>
