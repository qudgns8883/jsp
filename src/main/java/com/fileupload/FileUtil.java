package com.fileupload;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
<<<<<<< HEAD
import jakarta.servlet.http.HttpServletResponse;
=======
>>>>>>> a4f2275 (14장 모델2 게시판)
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
<<<<<<< HEAD
=======
import java.util.ArrayList;
import java.util.Collection;
>>>>>>> a4f2275 (14장 모델2 게시판)
import java.util.Date;

public class FileUtil {


    //파일 업로드
<<<<<<< HEAD
    public static String uploadFile(HttpServletRequest req,String sDir)
    throws ServletException, IOException {

        //Part 객체를 통해 서버로 전송된 파일명 읽기
        Part part = req.getPart("attachedFile");
=======
    public static String uploadFile(HttpServletRequest req, String sDir)
    throws ServletException, IOException {

        //Part 객체를 통해 서버로 전송된 파일명 읽기
        Part part = req.getPart("ofile");
>>>>>>> a4f2275 (14장 모델2 게시판)
        //Part 객체의 헤더값
        String partHeader = part.getHeader("content-disposition");
        System.out.println("partHeader :::" + partHeader);

        //헤더값에서 파일명 잘라내기
        String[] phArr = partHeader.split("filename=");
        String originalFileName = phArr[1].trim().replace("\"", "");

        //전송된 파일이 있으면 디렉토리에 파일저장
        if (!originalFileName.isEmpty()) {
            //C://download/filename 확장자
            part.write(sDir + File.separator + originalFileName);
        }
        return originalFileName;
<<<<<<< HEAD
    }
=======



    }
    //multiple 속성 추가 2개 이상 파일 업로드
    public static ArrayList<String> multiple(HttpServletRequest req, String sDir)
    throws ServletException, IOException{
    //파일명 저장을 위한 컬렉션 생성
    ArrayList<String> listFileName = new ArrayList<>();

    Collection<Part> parts = req.getParts();
    for(Part part : parts){

        if(!part.getName().equals("ofile")){
            continue;
        }
        String partHeader = part.getHeader("content-disposition");
        System.out.println("partHeader :::" + partHeader);

        //헤더값에서 파일명 잘라내기
        String[] phArr = partHeader.split("filename=");
        String originalFileName = phArr[1].trim().replace("\"", "");

        //전송된 파일이 있으면 디렉토리에 파일저장
        if (!originalFileName.isEmpty()) {
            //C://download/filename 확장자
            part.write(sDir + File.separator + originalFileName);
        }

    //컬렉션에 추가
        listFileName.add(originalFileName);
    }
    return listFileName;
}

>>>>>>> a4f2275 (14장 모델2 게시판)

        //파일명 변경
    public static String renameFile(String sDir, String fileName){
    //확장자 잘라내기 ex) png,jpg
    String ext = fileName.substring(fileName.lastIndexOf("."));

    //날짜_시간.확장자 새로운 파일명 생성
        String now = new SimpleDateFormat("YYYYMMDD_HmsS").format(new Date());
        String newFileName = now + ext;

        //기존 파일명을 새 파일명으로 변경
        File oldFile = new File(sDir+ File.separator+fileName);
        File newFile = new File(sDir+ File.separator+newFileName);
        oldFile.renameTo(newFile);

        return newFileName;
    }
    }

