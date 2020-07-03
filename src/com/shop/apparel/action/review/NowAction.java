package com.shop.apparel.action.review;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.shop.apparel.action.Action;
import com.shop.apparel.dto.ReviewDto;
import com.shop.apparel.repository.ReviewRepository;
import com.shop.apparel.util.Script;

public class NowAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("NowAction");
		int productId = Integer.parseInt(request.getParameter("id"));
		ReviewRepository reviewRepository = ReviewRepository.getInstance();
		
		List<ReviewDto> reviewDtos = reviewRepository.findNow(productId);
		
		Gson gson = new Gson();
		String toJson = gson.toJson(reviewDtos);
		Script.outJson(toJson, response);
		
		
	}

}
