<%@ page import="com.commom.Person" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
     <meta charset="UTF-8">
     <title>Title</title>
</head>
<body>
     <%--
          웹 애플리케이션 당 하나의 application 객체 생성
          서버를 닫기 전까지 계속 유지 된다.
          클라이언트가 요펑하는 모든 페이지가 application객체를 공유함
          main을 켜야 Result 가 켜짐
     --%>

     <%
           Map<String, Person> maps = new HashMap<>();
           maps.put("person1", new Person("페이커", 28));
           maps.put("person2", new Person("구마유시", 24));
          maps.put("person3", new Person("제우스", 23));
          maps.put("person4", new Person("오너", 21));
          maps.put("person5", new Person("케리아", 20));
           application.setAttribute("maps",maps);
     %>

     <p>application 영역에 속성이 저장되었습니다.</p>
</body>
</html>
