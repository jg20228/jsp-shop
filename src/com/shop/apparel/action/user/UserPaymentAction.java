package com.shop.apparel.action.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.apparel.action.Action;
import com.shop.apparel.dto.CartResponseDtos;
import com.shop.apparel.repository.UserRepositroy;

public class UserPaymentAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memberId = Integer.parseInt(request.getParameter("id"));
		
		UserRepositroy userRepositroy = UserRepositroy.getInstance();
		List<CartResponseDtos> dtos = userRepositroy.findCartById(memberId);
		
		request.setAttribute("dtos", dtos);
		
		RequestDispatcher dis = request.getRequestDispatcher("user/payment.jsp");
		dis.forward(request, response);
	}
}
