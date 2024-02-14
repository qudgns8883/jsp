package com.model2;

import com.common.DBConnPool;
import com.model1.board.BoardDTO;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class MVCBoardDAO extends DBConnPool { // 커넥션 풀 상속
    public MVCBoardDAO() {
        super();
    }

    //검색 조건에 맞는 게시물 개수 반환
    public int selectCount(Map <String, Object> map){
        int totalCount = 0;

        String query = "SELECT COUNT(*) FROM scott.mvcboard";
        if(map.get("searchWord") != null){
            query += " WHERE " + map.get("searchField") + " " + " LIKE '%" + map.get("searchWord") + "%'";
        }
        //SLECT COUNT(*) FROM board_jsp WHERE title LIKE '%검색어%';

        try{
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);
            rs.next();
            totalCount = rs.getInt(1);

        }catch (Exception e){
            e.printStackTrace();;
            System.out.println("mvcboard selectCount 오류발생");
        }

        return totalCount;
    }

    //검색 조건에 맞는 게시물의 개수를 반환
    public List<MVCBoardDTO> selectList(Map<String, Object> map) {
        //쿼리 결과를 담을 변수
        List<MVCBoardDTO> bbs = new ArrayList<MVCBoardDTO>();
        //쿼리문 작성
        String query = "SELECT * FROM scott.mvcboard";

        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField") + " "
                    + " LIKE '%" + map.get("searchWord") + "%'";
        }
        query += " ORDER BY idx desc";

        try {
            stmt = con.createStatement(); //쿼리문 생성
            rs = stmt.executeQuery(query); //쿼리문 실행

            while (rs.next()) {   //결과를 순환
                //한 행(row)의 내용을 DTO에 저장
                MVCBoardDTO dto = new MVCBoardDTO();
                dto.setIdx(rs.getString("idx"));
                dto.setName(rs.getString("name"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setPostdate(rs.getDate("postdate"));
                dto.setOfile(rs.getString("ofile"));
                dto.setSfile(rs.getString("sfile"));
                dto.setDowncount(rs.getInt("downcount"));
                dto.setPass(rs.getString("pass"));
                dto.setVisitcount(rs.getInt("visitcount"));


                bbs.add(dto);  //결과 목록에 저장
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("mvcboard selectList 오류발생");

        }
        return bbs;
    }
    public int insertWrite(MVCBoardDTO dto) {
        int result = 0;
        //DB에 BOARD테이블에 맞춰서 작성
        try {
            String query = "INSERT INTO scott.mvcboard ( "
                    + "idx,name, title, content, ofile, sfile, pass)"
                    + " VALUES ("
                    + " scott.seq_board_num.nextval, ?, ?, ?, ?, ?, ?)";

            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getName());
            psmt.setString(2, dto.getTitle());
            psmt.setString(3, dto.getContent());
            psmt.setString(4, dto.getOfile());
            psmt.setString(5, dto.getSfile());
            psmt.setString(6, dto.getPass());

            //반환 값으로  , executeUpdate() 반환값은 숫자
            result = psmt.executeUpdate();
            System.out.println("반환값 확인" + result);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("mvcboard insertWrite 오류발생");
        }
        return result;
    }

    //파라메터 idx값에 따라 게시물 가져오기
    public MVCBoardDTO selectView(String idx){
        MVCBoardDTO dto = new MVCBoardDTO();

        String query = "SELECT * FROM scott.mvcboard WHERE idx = ?";

        try{
            psmt = con.prepareStatement(query);
            psmt.setString(1,idx);
            rs = psmt.executeQuery();

            if(rs.next()){
                dto.setIdx(rs.getString("idx"));
                dto.setName(rs.getString("name"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setPostdate(rs.getDate("postdate"));
                dto.setOfile(rs.getString("ofile"));
                dto.setSfile(rs.getString("sfile"));
                dto.setDowncount(rs.getInt("downcount"));
                dto.setPass(rs.getString("pass"));
                dto.setVisitcount(rs.getInt("visitcount"));
                System.out.println("ofile :: " +rs.getString("ofile") + "  sfile : " + rs.getString("sfile"));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return dto;
    }
public void updateVisitCount(String idx){
    String query = "UPDATE scott.mvcboard"
            + " SET visitcount  = visitcount + 1"
            + " WHERE idx =? ";

    try {
        psmt = con.prepareStatement(query);
        psmt.setString(1, idx);
        rs = psmt.executeQuery();


    } catch (Exception e) {
        e.printStackTrace();
        System.out.println("mvcboard updateVisitCount 오류발생");
    }
}

}


























