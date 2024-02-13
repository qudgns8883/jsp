<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
     <meta charset="UTF-8">
     <title>Annotation Mapping </title>
</head>
<body>
     <h2>Annotation 으로 매핑하기</h2>
     <p><!--request영역(자바클래스)에 저장된 msg값 출력 , el을 사용했기 때문에 출력안됨-->
          <strong>${msg}</strong>
          <br/>
     </p>
          <!--컨텍스트 루트경로 반환 , 처음은 null-->
          <a href="<%=request.getContextPath()%>/12/AnnoMapping.do">바로가기</a>


</body>
</html>
