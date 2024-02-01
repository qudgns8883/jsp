<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
     <meta charset="UTF-8">
     <title>Cookies Result</title>
</head>
<body>

     <h2>쿠키 확인</h2>

     <%
          Cookie[] cookies = request.getCookies();  //request 헤더에서 모든 쿠키가져오지
          if(cookies != null) {
               for(Cookie c: cookies) {
                    String cName = c.getName();
                    String cValue = c.getValue();

                    out.print(String.format("%s : %s", cName, cValue));
               }
          }
     %>

</body>
</html>
