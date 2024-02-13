<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="jakarta.tags.xml" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
     <meta charset="UTF-8">
     <title>JSTL - xml</title>
</head>
<body>
<%--c:set로 변수 생성 후 외부의 xml문서를 사용하기위해 import--%>
  <c:set var="booklist">
<%--외부파일 가져올 때 한글깨짐 방지 , charEncoding--%>
    <c:import url="BookList.xml" charEncoding="UTF-8"/>
  </c:set>
<%--파싱해 줄 x:parse 선언--%>
  <x:parse xml="${booklist}" var="blist"/>
<h2>파싱 1</h2>
<%--{}사용안함--%>
  제목 : <x:out select="$blist/booklist/book[2]/name"/><br/>
  작가 : <x:out select="$blist/booklist/book[2]/author"/><br/>
  가격 : <x:out select="$blist/booklist/book[1]/price"/><br/>

<h2>파싱 2</h2>
<table border="1">
     <tr>
          <th>제목</th>
          <th>저자</th>
          <th>가격</th>
     </tr>
<%--반복 노드는 forEach사용 = <book>--%>
     <x:forEach select="$blist/booklist/book" var="item">
<%--속성으로 지정한 item을 사용해 출력--%>
          <tr>
               <td><x:out select="$item/name" /></td>
               <td><x:out select="$item/author"/></td>
               <td>
                    <x:choose>
                    <x:when select="$item/price>=20000">
                         2만원 이상<br/>
                    </x:when>
                    <x:otherwise>
                            2만원 미만<br/>
                    </x:otherwise>
                    </x:choose>
               </td>
          </tr>
     </x:forEach>
</table>
<h2>파싱 3</h2>
<table border="1">
<%--반복 출력--%>
     <x:forEach select="$blist/booklist/book" var="item">
          <tr>
               <td><x:out select="$item/name"/></td>
               <td><x:out select="$item/author"/></td>
               <td><x:out select="$item/price"/></td>
                <%--문자열 비교 , =를 사용--%>
               <td><x:if select="$item/name = '총,균,쇠'">구매함</x:if></td>
          </tr>
     </x:forEach>
</table>

</body>
</html>
