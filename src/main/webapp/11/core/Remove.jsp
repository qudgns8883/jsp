<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--변수 선언--%>

<c:set var="scopeVar" value="Page Value"/> <%--영역 지정안하면 가장 좁은page영역이 지정--%>
<c:set var="scopeVar" value="Request value" scope="request"/>
<c:set var="scopeVar" value="Session Value" scope="session"/>
<c:set var="scopeVar" value="Application Value" scope="application"/>
<html>
<head>
     <meta charset="UTF-8">
     <title>JSTL Remove</title>
</head>
<body>
     <h2>출력</h2>
     <ul>
          <li>scopeVar : ${scopeVar}</li> <%--영역 지정안하면 가장 좁은page영역이 지정--%>
          <li>request scopeVar: ${requestScope.scopeVar}</li>
          <li>session scopeVar: ${sessionScope.scopeVar}</li>
          <li>application scopeVar : ${applicationScope.scopeVar}</li>
     </ul>

     <h2>session 영역에서 삭제</h2>
     <%--session영역에 저장된 변수만 삭제 , 변수가 삭제되어 값x --%>
     <c:remove var="scopeVar" scope="session"/>
     <ul>
          <li>scopeVar : ${scopeVar}</li>
          <li>request scopeVar: ${requestScope.scopeVar}</li>
          <li>session scopeVar: ${sessionScope.scopeVar}</li>
          <li>application scopeVar : ${applicationScope.scopeVar}</li>
     </ul>

     <h2>scope 지정 없이 삭제하기</h2>
     <c:remove var="scopeVar"/>  <%--scopeVar변수를 삭제해서 모두 삭제--%>
     <ul>
          <li>scopeVar : ${scopeVar}</li>
          <li>request scopeVar: ${requestScope.scopeVar}</li>
          <li>session scopeVar: ${sessionScope.scopeVar}</li>
          <li>application scopeVar : ${applicationScope.scopeVar}</li>
     </ul>
</body>
</html>
