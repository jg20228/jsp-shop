package com.shop.apparel.action.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.apparel.action.Action;
import com.shop.apparel.repository.UserRepositroy;
import com.shop.apparel.util.Script;

public class UserCartAllDeleteAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int memberId = Integer.parseInt(request.getParameter("id"));
		
		UserRepositroy userRepositroy = UserRepositroy.getInstance();
		int result = userRepositroy.deleteALLCart(memberId);
		
		Script.outText(result+"", response);
	}

}
