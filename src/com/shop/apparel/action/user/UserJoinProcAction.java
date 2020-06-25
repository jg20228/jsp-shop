package com.shop.apparel.action.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.apparel.action.Action;
import com.shop.apparel.model.RoleType;

public class UserJoinProcAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("username").equals("") || 
				request.getParameter("username") == null || 
				request.getParameter("password").equals("") || 
				request.getParameter("password") == null ||
				request.getParameter("email").equals("") || 
				request.getParameter("email") == null ||
				request.getParameter("address").equals("") || 
				request.getParameter("address") == null) 
		{
			return;
		}
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String userRole = RoleType.USER.toString();
		
		
		response.sendRedirect("user/login.jsp");
		
	}

}
