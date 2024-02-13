<%@ page import="java.util.Date" %>
<%--자바빈즈사용--%>
<%@ page import="com.common.Person" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--taglib지시어 사용--%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
     <meta charset="UTF-8">
     <title>JSTL Core Set</title>
</head>
<body>
<%-- el을 이용한 변수 선언    --%>
<c:set var="directVar" value="100"/>
<c:set var="elVar" value="${directVar %5}"/>
<c:set var="expVar" value="<%=new Date()%>"/>
<c:set var="betweenVar">변수값 이렇게 설정</c:set>

<h2>변수 출력</h2>
<ul>
     <li>directVar : ${pageScope.directVar}</li>
     <li>elVar : ${elVar}</li>
     <li>expVar : ${expVar}</li>
     <li>betweenVar : ${betweenVar}</li>
</ul>

<h2>자바빈즈 생성 - 1 생성자 사용</h2>
<c:set var ="personVar1" value='<%=new Person("박문수", 50)%>' scope="request"/>
<%--request영역에 저장된 자바빈즈출력--%>
<ul>
     <li>이름 : ${requestScope.personVar1.name}</li>
     <li>나이 : ${personVar1.age}</li>
</ul>

<h2>자바빈즈 생성 - 2 target property</h2>
<c:set var = "personVar2" value="<%=new Person()%>" scope="request"/>
<%--target과 property 속성을 사용하여 값을 나중에 설정
     target는 변수 property는 멤버변수명
--%>
<c:set target="${personVar2}" property="name" value="정약용"/>
<c:set target="${personVar2}" property="age" value="60"/>
<ul>
     <li>이름 : ${requestScope.personVar2.name}</li>
     <li>나이 : ${personVar2.age} </li>
</ul>

</body>
</html>
