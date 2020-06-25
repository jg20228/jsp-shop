package com.shop.apparel.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Orders {
	private int id;
	private int memberId;
	private Timestamp orderDate;
	private int totalPrice;
	
	//배달비??
	//private int deliveryPrice;
}
