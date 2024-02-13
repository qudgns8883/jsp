<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
     <meta charset="UTF-8">
     <title>Title</title>
</head>
<body>
<h4>OtherPage.jsp</h4>
<ul>
     <li>저장된 값 : ${requestVar}</li> <%--영역에 저장된 값과 매개변수로 전달된 값 출력--%>
     <li>매개변수 1 : ${param.user_param1}</li>
     <li>매개변수 2 : ${param.user_param2}</li>
</ul>
</body>
</html>
