package com.shop.apparel.action.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.apparel.action.Action;
import com.shop.apparel.dto.CartResponseDtos;
import com.shop.apparel.dto.PaymentActionDto;
import com.shop.apparel.repository.OrdersRepositroy;
import com.shop.apparel.repository.ProductRepositroy;
import com.shop.apparel.repository.UserRepositroy;
import com.shop.apparel.util.Script;

public class UserPaymentProcAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//결제시스템에서 성공이 되었을 경우 실행되는 곳
		int memberId = Integer.parseInt(request.getParameter("id"));
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		
		OrdersRepositroy ordersRepositroy = OrdersRepositroy.getInstance();
		UserRepositroy userRepositroy = UserRepositroy.getInstance();
		
		int orderId = ordersRepositroy.ordersSave(memberId, totalPrice);
		System.out.println(orderId);
		
		List<PaymentActionDto> dtos = ordersRepositroy.selectPaymentActionDto(memberId);
		
		//장바구니->order_detail 테이블에 입력
		for (PaymentActionDto dto : dtos) {
			ordersRepositroy.ordersDetailSave(orderId, dto.getProductId(), dto.getQuantity(), dto.getPrice());
		}
		//장바구니 비우기
		userRepositroy.deleteALLCart(memberId);
	}
}
