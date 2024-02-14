package com.model2;

import com.fileupload.FileUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.util.JSFunction;

import java.io.IOException;

public class WriteController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req , HttpServletResponse resp)
        throws ServletException, IOException {
            req.getRequestDispatcher("/14/Write.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req , HttpServletResponse resp)
            throws ServletException, IOException {
      //파일 업로드 처리
        String saveDir = req.getServletContext().getRealPath("/Uploads3");

        //파일 업로드
        String oFileName = "";
        try{
            oFileName = FileUtil.uploadFile(req,saveDir);
        }catch(Exception e){
            System.out.println("파일업로드 실패");
            JSFunction.alertLocation(resp,"파일 업로드 오류","../mvcvboard/write.do");
        return;
        }

        MVCBoardDTO dto = new MVCBoardDTO();
        dto.setName(req.getParameter("name"));
        dto.setTitle(req.getParameter("title"));
        dto.setContent(req.getParameter("content"));
        dto.setPass(req.getParameter("pass"));
        System.out.println("ofileName : " + oFileName);

        //파일명 설정
        if(oFileName != null &&oFileName != ""){
            //파일명 변경
            String sFileName = FileUtil.renameFile(saveDir, oFileName);

        dto.setOfile(sFileName);
        dto.setSfile(sFileName);
        }

        //DAO를 통해 DB 저장
        MVCBoardDAO dao = new MVCBoardDAO();
        int result = dao.insertWrite(dto);
        dao.close();

        if(result == 1){
            resp.sendRedirect("../mvcboard/list.do");
        }else{
            JSFunction.alertLocation(resp,"글쓰기 실패","../mvcvboard/write.do");
        }
    }

}
