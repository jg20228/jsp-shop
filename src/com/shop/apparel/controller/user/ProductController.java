package com.shop.apparel.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.apparel.action.Action;
import com.shop.apparel.action.product.ProductAddCartAction;
import com.shop.apparel.action.product.ProductDetailAction;
import com.shop.apparel.action.product.ProductHomeAction;
import com.shop.apparel.action.product.ProductOuterAction;
import com.shop.apparel.action.product.ProductTopAction;
import com.shop.apparel.action.user.UserJoinAction;
import com.shop.apparel.action.user.UserJoinProcAction;
import com.shop.apparel.action.user.UserLoginAction;
import com.shop.apparel.action.user.UserLoginProcAction;
import com.shop.apparel.action.user.UserLogoutAction;
import com.shop.apparel.action.user.UserUpdateAction;
import com.shop.apparel.action.user.UserUpdateProcAction;
import com.shop.apparel.action.user.UserUsernameCheckAction;



// http://localhost:8000/blog/user
@WebServlet("/product")
public class ProductController extends HttpServlet {
	private final static String TAG = "ProductController : ";
	private static final long serialVersionUID = 1L;
       
    public ProductController() {
        super();
    }

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// http://localhost:8000/blog/post?cmd=detail
		String cmd = request.getParameter("cmd");
		System.out.println(TAG+"router : "+cmd);
		Action action = router(cmd);
		action.execute(request, response);
	}
	
	public Action router(String cmd) {
		if(cmd.equals("home")) {



			return new ProductHomeAction(); //Board�� ���
		} else if(cmd.equals("detail")) {
			return new ProductDetailAction(); //�󼼺���
		}else if(cmd.equals("outer")) {
			return new ProductOuterAction(); //�󼼺���
		}else if(cmd.equals("top")) {
			return new ProductTopAction(); //�󼼺���
		}else if(cmd.equals("search")) {
		//	return new ProductSearchAction(); // ����
		}else if(cmd.equals("addCart")) {
			return new ProductAddCartAction();
		}
		return null;
	}
	
}