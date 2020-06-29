package com.shop.apparel.action.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.apparel.action.Action;
import com.shop.apparel.repository.UserRepositroy;

public class UserCartDeleteAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cartId = Integer.parseInt(request.getParameter("cartId"));
		UserRepositroy userRepositroy = UserRepositroy.getInstance();
		userRepositroy.deleteCartId(cartId);
		
	}
}
