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

	<div class="bbs-table-list">
		<table summary="No, content,Name,Data,Hits">
			<caption>일반게시판 게시글</caption>
			<colgroup>
				<col width="70">
				<col width="50">
				<col width="*">
				<col width="100">
				<col width="100">
				<col width="100">
			</colgroup>
			<thead>
				<tr>
					<th scope="col"><div class="tb-center">NO</div></th>
					<th scope="col"><div class="tb-center">&nbsp;</div></th>
					<th scope="col"><div class="tb-center">SUBJECT</div></th>
					<th scope="col"><div class="tb-center">NAME</div></th>
					<th scope="col"><div class="tb-center">DATE</div></th>
					<th scope="col"><div class="tb-center">HIT</div></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="notice" items="${notices}">
					<!--. 게시글 리스트 시작(한페이지당 게시글 수) -->
					<tr>
						<td><div class="tb-center">${notice.id}</div></td>
						<td><div class="tb-left">
								<img src="/shop/image/board/neo_default.gif">
							</div></td>

						<!-- .product image 관련 -->
						<td>
							<div class="tb-left">
								<img src="/shop/image/board/neo_head.gif"
									style="padding-left: 00px;">

								<!--. 스팸글 처리 -->
								<a href="/shop/board?cmd=noticeDetail&id=${notice.id}"> [
									PIGHIP ] ${notice.title}</a>
							</div>
						</td>
						<td>
							<div class="tb-center">
								<img src="/shop/image/board/neo_adminimg.gif">
							</div>
						</td>
						<td><div class="tb-center">${notice.createDate}</div></td>
						<td><div class="tb-center">${notice.readCount}</div></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

<c:choose>
	<c:when test="${sessionScope.principal.userRole.toString().equals('ADMIN')}">
		<a class="center"
		href="/shop/board?cmd=noticeWrite">
		<img src="/shop/image/board/board_write.gif" alt="글쓰기"></a>    
	</c:when>
	<c:otherwise>

	</c:otherwise>
</c:choose>
	<%@ include file="/include/serviceArea.jsp"%>
</div>
<!-- end of content__box -->

<%@ include file="/include/aside.jsp"%>
<%@ include file="/include/footer.jsp"%>