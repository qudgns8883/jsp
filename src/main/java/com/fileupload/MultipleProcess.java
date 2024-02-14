package com.fileupload;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/13/MultipleProcess.do")
@MultipartConfig(
        maxFileSize = 1024 * 1024 * 1,
        maxRequestSize = 1024 * 1024 * 10
)
public class MultipleProcess extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            String saveDirectory = getServletContext().getRealPath("/Uploads3");
            System.out.println("saveDir 확인 : " + saveDirectory);


            // 다중 파일 업로드은 Array와 for문 추가
            ArrayList<String> listFileName = FileUtil.multiple(req,saveDirectory);

            for (String originalFileName : listFileName) {
                // 저장된 파일명 변경
                String savedFileName = FileUtil.renameFile(saveDirectory, originalFileName);

                // DB에 저장하기
                insertFile(req, originalFileName, savedFileName);
            }

            resp.sendRedirect("FileList.jsp");
        }catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errMessage", "멀티파일 업로드 오류");
            req.getRequestDispatcher("MultiUploadMain.jsp").forward(req, resp);
        }
    }

    private void insertFile(HttpServletRequest req, String oFileName, String sFileName){
        //file 이외의 폼 값(제목 ,  카테고리 )
        String title = req.getParameter("title");
        String[] cateArr = req.getParameterValues("cate");
        StringBuffer cateBuf = new StringBuffer();
        int index = 0;  //,맨뒤 삭제

        //카테고리가 비어있으면 항목없음 , 여러 값이면 뒤에 , 추가
        if(cateArr == null) {
            cateBuf.append("선택한 항목없음");
        }else {
            for (String s : cateArr) {
                if (index != cateArr.length - 1) {  //
                    cateBuf.append(s + ", ");     //
                } else {
                    cateBuf.append(s);
                }
                index++;    //
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

