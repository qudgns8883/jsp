package com.common;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBConnPool {

    public Connection con; // 데이터베이스와 연결을 담당,데이터베이스에 접근할 수 있게 하는 객체
    public Statement stmt;// 파라미터가 없는 정적 쿼리문 실행할 때 사용
    public PreparedStatement psmt; // 파라미터가 있는 동적 쿼리문 실행할 때 사용
    public ResultSet rs; // SELECT 쿼리문 실행결과를 저장할 때 사용


    public DBConnPool() {
        try {
            //커넥션 풀 얻기
            Context initCtx = new InitialContext();
            //JNDI에서 이름과 실제 객체를 연결해주는 역할
            Context ctx = (Context) initCtx.lookup("java:comp/env");
            //java:comp/env > 현재 웹 애플리케이션의 루트 디렉토리
            DataSource source = (DataSource) ctx.lookup("dbcp_myoracle");

            //커넥션 풀을 통해서 connection 얻기
            con = source.getConnection();
            System.out.println("DB 커넥션 연결성공");

        } catch (Exception e) {
            System.out.println("DB 커넥션 연결실패");
            e.printStackTrace();
        }
    }

    public void close() {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (psmt != null) psmt.close();
            if (con != null) con.close();

            System.out.println("커넥션 풀 연결 자원 해제");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}