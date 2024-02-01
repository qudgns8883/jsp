<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
     <meta charset="UTF-8">
     <title>내장 객체  - Exception</title>
</head>
<body>
       <%
         int status = response.getStatus();
         System.out.println(status);

         if(status==404){
           out.print("404에러발생");
           out.print("<br/> 파일 경로를 확인하세여");
         }else if(status==405){
         out.print("405에러발생");
         out.print("<br/> 파일 경로를 확인하세여");
       }else if(status==500) {
              out.print("500에러발생");
              out.print("<br/> 파일 경로를 확인하세여");
         }
       %>
</body>
</html>
