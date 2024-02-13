<%@ page import="com.common.Person" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
     <meta charset="UTF-8">
     <title>List 컬렉션</title>
</head>
<body>
<h2>List 컬렉션</h2>
<%
     LinkedList<Person> lists = new LinkedList<Person>();
     lists.add(new Person("맹사성", 34));
     lists.add(new Person("장영실", 44));
     lists.add(new Person("신숙주", 54));
%>
<%--lists배열에 lists변수 설정--%>
     <c:set var="lists" value="<%= lists %>"/>
<%--for( list : ${lists}){}  , 배열이 있을 때동안 list에 담는다--%>
     <c:forEach items="${lists}" var="list" >
          <li>이름 :${list.name}, 나이: ${list.age}</li>
     </c:forEach>

<h2>Map 컬렉션</h2>
<%
     Map<String,Person> maps = new HashMap<>();
     maps.put("1st",new Person("맹사성", 34));
     maps.put("2st",new Person("장영실", 44));
     maps.put("3st",new Person("신숙주", 54));
%>
<%----%>
<c:set var="maps" value="<%=maps%>"/> <%--변수설정--%>
<c:forEach var="map" items="${maps}"> <%--컬렉션 순회 , 값출력--%>
     <li>Key => ${map.key}</li>
     <li>Value => 이름 : ${map.value.name} 나이 : ${map.value.age}</li>
</c:forEach>
</body>
</html>
