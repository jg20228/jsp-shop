package com.shop.apparel.action.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.apparel.action.Action;
import com.shop.apparel.repository.UserRepositroy;
import com.shop.apparel.util.Script;

public class UserCartUpdateAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int productId = Integer.parseInt(request.getParameter("productId"));
		int memberId = Integer.parseInt(request.getParameter("memberId"));
		int quantity = Integer.parseInt(request.getParameter("amount"));

		UserRepositroy userRepositroy = UserRepositroy.getInstance();
		int result = userRepositroy.updateCartQuantityById(memberId, productId, quantity);
		
		if(result==1) {
			Script.getMessage("수정완료", response);
		}
	}
}
