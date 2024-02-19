package com.model2;


import com.fileupload.FileUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.StringReader;

@WebServlet("/mvcboard/download.do")
public class DownloadController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {

        //매개변수
        String ofile = req.getParameter("ofile");
        String sfile = req.getParameter("sfile");
        String idx = req.getParameter("idx");

        //todo: 파일 다운로드 메소드 구현 후 호출
        //파일 다운로드
        FileUtil.download(req, resp, "/Uploads3", sfile,ofile);


    //파일 다운로드 수 증가
    MVCBoardDAO dao = new MVCBoardDAO();
    dao.updateDownCount(idx);
    dao.close();

    }
}
