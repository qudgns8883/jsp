<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
     <meta charset="UTF-8">
     <title>Session Login 구현</title>
</head>
<body>

     <jsp:include page="../common/Link.jsp"></jsp:include>
     <h2>로그인 페이지</h2>

     <span style="color:red; font-size: 1.2em;">
          <%--LoginErrMsg속성에 값이 있으면 그 내용 출력--%>
          <%= request.getAttribute("LoginErrMsg") == null ? "": request.getAttribute("LoginErrMsg")%>
     </span>
          <%--로그인 상태확인--%>
          <%--ture면 로그아웃 상태--%>
     <%
          if(session.getAttribute("UserId") == null){
     %>
          <script>
               function validateForm(form){
                   if(!form.user_id.value){                 //user_id에 값이 없으면
                       alert("아이디를 입력하세요");
                       return false;
                   }else if(!form.user_pwd.value){          //user_pwd에 값이 없으면
                       alert("비밀번호를 입력하세요");
                       return false;
                   }
               }
          </script>
     <%--HTML에서 form전송을 하기전에 입력된 데이터의 유효성을 체크하기 위해서 onsubmit 이벤트를 사용--%>
          <form action="../06/LoginProcess.jsp" method="post" name="loginFrm" onsubmit="return validateForm(this)">
          아이디 : <input type="text" name="user_id"/><br/>
          패스워드 : <input type="password" name="user_pwd"/><br/>
               <input type="submit" value="로그인">
          </form>
     <%
          }else{
     %>
          <%=session.getAttribute("UserName")%> 님 , 로그인 하셨습니다. <br/>
          <a href="Logout.jsp">[로그아웃]</a>
     <%
          }
     %>
</body>
</html>
