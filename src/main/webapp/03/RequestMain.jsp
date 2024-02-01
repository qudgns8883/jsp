<%@ page import="com.commom.Person" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  request.setAttribute("reqStr","request 영역 문자열");
  request.setAttribute("reqPerson",new Person("안중근",30));
%>
<html>
<head>
     <meta charset="UTF-8">
     <title>request 영역</title>
</head>
<body>
  <h2>request 영역의 속성값 읽기</h2>

    <%
      //request.removeAttribute("reqStr");
      request.removeAttribute("reqInt");
    %>
  <h2>request 영역의 속성값 읽기</h2>

    <%
      Person person = (Person) request.getAttribute("reqPerson");
    %>

  <ul>
    <li><%=request.getAttribute("reqStr")%></li>
    <li><%=person.getName()%>
  </ul>

  <h2>포워드된 페이지에서 request 영역 속성값 읽기</h2>

<%
  request.getRequestDispatcher("RequestForward.jsp?paramHan=한글&paramEng=Eng")
          .forward(request, response);
%>
</body>
</html>
