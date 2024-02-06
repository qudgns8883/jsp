<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
     //.. 상위 폴더 . 현재폴더
     String outerPath1 = "./OuterPage1.jsp";
     String outerPath2 = "./OuterPage1.jsp";

     pageContext.setAttribute("pAttr","동명왕");
     request.setAttribute("rAttr","온조왕");
%>

<html>
<head>
     <meta charset="UTF-8">
     <title>지시어와 액션태그 동작 방식 비교</title>
</head>

     <h2>지시어와 액션태그 동작 방식 비교</h2>

     <%--지시어 방식--%>
     <%--표현식 사용 불가, 외부생성변수가능 ,page공유o--%>
     <h3> 지시어로 페이지 포함하기</h3>
     <%@include file="OuterPage1.jsp"%>
     <%--<%@include file="<%=OuterPath1%>"%>  표현식x--%>
     <p>외부 파일에서 선언한 변수 : <%=newVar1%></p>


     <%-- 액션 태그 방식  --%>
     <%--표현식 사용가능,  파일에서 선언한 변수 사용불가, page공유x --%>
     <h3>액션 태그로 페이지 포함하기</h3>
     <jsp:include page="OuterPage2.jsp"></jsp:include>
     <jsp:include page="<%=outerPath2%>"></jsp:include>
     <%--<p>외부 파일에서 선언한 변수 : <%=newVar2%></p> 외부파일 변수x--%>

</body>
</html>
