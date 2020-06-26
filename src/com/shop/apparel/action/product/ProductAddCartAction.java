package com.shop.apparel.action.product;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.apparel.action.Action;

public class ProductAddCartAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		System.out.println("id = "+id);
		String cart = request.getParameter("cart");
		System.out.println("cart : "+cart);
		if(cart==null||cart=="") {
			cart = id;
		}else {
			String[] temp = cart.split("=");
			cart = temp[1]+"-"+id;
		}
		System.out.println(cart);
		Cookie cookie = new Cookie("cart", cart);		
		response.addCookie(cookie);

	}
}
