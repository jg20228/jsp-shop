package com.shop.apparel.action.user;

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
import com.shop.apparel.model.WishList;
import com.shop.apparel.repository.UserRepositroy;

public class UserCartAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//with Item 예정
		int memberId = Integer.parseInt(request.getParameter("id"));
		UserRepositroy userRepositroy = UserRepositroy.getInstance();
		
		List<CartResponseDtos> dtos = userRepositroy.findCartById(memberId);
		List<CartWishListResponseDto> cartWishListResponseDto = userRepositroy.cartWishDto(memberId);
		
		CartResponseDto dto = CartResponseDto.builder()
				.cartResponseDtos(dtos)
				.cartWishListResponseDto(cartWishListResponseDto)
				.build();
		
		request.setAttribute("dto", dto);
		RequestDispatcher dis = request.getRequestDispatcher("user/cart.jsp");
		dis.forward(request, response);
	}

}
