<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
     <meta charset="UTF-8">
     <title>Imlictit Forward</title>
</head>
<body>
     <h2>Imlictit OBj Main 페이지</h2>

     <ul>
          <li>페이지영역 : ${pageScope.scopeValue}</li>
          <li>리퀘스트영역 : ${requestScope.scopeValue}</li>
          <li>세션영역 : ${sessionScope.scopeValue}</li>
          <li>애플리케이션영역 : ${applicationScope.scopeValue}</li>
     </ul>

     <h2>영역 지정없이 속성 출력</h2>
     <ul>
          <li>${scopeValue}</li>
     </ul>
</body>
</html>
