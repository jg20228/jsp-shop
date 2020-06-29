<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp"%>
<%@ include file="/include/preloader.jsp"%>
<%@ include file="/include/header.jsp"%>
<%@ include file="/include/nav.jsp"%>


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
					<tfoot>
						<tr>
							<td colspan="8">
								<div class="tb-right">
									상품구매금액 <span style="font-size: 15px;"> 126,000원</span> = 합계 : <strong><span
										style="font-size: 15px;">126,000원</span></strong>
								</div>
							</td>
						</tr>
					</tfoot>

					<tbody>
						<form action="basket.html" method="post" name="forms"
							id="basket_form0"></form>
						<c:forEach var="cart" items="${dto.cartResponseDtos}">
							<tr class="nbg">
								<td><div class="tb-center">1</div></td>
								<td>
									<div class="tb-center">
										<div class="thumb">
											<a
												href="/shop/product?cmd=detail&id=${cart.productId}">
												<img src="${cart.productThumbnailH}" alt="상품 섬네일"
												title="상품 섬네일">
											</a>
										</div>
									</div>
								</td>
								<td>
									<div class="tb-left">
										<a
											href="/shop/product?cmd=detail&id=${cart.productId}"
											style="font-size: 13px; font-weight: bold;">${cart.productName}</a>
										<span class="MK-product-icons"></span>
										<div class="tb-left tb-opt" style="padding: 10px 0 0 0;">
											option 색상 : 아이보리</div>
									</div>
								</td>
								<td>
									<div class="tb-center" style="padding-left: 35px;">
										<div class="opt-spin" style="float: left;">
											<input type="text" name="amount" value="${cart.cartQuantity}"
												class="txt-spin"> <span class="btns"> <a
												href="javascript:count_change(0, 0)"><img class="btn-up"
													src="/shop/image/cart/cart_up.gif"></a> <a
												href="javascript:count_change(1, 0)"><img class="btn-dw"
													src="/shop/image/cart/cart_down.gif"></a>
											</span>
										</div>
										<a style="float: left;"
											href="javascript:send_basket(0, 'upd')"><img
											src="/shop/image/cart/cart_modify.gif" alt="수정" title="수정"></a>
									</div>
								</td>
								<td><div class="tb-center tb-price">
										<span>${cart.productPrice}</span>원
									</div></td>
								<td><div class="tb-center" style="color: #7d7d7d;">0</div></td>
								<td><div class="tb-center tb-delivery">
										<div class="MS_tb_delivery">
											<span class="MS_deli_txt" onmouseover="overcase(this, '0')"
												onmouseout="outcase(this, '0')"> <span
												class="MS_deli_title MS_deli_block">[기본배송]</span><span
												class="MS_deli_desc MS_deli_block">조건</span>
											</span>
											<div id="deliverycase0" class="MS_layer_delivery"
												style="display: none;">
												<dl>
													<dt>배송조건 : 기본배송(조건)</dt>
													<dd>
														주문금액이 <span class="MS_highlight">50,000원</span> 미만시 <br>
														<br style="line-height: 3px">배송비 <span
															class="MS_highlight">2,500원</span>이 청구됩니다.
													</dd>
												</dl>
												<span class="bull"></span>
												<iframe id="deliverycase_iframe0"
													class="MS_layer_delivery_iframe" frameborder="no"
													border="0"></iframe>
											</div>
										</div>
									</div></td>
								<td>
									<div class="tb-center">
										<span class="d-block"><a
											href="javascript:go_wish('24359','0','0','0','0','');"><img
												src="/shop/image/cart/cart_wish.gif" alt="관심상품" title="관심상품"></a></span>
										<span class="d-block"><a
											href="javascript:deleteCart(${cart.cartId});"><img
												src="/shop/image/cart/cart_del.gif" alt="삭제" title="삭제"></a></span>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- .table-fill-prd -->


			<div class="btn-order-ctrl rollover">
				<a href="javascript:basket_clear();"> <img
					src="/shop/image/cart/cart_empty.gif" alt="장바구니 비우기"
					title="장바구니 비우기"></a> <a href="/html/mainm.html"> <img
					src="http://www.pighip.co.kr/design/pighip/img/cart_shopping.gif"
					alt="계속쇼핑하기" title="계속쇼핑하기"></a> <a href="order.html"><img
					src="http://www.pighip.co.kr/design/pighip/img/cart_order.gif"
					alt="주문하기" title="주문하기"></a>

				<!--<a href="javascript:basket_estimate()"><img src="/images/d3/modern_simple/btn/btn_h36_estimate_print.gif" alt="견적서 출력" title="견적서 출력" /></a>-->
			</div>
			<br>
			<div style="text-align: right;"></div>

			<div class="mem-lvl">
				<p>											
					저희 쇼핑몰을 이용해주셔서 감사합니다.
					<span class="MS_group_content"> <span class="MS_group_hname"></span>
						<span class="username">${principal.username}님</span>이 <span class="MS_group_condition"></span>구매시,
						<span class="MS_group_msg">구매금액의 <font color="#F26622">1</font>%를
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
										<a
											href="/shop/shopdetail.html?branduid=24368&amp;xcode=&amp;mcode=&amp;scode=&amp;GfDT=bm9%2FW1w%3D"><img
											src="${wish.productThumbnailH}"
											alt="상품 섬네일" title="상품 섬네일"></a>
									</div>
								</div>
							</td>
							<td><div class="tb-left"
									style="font-size: 13px; font-weight: bold;">${wish.productName}</div></td>
							<td><div class="tb-center">
									<input type="text" name="amount" class="MS_input_txt txt-right"
										value="1" size="2">개
								</div></td>
							<td style="color: #7d7d7d;"><div class="tb-center">0</div></td>
							<td><div class="tb-center tb-bold">${wish.productPrice}</div></td>
							<td><div class="tb-center">있음</div></td>
							<td>
								<div class="tb-center">
									<span class="d-block"><a
										href="javascript:wish('0', 'ins');"><img
											src="/shop/image/cart/btn_h19_cart.gif" alt="장바구니"
											title="장바구니"></a></span> <span class="d-block">
											<a href="javascript:deleteWish(${wish.wishId});">
										<img src="/shop/image/cart/cart_del.gif" alt="삭제" title="삭제"></a></span>
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
	<%@ include file="/include/serviceArea.jsp"%>
</div>

<script src="/shop/js/cartView.js"></script>
<%@ include file="/include/aside.jsp"%>
<%@ include file="/include/footer.jsp"%>