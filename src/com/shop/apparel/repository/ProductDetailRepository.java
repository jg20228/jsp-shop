package com.shop.apparel.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shop.apparel.db.DBConn;
import com.shop.apparel.dto.DetailResponseDto;
import com.shop.apparel.dto.QnADto;
import com.shop.apparel.dto.ReviewDto;
import com.shop.apparel.dto.StarDto;
import com.shop.apparel.dto.WithItemDto;
import com.shop.apparel.model.Product;
import com.shop.apparel.model.QnA;
import com.shop.apparel.model.Reply;
import com.shop.apparel.model.Review;
import com.shop.apparel.model.WithItem;

public class ProductDetailRepository {
		//TAG는 오류 발생시 쉽게 추적하기 위함
		private static final String TAG = "ProductDetailRepository : ";
		
		//싱글톤 패턴으로 스스로 객체를 생성해서 다른곳에서 만들어진 이 객체를 사용하기 위함
		//목적 : 하나만 new 해서 사용
		private ProductDetailRepository() {} // 다른 곳에서 new 를 막기위해서 생성자를 private로 함
		
		private static ProductDetailRepository instance = new ProductDetailRepository(); //스스로 생성
		
		public static ProductDetailRepository getInstance() {
			return instance; //다른 곳에서 사용할때 이 것을 호출한다.
		}
		
		private Connection conn = null;
		private PreparedStatement pstmt = null;
		private ResultSet rs = null;
		
