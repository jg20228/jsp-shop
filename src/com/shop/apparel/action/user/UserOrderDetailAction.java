package com.shop.apparel.action.user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.apparel.action.Action;
import com.shop.apparel.dto.OrdersDetailDto;
import com.shop.apparel.dto.OrdersProductDto;
import com.shop.apparel.repository.OrdersRepositroy;

public class UserOrderDetailAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));

		OrdersRepositroy ordersRepositroy = OrdersRepositroy.getInstance();
		List<OrdersDetailDto> dtos= ordersRepositroy.selectAllOrdersDetailDto(id);
		
		request.setAttribute("dtos", dtos);
		
		RequestDispatcher dis = request.getRequestDispatcher("orders/orderDetail.jsp");
		dis.forward(request, response);
	}

}
