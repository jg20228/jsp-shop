package com.shop.apparel.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.NoArgsConstructor;

import lombok.Data;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Product_review {
	private int id;
	private String title;
	private String content;
	private Timestamp reviewDate;
	private String photo;
	private int memberId;
}
