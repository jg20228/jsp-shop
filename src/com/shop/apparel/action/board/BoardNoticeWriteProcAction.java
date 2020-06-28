package com.shop.apparel.action.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.apparel.action.Action;
import com.shop.apparel.model.Notice;
import com.shop.apparel.repository.BoardRepositroy;

public class BoardNoticeWriteProcAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Notice notice = Notice.builder()
				.id(0)
				.memberId(0)
				.title(title)
				.content(content)
				.build();
		
		BoardRepositroy boardRepositroy = BoardRepositroy.getInstance();
		
		int result = boardRepositroy.saveNotice(notice);
		
		RequestDispatcher dis = request.getRequestDispatcher("notice/noticeBoard.jsp");
		dis.forward(request, response);
	}
}
