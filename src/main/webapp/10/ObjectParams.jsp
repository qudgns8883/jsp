<%@ page import="com.common.Person" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
     <meta charset="UTF-8">
     <title>EL - 객체 매개변수 전달</title>
</head>
<body>
<%
     request.setAttribute("personObj", new Person("홍길동",100));
     request.setAttribute("StringObj","문자열");
     request.setAttribute("IntegerObj",new Integer(10));
%>

     <jsp:forward page="ObjectResult.jsp">
          <jsp:param value="10" name="firstNum"/>
          <jsp:param value="20" name="secondNum"/>
     </jsp:forward>

</body>
</html>
