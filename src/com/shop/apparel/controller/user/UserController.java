package com.shop.apparel.controller.user;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.apparel.action.Action;
import com.shop.apparel.action.user.UserJoinAction;
import com.shop.apparel.action.user.UserJoinProcAction;
import com.shop.apparel.action.user.UserLoginAction;
import com.shop.apparel.action.user.UserLoginProcAction;
import com.shop.apparel.action.user.UserLogoutAction;
import com.shop.apparel.action.user.UserUpdateAction;
import com.shop.apparel.action.user.UserUpdateProcAction;
import com.shop.apparel.action.user.UserUsernameCheckAction;


// http://localhost:8000/blog/user
@WebServlet("/user")
public class UserController extends HttpServlet {
	private final static String TAG = "UserController : ";
	private static final long serialVersionUID = 1L;
       
    public UserController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// http://localhost:8000/blog/user?cmd=join
		String cmd = request.getParameter("cmd");
		System.out.println(TAG+"router : "+cmd);
		Action action = router(cmd);
		action.execute(request, response);
	}
	
	public Action router(String cmd) {
		if(cmd.equals("join")) {
			// 회원가입 페이지로 이동
			return new UserJoinAction();
		}else if(cmd.equals("joinProc")) {
			// 회원가입을 진행 한 후 -> index.jsp로 이동
			return new UserJoinProcAction();
		}else if(cmd.equals("update")) {
			// 회원 수정 페이지로 이동 (세션에 User 오브젝트를 가지고 있을 예정)
			return new UserUpdateAction();
		}else if(cmd.equals("updateProc")) {
			// 회원 수정을 진행 한 후 -> index.jsp로 이동
			return new UserUpdateProcAction();
		}else if(cmd.equals("delete")) {
			// 회원 삭제를 진행 한 후 -> 로그아웃을 하고 -> index.jsp로 이동
		}else if(cmd.equals("login")) {
			// 회원 로그인 페이지로 이동
			return new UserLoginAction();
		}else if(cmd.equals("loginProc")) {
			// 회원 로그인을 수행한 후 -> 세션에 등록을 하고 -> index.jsp로 이동
			return new UserLoginProcAction();
		}else if(cmd.equals("logout")) {
			// 회원 로그인을 수행한 후 -> 세션에 등록을 하고 -> index.jsp로 이동
			return new UserLogoutAction();
		}else if(cmd.equals("usernameCheck")) {
			return new UserUsernameCheckAction();
		}
		return null;
	}
	

}