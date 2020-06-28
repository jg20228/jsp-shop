<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp"%>
<%@ include file="/include/preloader.jsp"%>
<%@ include file="/include/header.jsp"%>
<%@ include file="/include/nav.jsp"%>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>


<div class="bbs-table-write">
	<form name="form1" action="board.html" method="post"
		enctype="multipart/form-data" style="position: relative;"
		autocomplete="off">

		<div id="passimg" name="passimg" style="position: absolute; visibility: hidden; z-index: 999;"></div>
		<fieldset>
			<legend>일반게시판 쓰기</legend>
			<table summary="">
				<caption>게시판 글쓰기</caption>
				<tbody>
					<tr>
						<th><div>subject</div></th>
						<td>
							<div class="title">
								<input id="bw_input_subject" disabled="disabled"
									class="MS_input_txt input_style2" type="text" name="subject"
									value="문의합니다."> <input type="checkbox" name="tag"
									value="ok"> HTML태그 허용<br>
							</div>
						</td>
					</tr>
					<tr>
						<th><div>name</div></th>
						<td><input id="bw_input_writer" type="text" name="hname"
							class="MS_input_txt input_style" readonly="readonly"
							value="jg20228"> password <input id="bw_input_passwd"
							type="password" name="passwd" class="MS_input_txt input_style">
							<font color="red">자동 잠금 기능</font></td>
					</tr>

					<tr>
						<th><div>content</div></th>
						<td>
							<div>
								<textarea id="MS_text_content" name="content" wrap="off"
									onfocus="clear_content()" class="MS_input_txt"
									style="font-family: 굴림체;">배송전 취소나 변경사항 요청의 경우
									'주문취소&amp;배송전 변경' 게시판으로 남겨주세요 ! 
									인터넷쇼핑몰 특성상 휴일 제외 기본 3~5일 정도의 상품준비기간이 필요한 점
									참고 부탁드리며, 항상 최대한 빠른 입고와 배송을 위해 노력하겠습니다 :)</textarea>
								<input type="hidden" name="mobile_content_type" value="">
							</div>
						</td>
					</tr>
					<tr>
						<th><div>file</div></th>
						<td>
							<div>
							
								<input id="bw_input_file" type="text" class="MS_input_txt input_style2" 
								name="file_name1" value="" onfocus="this.blur();upalert()">
								
									<a href="javascript:upload('file_name1');">
										<img src="/shop/image/board/btn_file.gif">
									</a>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</fieldset>

		<table style="margin-top: 30px;">
			<tbody>
				<tr>
					<td style="border: 0; text-align: center; padding-left: 120px;">
						<a class="write" href="JavaScript:send();">
						<img src="/design/pighip/img/board_ok.gif" alt="글쓰기"></a> 
						<a href="/board/board.html?code=pighip&amp;page=1&amp;board_cate=&amp;s_id=&amp;stext=&amp;ssubject=&amp;scontent=&amp;shname=&amp;sbrand=&amp;sgid=&amp;branduid=">
						<img src="/design/pighip/img/board_cancel.gif" alt="글쓰기취소" style="margin: 0 0 0 5px;"></a>
					</td>
					
					<td
						style="border: 0; text-align: right; width: 100px; padding-right: 20px;">
						<a href="/board/board.html?code=pighip&amp;page=1&amp;board_cate=&amp;s_id=&amp;stext=&amp;ssubject=&amp;scontent=&amp;shname=&amp;sbrand=&amp;sgid=&amp;branduid=">
						<img src="/design/pighip/img/board_list.gif" alt="목록보기"></a>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>

<%@ include file="/include/aside.jsp"%>
<%@ include file="/include/footer.jsp"%>
