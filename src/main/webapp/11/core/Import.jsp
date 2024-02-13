<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
     <meta charset="UTF-8">
     <title>JSTL - import</title>
</head>
<body>
<%--외부 파일을 현재 위치에 삽일할 때 사용--%>
<%--request영역에 저장--%>
<c:set var="requestVar" value="MustHave" scope="request"/>
<%--url속성에 내부jsp경로를 지정하고 var속성 추가  ,준비한 외부페이지--%>
<c:import url="OtherPage.jsp" var="contents">
<%--포함될 페이지로 전달할 매개변수를 추가--%>
     <c:param name="user_param1" value="JSP"/>
     <c:param name="user_param2" value="기본서"/>
</c:import>
     <h2>다른 문서 삽입하기</h2>
<%--준비한 외부페이지에 삽입--%>
${contents}
<%--사이트를 통째로 삽입--%>
<iframe src="Goldpage.jsp" style="width: 100%; height: 600px;"></iframe>

</body>
</html>
