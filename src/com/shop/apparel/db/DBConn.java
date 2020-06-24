package com.shop.apparel.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConn {
	public static Connection getConnection() {
		try {
			//아파치 톰캣 8.5버전에서 DB연결할때 사용하는 방법
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource) envContext.lookup("jdbc/myoracle");
			Connection conn = ds.getConnection();
			System.out.println("DBConn : 데이터베이스 연결 성공");
			return conn;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DBConn : 데이터베이스 연결 실패");
			System.out.println("DBConn : Message : " + e.getMessage());
		}
		return null;
	}
	
	//DML중에서 INSERT,UPDATE,DELETE를 이용할때 접속을 끊어주기 위함
		public static void close(Connection conn, PreparedStatement pstmt) {
			try {
				conn.close();
				pstmt.close();
			} catch (Exception e) {
				System.out.println("DB종료시 오류가 발생 : " + e.getMessage());
			}
		}

	//SELECT를 할때는 ResultSet을 사용하므로 다르게 이용
		public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
			try {
				conn.close();
				pstmt.close();
				rs.close();
			} catch (Exception e) {
				System.out.println("DB종료시 오류가 발생 : " + e.getMessage());
			}
		}
}
