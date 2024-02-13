<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
     <meta charset="UTF-8">
     <title>Hello Servlet</title>
</head>
<body>
<h2> wed.xml에서 매핑 후 JSP에서 출력하기</h2>
<p>
     <!--request영역(자바클래스)에 저장된 msg값 출력-->
     <strong><%=request.getAttribute("message")%></strong>
     <br/>
     <!--목표URL을 서블릿 요청명으로 지정-->
     <a href="./HelloServlet.do">바로가기</a>
</p>


</body>
</html>
