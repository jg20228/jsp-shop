package com.shop.apparel.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shop.apparel.db.DBConn;
import com.shop.apparel.dto.OrdersDetailDto;
import com.shop.apparel.dto.OrdersProductDto;
import com.shop.apparel.model.Notice;
import com.shop.apparel.model.Orders;
import com.shop.apparel.model.Orders_detail;
import com.shop.apparel.model.Product;

public class OrdersRepositroy {
	//TAG는 오류 발생시 쉽게 추적하기 위함
	private static final String TAG = "OrdersRepositroy : ";
	
	//싱글톤 패턴으로 스스로 객체를 생성해서 다른곳에서 만들어진 이 객체를 사용하기 위함
	//목적 : 하나만 new 해서 사용
	private OrdersRepositroy() {} // 다른 곳에서 new 를 막기위해서 생성자를 private로 함
	
	private static OrdersRepositroy instance = new OrdersRepositroy(); //스스로 생성
	
	public static OrdersRepositroy getInstance() {
		return instance; //다른 곳에서 사용할때 이 것을 호출한다.
	}
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public List<OrdersDetailDto> selectAllOrdersDetailDto(int ordersId){
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT p.id, p.name, p.titlecomment, p.price, p.thumbnailh, od.id, od.quantity, od.price ");
		sb.append("FROM PRODUCT p INNER JOIN ORDERS_detail od ");
		sb.append("ON p.id = od.productid ");
		sb.append("WHERE od.orderid = ? ");
		final String SQL = sb.toString();
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, ordersId);
			rs = pstmt.executeQuery();
			
			List<OrdersDetailDto> dtos = new ArrayList<>();
			while(rs.next()) {
				Product product = Product.builder()
						.id(rs.getInt(1))
						.name(rs.getString(2))
						.titleComment(rs.getString(3))
						.price(rs.getInt(4))
						.thumbnailH(rs.getString(5))
						.build();
				
				Orders_detail orders_detail = Orders_detail.builder()
						.id(rs.getInt(6))
						.quantity(rs.getInt(7))
						.price(rs.getInt(8))
						.build();
				OrdersDetailDto dto = OrdersDetailDto.builder()
						.product(product)
						.orders_detail(orders_detail)
						.build();
				dtos.add(dto);
			}
			return dtos;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(TAG + "selectAllOrdersDetailDto : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt,rs);
		}
		return null;
	}
	

	
	public List<OrdersProductDto> selectAllDto(int id){
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT o.id, o.memberid, o.orderdate, o.totalprice , p.name, p.thumbnailh ");
		sb.append("FROM ");
		sb.append("ORDERS O INNER JOIN ORDERS_DETAIL OD ");
		sb.append("ON o.id = od.orderid ");
		sb.append("INNER JOIN product p ");
		sb.append("ON od.productid = p.id ");
		sb.append("WHERE o.memberid = ? ");
		final String SQL = sb.toString();
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			
			List<OrdersProductDto> dtos = new ArrayList<>();
			while(rs.next()) {
				Orders order = Orders.builder()
						.id(rs.getInt(1))
						.memberId(rs.getInt(2))
						.orderDate(rs.getTimestamp(3))
						.totalPrice(rs.getInt(4))
						.build();
				OrdersProductDto dto = OrdersProductDto.builder()
						.orders(order)
						.productName(rs.getString(5))
						.productThumbnailh(rs.getString(6))
						.build();
				dtos.add(dto);
			}
			return dtos;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(TAG + "selectAllDto : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt,rs);
		}
		return null;
	}
}
