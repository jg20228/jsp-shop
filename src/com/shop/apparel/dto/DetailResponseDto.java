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
	Product product;
	List<WithItem> withItems;
	List<Review> reviews;
	List<QnA> qnAs;
}