		public List<QnADto> selectByIdForQnA(int productId){
			StringBuilder sb = new StringBuilder();
			sb.append("SELECT q.title, q.content, q.qnadate, m. username, r.content, r.replydate, q.id ");
			sb.append("FROM qna q INNER JOIN member m ");
			sb.append("ON m.id = q.memberId ");
			sb.append("INNER JOIN reply r ");
			sb.append("ON q.id = r.qnaid ");
			sb.append("WHERE q.productid = ? ");
			sb.append("ORDER BY (q.id) ");
			
			final String SQL =sb.toString();
			List<QnADto> qnADtos = new ArrayList<>();
			try {
				conn = DBConn.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, productId);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					QnA qnA = QnA.builder()
							.title(rs.getString(1))
							.content(rs.getString(2))
							.qnADate(rs.getTimestamp(3))
							.id(rs.getInt(7))
							.build();
					QnADto qnADto = QnADto.builder()
							.qna(qnA)
							.content(rs.getString(5))
							.replydate(rs.getTimestamp(6))
							.username(rs.getString(4))
							.build();
					
					qnADtos.add(qnADto);
				}
				return qnADtos;				
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println(TAG+"selectByIdForQnA: "+e.getMessage());
			} finally {
				DBConn.close(conn, pstmt, rs);
			}
			return null;
		}
		
		public StarDto findByIdStar(int productId) {
			StringBuilder sb = new StringBuilder();
			sb.append("SELECT");
			sb.append("(SELECT count(star) FROM review WHERE productId = ? AND star = 5), ");
			sb.append("(SELECT count(star) FROM review WHERE productId = ? AND star = 4), ");
			sb.append("(SELECT count(star) FROM review WHERE productId = ? AND star = 3), ");
			sb.append("(SELECT count(star) FROM review WHERE productId = ? AND star = 2), ");
			sb.append("(SELECT count(star) FROM review WHERE productId = ? AND star = 1), ");
			sb.append("(SELECT sum(star) FROM review WHERE productId = ?), ");
			sb.append("(SELECT count(*) FROM review WHERE productId = ?) ");
			sb.append("FROM DUAL");
			final String SQL = sb.toString();
			StarDto starDto = null;
			
			try {
				conn = DBConn.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, productId);
				pstmt.setInt(2, productId);
				pstmt.setInt(3, productId);
				pstmt.setInt(4, productId);
				pstmt.setInt(5, productId);
				pstmt.setInt(6, productId);
				pstmt.setInt(7, productId);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					starDto = StarDto.builder()
							.five(rs.getInt(1))
							.four(rs.getInt(2))
							.three(rs.getInt(3))
							.two(rs.getInt(4))
							.one(rs.getInt(5))
							.sum(rs.getInt(6))
							.totalCount(rs.getInt(7))
							.build();
				}
				return starDto;
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println(TAG+"test: "+e.getMessage());
			} finally {
				DBConn.close(conn, pstmt, rs);
			}
			
			return null;
		}

		// detail.jsp의 review 부분에 필요한 것들 
		public List<ReviewDto> selectByIdForReview(int productId) {
			/*final String SQL = "SELECT p.id, p.name, p.type, p.titlecomment, p.price, p.thumbnailW, p.thumbnailH, p.contents, p.categoryId, r.id, r.star, r.content, r.reviewDate, r.photo, r.memberId, r.productId, m.username " + 
					"FROM product p INNER JOIN review r " + 
					"ON p.id = r.productId " + 
					"INNER JOIN member m " + 
					"ON r.memberId = m.id " + 
					"WHERE r.productId = ? ";*/
			
			final String SQL = "SELECT p.id, p.name, p.type, p.titlecomment, p.price, p.thumbnailW, p.thumbnailH, p.contents, p.categoryId, r.id, r.star, r.content, r.reviewDate, r.photo, r.memberId, r.productId, m.username,DECODE(star, 5 , '아주 만족' , " + 
					"4 , '만족' , " + 
					"3 , '보통' , " + 
					"2 , '미흡' , " + 
					"1 , '불만족', '평점없음') \"level\" " + 
					"FROM product p INNER JOIN review r " + 
					"ON p.id = r.productId " + 
					"INNER JOIN member m " + 
					"ON r.memberId = m.id " + 
					"WHERE r.productId = ? ";
			
			List<ReviewDto> reviewDtos = new ArrayList<>();
			
			try {
				conn = DBConn.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, productId);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
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
					Review review = Review.builder()
							.id(rs.getInt(10))
							.star(rs.getInt(11))
							.content(rs.getString(12))
							.reviewDate(rs.getTimestamp(13))
							.photo(rs.getString(14))
							.memberId(rs.getInt(15))
							.productId(rs.getInt(16))
							.build();
					ReviewDto reviewDto = ReviewDto.builder()
							.product(product)
							.review(review)
							.username(rs.getString(17))
							.level(rs.getString(18))
							.build();
					
					reviewDtos.add(reviewDto);
				}
				return reviewDtos;				
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println(TAG+"selectByIdForReview: "+e.getMessage());
			} finally {
				DBConn.close(conn, pstmt, rs);
			}
			
			return null;
		}
		
		// detail.jsp에 쓰기 위해 withItem 부분을 위함. 
		public List<WithItemDto> selectByIdForWithItem(int productId) {
			final String SQL = "SELECT p.id, p.name, p.type, p.titlecomment, p.price, p.thumbnailW, p.thumbnailH, p.contents, p.categoryId, w.id, w.parentproductId, w.withItemId " + 
					"FROM product p INNER JOIN withItem w " + 
					"ON p.id = w.withitemid " + 
					"WHERE w.parentProductId = ? ";
			List<WithItemDto> withItemDtos = new ArrayList<>();
			
			try {
				conn = DBConn.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, productId);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
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
					WithItem withItem = WithItem.builder()
							.id(rs.getInt(10))
							.parentProductId(rs.getInt(11))
							.withItemId(rs.getInt(12))
							.build();
					WithItemDto withItemDto = WithItemDto.builder()
							.product(product)
							.withItem(withItem)
							.build();
					
					withItemDtos.add(withItemDto);
				}
				return withItemDtos;				
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println(TAG+"selectByIdForWithItem: "+e.getMessage());
			} finally {
				DBConn.close(conn, pstmt, rs);
			}
			
			return null;
		}

}
