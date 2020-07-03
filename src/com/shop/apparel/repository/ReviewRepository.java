package com.shop.apparel.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shop.apparel.db.DBConn;
import com.shop.apparel.dto.ReviewDto;
import com.shop.apparel.model.Review;

import jdk.nashorn.internal.ir.GetSplitState;

public class ReviewRepository {
	private static final String TAG = "ReviewRepository";
	private static ReviewRepository instance = new ReviewRepository();
	private ReviewRepository() {}
	public static ReviewRepository getInstance() {
		return instance;
	}
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	
	public List<ReviewDto> findScore(int productId) {
		/*
		 * final String SQL = "SELECT r.content, r.reviewDate, r.star, m.username " +
		 * "FROM product p INNER JOIN review r " + "ON p.id = r.productId " +
		 * "INNER JOIN member m " + "ON r.memberId = m.id " + "WHERE r.productId = ? " +
		 * "ORDER BY r.star DESC ";
		 */
		
		final String SQL = "SELECT r.content, r.reviewDate, r.star, m.username, DECODE(star, 5 , '아주 만족' , " + 
				"4 , '만족' , " + 
				"3 , '보통' , " + 
				"2 , '미흡' , " + 
				"1 , '불만족', '평점없음') \"level\" " + 
				"FROM product p INNER JOIN review r " + 
				"ON p.id = r.productId " + 
				"INNER JOIN member m " + 
				"ON r.memberId = m.id " + 
				"WHERE r.productId = ? " + 
				"ORDER BY r.star DESC ";
		
		
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, productId);
			rs = pstmt.executeQuery();
			
			List<ReviewDto> reviewDtos = new ArrayList<>();
			
			while(rs.next()) {
				Review review = Review.builder()
						.content(rs.getString(1))
						.reviewDate(rs.getTimestamp(2))
						.star(rs.getInt(3))
						.build();
				ReviewDto reviewDto = ReviewDto.builder()
						.review(review)
						.username(rs.getString(4))
						.level(rs.getString(5))
						.build();
				
				reviewDtos.add(reviewDto);
				
			}
			return reviewDtos;	
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(TAG+"findScore : "+e.getMessage());
		} finally {
			DBConn.close(conn, pstmt, rs);
		}

		return null;
	}	
	
	
	public List<ReviewDto> findNow(int productId) {
			final String SQL = "SELECT r.content, r.reviewDate, r.star, m.username,DECODE(star, 5 , '아주 만족' , " + 
				"4 , '만족' , " + 
				"3 , '보통' , " + 
				"2 , '미흡' , " + 
				"1 , '불만족', '평점없음') \"level\" " + 
				"FROM product p INNER JOIN review r " + 
				"ON p.id = r.productId " + 
				"INNER JOIN member m " + 
				"ON r.memberId = m.id " + 
				"WHERE r.productId = ? " + 
				"ORDER BY r.reviewdate DESC ";
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, productId);
			rs = pstmt.executeQuery();
			
			List<ReviewDto> reviewDtos = new ArrayList<>();
			
			while(rs.next()) {
				Review review = Review.builder()
						.content(rs.getString(1))
						.reviewDate(rs.getTimestamp(2))
						.star(rs.getInt(3))
						.build();
				ReviewDto reviewDto = ReviewDto.builder()
						.review(review)
						.username(rs.getString(4))
						.level(rs.getString(5))
						.build();
				
				reviewDtos.add(reviewDto);
				
			}
			return reviewDtos;	
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(TAG+"findNow : "+e.getMessage());
		} finally {
			DBConn.close(conn, pstmt, rs);
		}

		return null;
	}		
	

}
