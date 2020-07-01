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
		int memberId = Integer.parseInt(request.getParameter("id"));
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		
		//결제 시스템~
		System.out.println(memberId);
		System.out.println(totalPrice);
		//결제 시스템 끝~
		
		OrdersRepositroy ordersRepositroy = OrdersRepositroy.getInstance();
		int orderId = ordersRepositroy.ordersSave(memberId, totalPrice);
		System.out.println(orderId);
		List<PaymentActionDto> dtos = ordersRepositroy.selectPaymentActionDto(memberId);
		for (PaymentActionDto dto : dtos) {
			ordersRepositroy.ordersDetailSave(orderId, dto.getProductId(), dto.getQuantity(), dto.getPrice());
		}
	}
}
