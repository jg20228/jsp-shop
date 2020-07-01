package com.shop.apparel.action.user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.apparel.action.Action;
import com.shop.apparel.dto.OrdersProductDto;
import com.shop.apparel.repository.OrdersRepositroy;

public class UserOrderAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));

		OrdersRepositroy ordersRepositroy = OrdersRepositroy.getInstance();
		List<OrdersProductDto> dtos = ordersRepositroy.selectAllDto(id);
		List<OrdersProductDto> opdto = new ArrayList<OrdersProductDto>();

		for (OrdersProductDto dto : dtos) {
			for (OrdersProductDto dto2 : dtos) {
				if (dto.getOrders().getId() == dto2.getOrders().getId()) {
					if (opdto.contains(dto2)) {
						for (OrdersProductDto tdto : opdto) {
							if(tdto.getOrders().getId()==dto2.getOrders().getId()&&!tdto.getProductName().contains("외")) {
								tdto.setProductName(tdto.getProductName()+" 외...");
							}
						}
					}else {
						opdto.add(dto2);
					}
					break;
				}
			}
		}
		request.setAttribute("dtos", opdto);

		RequestDispatcher dis = request.getRequestDispatcher("orders/order.jsp");
		dis.forward(request, response);
	}

}
