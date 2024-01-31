<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
     <title>Title</title>
</head>
<body>
<%
     String id = request.getParameter("user_id");
     String pwd = request.getParameter("user_pwd");
//equalsIgnoreCase 대소문자는 무시
     if(id.equalsIgnoreCase("must") && pwd.equals("1234")) {
          response.sendRedirect("ResponseWelcome.jsp"); //성공시 보내준다 ResponseWelcome.jsp
     }else {
          request.getRequestDispatcher("ResponseMain.jsp?loginErr=1")
                  .forward(request,response);
     }//틀렸을떄  loginErr=1값으로 돌려줌
%>

</body>
</html>