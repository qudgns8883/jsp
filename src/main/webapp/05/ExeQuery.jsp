<%@ page import="com.common.JDBCConnect" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
     <meta charset="UTF-8">
     <title>회원 조회 테스트(executeQuery() 사용)</title>
</head>
<body>
<%
  JDBCConnect jdbc = new JDBCConnect();

  //쿼리문 생성
  String sql = "SELECT id,pass,name,regidate FROM scott.member_jsp";
  Statement stmt = jdbc.con.createStatement(); //기존 레코드를 조회하는 쿼리문

  //쿼리 실행 결과를 rs에 담음
  ResultSet rs = stmt.executeQuery(sql);

  //결과 확인 (페이지에 출력) , 결과가 존재할 때동안
  while(rs.next()){
    String id = rs.getString(1);
    String pw = rs.getString(2);
    String name = rs.getString("name");
    Date regiDate = rs.getDate("regiDate");

  out.println(String.format ("%s, %s, %s, %s ", id,pw,name,regiDate+"<br/>"));
  }

  jdbc.close();
%>
</body>
</html>
