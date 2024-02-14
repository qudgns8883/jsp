<%@ page import="com.util.JSFunction" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
     String saveDir = application.getRealPath("/Uploads3");
     String saveFileName = request.getParameter("sName");
     String originalFileName = request.getParameter("oName");

     System.out.println("저장 경로 : " + saveDir);
     System.out.println("저장 파일 : " + saveFileName);
     System.out.println("원본 파일 : " + originalFileName);

     try {
          // 파일을 찾아 입력 스트립 작성
          File file = new File(saveDir, saveFileName);
          InputStream inputStream = new FileInputStream(file);
          //브라우저의 종류를 알려줌
          String client = request.getHeader("User-Agent");

          if (client.indexOf("WOW64") == -1) {
               originalFileName = new String(originalFileName.getBytes("UTF-8"), "ISO-8859-1");
               System.out.println("클라이언트 헤더 정보 : " + client);
          } else {
               originalFileName = new String(originalFileName.getBytes("KSC5601"), "ISO-8859-1");
          }
          // 파일 다운로드용 헤더 설정

          response.reset();// 이 메서드는 응답 객체(response)의 설정을 초기화합니다.
          response.setContentType("application/octet-stream; charset=utf-8");
          //"Content-Disposition" 헤더는 브라우저에게 응답을 다운로드 , attachment"는 첨부 파일로써 다운로드되어야 함을 나타내며
          //다운되는 파일명을 지정
          response.setHeader("Content-Disposition", "attachment; filename=\"" + originalFileName);
          //파일크기를 헤더에 설정
          response.setHeader("Content-Length", "" + file.length());

          // 출력 스트림 초기화
          out.clear();

          // response 내장 객체로부터 새로운 출력 스트림 생성
          OutputStream outStream = response.getOutputStream();

          // 출력 스트림에 파일내용 출력
          byte[] b = new byte[(int)file.length()];
          int readBuffer = 0;  //읽어들인 데이터의 크기를 반환하며, readBuffer에 저장합니다
          while ((readBuffer = inputStream.read(b)) > 0) {
              // b 배열의 0부터 readBuffer까지의 범위의 데이터를 출력 스트림으로 전송합니다.
               outStream.write(b, 0, readBuffer);
          }

          // 입출력 스트림 닫음
          inputStream.close();
          outStream.close();

     } catch (FileNotFoundException fe) {
          JSFunction.alertBack("파일을 찾을 수 없습니다.",out);
     } catch (Exception e) {
          JSFunction.alertBack("예외가 발생했습니다.",out);
     }
%>