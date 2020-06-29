package com.shop.apparel.action.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.apparel.action.Action;
import com.shop.apparel.dto.CartResponseDto;
import com.shop.apparel.dto.CartResponseDtos;
import com.shop.apparel.dto.CartWishListResponseDto;
import com.shop.apparel.model.Cart;
import com.shop.apparel.model.WishList;
import com.shop.apparel.repository.ProductRepositroy;
import com.shop.apparel.repository.UserRepositroy;
import com.shop.apparel.util.Script;

public class ProductAddWishListAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productId = Integer.parseInt(request.getParameter("productId"));
		int memberId = Integer.parseInt(request.getParameter("memberId"));
		
		System.out.println(productId);
		System.out.println(memberId);
		
		UserRepositroy userRepositroy = UserRepositroy.getInstance();
		
		List<WishList> wishLists = userRepositroy.findAllWishList(memberId);
		boolean check = true;
		for (WishList wishList : wishLists) {
			if(wishList.getProductId()==productId) {
				check = false;
			}
		}
		
		if(check) {
			int result = userRepositroy.saveWishList(memberId, productId);
			Script.outText(result+"", response);
		}
	}
}
