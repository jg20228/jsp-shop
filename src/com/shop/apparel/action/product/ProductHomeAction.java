package com.shop.apparel.action.product;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.apparel.action.Action;
import com.shop.apparel.model.Member;
import com.shop.apparel.util.Script;

public class ProductHomeAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dis = request.getRequestDispatcher("home.jsp");
		dis.forward(request, response);
	}
}
