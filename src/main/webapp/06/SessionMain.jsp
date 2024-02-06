<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
     <meta charset="UTF-8">
     <title>Title</title>


     <%
          //포맷
          SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");

          //세션 생성 시간
          long craetionTime = session.getCreationTime();
          String craetionTimeStr = dateFormat.format(new Date(craetionTime));

          //마지막 요청시간
          long lastTime = session.getLastAccessedTime();
          String lastTimeStr = dateFormat.format(new Date(lastTime));

     //session.setMaxInactiveInterval(1800);
     %>
</head>
<body>

     <h2>session 설정확인</h2>

     <ul>
          <li>세션 유지 시간 <%=session.getMaxInactiveInterval()%></li>
          <li>세션 아이디<%=session.getId()%></li>
          <li>최초 요청시간<%=craetionTimeStr%></li>
          <li>마지막 요청시간 <%=lastTimeStr%></li>
     </ul>
</body>
</html>
