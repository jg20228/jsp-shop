package com.shop.apparel.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Member {
	private int id;
	private String name;
	private String username;
	private String password;
	private String birthdate;
	private String gender;
	private String address;
	private String phone;
	private String email;
	private RoleType userRole;
	private String agreement;
}
