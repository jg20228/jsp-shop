<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp"%>
<%@ include file="/include/preloader.jsp"%>
<%@ include file="/include/header.jsp"%>
<%@ include file="/include/nav.jsp"%>

<!-- user에만 쓰이는 css -->
<link rel="stylesheet" href="/shop/css/user/user.css">


<div class="content__box">
	<form name="form1" method="post" id="join_form" action="/shop/user?cmd=updateProc" autocomplete="off">
		<h2 class="tit-page">MY PAGE</h2>
		<!-- 일반회원 기본 노출 -->
		<div id="personInfo">
			<table class="person-tb">
				<colgroup>
					<col width="135">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th class="none">
							<div class="tb-l pl-30">
								<span class="red"><img src="/shop/image/user/join/join_img1.gif"></span> 이름
							</div>
						</th>
						<td class="none">
							<div class="tb-l pl-6">
								<input type="text" name="name" id="name" value="${sessionScope.principal.name}" class="MS_input_txt w137" size="15" maxlength="30" disabled="disabled">
							</div>
						</td>
					</tr>
					<tr>
						<th>
							<div class="tb-l pl-30">
								<span class="red"><img src="/shop/image/user/join/join_img1.gif"></span> 아이디
							</div>
						</th>
						<td>
							<div class="tb-l pl-6">
								<input type="text" name="username" id="username" value="${sessionScope.principal.username}" class="MS_input_txt w137" size="10" maxlength="12" disabled="disabled""> <span> <a
									style="font-size: 0;" href="javascript:check('id');"> <img src="/shop/image/user/join/idcheck.gif" alt="ID중복확인">
								</a>
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<th>
							<div class="tb-l pl-30">
								<span class="red"><img src="/shop/image/user/join/join_img1.gif"></span> 비밀번호
							</div>
						</th>
						<td>
							<div class="tb-l pl-6">
								<input type="password" name="password1" id="password1" class="MS_input_txt w137" value="" size="15" maxlength="20" onkeyup="check_pwd_length(this, 'password');"> <span
									class="idpw-info"> * 영문 대소문자/숫자/특수문자를 혼용하여 2종류 10~16자 또는 3종류 8~16자 </span>
							</div>
						</td>
					</tr>
					<tr>
						<th>
							<div class="tb-l pl-30">
								<span class="red"><img src="/shop/image/user/join/join_img1.gif"></span> 비밀번호 확인
							</div>
						</th>
						<td>
							<div class="tb-l pl-6">
								<input type="password" name="password2" id="password2" class="MS_input_txt w137" value="" size="15" maxlength="20" onkeyup="check_pwd_length(this, 'repassword');">
							</div>
						</td>
					</tr>
					<tr>
						<th>
							<div class="tb-l pl-30">
								<span class="red"><img src="/shop/image/user/join/join_img1.gif"></span> 생일/성별
							</div>
						</th>
						<td>
							<div class="tb-l pl-6">
								<input type="text" name="birthyear" value="${dto.birthyear}" size="10" maxlength="4">년 <input type="text" name="birthmonth" value="${dto.birthmonth}" size="10" maxlength="4">월
								<input type="text" name="birthdate" value="${dto.birthdate}" size="10" maxlength="4">일

								<c:choose>
									<c:when test="${sessionScope.principal.gender eq '1'}">
										<input type="radio" name="gender" value="1" class="MS_radio" checked> 남
										<input type="radio" name="gender" value="2" class="MS_radio">여
									</c:when>
									<c:otherwise>
										<input type="radio" name="gender" value="1" class="MS_radio"> 남
										<input type="radio" name="gender" value="2" class="MS_radio" checked>여	
									</c:otherwise>
								</c:choose>
							</div>
						</td>
					</tr>

					<tr>
						<th>
							<div class="tb-l pl-30">
								<span class="red"><img src="/shop/image/user/join/join_img1.gif"></span> 우편번호
							</div>
						</th>
						<td>
							<div class="tb-l pl-6">
								<input type="text" name="post" form="join_form" id="post" class="MS_input_txt" value="${dto.post}" size="3" maxlength="3" onfocus="this.blur();"> <span><a style="font-size: 0;"
									href="javascript:post(1);" onClick="goPopup();" value="팝업_domainChk"> <img src="/shop/image/user/join/zipcode.gif" alt="우편번호검색">
								</a></span>
							</div>
						</td>
					</tr>
					<tr>
						<th>
							<div class="tb-l pl-30">
								<span class="red"><img src="/shop/image/user/join/join_img1.gif"></span> 집주소
							</div>
						</th>
						<td>
							<div class="tb-l pl-6">
								<input type="text" name="haddress1" form="join_form" id="haddress1" class="MS_input_txt w415" value="${dto.haddress1}" size="40" maxlength="100" readonly="readonly">
							</div>
						</td>
					</tr>
					<tr>
						<th>
							<div class="tb-l pl-30">
								<span class="red"> <img src="/shop/image/user/join/join_img1.gif"></span> 상세주소
							</div>
						</th>
						<td>
							<div class="tb-l pl-6">
								<input type="text" name="haddress2" form="join_form" id="haddress2" class="MS_input_txt w415" value="${dto.haddress2}" size="40" maxlength="100">
							</div>
						</td>
					</tr>
					<tr>
						<th>
							<div class="tb-l pl-30">
								<span class="red"><img src="/shop/image/user/join/join_img1.gif"></span> 연락처
							</div>
						</th>
						<td>
							<div class="tb-l pl-6">
								<input type="text" name="hphone1" id="hphone1" value="${dto.hphone1}" size="10" maxlength="4"> <input type="text" name="hphone2" id="hphone2" value="${dto.hphone2}" size="10"
									maxlength="4"> - <input type="text" name="hphone3" id="hphone3" value="${dto.hphone3}" size="10" maxlength="4">
							</div>
						</td>
					</tr>
					<tr>
						<th>
							<div class="tb-l pl-30">
								<span class="red"><img src="/shop/image/user/join/join_img1.gif"></span> 이메일
							</div>
						</th>
						<td>
							<div class="tb-l pl-6">
								<input type="text" name="email1" id="email1" onchange="this.form.emailcheck.value=''" class="MS_input_txt" size="10" maxlength="20" value="${dto.email1}"> <span>@</span> <span
									id="direct_email" style="margin-top: 3px; display: inline-block"> <input type="text" name="email2" id="email2" class="MS_input_txt" value="${dto.email2}" size="15" maxlength="25"
									onchange="this.form.emailcheck.value=''">
								</span> <span><a style="font-size: 0;" href="javascript:emailcheck('Y', 'N');"> <img src="/shop/image/user/join/idcheck.gif" alt="ID중복확인">
								</a></span>
							</div>
						</td>
					</tr>
					<tr>
						<th>
							<div class="tb-l pl-30">SMS 수신여부</div>
						</th>
						<td>
							<div class="tb-l pl-6">
								SMS 문자메세지로 이벤트 및 유용한 쇼핑몰 정보를 받으시겠습니까?<br> <label style="margin-right: 20px;"> <input type="radio" name="smsreceive" form="join_form" value="Y" checked> 받습니다.
								</label> <label> <input type="radio" name="smsreceive" form="join_form" value="N"> 받지 않습니다.
								</label>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- #personInfo -->

		<div class="btn-area">
			<button type="submit">
				<img src="/shop/image/user/join/btn_join_ok.gif" alt="회원 수정 완료">
			</button>
			<a href="/shop/home.jsp"> <img src="/shop/image/user/join/btn_join_cancel.gif" alt="돌아가기">
			</a>
		</div>
	</form>

	<script language="javascript">
		// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
		//document.domain = "abc.go.kr";

		function goPopup() {
			// 주소검색을 수행할 팝업 페이지를 호출합니다.
			// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
			var pop = window.open("/shop/user/jusoPopup.jsp", "pop",
					"width=570,height=420, scrollbars=yes, resizable=yes");
		}
		function jusoCallBack(haddress1, post) {
			// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
			var tfhAddress1 = document.querySelector("#haddress1");
			tfhAddress1.value = haddress1;
			var tfPost = document.querySelector("#post");
			tfPost.value = post;
		}
	</script>

	<%@ include file="/include/serviceArea.jsp"%>
</div>
<%@ include file="/include/aside.jsp"%>
<%@ include file="/include/footer.jsp"%>