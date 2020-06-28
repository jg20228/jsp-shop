package com.shop.apparel.action.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.apparel.action.Action;
import com.shop.apparel.model.Notice;
import com.shop.apparel.repository.BoardRepositroy;

public class BoardNoticeUpdateProcAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		BoardRepositroy boardRepositroy = BoardRepositroy.getInstance();
		Notice notice = boardRepositroy.selectById(id);
		
		request.setAttribute("notice", notice);
		
		RequestDispatcher dis = request.getRequestDispatcher("notice/noticeBoardUpdate.jsp");
		dis.forward(request, response);
	}
}
