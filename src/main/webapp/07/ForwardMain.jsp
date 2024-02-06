<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
     pageContext.setAttribute("pAttr","김유신");
     request.setAttribute("rAttr","계백");
%>
<html>
<head>
     <meta charset="UTF-8">
     <title>Title</title>
</head>
<body>
     <%--forward를 만나면 그전의 모든 출력은 제거--%>
     <h2>액션태그를 활용한 초워딩</h2>
     <%--요청을 주는 것은 request --%>
     <jsp:forward page="ForwardSub.jsp"></jsp:forward>



</body>
</html>
