package com.shop.apparel.test;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class DateTest {
	public static void main(String[] args) {
		
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		
		System.out.println(ts);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		System.out.println(sdf.format(ts).split("-")[0]);
		System.out.println(sdf.format(ts).split("-")[1]);
		System.out.println(sdf.format(ts).split("-")[2]);

		
	}
}
