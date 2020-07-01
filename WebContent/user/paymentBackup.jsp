<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp"%>
<%@ include file="/include/preloader.jsp"%>
<%@ include file="/include/header.jsp"%>
<%@ include file="/include/nav.jsp"%>
<link rel="stylesheet" href="/shop/css/user/payment.css">
<!-- JSTL에서 , 를 찍기 위함 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="content__box">
	<div id="order">
		<dl class="loc-navi">
			<dt class="blind">현재 위치</dt>
			<dd>
				<a href="/">Home</a> &gt; <strong>주문서</strong>
			</dd>
		</dl>
		<h2>주문/결제</h2>
		<div class="page-body">
			<form name="form1" id="order_form" action="/shop/orderin.html"
				method="post">
				<fieldset>
					<legend>주문 폼</legend>
					<h3>주문리스트</h3>
					<div class="tbl-order">
						<table>
							<caption>주문리스트</caption>
							<colgroup>
								<col style="width: 80px">
								<col style="width: 180px">
								<col style="width: 90px">
								<col style="width: 90px">
							</colgroup>
							<thead>
								<tr>
									<th scope="col"></th>
									<th scope="col">제품</th>
									<th scope="col">수량</th>
									<th scope="col">가격</th>
								</tr>
							</thead>
							<c:set var="sum" value="0" />
							<tbody>
								<c:forEach var="dto" items="${dtos}">
								<c:set var="sum" value="${sum + (dto.productPrice*dto.cartQuantity)}"/>
								<tr class="nbg">
									<td>
										<div class="tb-center">
											<div class="thumb">
												<img src="${dto.productThumbnailH}" width="60">
											</div>
										</div>
									</td>
									<td>
										<div class="tb-left">
											<a href="/shop/product?cmd=detail&id=${dto.productId}">${dto.productName} </a>
										</div>
									</td>
									<td>
										<div class="tb-center">${dto.cartQuantity}</div>
									</td>
									<td>
										<div class="tb-right tb-bold"><fmt:formatNumber value="${dto.productPrice*dto.cartQuantity}" pattern="#,###"/>원</div>
									</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- .table-order -->
					<div class="tbl-order tot-order">
						<table>
							<caption></caption>
							<colgroup>
								<col style="width: 100px">
								<col>
							</colgroup>
							<thead>
								<tr>
									<th>최종 결제금액</th>
									<td><strong class="price"><em><span
												id="block_unit_dollar" style="display: none">$</span> <span
												id="op_total_price"><fmt:formatNumber value="${sum}" pattern="#,###"/></span></em> 
												<span id="block_unit_won">원</span></strong>
								</tr>
							</thead>
						</table>
					</div>
					<!-- .tbl-pay -->

					<div id="paybutton">
						<a href="javascript:send(${principal.id},${sum});"><img
							src="/shop/image/pay/order_pay_ok.gif" alt="주문하기" title="주문하기"></a>
						<a href="/shop/user?cmd=cart&id=${principal.id}"><img
							src="/shop/image/pay/order_pay_cancel.gif" alt="주문취소" title="주문취소"></a>
					</div>
				</fieldset>
			</form>
		</div>
		<!-- .page-body -->
	</div>

	<%@ include file="/include/serviceArea.jsp"%>
</div>

<script>
function send(id,totalPrice) {
	$.ajax({
		type: "post",
		url: "/shop/user?cmd=paymentProc",
		data: "id="+id+"&totalPrice="+totalPrice,
		contentType: "application/x-www-form-urlencoded; charset=utf-8",
		dataType: "text"
	}).done(function(result){
		location.href="/shop/user?cmd=order&id="+id;
	}).fail(function(error){
		alert("실패");
	});
}
</script>

<script src="/shop/js/cartView.js"></script>
<%@ include file="/include/aside.jsp"%>
<%@ include file="/include/footer.jsp"%>