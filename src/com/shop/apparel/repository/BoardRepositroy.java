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
