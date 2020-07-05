package com.shop.apparel.action.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.apparel.action.Action;
import com.shop.apparel.repository.AdminRepositroy;
import com.shop.apparel.util.Script;

public class AdminProductDeleteAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productId = Integer.parseInt(request.getParameter("id"));
		AdminRepositroy adminRepositroy = AdminRepositroy.getInstance();
		int result = adminRepositroy.deleteProduct(productId);
		
		if(result==1) {
			Script.href("삭제 완료", "/shop/admin?cmd=product", response);
		}
	}
}
