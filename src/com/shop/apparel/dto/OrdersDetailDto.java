package com.shop.apparel.dto;

import com.shop.apparel.model.Orders_detail;
import com.shop.apparel.model.Product;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class OrdersDetailDto {
	private Product product;
	private Orders_detail orders_detail;
}
