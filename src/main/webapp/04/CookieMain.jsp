<%@ page contentType="text/html;charset=UTF-8" language="java" %>
     <%--
          쿠키는 웹사이트에 접속했을 때 사용자를 기억하는 수단
          쿠키는 처음 만들어진 시점에서는 서버는 쿠키를 읽을 수 없다.

          name : 쿠키이름
          value : 쿠키값
          domain : 쿠키를 적용할 도메인
          path : 쿠키를 적용할 경로
          maxAge : 쿠키 유지기간(단위: 초) 하루 : 86400

          name은 문자열을 입혁하는데 , ; space = 포함이 안됨
          path 는 특정 경로를 입ㄺ하면 그 하위 경로도 포함
          age를 설정 안하면 브라우저 종료될 때 쿠키 만료된다.
          getAge age 설정 안 했을 떄 -1 반환
     --%>
<html>
<head>
     <meta charset="UTF-8">
     <title>Title</title>
</head>
<body>
     <h2> 1. 쿠키 설정</h2>
     <%
          Cookie cookie = new Cookie("myCookie","내가만든쿠키");
          cookie.setPath(request.getContextPath()); //최상위 경로로 설정
          cookie.setMaxAge(3600);   //1시간
          response.addCookie(cookie);  //  response
     %>

     <h2> 2. 쿠키 설정 직후에 쿠키 확인</h2>
     <%
          Cookie[] cookies = request.getCookies();  //request 헤더에서 모든 쿠키가져오지
          if(cookies != null) {
               for(Cookie c: cookies) {
                    String cName = c.getName();
                    String cValue = c.getValue();

                    out.print(String.format("%s : %s", cName, cValue));
               }
          }
     %>
     <h2> 3. 페이지 이동 후 쿠키 값 읽어오기</h2>
     <a href=" CookieResult.jsp">
          다음 페이지에서 쿠키 값 확인하기
     </a>
</body>
</html>
