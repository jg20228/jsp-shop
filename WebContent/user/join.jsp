<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp"%>
<%@ include file="/include/preloader.jsp"%>
<%@ include file="/include/header.jsp"%>
<%@ include file="/include/nav.jsp"%>

<!-- user에만 쓰이는 css -->
<link rel="stylesheet" href="/shop/css/user/user.css">


<div class="content__box">	
<form name="form1" method="post" id="join_form" action="/shop/idinfo.html" enctype="multipart/form-data" autocomplete="off">
<h2 class="tit-page">JOIN</h2>	
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
							<span class="red"><img
								src="/shop/image/user/join/join_img1.gif"></span> 이름
						</div>
					</th>
					<td class="none">
						<div class="tb-l pl-6">
							<input type="text" name="hname" id="hname" value=""
								class="MS_input_txt w137" size="15" maxlength="30">
						</div>
					</td>
				</tr>
				<tr>
					<th>
						<div class="tb-l pl-30">
							<span class="red"><img
								src="/shop/image/user/join/join_img1.gif"></span> 아이디
						</div>
					</th>
					<td>
						<div class="tb-l pl-6">
							<input type="text" name="id" id="id" value="" class="MS_input_txt w137" size="10" maxlength="12"> 
								<span>
									<a style="font-size: 0;" href="javascript:check('id');">
										<img src="/shop/image/user/join/idcheck.gif" alt="ID중복확인">
									</a>
								</span>
						</div>
					</td>
				</tr>
				<tr>
					<th>
						<div class="tb-l pl-30">
							<span class="red"><img
								src="/shop/image/user/join/join_img1.gif"></span> 비밀번호
						</div>
					</th>
					<td>
						<div class="tb-l pl-6">
							<input type="password" name="password1" id="password1"
								class="MS_input_txt w137" value="" size="15" maxlength="20"
								onkeyup="check_pwd_length(this, 'password');"> 
								
								<span class="idpw-info"> * 영문 대소문자/숫자/특수문자를 혼용하여 2종류 10~16자 또는
								3종류 8~16자 
								</span>
						</div>
					</td>
				</tr>
				<tr>
					<th>
						<div class="tb-l pl-30">
							<span class="red"><img
								src="/shop/image/user/join/join_img1.gif"></span> 비밀번호 확인
						</div>
					</th>
					<td>
						<div class="tb-l pl-6">
							<input type="password" name="password2" id="password2"
								class="MS_input_txt w137" value="" size="15" maxlength="20"
								onkeyup="check_pwd_length(this, 'repassword');">
						</div>
					</td>
				</tr>
				<tr>
					<th>
						<div class="tb-l pl-30">
							<span class="red"><img
								src="/shop/image/user/join/join_img1.gif"></span> 생일/성별
						</div>
					</th>
					<td>
						<div class="tb-l pl-6">
							<input type="text" name="birthyear" value="" size="10" maxlength="4">년 
							<input type="text" name="birthmonth" value="" size="10" maxlength="4">월
							<input type="text" name="birthdate" value="" size="10" maxlength="4">일
							<input type="radio" name="sex" value="1"
								class="MS_radio">남 <input type="radio" name="sex"
								value="2" class="MS_radio" checked="">여
						</div>
					</td>
				</tr>

				<tr>
					<th>
						<div class="tb-l pl-30">
							<span class="red"><img
								src="/shop/image/user/join/join_img1.gif"></span> 우편번호
						</div>
					</th>
					<td>
						<div class="tb-l pl-6">
							<input type="text" name="hpost1" form="join_form" id="hpost1"
								class="MS_input_txt" value="" size="3" maxlength="3"
								onfocus="this.blur();"> - <input type="text"
								name="hpost2" form="join_form" id="hpost2" class="MS_input_txt"
								value="" size="3" maxlength="3" onfocus="this.blur();">
							<span><a style="font-size: 0;" href="javascript:post(1);"><img
									src="/shop/image/user/join/zipcode.gif" alt="우편번호검색"></a></span>
						</div>
					</td>
				</tr>
				<tr>
					<th>
						<div class="tb-l pl-30">
							<span class="red"><img
								src="/shop/image/user/join/join_img1.gif"></span> 집주소
						</div>
					</th>
					<td>
						<div class="tb-l pl-6">
							<input type="text" name="haddress1" form="join_form"
								id="haddress1" class="MS_input_txt w415" value="" size="40"
								maxlength="100" readonly="readonly">
						</div>
					</td>
				</tr>
				<tr>
					<th>
						<div class="tb-l pl-30">
							<span class="red"><img
								src="/shop/image/user/join/join_img1.gif"></span> 상세주소
						</div>
					</th>
					<td>
						<div class="tb-l pl-6">
							<input type="text" name="haddress2" form="join_form"
								id="haddress2" class="MS_input_txt w415" value="" size="40"
								maxlength="100">
						</div>
					</td>
				</tr>
				<tr>
					<th>
						<div class="tb-l pl-30">
							<span class="red"><img
								src="/shop/image/user/join/join_img1.gif"></span> 연락처
						</div>
					</th>
					<td>
						<div class="tb-l pl-6">
							<input type="text" name="hphone1" id="hphone1" value="010" size="10" maxlength="4">
							<input type="text" name="hphone2" id="hphone2" value="" size="10" maxlength="4"> -
							<input type="text" name="hphone3" id="hphone3" value="" size="10" maxlength="4">
						</div>
					</td>
				</tr>
				<tr>
					<th>
						<div class="tb-l pl-30">
							<span class="red"><img
								src="/shop/image/user/join/join_img1.gif"></span> 이메일
						</div>
					</th>
					<td>
						<div class="tb-l pl-6">
							<input
								type="text" name="email1" id="email1"
								onchange="this.form.emailcheck.value=''" class="MS_input_txt"
								size="10" maxlength="20" value=""> <span>@</span> <span
								id="direct_email" style="margin-top: 3px; display: inline-block">
								<input type="text" name="email2" id="email2"
								class="MS_input_txt" value="" size="15" maxlength="25"
								onchange="this.form.emailcheck.value=''">
							</span> 
								<span><a style="font-size: 0;" href="javascript:emailcheck('Y', 'N');">
								<img src="/shop/image/user/join/idcheck.gif" alt="ID중복확인"></a></span>
						</div>
					</td>
				</tr>
				<tr>
					<th>
						<div class="tb-l pl-30">&nbsp;&nbsp;휴대폰</div>
					</th>
					<td>
						<div class="tb-l pl-6">
							<input type="text" name="etcphone1" form="join_form"
								id="etcphone1" class="MS_input_tel" value="" size="4"
								maxlength="4"> - 
							<input type="text" name="etcphone2" form="join_form"
								id="etcphone2" class="MS_input_tel" value="" size="4"
								maxlength="4"> - 
							<input type="text" name="etcphone3"
								form="join_form" id="etcphone3" class="MS_input_tel" value=""
								size="4" maxlength="4" minlength="4">
						</div>
					</td>
				</tr>
				<tr>
					<th><div class="tb-l pl-30">&nbsp;&nbsp;회사전화</div></th>
					<td>
						<div class="tb-left pl-6">
							<input type="text" name="ophone1" id="ophone1"
								class="MS_input_tel" value="" size="4" maxlength="4"> -
							<input type="text" name="ophone2" id="ophone2"
								class="MS_input_tel" value="" size="4" maxlength="4"> -
							<input type="text" name="ophone3" id="ophone3"
								class="MS_input_tel" value="" size="4" maxlength="4">
						</div>
					</td>
				</tr>
				<tr>
					<th><div class="tb-l pl-30">&nbsp;&nbsp;회사주소</div></th>
					<td>
						<div class="tb-left pl-6">
							<ul style="padding: 5px 0;">
								<li style="margin-bottom: 5px;"><input type="text"
									name="opost1" id="opost1" class="MS_input_txt" value=""
									size="3" maxlength="3" onfocus="this.blur();"> - <input
									type="text" name="opost2" id="opost2" class="MS_input_txt"
									value="" size="3" maxlength="3" onfocus="this.blur();">
									<a href="javascript:post(2);"><img
										src="/shop/image/user/join/zipcode.gif" alt="우편번호검색"></a></li>
								<li><input type="text" name="oaddress" id="oaddress"
									class="MS_input_txt" value="" size="40" maxlength="100">
								</li>
							</ul>
						</div>
					</td>
				</tr>

				<tr>
					<th>
						<div class="tb-l pl-30">이메일 수신여부</div>
					</th>
					<td>
						<div class="tb-l pl-6">
							apparel에서 보내드리는 정보, 이벤트 메일을 받으시겠습니까?<br> <label
								style="margin-right: 20px;"> <input type="radio"
								name="emailreceive" value="Y" disabled="" checked="">
								받습니다.
							</label> <label> <input type="radio" name="emailreceive"
								value="N" disabled=""> 받지 않습니다.
							</label>
						</div>
					</td>
				</tr>
				<tr>
					<th>
						<div class="tb-l pl-30">SMS 수신여부</div>
					</th>
					<td>
						<div class="tb-l pl-6">
							SMS 문자메세지로 이벤트 및 유용한 쇼핑몰 정보를 받으시겠습니까?<br> <label
								style="margin-right: 20px;"> <input type="radio"
								name="smsreceive" form="join_form" value="Y" disabled=""
								checked=""> 받습니다.
							</label> <label> <input type="radio" name="smsreceive"
								form="join_form" value="N" disabled=""> 받지 않습니다.
							</label>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<!-- #personInfo -->

	<div class="btn-area">
		<a href="javascript:send();"><img
			src="/shop/image/user/join/btn_join_ok.gif" alt="가입완료"></a> <a
			href="Javascript:history.back()"><img
			src="/shop/image/user/join/btn_join_cancel.gif" alt="돌아가기"></a>
	</div>
</form>

<script>
	function send(){
		alert("test");
	}
</script>

<%@ include file="/include/serviceArea.jsp"%>
</div>
<%@ include file="/include/aside.jsp"%>
<%@ include file="/include/footer.jsp"%>