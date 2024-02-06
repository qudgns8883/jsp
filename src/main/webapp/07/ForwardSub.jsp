<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
     <meta charset="UTF-8">
     <title>Title</title>
</head>
<body>

     <h2>포워드 결과</h2>
 <ul>
      <li>
          <%-- 페이지가 다르니 page영역에 설정한 속성은 못 불러옴--%>
           page영역 : <%=pageContext.getAttribute("pAttr")%>
      </li>
      <li>
           request 영역 : <%=request.getAttribute("rAttr")%>
      </li>
 </ul>

</body>
</html>
