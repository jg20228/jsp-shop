package com.shop.apparel.action.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.apparel.action.Action;
import com.shop.apparel.repository.BoardRepositroy;
import com.shop.apparel.util.Script;

public class BoardNoticeDeleteProc implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		
		BoardRepositroy boardRepositroy = BoardRepositroy.getInstance();
		int result = boardRepositroy.deleteById(id);
		
		Script.href("/shop/board?cmd=noticeBoard", response);
	}
}
