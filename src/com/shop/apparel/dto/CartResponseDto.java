package com.shop.apparel.dto;

import java.util.List;

import com.shop.apparel.model.WishList;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CartResponseDto {
	List<CartWishListResponseDto> cartWishListResponseDto;
	List<CartResponseDtos> cartResponseDtos;
}
