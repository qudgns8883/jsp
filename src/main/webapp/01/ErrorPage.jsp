
<%@ page contentType="text/html;charset=UTF-8" language="java"
      errorPage="IsErrorPage.jsp"

%>
<html>
<head>
      <title>Title</title>
</head>
<body>
      <%    if (Age >= 10) { %>
            int Age = Integer.parseInt(request.getParameter("age")) + 10;
            out.println("10년 후 당신의 나이는 " + Age + "입니다.");
      %>
</body>
</html>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>