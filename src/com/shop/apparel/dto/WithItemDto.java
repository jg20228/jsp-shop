package com.shop.apparel.dto;

import com.shop.apparel.model.Product;
import com.shop.apparel.model.WithItem;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class WithItemDto{
	private Product product;
	private WithItem withItem;
}
