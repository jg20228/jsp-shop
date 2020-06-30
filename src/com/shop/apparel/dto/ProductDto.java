package com.shop.apparel.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class ProductDto {
	private int id;
	private String name;
	private String titleComment;
	private int price;
	private String thumbnailW;
	private String contents;
}
