package com.shop.apparel.action.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.apparel.action.Action;
import com.shop.apparel.repository.UserRepositroy;

public class UserWishDeleteAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int wishId = Integer.parseInt(request.getParameter("wishId"));
		UserRepositroy userRepositroy = UserRepositroy.getInstance();
		userRepositroy.deleteWishId(wishId);
	}
}
