package com.shop.apparel.action.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.apparel.action.Action;
import com.shop.apparel.model.Member;
import com.shop.apparel.repository.UserRepositroy;
import com.shop.apparel.util.Script;

public class UserLoginProcAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 유효성 검사
//		if (request.getParameter("username").equals("") ||
//			request.getParameter("username") == null ||
//			request.getParameter("password").equals("") ||
//			request.getParameter("password") == null) 
//		{
//			return;
//		}

		
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		
		System.out.println(username);
		System.out.println(password);
		

		UserRepositroy userRepositroy = UserRepositroy.getInstance();
		Member member = userRepositroy.findByUsernameAndPassword(username, password);

		if (member != null) {
			HttpSession session = request.getSession();
			session.setAttribute("principal", member);
			// 아이디 기억하기
			if (request.getParameter("remember") != null) {
				Cookie cookie = new Cookie("remember", member.getUsername());
				response.addCookie(cookie);
			} else {
				Cookie cookie = new Cookie("remember", "");
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
			// 로그인 성공
			Script.href("로그인 성공", "/shop/index.jsp", response);
		} else {
			Script.back("로그인 실패. 다시 로그인 해주세요", response);
		}

	}

}
