package com.shop.apparel.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shop.apparel.db.DBConn;
import com.shop.apparel.dto.ReviewDto;
import com.shop.apparel.model.Member;
import com.shop.apparel.model.Product;
import com.shop.apparel.model.Review;
import com.shop.apparel.model.RoleType;

import lombok.Builder;

public class AdminRepositroy {
	
	//TAG는 오류 발생시 쉽게 추적하기 위함
	private static final String TAG = "AdminRepositroy : ";
	
	//싱글톤 패턴으로 스스로 객체를 생성해서 다른곳에서 만들어진 이 객체를 사용하기 위함
	//목적 : 하나만 new 해서 사용
	private AdminRepositroy() {} // 다른 곳에서 new 를 막기위해서 생성자를 private로 함
	
	private static AdminRepositroy instance = new AdminRepositroy(); //스스로 생성
	
	public static AdminRepositroy getInstance() {
		return instance; //다른 곳에서 사용할때 이 것을 호출한다.
	}
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public List<ReviewDto> adminAllReview(){
		final String SQL = "SELECT p.id, p.name, p.type, p.price, r.id, r.star, r.content, r.reviewDate, r.photo, r.memberId, r.productId, m.username " + 
				"FROM review r INNER JOIN product p " + 
				"ON r.productId = p.id " + 
				"INNER JOIN member m " + 
				"ON r.memberId = m.id ";
		try {
			List<ReviewDto> reviewDtos = new ArrayList<ReviewDto>();
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Product product = Product.builder()
						.id(rs.getInt(1))
						.name(rs.getString(2))
						.type(rs.getString(3))
						.price(rs.getInt(4))
						.build();
			   Review review = Review.builder()
					   .id(rs.getInt(5))
					   .star(rs.getInt(6))
					   .content(rs.getString(7))
					   .reviewDate(rs.getTimestamp(8))
					   .photo(rs.getString(9))
					   .memberId(rs.getInt(10))
					   .productId(rs.getInt(11))
					   .build();
			   ReviewDto reviewDto = ReviewDto.builder()
					   .product(product)
					   .review(review)
					   .username(rs.getString(12))
					   .build();
			   
			   reviewDtos.add(reviewDto);
			   
			   System.out.println("productId : " +reviewDtos.toString() );
					
			}
			return reviewDtos;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(TAG + "adminAllReview : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt,rs);
		}
		return null;
	}
	
	public List<Product> adminAllProduct(){
		final String SQL = "SELECT id, name, type, titleComment, price, thumbnailW, thumbnailH, contents, categoryId " + 
				"FROM product ";
		try {
			List<Product> products = new ArrayList<Product>();
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Product product = Product.builder()
						.id(rs.getInt(1))
						.name(rs.getString(2))
						.type(rs.getString(3))
						.titleComment(rs.getString(4))
						.price(rs.getInt(5))
						.thumbnailW(rs.getString(6))
						.thumbnailH(rs.getString(7))
						.contents(rs.getString(8))
						.categoryId(rs.getInt(9))
						.build();
				products.add(product);
			}
			return products;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(TAG + "adminAllProduct : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt,rs);
		}
		return null;
	}
	
	public List<Member> adminAllMember(){
		final String SQL = "SELECT id, name, username, password, birthdate, gender, address, phone, email, userRole, agreement "
				+ "FROM member";
		try {
			List<Member> members = new ArrayList<Member>();
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Member member = new Member();
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
				members.add(member);
			}
			return members;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(TAG + "adminAllMember : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt,rs);
		}
		return null;
	}
}
