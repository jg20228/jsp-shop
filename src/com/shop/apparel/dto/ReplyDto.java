package com.shop.apparel.dto;

import com.shop.apparel.model.Reply;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class ReplyDto {
	private Reply reply;
	private String username;
	private int productId;
}
