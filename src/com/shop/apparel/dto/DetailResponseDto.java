package com.shop.apparel.dto;
import java.util.List;

import com.shop.apparel.model.Product;
import com.shop.apparel.model.QnA;
import com.shop.apparel.model.Review;
import com.shop.apparel.model.WithItem;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class DetailResponseDto {
	private Product product;
	private List<WithItemDto> withItemDtos;
	private List<ReviewDto> reviewDtos;
	private List<QnADto> qnADtos;
	private StarDto starDto;
	
}
