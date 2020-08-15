<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp"%>
<%@ include file="/include/preloader.jsp"%>
<%@ include file="/include/header.jsp"%>
<%@ include file="/include/nav.jsp"%>
<link rel="stylesheet" href="/shop/css/user/payment.css">
<!-- JSTL에서 , 를 찍기 위함 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

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

</div>

<script src="/shop/js/cartView.js"></script>
<script>
function send(id,totalPrice) {
	
	var IMP = window.IMP; // 생략가능
	IMP.init('imp59848808'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	
	IMP.request_pay({
	    pg : 'inicis', // version 1.1.0부터 지원.
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '주문명:결제테스트',
	    amount : totalPrice,
	    buyer_email : '${sessionScope.principal.email}',
	    buyer_name : '${sessionScope.principal.name}',
	    buyer_tel : '${sessionScope.principal.phone}',
	    buyer_addr : '${sessionScope.principal.address}',
	    buyer_postcode : '123-456',
	    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
	}, function(rsp) {
	    if ( rsp.success ) {
	        var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	        $.ajax({
	    		type: "post",
	    		url: "/shop/user?cmd=paymentProc",
	    		data: "id="+id+"&totalPrice="+totalPrice,
	    		contentType: "application/x-www-form-urlencoded; charset=utf-8",
	    		dataType: "text"
	    	}).done(function(result){
	    		location.href="/shop/user?cmd=order&id="+id;
	    	}).fail(function(error){
	    		alert("결제가 비정상적으로 처리됨. 관리자에게 문의 하세요.");
	    	});
	        
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	});
}
</script>
<%@ include file="/include/aside.jsp"%>
<%@ include file="/include/footer.jsp"%>