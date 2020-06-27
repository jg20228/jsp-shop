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
public class Reply {
	private int id;
	private int memberId;
	private String content;
	private int qnaId;
	private Timestamp sysdate;
}
