<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/head.jsp"%>
<%@ include file="../include/preloader.jsp"%>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/nav.jsp"%>

<div class="content__box">
	<div id="productDetail">
		<h2 class="tit-page">top</h2>
		<div class="page-body">
			<div class="thumb-info">
				<!-- thumbnail 가로사진 -->
				<div class="thumb-wrap">
					<div class="thumb">
						<img src="${dtos.product.thumbnailW}">
					</div>
				</div>
				<!-- .thumb-wrap -->
				<!-- 장바구니 -->
				<form name="form1" method="post" id="form1" action="/shop/basket.html">
					<div class="info">
						<table border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr valign="top">
									<td style="position: relative; border-right: 1px solid #d1d1d1; width: 470px; padding-bottom: 100px;">
										<!-- 상품명 -->
										<h3 class="tit-prd">
											<span class="line">${dtos.product.name}</span>
										</h3>
										<!-- product테이블에 이부분 컬럼 만들어야 할듯! 예를 들어 titleComment -->
										<div>${dtos.product.titleComment}</div>
										<!-- 장바구니, 주문하기, 위시리스트 버튼 -->
										<div class="prd-btns">
											<div class="rollover">
												<a href="javascript:addCart(${dtos.product.id}, ${principal.id});"> <img src="/shop/image/detail/cart_btn.gif" alt="cart" title="cart">
												</a> <a href="javascript:send_multi('', 'baro', '');"> <img src="/shop/image/detail/buy_btn.gif" alt="buy now" title="buy now">
												</a> <a href="javascript:addWishList(${dtos.product.id}, ${principal.id});"> <img src="/shop/image/detail/wish_btn.gif" alt="wishlist" title="wishlist"></a>
											</div>
										</div>
									</td>
									<td align="right">
										<div class="table-opt">
											<table summary="판매가격, 적립금, 주문수량, 옵션, 사이즈, 상품조르기, sns" style="width: 285px;">
												<caption>상품 옵션</caption>
												<colgroup>
													<col width="80">
													<col width="*">
												</colgroup>
												<tbody>
													<!-- 상품 가격 -->
													<tr>
														<th scope="row"><div class="tb-left">PRICE</div></th>
														<td class="price">
															<div class="tb-left">${dtos.product.price}</div>
														</td>
													</tr>
													<!-- 상품 색상 옵션 -->
													<tr>
														<th scope="row"><div class="tb-left">색상</div></th>
														<td>
															<div class="tb-left">
																<span id="MK_opt_0"> <input type="hidden" id="optionlist_0" name="optionlist[]" value=""> 
																<select id="MK_p_s_0" onchange="p_add_product(this)" p_opt_cnt="0" mandatory="Y">
																		<option value="">--옵션 선택--</option>
																		<option value="0" price="49000" opt_price="0" opt_title="그린" stock_cnt="-1">그린</option>
																		<option value="1" price="49000" opt_price="0" opt_title="퍼플" stock_cnt="-1">퍼플</option>
																		<option value="2" price="49000" opt_price="0" opt_title="블루" stock_cnt="-1">블루</option>
																		<option value="3" price="49000" opt_price="0" opt_title="차콜" stock_cnt="-1">차콜</option>
																		<option value="4" price="49000" opt_price="0" opt_title="블랙" stock_cnt="-1">블랙</option>
																</select>
																</span>
															</div>
														</td>
													</tr>
													<!-- 총 상품 금액 -->
													<tr>
														<td colspan="2">
															<div class="tb-left">
																<div class="MK_optAddWrap">
																	<div id="MK_innerOptWrap">
																		<div id="MK_innerOptScroll">
																			<ul class="MK_inner-opt-cm" id="MK_innerOpt_01"></ul>
																			<ul class="MK_inner-opt-cm" id="MK_innerOpt_02"></ul>
																		</div>
																		<div id="MK_innerOptTotal" class="">
																			<p class="totalRight">
																				<span class="MK_txt-total">총 상품 금액</span> <strong class="MK_total" id="MK_p_total">0</strong> <span class="MK_txt-won">원</span>

																			</p>
																		</div>
																	</div>
																</div>
																<!-- .MK_optAddWrap -->
																<input type="hidden" name="xcode" value="033"> <input type="hidden" name="mcode" value="001"> 
																<input type="hidden" name="option_type" id="option_type" value="PS">
																<script type="text/javascript">
																	var isdicker = "";
																	var NU_NL_only_2 = ""; //2단옵션일 경우 두번째 옵션만 사용유무 확인
																	var basketcnt = "0";
																	var p_list_total_cnt = 0;
																	var p_total_price = 0; //장바구니에 담은 총금액
																	var sellprice = parseInt(
																			49000,
																			10); //상품 기본 판매가(옵션값 제외)
																	var option_type = "PS";
																	var opt_cnt = 1 - 1;
																	var optionprice = "49000";
																	var arrOptionPrice = optionprice
																			.split(',');
																	var oiroptionprice = "";
																	var oriarrOptionPrice = oiroptionprice
																			.split(',');
																	var pc_cnt = 0; //PC옵션의 인덱스값으로 사용
																	var total_stock_cnt = ""; //전체 재고 갯수
																	var min_add_amount = parseInt(
																			1,
																			10); //최소주문수량
																	var miniq = parseInt(
																			1,
																			10); //최소주문수량
																	var maxq = parseInt(
																			2147483647,
																			10); //최대주문수량
																	var brandcode = "033001001272";
																	var product_uid = "24348";
																	var pc_option = new Array();
																	var arr_li_code = new Array();
																	var collline = "C";
																	var discount_uid = "";
																	var etctype = "|";
																	var prd_sellprice = "49000";
																	var prd_regdate = "2020-06-16 14:17:16";
																	var is_discount = "";
																	var product_discount = "";
																	var optioncode = new Array();
																	var ORBAS = "A";
																	var is_mobile_use = false;
																	var template_m_setid = 15;
																	var collbasket_type = 'Y';
																	var baro_opt = "N";
																</script>
															</div>
														</td>
													</tr>
												</tbody>
											</table>
										</div> <!-- .table-opt -->
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- .info -->
				</form>
			</div>
			<!-- .thumb-info -->

			<div style="height: 100px;"></div>
			<!-- detail, withItem, review, qna, readme를 위한 nav bar -->
			<div class="detailmenu" id="detail">
				<ul>
					<li class="selected"><a href="#detail">DETAIL</a></li>
					<li><a href="#withitem">WITH ITEM</a></li>
					<li><a href="#review">REVIEW</a></li>
					<li><a href="#qna">QNA</a></li>
					<li><a href="#readme">READ ME</a></li>
				</ul>
			</div>
			<!-- product_disc 테이블에 content 부분!-->
			<!--<h3 class="detail-title">상품 상세 설명</h3>-->
			<div class="prd-detail">
				<!-- content 부분 -->
				${dtos.product.contents}
				<!-- s: 상품 일반정보(상품정보제공 고시) -->
				<!-- e: 상품 일반정보(상품정보제공 고시) -->
			</div>
			<!-- detail, withItem, review, qna, readme를 위한 nav bar -->
			<div class="detailmenu" id="withitem">
				<ul>
					<li><a href="#detail">DETAIL</a></li>
					<li class="selected"><a href="#withitem">WITH ITEM</a></li>
					<li><a href="#review">REVIEW</a></li>
					<li><a href="#qna">QNA</a></li>
					<li><a href="#readme">READ ME</a></li>
				</ul>
			</div>
			<!-- WHITH ITEM 관련상품-->
			<form name="allbasket" method="post" action="/shop/user?cmd=allCart">
				<h3 class="detail-title">WITH ITEM</h3>
				<div class="prd-list">
					<table summary="상품이미지, 상품 설명, 가격">
						<caption>관련 상품 리스트</caption>
						<tbody>
							<tr>
							<!-- 첫번째 관련상품 부분 -->
							<!-- for each시작 지점 -->
							<c:forEach var="withItemDto" items="${dtos.withItemDtos}">
								<td width="16.666%;">
									<table border="0" cellpadding="0" cellspacing="0" style="width: 170px; margin: 0 auto;">
										<tbody>
											<tr>
												<td><div class="thumb">
														<a href="/shop/product?cmd=detail&id=${withItemDto.product.id}">
														<!-- 관련상품 세로썸네일, 여기에 사진 뿌리면서 사이즈가 작아져야 할텐데.. 그리고 세로 사진 썸네일임... /shop/image/detail/thumbH(1).jpg-->
														<img class="MS_prod_img_s" src="${withItemDto.product.thumbnailH}" alt="상품 섬네일" title="상품 섬네일"></a>
													</div></td>
											</tr>
											<tr>
												<td><div class="prd-name">
													<!-- 관련상품 이상품의 detail페이지로 이동///이 상품의 titleComment {product.titleComment} -->
														<a href="/shop/product?cmd=detail&id=${withItemDto.product.id}">${withItemDto.product.name}  ${withItemDto.product.titleComment}
														</a>
													</div></td>
											</tr>
											<tr>
												<td>
													<div -class="prd-price">

														<ul>
														<!-- 이 관련상품의 가격 {product.price} -->
															<li class="prd-price">${withItemDto.product.price}원</li>
														</ul>

													</div>
												</td>
											</tr>
											<!--
                                        <tr>
                                            <td>
                                                <div class="prd-reserve">
                                                                                                0원
                                                                                                </div>
                                            </td>
                                        </tr>
                                        -->
											<!-- 이 관련 상품의 옵션 -->                                        
											<tr>
												<td>
													<div class="option_select">
													<!-- 색상 옵션 -->
														<div>
															색상 : <select id="optionlist0_0" name="optionlist0[]" onchange="seloptvalue();display_coll_option_stock('PS', 0);" mandatory="Y" class="MS_related_option vo_value_list">
																<option value="">--- 필수 옵션입니다 ---</option>
																<option value="핑크" origin="핑크">핑크</option>
																<option value="라임" origin="라임">라임</option>
																<option value="아이보리" origin="아이보리">아이보리</option>
																<option value="블루" origin="블루">블루</option>
																<option value="퍼플" origin="퍼플">퍼플</option>
																<option value="베이지" origin="베이지">베이지</option>
															</select>
														</div>
														<!-- 사이즈 옵션 -->
														<div>
															사이즈 : <select id="optionlist0_1" name="optionlist0[]" onchange="seloptvalue();display_coll_option_stock('PS', 0);" mandatory="Y" class="MS_related_option vo_value_list">
																		<option value="">--- 필수 옵션입니다 ---</option>
																		<option value="S" origin="S">S</option>
																		<option value="M" origin="M">M</option>
																	</select><input type="hidden" id="uid0" name="uid0" value="23321"> 
																	<input type="hidden" id="option_type0" name="option_type0" value="PS"> 
																	<input type="hidden" name="spcode">
																	<input type="hidden" name="spcode2"> 
																	<input type="hidden" id="JsonData0" name="JsonData0" value="YY"> 
																	<input type="hidden" id="collprice0" name="collprice0" value="22000">
																	<input type="hidden" id="colloptprice0_1" name="colloptprice0_1" value="0">
																	<input type="hidden" id="colloptprice0_2" name="colloptprice0_2" value="0">
														</div>
													</div>
												</td>
											</tr>
											<!-- 이 관련상품의 체크박스 - 누르면 장바구니에 담기는 기능이다.  -->
											<tr>
												<td><div class="prd-check">
														<input type="checkbox" name="collbasket" value="034001000476" class="MS_related_checkbox">
													</div></td>
											</tr>
										</tbody>
									</table>
								</td>
								<!-- end of foreach문 -->
								</c:forEach>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="related-allbasket">
					<a href="javascript:send_multi('2', '', 'relation', '')">
					<!-- 누르면 장바구니로 갈 수 있도록 하기 -->
					<img src="/shop/image/detail/allbasket.gif" align="absmiddle" border="0"></a>
				</div>
			</form>
			<a name="reviewboard"></a>
			<!-- detail, withItem, review, qna, readme를 위한 nav bar -->
			<div class="detailmenu" id="review">
				<ul>
					<li><a href="#detail">DETAIL</a></li>
					<li><a href="#withitem">WITH ITEM</a></li>
					<li class="selected"><a href="#review">REVIEW</a></li>
					<li><a href="#qna">QNA</a></li>
					<li><a href="#readme">READ ME</a></li>
				</ul>
			</div>
			<div class="board-hd">
				<h3 class="board-title">REVIEW</h3>
			</div>
			<link type="text/css" rel="stylesheet" href="/template_common/shop/modern_simple/power_review_custom.2.css?t=201906240943">
			<!-- 여기에 review.jsp include할 예정 -->
			<%@ include file="review.jsp"%>
			<!-- #powerReview-->
			<p style="clear: both"></p>

			<a name="brandqna_list"></a>
			<div class="detailmenu" id="qna">
				<ul>
					<li><a href="#detail">DETAIL</a></li>
					<li><a href="#withitem">WITH ITEM</a></li>
					<li><a href="#review">REVIEW</a></li>
					<li class="selected"><a href="#qna">QNA</a></li>
					<li><a href="#readme">READ ME</a></li>
				</ul>
			</div>
			<div class="board-hd">
				<h3 class="board-title">Q&amp;A</h3>
			</div>
				<div class="table-slide qna-list">
				<!-- here -->
				<table summary="번호, 제목, 작성자, 작성일, 조회">
						<caption>QnA 리스트</caption>
					
						<colgroup>
							<col width="80">
							<col width="30">
							<col width="*">
							<col width="100">
							<col width="100">
							<col width="80">
						</colgroup>
					
						<thead>
							<tr>
								<th scope="col"><div class="tb-center">NO</div></th>
								<th scope="col"></th>
								<th scope="col"><div class="tb-center">SUBJECT</div></th>
								<th scope="col"><div class="tb-center">NAME</div></th>
								<th scope="col"><div class="tb-center">DATE</div></th>
								<th scope="col"><div class="tb-center">STATE</div></th>
							</tr>
						</thead>
					
						<tbody>
							<c:forEach var="qnADto" items="${dtos.qnADtos}" varStatus="status">
							
							<tr>
								<td><div class="tb-center">
										<span class="reviewnum">${status.count}</span>
									</div></td>
								<td><div class="tb-center"></div></td>
								<td><div class="tb-left reply_depth0">
										<span><img src="/shop/image/detail/neo_lock.gif"></span>
										<a>${qnADto.qna.title}</a>
									</div></td>
								<td><div class="tb-center">${qnADto.username}</div></td>
								<td><div class="tb-center">${qnADto.qna.qnADate}</div></td>
								<td><div class="tb-center"><span id="qna_board_showhits2">8</span></div></td>
							</tr>
							
							
							<tr class="MS_qna_content_box cnt" id="qna_board_block1">
								<td colspan="5">
									<div class="tb-left">
										<div class="qna_board_content"></div>
									</div>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>

