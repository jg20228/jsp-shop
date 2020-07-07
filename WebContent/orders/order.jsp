<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp"%>
<%@ include file="/include/preloader.jsp"%>
<%@ include file="/include/header.jsp"%>
<%@ include file="/include/nav.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="content__box">
	<div class="page-body">
		<p class="t-box-msg">
			<strong>${principal.name}</strong>님이 쇼핑몰에서 주문한 내역입니다.
		</p>
		<div class="table-d2-list">
			<table summary="번호, 주문일자, 상품명, 결제금액, 주문상세, 배송현황">
				<caption>주문내역</caption>
				<colgroup>
					<col width="70">
					<col width="95">
					<col width="70">
					<col width="*">
					<col width="100">
					<col width="75">
					<col width="75">
				</colgroup>
				<thead>
					<tr>
						<th scope="row"><div class="tb-center">번호</div></th>
						<th scope="row"><div class="tb-center">주문일자</div></th>
						<th scope="row"><div class="tb-center">사진</div></th>
						<th scope="row"><div class="tb-center">상품명</div></th>
						<th scope="row"><div class="tb-center">결제금액</div></th>
						<th scope="row"><div class="tb-center">주문상세</div></th>
						<th scope="row"><div class="tb-center">배송현황</div></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items="${dtos}" varStatus="status">
					<tr>
						<td><div class="tb-center">${status.count}</div></td>
						<td><div class="tb-center">${dto.orders.orderDate}</div></td>
						<td><div class="tb-center"><img src="${dto.productThumbnailh}" alt="#"></div></td>
						<td><div class="tb-center">${dto.productName}</div></td>
						<td><div class="tb-center"><fmt:formatNumber value="${dto.orders.totalPrice}" pattern="#,###"/>원</div></td>
						<td><div class="tb-center"><a href="/shop/user?cmd=orderDetail&id=${dto.orders.id}">주문상세</a></div></td>
						<td><div class="tb-center">준비중</div></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<ol class="paging">
		</ol>
		<ul class="foot-dsc">
			<li>상품명 또는 주문상세의 조회 버튼을 클릭하시면, 주문상세 내역을 확인하실 수 있습니다.</li>
			<li>배송현황의 조회 버튼을 클릭하시면, 해당 주문의 배송 현황을 한눈에 확인하실 수 있습니다.</li>
		</ul>
	</div>
	<%@ include file="../include/serviceArea.jsp"%>
</div>
<%@ include file="/include/aside.jsp"%>
<%@ include file="/include/footer.jsp"%>