package com.shop.apparel.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Product_detail {
	private int id;
	private int productId;
	private int reviewId;
	private int qnaId;
	private int discriptionId;
}
