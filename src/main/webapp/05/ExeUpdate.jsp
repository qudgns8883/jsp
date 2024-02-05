<%@ page import="com.commom.JDBCConnect" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
     <meta charset="UTF-8">
     <title>회원 추가 테스트(executeUpdate() 사용)</title>

    <%
      JDBCConnect jdbc = new JDBCConnect();

      //테스트용 입력값
      String id= "test1";
      String pass = "1234";
      String name = "테스트1";

      //쿼리문 생성
      String sql = "INSERT INTO scott.member_jsp VALUES(?,?,?,sysdate)";
      PreparedStatement psmt = jdbc.con.prepareStatement(sql);

      psmt.setString(1,id);
      psmt.setString(2,pass);
      psmt.setString(3,name);

      int intResult = psmt.executeUpdate();
      out.println(intResult + "행이 입력되었습니다.");

      jdbc.close();
    %>
</head>
<body>

</body>
</html>
