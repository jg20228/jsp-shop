package com.shop.apparel.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import oracle.sql.TIMESTAMP;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Product_qna {
	private int id;
	private String category;
	private String replyState;
	private String title;
	private String content;
	private TIMESTAMP qnaDate;
	private int memberId;
}
