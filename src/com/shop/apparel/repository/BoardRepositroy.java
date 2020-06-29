package com.shop.apparel.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shop.apparel.db.DBConn;
import com.shop.apparel.model.Notice;

public class BoardRepositroy {
	//TAG는 오류 발생시 쉽게 추적하기 위함
	private static final String TAG = "BoardRepositroy : ";
	
	//싱글톤 패턴으로 스스로 객체를 생성해서 다른곳에서 만들어진 이 객체를 사용하기 위함
	//목적 : 하나만 new 해서 사용
	private BoardRepositroy() {} // 다른 곳에서 new 를 막기위해서 생성자를 private로 함
	
	private static BoardRepositroy instance = new BoardRepositroy(); //스스로 생성
	
	public static BoardRepositroy getInstance() {
		return instance; //다른 곳에서 사용할때 이 것을 호출한다.
	}
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	//delete
	
	public int updateById(Notice notice) {
		final String SQL = "UPDATE notice set title = ? , content = ? WHERE id = ?";
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, notice.getTitle());
			pstmt.setString(2, notice.getContent());
			pstmt.setInt(3, notice.getId());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(TAG + "updateById : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt);
		}
		return -1;
	}
	
	public int deleteById(int id) {
		final String SQL = "DELETE FROM notice WHERE id = ?";
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, id);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(TAG + "deleteById : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt);
		}
		return -1;
	}
	
	//관리자가 작성하는 공지사항
	public int saveNotice(Notice notice){
		final String SQL = "INSERT INTO notice(id, memberId, title, content, createDate, readCount) "
				+ "VALUES(notice_SEQ.nextval,?,?,?,sysdate,0)";
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, notice.getMemberId());
			pstmt.setString(2, notice.getTitle());
			pstmt.setString(3, notice.getContent());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(TAG + "saveNotice : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt);
		}
		return -1;
	}
	
	
	public Notice selectById(int id){
		final String SQL = "SELECT * FROM notice WHERE id = ?";
		Notice notice = null;
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				notice = Notice.builder()
						.id(rs.getInt(1))
						.memberId(rs.getInt(2))
						.title(rs.getString(3))
						.content(rs.getString(4))
						.createDate(rs.getTimestamp(5))
						.readCount(rs.getInt(6))
						.build();
			}
			return notice;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(TAG + "selectById : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt);
		}
		return null;
	}
	
	
	public List<Notice> selectAll(){
		final String SQL = "SELECT * FROM notice ORDER BY id DESC";
		List<Notice> notices = new ArrayList<>();
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Notice notice = Notice.builder()
						.id(rs.getInt(1))
						.memberId(rs.getInt(2))
						.title(rs.getString(3))
						.content(rs.getString(4))
						.createDate(rs.getTimestamp(5))
						.readCount(rs.getInt(6))
						.build();
				notices.add(notice);
			}
			return notices;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(TAG + "selectAll : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt);
		}
		
		return null;
	}
	
}
