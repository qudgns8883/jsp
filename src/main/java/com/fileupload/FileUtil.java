package com.fileupload;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.http.Part;

import java.io.*;
import java.text.SimpleDateFormat;

import java.util.ArrayList;
import java.util.Collection;

import java.util.Date;

public class FileUtil {
    // 파일 업로드
    public static String uploadFile(HttpServletRequest req, String sDir)
            throws ServletException, IOException {
        // Part 객체를 통해 서버로 전송된 파일명 읽기
        Part part = req.getPart("ofile");
        // Part 객체의 헤더값 content-disposition 값 읽기
        String partHeader = part.getHeader("content-disposition");
        // form-data; name="attachedFile"; filename="파일명.확장자"
        System.out.println("partHeader ::: " + partHeader);

        // 헤더 값에서 파일명 잘라내기
        String[] phArr = partHeader.split("filename=");
        String originalFileName = phArr[1].trim().replace("\"", "");

        // 전송된 파일이 있으면 디렉토리에 저장
        if (!originalFileName.isEmpty()) {
            part.write(sDir + File.separator + originalFileName);
        }
        return originalFileName;
    }

    // 파일명 변경
    public static String renameFile(String sDir, String fileName) {
        // 확장자 잘라내기
        // temp.png
        String ext = fileName.substring(fileName.lastIndexOf("."));

        // 날짜_시간.확장자 새로운 파일명 생성
        String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
        String newFileName = now + ext;

        // 기존 파일명을 새 파일명으로 변경
        File oldFile = new File(sDir + File.separator + fileName);
        File newFile = new File(sDir + File.separator + newFileName);
        oldFile.renameTo(newFile);

        return newFileName;
    }

    // multiple 속성 추가로 2개 이상 파일 업로드
    public static ArrayList<String> multiple(HttpServletRequest req, String sDir)
            throws ServletException, IOException{

        // 파일명 저장을 위한 컬렉션 생성
        ArrayList<String> listFileName = new ArrayList<>();

        // Part 객체를 통해 서버로 전송된 파일명 읽어오기
        Collection<Part> parts = req.getParts();
        for (Part part : parts){
            // 파일이 아니라면 업로드 대상에서 무시
            if(!part.getName().equals("ofile")){
                continue;
            }
            // 헤더값에서 파일명을 추출하고, 디렉터리에 저장
            String partHeader = part.getHeader("content-disposition");
            // form-data; name="attachedFile"; filename="파일명.확장자"
            System.out.println("partHeader ::: " + partHeader);

            // 헤더 값에서 파일명 잘라내기
            String[] phArr = partHeader.split("filename=");
            String originalFileName = phArr[1].trim().replace("\"", "");

            // 전송된 파일이 있으면 디렉토리에 저장
            if (!originalFileName.isEmpty()) {
                part.write(sDir + File.separator + originalFileName);
            }

            // 원본파일명을 ArrayList 컬렉션에 추가
            listFileName.add(originalFileName);
        }
        // 파일명이 담겨 있는 컬렉션을 반환
        return listFileName;
    }

    public static void download(HttpServletRequest req , HttpServletResponse resp ,
                                String dir, String sfileName, String ofileName){
        //dir = "/Uploads3
        String sDir = req.getServletContext().getRealPath(dir);
        try{
            File file =new File(sDir,sfileName);
            InputStream inputStream = new FileInputStream(file);
            String client = req.getHeader("User-Agent");


            if (client.indexOf("WOW64") == -1) {
                ofileName = new String(ofileName.getBytes("UTF-8"), "ISO-8859-1");
                System.out.println("클라이언트 헤더 정보 : " + client);
            } else {
                ofileName = new String(ofileName.getBytes("KSC5601"), "ISO-8859-1");
            }


            // 파일 다운로드용 헤더 설정

            resp.reset();// 이 메서드는 응답 객체(response)의 설정을 초기화합니다.
            resp.setContentType("application/octet-stream; charset=utf-8");
            //"Content-Disposition" 헤더는 브라우저에게 응답을 다운로드 , attachment"는 첨부 파일로써 다운로드되어야 함을 나타내며
            //다운되는 파일명을 지정
            resp.setHeader("Content-Disposition", "attachment; filename=\"" + ofileName);
            //파일크기를 헤더에 설정
            resp.setHeader("Content-Length", "" + file.length());


            // response 내장 객체로부터 새로운 출력 스트림 생성
            OutputStream outStream = resp.getOutputStream();

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
    }catch (FileNotFoundException e){
        System.out.println("파일을 찾을 수 없음");
        e.printStackTrace();
    }catch(Exception e){
        System.out.println("파일 다운로드 중 예외 발생");
        e.printStackTrace();
    }
    }
}

























