<%@ page import="com.util.CookieManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  CookieManager.makeCookie(response, "ELCookie" , "EL" , 10);
%>
<html>
<head>
     <meta charset="UTF-8">
     <title>EL - 그 외 내장 객체</title>
</head>
<body>
<h2>쿠키값 읽기</h2>
<li>EL 쿠키 값 : ${cookie.ELCookie.value}</li>

<h2>HTTP 헤더값</h2>
<ul>
     <li>host : ${header.host}</li>
     <li>user-agent : ${header['user-agent']}</li>
     <li>cookie : ${header.cookie}</li>
</ul>

     <h2>컨텍스트 초기화 매개변수</h2>
<ul>
     <li>OracleDriver : ${initParam.OracleDriver}</li>
     <li>INIT_PARAM : ${initParam.INIT_PARAM}</li>
</ul>

<h2>컨텍스트 루트경로</h2>
<ul>
<li>${pageContext.request.contextPath}</li>
</ul>
</body>
</html>
