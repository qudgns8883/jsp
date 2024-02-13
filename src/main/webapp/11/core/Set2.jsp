<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.common.Person" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
     <meta charset="UTF-8">
     <title>JSTL - set 2</title>
</head>
<body>
     <h2>List컬렉션</h2>
     <%
     ArrayList<Person> pList = new ArrayList<Person>();
     pList.add(new Person("성삼문",50));
     pList.add(new Person("박팽년",60));
     %>

     <c:set var = "personList" value = "<%=pList%>" scope="request"/>
     <ul>
          <%--다른영역에 같은 이름으로 저장한 속성이 없으므로 requestScope생략가능--%>
          <li>이름 : ${requestScope.personList[0].name}
          <li>나이 : ${personList[1].age}</li>
     </ul>

     <h2>Map 컬렉션</h2>
     <%
     Map<String, Person> pMap = new HashMap<>();
     pMap.put("personArg1", new Person("하위지",65));
     pMap.put("personArg2", new Person("이개",6));
     %>

     <c:set var = "personMap" value = "<%=pMap%>" scope="request"/>
          <ul>
               <%--다른영역에 같은 이름으로 저장한 속성이 없으므로 requestScope생략가능--%>
               <li>이름 : ${requestScope.personMap.personArg1.name}</li>
               <li>나이 : ${personMap.personArg2.age}</li>
          </ul>
     </body>
</html>