<ol class="paging">
	<li class="first"><a
		href="/shop/shopdetail.html?branduid=23321&amp;xcode=034&amp;mcode=001&amp;scode=001&amp;qnapage=1#brandqna_list"><img
			src="/design/pighip/img/page_prev.gif" alt="[처음]"></a></li>

	<li><a
		href="/shop/shopdetail.html?branduid=23321&amp;xcode=034&amp;mcode=001&amp;scode=001&amp;qnapage=1#brandqna_list">1</a></li>
	<li><a
		href="/shop/shopdetail.html?branduid=23321&amp;xcode=034&amp;mcode=001&amp;scode=001&amp;qnapage=2#brandqna_list">2</a></li>
	<li class="now"><a
		href="/shop/shopdetail.html?branduid=23321&amp;xcode=034&amp;mcode=001&amp;scode=001&amp;qnapage=3#brandqna_list">3</a></li>
	<li><a
		href="/shop/shopdetail.html?branduid=23321&amp;xcode=034&amp;mcode=001&amp;scode=001&amp;qnapage=4#brandqna_list">4</a></li>

	<li class="last"><a
		href="/shop/shopdetail.html?branduid=23321&amp;xcode=034&amp;mcode=001&amp;scode=001&amp;qnapage=4#brandqna_list"><img
			src="/design/pighip/img/page_next.gif" alt="[끝]"></a></li>
