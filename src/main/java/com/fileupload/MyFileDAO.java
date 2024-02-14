package com.fileupload;

import com.common.DBConnPool;

import java.util.ArrayList;
import java.util.List;

public class MyFileDAO extends DBConnPool {

    //게시글 작성

    public int insertFile(MyFileDTO dto) {
        int applyResult = 0;


        try {
            String query = "INSERT INTO scott.myfile ("
                    + "idx, title, cate, ofile, sfile)"
                    + " VALUES (scott.seq_board_num.nextval, ?, ?, ?, ?)";

            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getTitle());
            psmt.setString(2, dto.getCate());
            psmt.setString(3, dto.getOfile());
            psmt.setString(4, dto.getSfile());

            applyResult = psmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("insertFile 오류발생");

        }
        return applyResult;
    }
    //파일 목록 반환
    public List<MyFileDTO> myFileList(){
        List<MyFileDTO> fileList = new ArrayList<>();
        //쿼리문
        String quety = "SELECT * FROM scott.myfile ORDER BY idx DESC";

        try{

            stmt = con.createStatement();
            rs = stmt.executeQuery(quety);

            while(rs.next()){
                MyFileDTO dto = new MyFileDTO();
                dto.setIdx(rs.getString("idx"));
                dto.setTitle(rs.getString("Title"));
                dto.setCate(rs.getString("Cate"));
                dto.setSfile(rs.getString("Sfile"));
                dto.setOfile(rs.getString("Ofile"));
                dto.setPostdate(rs.getString("Postdate"));
                //목록에 추가
                fileList.add(dto);

            }


        }catch(Exception e){
            System.out.println("myFileList 오류발생");
        }

return fileList;
    }


}
