package com.shop.apparel.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UpdateResponseDto {
 private String birthyear;
 private String birthmonth;
 private String birthdate;
 
 private String post;
 private String haddress1;		
 private String haddress2;
 
 private String hphone1;
 private String hphone2;
 private String hphone3;
 
 private String email1;
 private String email2;
 

}
