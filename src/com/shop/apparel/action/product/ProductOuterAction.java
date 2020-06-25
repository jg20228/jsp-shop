package com.shop.apparel.action.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.apparel.action.Action;
import com.shop.apparel.model.Product;
import com.shop.apparel.repository.ProductRepositroy;

public class ProductOuterAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductRepositroy productRepositroy = ProductRepositroy.getInstance();
		List<Product> products  = productRepositroy.selectAll();
		
		request.setAttribute("products", products);
		for (Product product : products) {
			System.out.println(product.getId());
		}
		
		RequestDispatcher dis = request.getRequestDispatcher("product/outer.jsp");
		dis.forward(request, response);
	}

}
