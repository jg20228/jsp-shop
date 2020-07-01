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
public class QnADto {
	private String title;
	private String content;
	private Timestamp qnaDate;
	private int memberId;
}