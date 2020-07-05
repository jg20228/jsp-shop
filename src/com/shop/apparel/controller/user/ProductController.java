package com.shop.apparel.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.apparel.action.Action;
import com.shop.apparel.action.product.ProductAddCartAction;
import com.shop.apparel.action.product.ProductAddWishListAction;
import com.shop.apparel.action.product.ProductDetailAction;
import com.shop.apparel.action.product.ProductHomeAction;
import com.shop.apparel.action.product.ProductProductListAction;
import com.shop.apparel.action.product.ProductSearchAction;



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



			return new ProductHomeAction();
		} else if(cmd.equals("detail")) {
			return new ProductDetailAction();
		}else if(cmd.equals("search")) {
			return new ProductSearchAction();
		}else if(cmd.equals("addCart")) {
			return new ProductAddCartAction();
		}else if(cmd.equals("addWishList")) {
			return new ProductAddWishListAction();
		}else if(cmd.equals("searchProc")) {
			return new ProductSearchAction();
		}else if(cmd.equals("productList")) {
			return new ProductProductListAction();
		}
		return null;
	}
	
}