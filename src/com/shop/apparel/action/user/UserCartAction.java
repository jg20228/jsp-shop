package com.shop.apparel.action.user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.apparel.action.Action;
import com.shop.apparel.model.Product;
import com.shop.apparel.repository.ProductRepositroy;

public class UserCartAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//추가적인 로직 
		//테이블이 완전해진다면 수량을 여기서 해야할 가능성이 높다.
		
		
		//모든 쿠키를 가져온다.
		Cookie[] cookies = request.getCookies();
		
		//쿠키중에서 cart이름을 가진 쿠키값을 찾아서 값을 가져옴
		String carts = "";
		if(cookies !=null) {
			for (Cookie cookie : cookies) {
				if(cookie.getName().equals("cart")) {
					carts = cookie.getValue();
				}
			}
		}
		//만약 값을 가져왔는데도 ""이나 null이면 페이지로 이동하고 끝남
		if(carts==""||carts==null) {
			RequestDispatcher dis = request.getRequestDispatcher("user/cart.jsp");
			dis.forward(request, response);
			return;
		}
		
		//값이 있다면 split으로 파싱을함 ex) 1-2-3-4 ->배열의 1 2 3 4
		String[] cartSplit = carts.split("-");
		
		//장바구니에 뿌려줄 컬렉션 생성
		List<Product> products = new ArrayList<Product>();
		
		//DB 준비
		ProductRepositroy productRepositroy = ProductRepositroy.getInstance();
		
		//중복이 되면 추가할때 체크하기 위함
		boolean check = false;
		for (int i = 0; i < cartSplit.length; i++) {
			
			for (int j = 0; j < products.size(); j++) {
				//중복이 되면 check를 true로 돌림
				if(products.get(j).getId()==Integer.parseInt(cartSplit[i])) {
					System.out.println(products.get(j).getName()+"J 장바구니에 중복 확인 I "+cartSplit[i]);
					check = true;
				}
			}
			if(check) {
				
			}else {
				//중복이 없다면 컬렉션에 담는다.
				Product product = productRepositroy.selectById(Integer.parseInt(cartSplit[i]));
				products.add(product);
				check=false;
			}
		}
		request.setAttribute("carts", products);
		
		RequestDispatcher dis = request.getRequestDispatcher("user/cart.jsp");
		dis.forward(request, response);
	}

}
