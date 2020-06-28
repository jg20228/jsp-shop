package com.shop.apparel.action.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.apparel.action.Action;
import com.shop.apparel.model.Member;
import com.shop.apparel.model.RoleType;
import com.shop.apparel.repository.UserRepositroy;
import com.shop.apparel.util.Script;

public class UserUpdateProcAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String username = request.getParameter("username");

		String password = request.getParameter("password1");
		String birthdate = request.getParameter("birthyear")+ "-";
		birthdate += request.getParameter("birthmonth")+ "-";
		birthdate += request.getParameter("birthdate");		
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
		
		Member member = Member.builder()
				.id(id)
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
		int result = userRepositroy.update(member);
		member = userRepositroy.findById(id);
		
		if(result ==1) {
			
			HttpSession session = request.getSession();
			session.setAttribute("principal", member);
			
			Script.href("회원 수정이 완료되었습니다.", "/shop/index.jsp", response);
		} else {
			Script.back("회원 수정에 실패 하였습니다.", response);
		}
	}

}
