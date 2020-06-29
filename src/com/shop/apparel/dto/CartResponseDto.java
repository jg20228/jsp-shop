package com.shop.apparel.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder

public class CartResponseDto {
	private int	productId;
	private String productName;
	private String productType;
	private int cartId;
	private int cartQuantity;
	private int productPrice;
	private String productThumbnail;
	private int memberId;
	private String memberUsername;
}
