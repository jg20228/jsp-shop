package com.shop.apparel.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.shop.apparel.db.DBConn;
import com.shop.apparel.model.Member;
import com.shop.apparel.model.RoleType;

public class UserRepositroy {
	// TAG는 오류 발생시 쉽게 추적하기 위함
	private static final String TAG = "UsersRepository : ";

	// 싱글톤 패턴으로 스스로 객체를 생성해서 다른곳에서 만들어진 이 객체를 사용하기 위함
	// 목적 : 하나만 new 해서 사용
	private UserRepositroy() {
	} // 다른 곳에서 new 를 막기위해서 생성자를 private로 함

	private static UserRepositroy instance = new UserRepositroy(); // 스스로 생성

	public static UserRepositroy getInstance() {
		return instance; // 다른 곳에서 사용할때 이 것을 호출한다.
	}

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	// 회원 수정시 세션에 principal 값 갱신
	public Member findById(int id) {

		final String SQL = "SELECT id, name, username, password, birthdate, gender, address, phone, email, userRole, agreement "
				+ "FROM member WHERE id = ? ";
		
		Member member = null;
		
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(SQL);

			pstmt.setInt(1, id);
						

			rs = pstmt.executeQuery();

			if (rs.next()) {
				
				member = new Member();
				member.setId(rs.getInt("id"));
				member.setName(rs.getString("name"));
				member.setUsername(rs.getString("username"));
				member.setPassword(rs.getString("password"));
				member.setBirthdate(rs.getString("birthdate"));
				member.setGender(rs.getString("gender"));
				member.setAddress(rs.getString("address"));
				member.setPhone(rs.getString("phone"));
				member.setEmail(rs.getString("email"));
				member.setUserRole(RoleType.valueOf(rs.getString("userRole")));
				member.setAgreement(rs.getString("agreement"));
			}
			return member;

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(TAG + "findByUsernameAndPassword : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt);
		}

		return null;
	}
	
	// 회원 정보 수정
	public int  update(Member member) {

		final String SQL = "UPDATE member SET password =?, address = ?, phone = ?, email = ?, agreement = ? WHERE id = ?";
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(SQL);

			System.out.println("update : " + member.getPassword());
			System.out.println("update : " + member.getAddress());
			System.out.println("update : " + member.getPhone());
			System.out.println("update : " + member.getEmail());
			System.out.println("update : " + member.getAgreement());
			System.out.println("update : " + member.getId());
			System.out.println();
			
			pstmt.setString(1, member.getPassword());
			pstmt.setString(2, member.getAddress());
			pstmt.setString(3, member.getPhone());
			pstmt.setString(4, member.getEmail());
			pstmt.setString(5, member.getAgreement());
			pstmt.setInt(6, member.getId());
			
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(TAG + "update : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt);
		}

		return -1;
	}
	
	// 로그인
	public Member findByUsernameAndPassword(String username, String password) {

		final String SQL = "SELECT id, name, username, password, birthdate, gender, address, phone, email, userRole, agreement "
				+ "FROM member WHERE username = ? AND password = ? ";
		
		Member member = null;
		
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, username);
			pstmt.setString(2, password); 
			

			rs = pstmt.executeQuery();

			if (rs.next()) {
				
				member = new Member();
				member.setId(rs.getInt("id"));
				member.setName(rs.getString("name"));
				member.setUsername(rs.getString("username"));
				member.setPassword(rs.getString("password"));
				member.setBirthdate(rs.getString("birthdate"));
				member.setGender(rs.getString("gender"));
				member.setAddress(rs.getString("address"));
				member.setPhone(rs.getString("phone"));
				member.setEmail(rs.getString("email"));
				member.setUserRole(RoleType.valueOf(rs.getString("userRole")));
				member.setAgreement(rs.getString("agreement"));
			}
			return member;

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(TAG + "findByUsernameAndPassword : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt);
		}

		return null;
	}

	// 회원 가입
	public int save(Member member) {

		final String SQL = "INSERT INTO member(id, name, username, password, birthdate, gender, address, phone, email, userRole, agreement) "
				+ "VALUES(member_SEQ.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getUsername());
			pstmt.setString(3, member.getPassword());
			pstmt.setString(4, member.getBirthdate());
			pstmt.setString(5, member.getGender());
			pstmt.setString(6, member.getAddress());
			pstmt.setString(7, member.getPhone());
			pstmt.setString(8, member.getEmail());
			pstmt.setString(9, member.getUserRole().toString());
			pstmt.setString(10, member.getAgreement());
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(TAG + "save : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt);
		}

		return -1;
	}

}
