package com.shop.apparel.dto;

import com.shop.apparel.model.Orders;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class OrdersProductDto {
	private Orders orders;
	private String productName;
	private String productThumbnailh;
}
