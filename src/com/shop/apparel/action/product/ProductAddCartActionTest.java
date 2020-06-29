package com.shop.apparel.action.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.apparel.action.Action;
import com.shop.apparel.model.Cart;
import com.shop.apparel.repository.ProductRepositroy;
import com.shop.apparel.repository.UserRepositroy;

public class ProductAddCartActionTest implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productId = Integer.parseInt(request.getParameter("productId"));
		int memberId = Integer.parseInt(request.getParameter("memberId"));
		
		ProductRepositroy productRepositroy = ProductRepositroy.getInstance();
		UserRepositroy userRepositroy = UserRepositroy.getInstance();
		List<Cart> carts = productRepositroy.selectAllCartById(memberId);
		
		// cart내에 중복된 물품이 있으면 안담고 그냥 수량이 증가
		for (Cart cart : carts) {
			if(cart.getProductId() == productId) {
				cart.setQuantity(cart.getQuantity()+1);
				userRepositroy.updateCart(cart.getQuantity(), memberId, productId);
				return;
			}
		}
		System.out.println("실행");
		int result = userRepositroy.saveCartId(memberId, productId);
	}
}
