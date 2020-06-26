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
public class Notice {
	private int id;
	private int memberId;
	private String title;
	private String content;
	private Timestamp createDate;
	private int readCount;
}
