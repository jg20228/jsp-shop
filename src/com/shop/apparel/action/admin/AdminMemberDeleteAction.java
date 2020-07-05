package com.shop.apparel.action.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.apparel.action.Action;
import com.shop.apparel.repository.AdminRepositroy;
import com.shop.apparel.util.Script;

public class AdminMemberDeleteAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memberId = Integer.parseInt(request.getParameter("id"));
		if(memberId==0) {return;}
		AdminRepositroy adminRepositroy = AdminRepositroy.getInstance();
		int result = adminRepositroy.deleteMember(memberId);
		
		if(result==1) {
			Script.href("location.href", response);
		}
	}
}
