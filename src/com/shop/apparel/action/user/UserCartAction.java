package com.shop.apparel.action.user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.apparel.action.Action;
import com.shop.apparel.dto.CartResponseDto;
import com.shop.apparel.model.Cart;
import com.shop.apparel.model.Product;
import com.shop.apparel.repository.ProductRepositroy;
import com.shop.apparel.repository.UserRepositroy;

public class UserCartAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//with Item 예정
		int memberId = Integer.parseInt(request.getParameter("id"));
		UserRepositroy userRepositroy = UserRepositroy.getInstance();
		
		List<CartResponseDto> dtos = userRepositroy.findCartById(memberId);
		request.setAttribute("dtos", dtos);
		RequestDispatcher dis = request.getRequestDispatcher("user/cart.jsp");
		dis.forward(request, response);
	}

}
