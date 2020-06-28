package com.shop.apparel.controller.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.apparel.action.Action;
import com.shop.apparel.action.admin.ProductRegistrationAction;
import com.shop.apparel.action.board.BoardNoticeAction;
import com.shop.apparel.action.board.BoardNoticeDetailAction;
import com.shop.apparel.action.board.BoardNoticeMemberAction;
import com.shop.apparel.action.board.BoardNoticeOverseasAction;
import com.shop.apparel.action.board.BoardNoticeSizeAction;
import com.shop.apparel.action.board.BoardNoticeWriteAction;
import com.shop.apparel.action.board.BoardNoticeWriteProcAction;
import com.shop.apparel.action.product.ProductDetailAction;
import com.shop.apparel.action.product.ProductHomeAction;


@WebServlet("/board")
public class BoardController extends HttpServlet {
	private final static String TAG = "BoardController : ";
	private static final long serialVersionUID = 1L;
    
    public BoardController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// http://localhost:8000/blog/admin?cmd=productRegistration
				String cmd = request.getParameter("cmd");
				System.out.println(TAG+"router : "+cmd);
				Action action = router(cmd);
				action.execute(request, response);
	}
	
	public Action router(String cmd) {
		if(cmd.equals("noticeBoard")) {
			return new BoardNoticeAction(); 
		} else if(cmd.equals("noticeMember")) {
			return new BoardNoticeMemberAction(); 
		}else if(cmd.equals("noticeOverseas")) {
			return new BoardNoticeOverseasAction(); 
		}else if(cmd.equals("noticeSize")) {
			return new BoardNoticeSizeAction(); 
		}else if(cmd.equals("noticeDetail")) {
			return new BoardNoticeDetailAction(); 
		}else if(cmd.equals("noticeWrite")) {
			return new BoardNoticeWriteAction(); 
		}else if(cmd.equals("noticeWriteProc")) {
			return new BoardNoticeWriteProcAction(); 
		}
		return null;
	}
}
