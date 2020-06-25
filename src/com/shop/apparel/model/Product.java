package com.shop.apparel.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Product {
	private int id;
	private String name;
	private int price;
	private String imgSrc;
	private int categoryId;
}
