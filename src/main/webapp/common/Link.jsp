<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<table border="1" width="98%">
     <tr>
          <td align="center">
               <%
                    if(session.getAttribute("UserId") == null){
               %>
                    <a href="../06/LoginForm.jsp">로그인</a>
               <%
                    }else {
               %>
                    <a href="../06/Logout.jsp">로그아웃</a>
               <%
                    }
               %>
               &nbsp;&nbsp;&nbsp;
               <a href="../08/List.jsp">게시판(페이징 x)</a>
               &nbsp;&nbsp;&nbsp;
               <a href="../09/List.jsp">게시판(페이징  o)</a>
          </td>
     </tr>

</table>

</html>
