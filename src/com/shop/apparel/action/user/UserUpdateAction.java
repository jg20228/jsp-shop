package com.shop.apparel.action.user;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.apparel.action.Action;
import com.shop.apparel.dto.UpdateResponseDto;
import com.shop.apparel.model.Member;

public class UserUpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("principal");

		// 맴버에 들어있는 값 중에서 파싱해야 하는 것들
		// 생년월일, 연락처, 이메일
		System.out.println(member.getBirthdate());
		System.out.println(member.getPhone());
		System.out.println(member.getEmail());
		System.out.println(member.getAddress());
		System.out.println();

		Timestamp ts = Timestamp.valueOf(member.getBirthdate());

		System.out.println(ts);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		String birthyear = sdf.format(ts).split("-")[0];
		String birthmonth = sdf.format(ts).split("-")[1];
		String birthdate = sdf.format(ts).split("-")[2];
		
		System.out.println(birthyear);
		System.out.println(birthmonth);
		System.out.println(birthdate);
		
		/////////////////////////////////////////////////////////////
		String post = member.getAddress().split("/")[0];
		String haddress1 = member.getAddress().split("/")[1];		
		String haddress2 = member.getAddress().split("/")[2];
		///////////////////////////////////////////////////////////
		String hphone1 = member.getPhone().split("-")[0];
		String hphone2 = member.getPhone().split("-")[1];
		String hphone3 = member.getPhone().split("-")[2];
		/////////////////////////////////////////////////////////
		String email1 = member.getEmail().split("@")[0];
		String email2 = member.getEmail().split("@")[1];
		
		UpdateResponseDto dto = UpdateResponseDto.builder()
				.birthyear(birthyear)
				.birthmonth(birthmonth)
				.birthdate(birthdate)
				.post(post)
				.haddress1(haddress1)
				.haddress2(haddress2)
				.hphone1(hphone1)
				.hphone2(hphone2)
				.hphone3(hphone3)
				.email1(email1)
				.email2(email2)
				.build();
		
		request.setAttribute("dto", dto);
		
		RequestDispatcher dis = request.getRequestDispatcher("user/myPage.jsp");
		dis.forward(request, response);
	}

}
