<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
     <meta charset="UTF-8">
     <title>액션태그 useBean</title>
</head>
<body>
     <%-- * 모든 값을 다 받아옴--%>
     <jsp:useBean id="person" class="com.common.Person"/>
     <jsp:setProperty name="person" property="*"/>

          <h2>getProperty 액션태그로 자바빈즈 속성 가져오기</h2>

          <ul>
               <li>이름 : <jsp:getProperty name="person" property="name"/></li>
               <li>나이 : <jsp:getProperty name="person" property="age"/></li>
          </ul>
</body>
</html>
