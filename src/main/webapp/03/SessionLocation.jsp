<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
     <meta charset="UTF-8">
     <title>Title</title>
</head>
<body>
     <h2> 페이지 이동 후 세션 영역의 속성 값읽기</h2>

     <%
          ArrayList<String> lists = (ArrayList<String>) session.getAttribute("lists");
          for(String str : lists) {
              out.println(str + "<br/>");
          }
     %>
</body>
</html>
