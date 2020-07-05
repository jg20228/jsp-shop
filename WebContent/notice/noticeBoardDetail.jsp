<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp"%>
<%@ include file="/include/preloader.jsp"%>
<%@ include file="/include/header.jsp"%>
<%@ include file="/include/nav.jsp"%>

<style>
/* BASIC css start */
#noticemenu {
	display: table;
	margin: 0 auto 60px;
}

#noticemenu li {
	float: left;
	margin-left: 5px;
}

#noticemenu li:first-child {
	margin-left: 0;
}
/* BASIC css end */
</style>

<div class="content__box">

	<h2 class="tit-page">NOTICE</h2>

	<ul id="noticemenu" class="rollover">

		<li><a href="/shop/board?cmd=noticeBoard"> <img
				src="/shop/image/notice/noticemenu1_over.gif"
				onmouseover="this.src='/shop/image/notice/noticemenu1_over.gif'"
				onmouseout="this.src='/shop/image/notice/noticemenu1_over.gif'">
		</a></li>

		<li><a href="/shop/board?cmd=noticeMember"> <img
				src="/shop/image/notice/noticemenu2.gif"
				onmouseover="this.src='/shop/image/notice/noticemenu2_over.gif'"
				onmouseout="this.src='/shop/image/notice/noticemenu2.gif'">
		</a></li>

		<li><a href="/shop/board?cmd=noticeOverseas"> <img
				src="/shop/image/notice/noticemenu3.gif"
				onmouseover="this.src='/shop/image/notice/noticemenu3_over.gif'"
				onmouseout="this.src='/shop/image/notice/noticemenu3.gif'">
		</a></li>

		<li><a href="/shop/board?cmd=noticeSize"> <img
				src="/shop/image/notice/noticemenu4.gif"
				onmouseover="this.src='/shop/image/notice/noticemenu4_over.gif'"
				onmouseout="this.src='/shop/image/notice/noticemenu4.gif'">
		</a></li>
	</ul>
	<div class="bbs-table-view">
		<table summary="게시글 보기">
			<caption>게시글 보기</caption>
			<thead>
				<tr>
					<td>
						<ul class="f_left">
							<li class="tb-right th">SUBJECT</li>
							<li>${notice.title}<span class="reply_status reply_NONE"></span></li>
						</ul>

						<ul class="f_right">
							<li class="tb-right th">DATE</li>
							<li>${notice.createDate}</li>
						</ul>

					</td>
				</tr>
				<tr>
					<td>
						<ul class="f_left">
							<li class="tb-right th">NAME</li>
							<li><img src="/shop/image/board/neo_adminimg.gif" border="0"
								align="absmiddle"></li>
						</ul>

						<ul class="f_right hit">
							<li class="tb-right th">HITS</li>
							<li>${notice.readCount}</li>
						</ul>
					</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>

						<div class="data-bd-cont">
							<center>${notice.content}</center>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		<div id="comment_list_0"></div>
		<form id="comment_form" name="comment" action="board.html?"
			method="post" autocomplete="off">
			<input type="hidden" name="page_type" value="board_view"> 
			<input type="hidden" name="formnum" value="0"> 
			<input type="hidden" name="code" value="pighip"> 
			<input type="hidden" name="num1" value="816107"> 
			<input type="hidden" name="num2" value="00000"> 
			<input type="hidden" name="page" value="1">
			<input type="hidden" name="lock" value="Y"> 
			<input type="hidden" name="type" value="v"> 
			<input type="hidden" name="type2"> 
			<input type="hidden" name="comnum"> 
			<input type="hidden" name="comtype"> 
			<input type="text" name="___DUMMY___" readonly="" disabled="" style="display: none;">
		<fieldset>
			<legend>코멘트 쓰기</legend>
			<table summary="코멘트 쓰기" class="comment-box">
				<caption>코멘트 쓰기</caption>
				<colgroup>
					<col width="120">
					<col>
					<col width="150">
				</colgroup>
				<tbody>
					<tr>
						<td colspan="3" class="com-wrt-box">
							<div>
								<div class="wrt">
									<label class="th">NAME</label>
									<span>jg20228
										<input name="cname" type="hidden" value="jg20228">
									</span> 
									<label class="th">PASSWORD</label>
									<span><input type="password" name="cpass" 
										class="MS_input_txt input-style input-style2"
										onclick="CheckLogin()" onkeypress="CheckLogin()"
										placeholder="패스워드"> 
									</span>
									<div class="clear"></div>
									</div>

									<div class="wrt">
										<label class="th">CONTENTS</label>
										<span>
											<textarea name="comment" onchange="Checklength(this);"
												onkeyup="Checklength(this);" onclick="CheckLogin()"
												placeholder="내용">
											</textarea>
										</span>
											<span>
												<a href="javascript:comment_save('');"> 
												<img src="/shop/image/board/btn_comment.gif" alt="글쓰기"
												title="글쓰기" style="margin-left: 10px;">
												</a>
											</span>
										<div class="clear"></div>
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</fieldset>
		</form>
		<div class="view-link">
			<table border="0" cellpadding="0" cellspacing="0">
				<tbody>
					<tr>
						<c:if test="${sessionScope.principal.userRole.toString().equals('ADMIN')}">
						<td style="padding: 0; border: 0;"><a
							href="/shop/board?cmd=noticeUpdate&id=${notice.id}"
							class="none"><img src="/shop/image/board/board_modify.gif"
								alt="수정"></a> 
							<a
							href="/shop/board?cmd=noticeDeleteProc&id=${notice.id}">
							<img src="/shop/image/board/board_del.gif" alt="삭제"></a> 
							<a
							class="write"
							href="/shop/board?cmd=noticeWrite"><img
								src="/shop/image/board/board_write.gif" alt="글쓰기"></a>
						</td>
						</c:if>
						<td style="text-align: right; padding: 0; border: 0;"><a
							href="/shop/board?cmd=noticeBoard">
							<img src="/shop/image/board/board_list.gif" alt="목록보기"></a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>


</div>
<!-- end of content__box -->

<%@ include file="/include/aside.jsp"%>
<%@ include file="/include/footer.jsp"%>