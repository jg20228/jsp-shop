package com.shop.apparel.action.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.apparel.action.Action;
import com.shop.apparel.model.Notice;
import com.shop.apparel.repository.BoardRepositroy;

public class BoardNoticeAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		BoardRepositroy boardRepositroy = BoardRepositroy.getInstance();
		List<Notice> notices = boardRepositroy.selectAll();
		System.out.println("notice : "+notices);
		for (Notice notice : notices) {
			System.out.println(notice.getTitle());
		}
		request.setAttribute("notices", notices);
		
		RequestDispatcher dis = request.getRequestDispatcher("notice/noticeBoard.jsp");
		dis.forward(request, response);
	}

}
