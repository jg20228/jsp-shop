package com.shop.apparel.dto;

import java.sql.Timestamp;

import com.shop.apparel.model.QnA;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class QnADto {
	private QnA qna;
	private String username;
	private String name;
	private String content;
	private Timestamp replydate;
}
