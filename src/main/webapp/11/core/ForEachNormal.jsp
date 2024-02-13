<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
     <meta charset="UTF-8">
     <title>일반 for문 형태의 forEach태그</title>

</head>
<body>
<h2>일반 for문 형태</h2>
<c:forEach begin="1" end="3" step="1" var="i">
     <p>반복 ${i}</p>
</c:forEach>

<h2>var status속성 살펴보기</h2>
<table border="1">
<%--루프의 현재 상태를 알려주는 변수이름 지정 , varStatus="loop"--%>
     <c:forEach begin="3" end="5" step="1" varStatus="loop">
          <tr>
               <td>count : ${loop.count}</td>
               <td>index : ${loop.index}</td>
               <td>current : ${loop.current}</td>
               <td>first : ${loop.first}</td>
               <td>last : ${loop.last}</td>
          </tr>
     </c:forEach>
</table>

<h2>1에서 100까지 정수 중 홀수 총 합</h2>
<%--1. 1~100까지 for문 돌리기--%>
<%--2. for문 돌면서 홀수인지 판변--%>
<%--3. 홀수면 변수에 값더해주기--%>

<c:forEach begin="1" end="100" var="j">
     <c:if test="${j %2 !=0}">
          <c:set var="sum" value="${ sum + j}"/>
     </c:if>

</c:forEach>
1~100까지 정수 중 홀수 총 합은 ${sum}

</body>

</html>
