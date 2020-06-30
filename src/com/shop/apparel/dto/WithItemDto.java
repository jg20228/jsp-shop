package com.shop.apparel.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class WithItemDto {
	private String name;         //productId - product - name
	private String titleComment; //productId - product - titleComment
	private int price;           //productId - product - price
	private String thumbnailH;   //productId - product - thumbnailH
	private int productId; //이거는 이 상품 눌러서 해당 디테일 페이지를 위한 것. 
}
