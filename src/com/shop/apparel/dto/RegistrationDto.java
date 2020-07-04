package com.shop.apparel.dto;

import java.util.List;

import com.shop.apparel.model.Category;
import com.shop.apparel.model.Product;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RegistrationDto {
	private List<Category> categories;
	private List<Product> products;
}
