package com.shop.apparel.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Review {
	private int id;
	private String content;
	private Timestamp reviewDate;
	private String photo;
	private int memberId;
	private int productId;
}
