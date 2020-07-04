package com.shop.apparel.action.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.soap.Detail;

import com.shop.apparel.action.Action;
import com.shop.apparel.dto.DetailResponseDto;
import com.shop.apparel.dto.ProductDto;
import com.shop.apparel.dto.QnADto;
import com.shop.apparel.dto.ReviewDto;
import com.shop.apparel.dto.StarDto;
import com.shop.apparel.dto.WithItemDto;
import com.shop.apparel.model.Product;
import com.shop.apparel.model.WithItem;
import com.shop.apparel.repository.ProductRepositroy;
import com.shop.apparel.repository.ProductDetailRepository;

public class ProductDetailAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//여기서 detail은 model을 어떻게 만드느냐에 따라서 db에 접근하는게 달라질것이다.
		//join을 사용해서 최대한 적게 db에 접근하고 재활용성을 높인 뒤 dto에 담은 후
		//하나의 객체를 requset에 실어 보낸뒤 해당 객체에 담긴 값들을 이용 해야한다!
		
		//현재는 테스트를 위해서 id값으로 검색한 product 하나만 보내고 있다.
		int productId = Integer.parseInt(request.getParameter("id"));
		ProductRepositroy productRepositroy = ProductRepositroy.getInstance();
		ProductDetailRepository productDetailRepository = ProductDetailRepository.getInstance();
		
		StarDto starDto = productDetailRepository.findByIdStar(productId);
		
		Product product = productRepositroy.selectById(productId);
		List<WithItemDto> withItemDtos = productDetailRepository.selectByIdForWithItem(productId);
		List<ReviewDto> reviewDtos = productDetailRepository.selectByIdForReview(productId);
		List<QnADto> qnADtos = productDetailRepository.selectByIdForQnA(productId);
		
		DetailResponseDto detailResponseDtos = DetailResponseDto.builder()
				.product(product)
				.withItemDtos(withItemDtos)
				.reviewDtos(reviewDtos)
				.starDto(starDto)
				.qnADtos(qnADtos)
				.build();
		
		for (ReviewDto reviewDto : reviewDtos) {
			System.out.println(reviewDto.getReview().getMemberId());
			System.out.println(reviewDto.getReview().getReviewDate());
		}
		
		request.setAttribute("dtos", detailResponseDtos);

		RequestDispatcher dis = request.getRequestDispatcher("detail/detail.jsp");
		dis.forward(request, response);
	}
}
