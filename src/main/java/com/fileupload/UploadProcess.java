package com.fileupload;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

<<<<<<< HEAD
import java.io.File;
import java.io.IOException;


@WebServlet("/13/UploadProcess.do")
//파일업로드를 위한 서블릿 구성 애너테이션
@MultipartConfig(
        maxFileSize = 1024*1024*1,  //업로드할 개별파일의 최대 크기 1mb지정
        maxRequestSize = 1024*1024*10  //멀티파트 요청에 포함된 전체 파일의 큭로 10mb지정
=======
import java.io.IOException;

@WebServlet("/13/UploadProcess.do")
@MultipartConfig(
        maxFileSize = 1024 * 1024 * 1,
        maxRequestSize = 1024 * 1024 * 10
>>>>>>> a4f2275 (14장 모델2 게시판)
)
public class UploadProcess extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
<<<<<<< HEAD
        throws ServletException, IOException {

        try{
            //드라이브 명으로 절대경로를 받아옴
            String saveDirector = getServletContext().getRealPath("/Uploads3");
            System.out.println("saveDirector 확인 : " +saveDirector);

            // FileUtil을 호출하여 파일 업로드
            String oFileName = FileUtil.uploadFile(req, saveDirector);

            //FileUtil을 호출하여 저장된 파일명 변경
            String sFileName = FileUtil.renameFile(saveDirector, oFileName);

            //내장 객체와 파일명을 인수로 전달하여 DB에 저장하기
            insertFile(req, oFileName, sFileName);
            resp.sendRedirect("FileList.jsp");

        }catch (Exception e){
            e.printStackTrace();
            //request영역에 메서지를 저장한 후 FileUpload.jsp이동
            req.setAttribute("errMessage" , "파일 업로드 오류");
            req.getRequestDispatcher("FileUpload.jsp").forward(req,resp);
        }



        }
=======
            throws ServletException, IOException {
        try {
            // 드라이브 명으로 절대경로 지정하기
            // saveDirectory = C:\jp\jsp\src\main\webapp\Uploads
            String saveDirectory = getServletContext().getRealPath("/Uploads");
            System.out.println("saveDir 확인 : " + saveDirectory);

            // 파일 업로드
            String originalFileName = FileUtil.uploadFile(req, saveDirectory);

            // 저장된 파일명 변경
            String savedFileName = FileUtil.renameFile(saveDirectory, originalFileName);

            // DB에 저장하기
            insertFile(req, originalFileName, savedFileName);

            // 파일 목록 페이지로 이동
            resp.sendRedirect("FileList.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errMessage", "파일 업로드 오류");
            req.getRequestDispatcher("FileUploadMain.jsp").forward(req, resp);
        }
    }
>>>>>>> a4f2275 (14장 모델2 게시판)
    //파일저장 메소드  , 매개변수로 정의된 내장객체를 통해 원본파일명 변경된파일명 전달
    private void insertFile(HttpServletRequest req, String oFileName, String sFileName){
        //file 이외의 폼 값(제목 ,  카테고리 )
        String title = req.getParameter("title");
        String[] cateArr = req.getParameterValues("cate");
        StringBuffer cateBuf = new StringBuffer();
<<<<<<< HEAD
=======
        int index = 0;  //,맨뒤 삭제

>>>>>>> a4f2275 (14장 모델2 게시판)
        //카테고리가 비어있으면 항목없음 , 여러 값이면 뒤에 , 추가
        if(cateArr == null) {
            cateBuf.append("선택한 항목없음");
        }else {
<<<<<<< HEAD
            for(String s: cateArr){
                cateBuf.append(s+", ");
=======
            for (String s : cateArr) {
                if (index != cateArr.length - 1) {  //
                    cateBuf.append(s + ", ");     //
                } else {
                    cateBuf.append(s);
                }
                index++;    //
>>>>>>> a4f2275 (14장 모델2 게시판)
            }
        }
        System.out.println("파일 외 폼값 :::" + title + " " + cateBuf);

    //dto객체 생성 후 전송된 폼값을 담음
    MyFileDTO dto = new MyFileDTO();
    dto.setTitle(title);
    dto.setCate(cateBuf.toString());
    dto.setOfile(oFileName);
    dto.setSfile(sFileName);
    //dao객체 생성 후 클래스 호출 해 데이터베이스에 저장
    MyFileDAO dao = new MyFileDAO();
    dao.insertFile(dto);
    dao.close();
    }
}












