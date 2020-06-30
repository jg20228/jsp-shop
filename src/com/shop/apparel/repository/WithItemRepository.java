package com.shop.apparel.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shop.apparel.db.DBConn;
import com.shop.apparel.dto.WithItemDto;
import com.shop.apparel.model.WithItem;

public class WithItemRepository {
		//TAG는 오류 발생시 쉽게 추적하기 위함
		private static final String TAG = "WithItemRepository : ";
		
		//싱글톤 패턴으로 스스로 객체를 생성해서 다른곳에서 만들어진 이 객체를 사용하기 위함
		//목적 : 하나만 new 해서 사용
		private WithItemRepository() {} // 다른 곳에서 new 를 막기위해서 생성자를 private로 함
		
		private static WithItemRepository instance = new WithItemRepository(); //스스로 생성
		
		public static WithItemRepository getInstance() {
			return instance; //다른 곳에서 사용할때 이 것을 호출한다.
		}
		
		private Connection conn = null;
		private PreparedStatement pstmt = null;
		private ResultSet rs = null;
		
		// detail.jsp에 쓰기 위해 withDto중에 필요한 것들만! 
		public List<WithItemDto> selectByIdForDto(int productId) {
			final String SQL = "";
			List<WithItemDto> withItemDtos = new ArrayList<>();
			
			try {
				conn = DBConn.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, productId);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					WithItem withItem = WithItem.builder()
							.id(rs.getInt(1))
							.parentProductId(rs.getInt(2))
							//여기 다시 해야함.
							.build();
					WithItemDto withItemDto = WithItemDto.builder()
							.withItem(withItem)
							.name(rs.getString(4))
							.titleComment(rs.getString(5))
							.price(rs.getInt(6))
							.thumbnailH(rs.getString(7))
							.productId(rs.getInt(8))
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