</ol>
</div>	

			<div class="board-btns">
				<a href="/board/board.html?code=pighip_board2&amp;page=1&amp;type=i&amp;branduid=24348&amp;returnurl=xcode=&amp;mcode=&amp;scode="><img src="/shop/image/detail/detail_write.gif" alt="상품문의"
					title="상품문의"></a> <a href="/board/board.html?code=pighip_board2"><img src="/shop/image/detail/detail_list.gif" alt="전체보기" title="전체보기"></a>
			</div>

			<div class="detailmenu" id="readme">
				<ul>
					<li><a href="#detail">DETAIL</a></li>
					<li><a href="#withitem">WITH ITEM</a></li>
					<li><a href="#review">REVIEW</a></li>
					<li><a href="#qna">QNA</a></li>
					<li class="selected"><a href="#readme">READ ME</a></li>
				</ul>
			</div>
			<div style="text-align: center;">
				<img src="/design/pighip/img/detail_model.jpg" alt="">
			</div>
			<div style="text-align: center;">
				<img src="/design/pighip/img/detail_common.gif" alt="">
			</div>

		</div>
		<!-- .page-body -->
	</div>


</div>
<!-- end of content__box -->
<%@ include file="../include/aside.jsp"%>
<%@ include file="../include/footer.jsp"%>