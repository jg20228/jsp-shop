package com.shop.apparel.controller.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.apparel.action.Action;
import com.shop.apparel.action.admin.AdminIndexAction;
import com.shop.apparel.action.admin.AdminMemberListAction;
import com.shop.apparel.action.admin.AdminTableAction;
import com.shop.apparel.action.admin.ProductRegistrationAction;
import com.shop.apparel.action.product.ProductDetailAction;
import com.shop.apparel.action.product.ProductHomeAction;

@WebServlet("/admin")
public class AdminController extends HttpServlet {
	private final static String TAG = "AdminController : ";
	private static final long serialVersionUID = 1L;
    
    public AdminController() {
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
		if(cmd.equals("productRegistration")) {
			return new ProductRegistrationAction(); 
		}else if(cmd.equals("productRegistrationProc")) {
			//return new ProductRegistrationProcAction(); 
		}else if(cmd.equals("productUpdate")) {
			//return new ProductUpdateAction();
		}else if(cmd.equals("productUpdateProc")) {
			//return new ProductUpdateProcAction(); 
		}else if(cmd.equals("productDelete")) {
			//return new ProductDeleteAction(); 
		}else if(cmd.equals("productDeleteProc")) {
			//return new ProductDeleteProcAction(); 
		}else if(cmd.equals("search")) {
			//return new ProductSearchAction(); 
		}else if(cmd.equals("index")) {
			return new AdminIndexAction();
		}else if(cmd.equals("table")) {
			return new AdminTableAction();
		}else if(cmd.equals("memberList")) {
			return new AdminMemberListAction();
		}else if(cmd.equals("reviewList")) {
			//return new AdminReviewListAction();
		}else if(cmd.equals("replyList")) {
			//return new AdminReplyListAction();
		}else if(cmd.equals("qnAList")) {
			//return new AdminQnAListAction();
		}else if(cmd.equals("productList")) {
			//return new AdminProductListAction();
		}else if(cmd.equals("orderList")) {
			//return new AdminOrderListAction();
		}
		return null;
	}
}
