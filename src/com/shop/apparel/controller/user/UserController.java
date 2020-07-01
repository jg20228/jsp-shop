package com.shop.apparel.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.apparel.action.Action;
import com.shop.apparel.action.user.UserCartAction;
import com.shop.apparel.action.user.UserCartDeleteAction;
import com.shop.apparel.action.user.UserCartUpdateAction;
import com.shop.apparel.action.user.UserJoinAction;
import com.shop.apparel.action.user.UserJoinProcAction;
import com.shop.apparel.action.user.UserLoginAction;
import com.shop.apparel.action.user.UserLoginProcAction;
import com.shop.apparel.action.user.UserLogoutAction;
import com.shop.apparel.action.user.UserOrderAction;
import com.shop.apparel.action.user.UserOrderDetailAction;
import com.shop.apparel.action.user.UserPaymentAction;
import com.shop.apparel.action.user.UserPaymentProcAction;
import com.shop.apparel.action.user.UserUpdateAction;
import com.shop.apparel.action.user.UserUpdateProcAction;
import com.shop.apparel.action.user.UserUsernameCheckAction;
import com.shop.apparel.action.user.UserWishDeleteAction;



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
			// ȸ������ �������� �̵�
			return new UserJoinAction();
		}else if(cmd.equals("joinProc")) {
			// ȸ�������� ���� �� �� -> index.jsp�� �̵�
			return new UserJoinProcAction();
		}else if(cmd.equals("update")) {
			// ȸ�� ���� �������� �̵� (���ǿ� User ������Ʈ�� ������ ���� ����)
			return new UserUpdateAction();
		}else if(cmd.equals("updateProc")) {
			// ȸ�� ������ ���� �� �� -> index.jsp�� �̵�
			return new UserUpdateProcAction();
		}else if(cmd.equals("delete")) {
			// ȸ�� ������ ���� �� �� -> �α׾ƿ��� �ϰ� -> index.jsp�� �̵�
		}else if(cmd.equals("login")) {
			// ȸ�� �α��� �������� �̵�
			return new UserLoginAction();
		}else if(cmd.equals("loginProc")) {
			// ȸ�� �α����� ������ �� -> ���ǿ� ����� �ϰ� -> index.jsp�� �̵�
			return new UserLoginProcAction();
		}else if(cmd.equals("logout")) {
			// ȸ�� �α����� ������ �� -> ���ǿ� ����� �ϰ� -> index.jsp�� �̵�
			return new UserLogoutAction();
		}else if(cmd.equals("usernameCheck")) {
			return new UserUsernameCheckAction();
		}else if(cmd.equals("cart")) {
			return new UserCartAction();
		}else if(cmd.equals("order")) {
			return new UserOrderAction();
		}else if(cmd.equals("deleteCart")) {
			return new UserCartDeleteAction();
		}else if(cmd.equals("deleteWishList")) {
			return new UserWishDeleteAction();
		}else if(cmd.equals("updateCart")) {
			return new UserCartUpdateAction();
		}else if(cmd.equals("orderDetail")) {
			return new UserOrderDetailAction();
		}else if(cmd.equals("payment")) {
			return new UserPaymentAction();
		}else if(cmd.equals("paymentProc")) {
			return new UserPaymentProcAction();
		}
		return null;
	}
}