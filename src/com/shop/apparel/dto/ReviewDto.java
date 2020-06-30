package com.shop.apparel.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class ReviewDto {
	private String content;
	private Timestamp reviewDate;
	private String photo;
	private String username; //member테이블이랑 조인
}
