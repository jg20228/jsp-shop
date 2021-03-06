<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp"%>
<%@ include file="/include/preloader.jsp"%>
<%@ include file="/include/header.jsp"%>
<%@ include file="/include/nav.jsp"%>

<!-- JSTL에서 , 를 찍기 위함 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div class="content__box">
	<div id="cartWrap">
		<h2 class="tit-page">CART</h2>
		<div class="page-body">
			<!--<h3 class="tit-cart"><img src="/images/d3/modern_simple/cart_fill_tit.gif" alt="장바구니 담긴 상품" title="장바구니 담긴 상품" /></h3>-->
			<div class="table-cart table-fill-prd">
				<table summary="번호, 사진, 제품명, 수량, 적립, 가격, 배송비, 취소">
					<caption>장바구니 담긴 상품</caption>
					<colgroup>
						<col width="60">
						<col width="130">
						<col width="*">
						<col width="130">
						<col width="130">
						<col width="130">
						<col width="130">
						<col width="130">
					</colgroup>
					<thead>
						<tr>
							<th scope="col"><div class="tb-center">NO</div></th>
							<th scope="col"><div class="tb-center"></div></th>
							<th scope="col" style="padding-left: 50px;">
								<div class="tb-left">ITEM</div>
							</th>
							<th scope="col"><div class="tb-center">QTY</div></th>
							<th scope="col"><div class="tb-center">PRICE</div></th>
							<th scope="col"><div class="tb-center">SAVE</div></th>
							<th scope="col"><div class="tb-center">DELIVERY</div></th>
							<th scope="col"><div class="tb-center">TOTAL</div></th>
						</tr>
					</thead>
					<c:set var="sum" value="0" />
					<tbody>
						<c:forEach var="cart" items="${dto.cartResponseDtos}" varStatus="status">
						<form action="basket.html" method="post" name="forms"
							id="basket_form${status.count}">
							<c:set var="sum" value="${sum + (cart.productPrice*cart.cartQuantity)}"/>
							<tr class="nbg">
								<td><div class="tb-center">${status.count}</div></td>
								<td>
									<div class="tb-center">
										<div class="thumb">
											<a href="/shop/product?cmd=detail&id=${cart.productId}">
												<img src="${cart.productThumbnailH}" alt="상품 섬네일"
												title="상품 섬네일">
											</a>
										</div>
									</div>
								</td>
								<td>
									<div class="tb-left">
										<a href="/shop/product?cmd=detail&id=${cart.productId}"
											style="font-size: 13px; font-weight: bold;">${cart.productName}</a>
										<span class="MK-product-icons"></span>
										<div class="tb-left tb-opt" style="padding: 10px 0 0 0;">
											option 색상 : 아이보리</div>
									</div>
								</td>
								<td>
									<div class="tb-center" style="padding-left: 35px;">
										<div class="opt-spin" style="float: left;">
										
											<input type="text" name="amount" value="${cart.cartQuantity}"class="txt-spin"> 
											<span class="btns"> 
													<a href="javascript:count_change(0,${status.count})">
														<img class="btn-up" src="/shop/image/cart/cart_up.gif"></a> 
														<a href="javascript:count_change(1,${status.count})">
														<img class="btn-dw" src="/shop/image/cart/cart_down.gif">
													</a>
											</span>
										</div>
										<a style="float: left;"
											href="javascript:updateCart(${cart.productId}, ${cart.memberId},${status.count})"><img
											src="/shop/image/cart/cart_modify.gif" alt="수정" title="수정"></a>
									</div>
								</td>
								<td><div class="tb-center tb-price">
										<span><fmt:formatNumber value="${cart.productPrice}" pattern="#,###"/></span>원
									</div></td>
								<td><div class="tb-center" style="color: #7d7d7d;">0</div></td>
								<td><div class="tb-center tb-delivery">
												<div class="container">
												  <a href="#" data-toggle="popover" title="배송조건 : 기본배송(조건)" data-content=
												  "주문금액이 50,000원 미만시 
														배송비 2,500원이 청구됩니다.">
															기본배송[조건]</a>
												</div>
									</div></td>
								<td>
									<div class="tb-center">
										<span class="d-block"><a
											href="javascript:go_wish(${cart.productId},${cart.memberId},${cart.cartId});"><img
												src="/shop/image/cart/cart_wish.gif" alt="관심상품" title="관심상품"></a></span>
										<span class="d-block"><a
											href="javascript:deleteCart(${cart.cartId});"><img
												src="/shop/image/cart/cart_del.gif" alt="삭제" title="삭제"></a></span>
									</div>
								</td>
							</tr> 
							</form>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="8">
								<div class="tb-right">
									상품구매금액 <span style="font-size: 15px;">
									<fmt:formatNumber value="${sum}" pattern="#,###"/>
									</span> = 합계 : 
									<strong><span style="font-size: 15px;"><fmt:formatNumber value="${sum}" pattern="#,###"/></span>
									</strong>
								</div>
							</td>
						</tr>
					</tfoot>


				</table>
			</div>
			<!-- .table-fill-prd -->


			<div class="btn-order-ctrl rollover">
				<a href="javascript:cartClear(${principal.id});"> <img
					src="/shop/image/cart/cart_empty.gif" alt="장바구니 비우기"
					title="장바구니 비우기"></a> 
					<a href="index.jsp"> <img
					src="http://www.pighip.co.kr/design/pighip/img/cart_shopping.gif"
					alt="계속쇼핑하기" title="계속쇼핑하기"></a> 
					<a href="/shop/user?cmd=payment&id=${principal.id}">
					<img src="http://www.pighip.co.kr/design/pighip/img/cart_order.gif"
					alt="주문하기" title="주문하기"></a>

				<!--<a href="javascript:basket_estimate()"><img src="/images/d3/modern_simple/btn/btn_h36_estimate_print.gif" alt="견적서 출력" title="견적서 출력" /></a>-->
			</div>
			<br>
			<div style="text-align: right;"></div>

			<div class="mem-lvl">
				<p>
					저희 쇼핑몰을 이용해주셔서 감사합니다. <span class="MS_group_content"> <span
						class="MS_group_hname"></span> <span class="username">${principal.username}님</span>이
						<span class="MS_group_condition"></span>구매시, <span
						class="MS_group_msg">구매금액의 <font color="#F26622">1</font>%를
							<font color="#F26622">추가 적립</font>해 드립니다.
					</span>
					</span>
				</p>
			</div>
			<!-- .mem-lvl -->

			<h2 class="tit-page" style="margin: 100px 0 20px 0;">WISH LIST</h2>
			<div class="table-cart table-fill-prd">
				<table summary="사진, 제품명, 수량, 적립, 재고, 가격, 처리">
					<caption>관심상품</caption>
					<colgroup>
						<col width="180">
						<col width="*">
						<col width="130">
						<col width="130">
						<col width="130">
						<col width="130">
						<col width="130">
					</colgroup>
					<thead>
						<tr>
							<th scope="col"><div class="tb-center"></div></th>
							<th scope="col"><div class="tb-left"
									style="padding-left: 120px;">ITEM</div></th>
							<th scope="col"><div class="tb-center">QTY</div></th>
							<th scope="col"><div class="tb-center">SAVE</div></th>
							<th scope="col"><div class="tb-center">PRICE</div></th>
							<th scope="col"><div class="tb-center">STOCK</div></th>
							<th scope="col"><div class="tb-center">SELECT</div></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="wish" items="${dto.cartWishListResponseDto}">
							<form name="formwish" method="post"></form>
							<tr class="nbg">
								<td>
									<div class="tb-center">
										<div class="thumb">
											<a href="/shop/product?cmd=detail&id=${wish.productId}"><img
												src="${wish.productThumbnailH}" alt="상품 섬네일" title="상품 섬네일"></a>
										</div>
									</div>
								</td>
								<td><div class="tb-left"
										style="font-size: 13px; font-weight: bold;">${wish.productName}</div></td>
								<td><div class="tb-center">
										<input type="text" name="amount"
											class="MS_input_txt txt-right" value="1" size="2">개
									</div></td>
								<td style="color: #7d7d7d;"><div class="tb-center">0</div></td>
								<td><div class="tb-center tb-bold"><fmt:formatNumber value="${wish.productPrice}" pattern="#,###"/>원</div></td>
								<td><div class="tb-center">있음</div></td>
								<td>
									<div class="tb-center">
										<span class="d-block"><a
											href="javascript:go_cart(${wish.productId},${wish.memberId},${wish.wishId});"><img
												src="/shop/image/cart/btn_h19_cart.gif" alt="장바구니"
												title="장바구니"></a></span> <span class="d-block"> <a
											href="javascript:deleteWish(${wish.wishId});"> <img
												src="/shop/image/cart/cart_del.gif" alt="삭제" title="삭제"></a></span>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- .table-fill-prd -->
		</div>
		<!-- .page-body -->
	</div>

</div>
<script>

	$(document).ready(function(){
	  $('[data-toggle="popover"]').popover();   
	});
</script>
<script src="/shop/js/cartView.js"></script>
<%@ include file="/include/aside.jsp"%>
<%@ include file="/include/footer.jsp"%>