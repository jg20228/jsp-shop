package com.shop.apparel.action.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.shop.apparel.action.Action;
import com.shop.apparel.model.Member;
import com.shop.apparel.repository.AdminRepositroy;
import com.shop.apparel.util.Script;

public class AdminMemberListAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Gson gson = new Gson();
		AdminRepositroy adminRepositroy =AdminRepositroy.getInstance();
		List<Member> members = adminRepositroy.adminAllMember();
		String jsonMembers = gson.toJson(members);
		Script.outJson(jsonMembers, response);
	}
}
