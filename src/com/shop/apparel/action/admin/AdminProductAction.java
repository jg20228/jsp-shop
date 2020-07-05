package com.shop.apparel.action.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.apparel.action.Action;
import com.shop.apparel.model.Member;
import com.shop.apparel.model.Product;
import com.shop.apparel.repository.AdminRepositroy;
import com.shop.apparel.util.Script;

public class AdminProductAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("principal") == null) {
			Script.href("index.jsp", response);
			return;
		}
		Member member = (Member) session.getAttribute("principal");
		if(!member.getUserRole().toString().equals("ADMIN")) {
			Script.href("index.jsp", response);
			return;
		}
		
		//이부분~
		AdminRepositroy adminRepositroy = AdminRepositroy.getInstance();
		List<Product> products = adminRepositroy.adminAllProduct();
		for (Product product : products) {
			//20자 초과시 글자 자름
			if(product.getTitleComment().length()>20) {
				product.setTitleComment(product.getTitleComment().substring(0, 20)+"...");
			}
			if(product.getContents().length()>20) {
				product.setContents(product.getContents().substring(0, 20)+"...");
			}
		}
		request.setAttribute("products", products);
		//
		
		RequestDispatcher dis = request.getRequestDispatcher("startbootstrap/product.jsp");
		dis.forward(request, response);
	}
}
