package com.shop.apparel.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shop.apparel.db.DBConn;
import com.shop.apparel.dto.DetailResponseDto;
import com.shop.apparel.dto.WithItemDto;
import com.shop.apparel.model.Product;
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
		
		// detail.jsp에 쓰기 위해 withItem 부분을 위함. 
		public List<WithItemDto> selectById(int productId) {
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
				System.out.println(TAG+"selectByIdForDto: "+e.getMessage());
			} finally {
				DBConn.close(conn, pstmt, rs);
			}
			
			return null;
		}

}
