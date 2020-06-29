package com.shop.apparel.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CartWishListResponseDto {
	private int wishId;
	private int memberId;
	private int productId;
	private String productName;
	private int productPrice;
	private String productThumbnail;
}
