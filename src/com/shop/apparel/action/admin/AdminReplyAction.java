package com.shop.apparel.action.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.apparel.action.Action;
import com.shop.apparel.dto.ReplyDto;
import com.shop.apparel.dto.ReviewDto;
import com.shop.apparel.model.Member;
import com.shop.apparel.repository.AdminRepositroy;
import com.shop.apparel.util.Script;

public class AdminReplyAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("principal") == null) {
			Script.href("index.jsp", response);
			return;
		}
		Member member = (Member) session.getAttribute("principal");
		if(!member.getUserRole().toString().equals("ADMIN")) {
			Script.href("index.jsp", response);
			return;
		}
		
		AdminRepositroy adminRepositroy = AdminRepositroy.getInstance();
		List<ReplyDto> replyDtos = adminRepositroy.adminAllReply();
		
		request.setAttribute("replyDtos", replyDtos);
		
		RequestDispatcher dis = request.getRequestDispatcher("startbootstrap/reply.jsp");
		dis.forward(request, response);
	}
}
