<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
     <meta charset="UTF-8">
     <title>JSTL</title>
</head>
<body>
<%--request영역은 공유되지않음--%>
<c:set var="requestVar" value="MustHave" scope="request"/>
<%--OtherPage.jsp페이지로 리다이렉트--%>
<c:redirect url="OtherPage.jsp">
<%--c:param을 이용해 전달--%>
  <c:param name="user_param1" value="출판사"/>
  <c:param name="user_param2" value="골든레빗"/>

  </c:redirect>
</body>
</html>
