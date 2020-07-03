package com.shop.apparel.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class StarDto {
	private int totalCount;
	private int sum;
	private int one;
	private int two;
	private int three;
	private int four;
	private int five;
}
