<%@ page import="com.common.JDBCConnect" %>
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

      //쿼리문 생성 , ? : 인파라미터며 정확한 값을 나중에 채워준다는 의미
      String sql = "INSERT INTO scott.member_jsp VALUES(?,?,?,sysdate)";
      PreparedStatement psmt = jdbc.con.prepareStatement(sql);//인파라미터가 있는 동적 쿼리를 처리할때사용

      //psmt 정해진 sql문장을 데이터베이스에 삽입
      psmt.setString(1,id);
      psmt.setString(2,pass);
      psmt.setString(3,name);

      //기존레코드를 변화시키거나 새로운 레코드를 입력하하는 쿼리문
      int intResult = psmt.executeUpdate();
      out.println(intResult + "행이 입력되었습니다.");

      jdbc.close();
    %>
</head>
<body>

</body>
</html>
