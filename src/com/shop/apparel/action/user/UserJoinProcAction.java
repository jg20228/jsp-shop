package com.shop.apparel.action.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.apparel.action.Action;
import com.shop.apparel.model.Member;
import com.shop.apparel.model.RoleType;
import com.shop.apparel.repository.ProductRepositroy;
import com.shop.apparel.repository.UserRepositroy;

public class UserJoinProcAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		if (request.getParameter("username").equals("") || 
//				request.getParameter("username") == null || 
//				request.getParameter("password1").equals("") || 
//				request.getParameter("password1") == null ||
//				request.getParameter("password2").equals("") || 
//				request.getParameter("password2") == null ||
//				request.getParameter("password1") != request.getParameter("password2") ||
//				request.getParameter("email").equals("") || 
//				request.getParameter("email") == null ||
//				request.getParameter("address").equals("") || 
//				request.getParameter("address") == null) 
//		{
//			return;
//		}
		
		String name = request.getParameter("name");
		String username = request.getParameter("username");

		String password = request.getParameter("password1");
		String birthdate = request.getParameter("birthyear");
		if(Integer.parseInt(request.getParameter("birthmonth")) < 10 && (request.getParameter("birthmonth").length()) < 2){
			birthdate += "0"+request.getParameter("birthmonth");
		}else {
			birthdate += request.getParameter("birthmonth");
		}
		
		if(Integer.parseInt(request.getParameter("birthdate")) < 10 && (request.getParameter("birthdate").length()) < 2) {
			birthdate += "0"+request.getParameter("birthdate");
		}else {
			birthdate += request.getParameter("birthdate");
		}
		String gender = request.getParameter("gender");		
		String post = request.getParameter("post") + "/";
		String address = post;
		address += request.getParameter("haddress1") + "/";		
		address += request.getParameter("haddress2");		
		String phone = request.getParameter("hphone1") + "-";		
		phone += request.getParameter("hphone2")+ "-";		
		phone += request.getParameter("hphone3");		
		String email = request.getParameter("email1");		
		email += "@";		
		email += request.getParameter("email2");	
		RoleType userRole = RoleType.USER;
		String agreement = request.getParameter("smsreceive");		
		
		System.out.println(name);
		System.out.println(username);
		System.out.println(password);
		System.out.println(birthdate);
		System.out.println(gender);
		System.out.println(post);
		System.out.println(address);
		System.out.println(phone);
		System.out.println(email);
		System.out.println(userRole);
		System.out.println(agreement);
		
		Member member = Member.builder()
				.name(name)
				.username(username)
				.password(password)
				.birthdate(birthdate)
				.gender(gender)
				.address(address)
				.phone(phone)
				.email(email)
				.userRole(userRole)
				.agreement(agreement)
				.build();
		

		UserRepositroy userRepositroy = UserRepositroy.getInstance();
		int result = userRepositroy.save(member);
		
		response.sendRedirect("user/login.jsp");
	}
}
