package com.membership;


import com.common.DBConnPool;

public class MemberDAO extends DBConnPool {




    public MemberDAO() {
        super();
    }



    //받아온 파라미터 아이디/패스워드 일치하는 회원정보 반환
    public MemberDTO getMemberDTO(String uid,String upass){

        MemberDTO dto = new MemberDTO();  //회원정보 DTO객체 생성

        //DB의 명령문은 대문자로
        String sql = "SELECT * from scott.member_jsp WHERE id = ? AND pass = ?";

        try{
            psmt = con.prepareStatement(sql);  //인파라미터가 있는 동적 쿼리를 처리할때사용

            //psmt 정해진 sql문장을 데이터베이스에 삽입
            psmt.setString(1,uid);
            psmt.setString(2,upass);

            rs = psmt.executeQuery();  //쿼리 실행 결과를 rs에 담음

            while(rs.next()){   //결과가 존재할 때동안
                dto.setId(rs.getString("id"));
                dto.setPass(rs.getString("pass"));
                dto.setName(rs.getString("name"));
                dto.setRegidate(rs.getString("regidate"));
            }

        }catch(Exception e){
            e.printStackTrace();
        }


        return dto;
    }


}
