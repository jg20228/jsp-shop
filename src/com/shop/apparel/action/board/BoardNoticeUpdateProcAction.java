package com.shop.apparel.action.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.apparel.action.Action;
import com.shop.apparel.model.Notice;
import com.shop.apparel.repository.BoardRepositroy;
import com.shop.apparel.util.Script;

public class BoardNoticeUpdateProcAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Notice notice = Notice.builder()
				.id(id)
				.title(title)
				.content(content)
				.build();
		BoardRepositroy boardRepositroy = BoardRepositroy.getInstance();
		int result = boardRepositroy.updateById(notice);
		
		Script.href("/shop/board?cmd=noticeBoard", response);
	}
}
