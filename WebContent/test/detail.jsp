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
						<!--<a id="zoom_image" href="javascript:imageview('', '');" rel="/shopimages/pighip/">
<img class="detail_image" id="lens_img" src="/shopimages/pighip/0330010012722.jpg?1592890404" border="0" width="300" />
</a>-->
						<img src="${product.thumbnail}">
					</div>
					<div class="thumb-ctrl">
						<a href="javascript:alert('상세 이미지가 없습니다.');">
							<img src="/shop/image/detail/view_image.gif" alt="큰 이미지 보기" title="큰 이미지 보기">
						</a>
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
											<span class="line">${product.name}</span>
										</h3>
										<!-- product테이블에 이부분 컬럼 만들어야 할듯! 예를 들어 titleComment -->
										<div>큼지막한 지구 프린팅이 돋보이는 티셔츠 ♡ 배색 포인트가 매력이예요 !</div>
										<!-- 장바구니, 주문하기, 위시리스트 버튼 -->
										<div class="prd-btns">
											<div class="rollover">
												<a href="javascript:send_multi('', '');"> <img src="/shop/image/detail/cart_btn.gif" alt="cart" title="cart">
												</a> <a href="javascript:send_multi('', 'baro', '');"> <img src="/shop/image/detail/buy_btn.gif" alt="buy now" title="buy now">
												</a> <a href="javascript:login_chk('033001001272');"> <img src="/shop/image/detail/wish_btn.gif" alt="wishlist" title="wishlist"></a>
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
															<div class="tb-left">${product.price}</div>
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
													<!-- 네이버 페이 -->
													<tr>
														<td colspan="2">
															<div class="tb-left">
																<div style="margin-top: 10px; text-align: center">
																	<script type="text/javascript" src="http://pay.naver.com/customer/js/naverPayButton.js" charset="UTF-8"></script>
																	<script type="text/javascript" src="https://pay.naver.com/customer/js/innerNaverPayButton.js?site_preference=normal&amp;442495" charset="UTF-8"></script>
																	<link id="NAVER_PAY_STYLE" type="text/css" rel="stylesheet" href="shop/css/product/naverpay.css">
																	<script language="javascript">
																		function nhn_buy_nc_baro() {
																			var nhnForm = document.allbasket;
																			if (navigator.appName == 'Microsoft Internet Explorer') {
																				var ie9_chk = navigator.appVersion
																						.indexOf("MSIE 9") > -1 ? true
																						: false;
																				var ie10_chk = navigator.appVersion
																						.indexOf("MSIE 10") > -1 ? true
																						: false;

																				if (ie10_chk == true) {
																					ie9_chk = true;
																				}
																			}
																			if (ie9_chk
																					|| navigator.appName != 'Microsoft Internet Explorer') {
																				var aElement = document
																						.createElement("input");
																				aElement
																						.setAttribute(
																								'type',
																								'hidden');
																				aElement
																						.setAttribute(
																								'name',
																								'navercheckout');
																				aElement
																						.setAttribute(
																								'value',
																								'1');

																				if (typeof (inflowParam) != 'undefined') {
																					var aElement2 = document
																							.createElement("input");
																					aElement2
																							.setAttribute(
																									'type',
																									'hidden');
																					aElement2
																							.setAttribute(
																									'name',
																									'nhn_ncisy');
																					aElement2
																							.setAttribute(
																									'value',
																									inflowParam);
																				}
																			} else {
																				try {
																					var aElement = document
																							.createElement("<input type='hidden' name='navercheckout' value='1'>");

																					if (typeof (inflowParam) != 'undefined') {
																						var aElement2 = document
																								.createElement("<input type='hidden' name='nhn_ncisy' value='"+inflowParam+"'>");
																					}
																				} catch (e) {
																					var aElement = document
																							.createElement("input");
																					aElement
																							.setAttribute(
																									'type',
																									'hidden');
																					aElement
																							.setAttribute(
																									'name',
																									'navercheckout');
																					aElement
																							.setAttribute(
																									'value',
																									'1');

																					if (typeof (inflowParam) != 'undefined') {
																						var aElement2 = document
																								.createElement("input");
																						aElement2
																								.setAttribute(
																										'type',
																										'hidden');
																						aElement2
																								.setAttribute(
																										'name',
																										'nhn_ncisy');
																						aElement2
																								.setAttribute(
																										'value',
																										inflowParam);
																					}

																					ie9_chk = true;
																				}
																			}

																			nhnForm
																					.appendChild(aElement);

																			if (typeof (inflowParam) != 'undefined') {
																				nhnForm
																						.appendChild(aElement2);
																			}
																			nhnForm.target = "loginiframe";
																			nhnForm.ordertype.value = "baro|parent.";

																			//send_multi('baro','');
																			send_multi(
																					'',
																					'baro',
																					'');
																			if (ie9_chk
																					|| navigator.appName != 'Microsoft Internet Explorer') {
																				aElement
																						.setAttribute(
																								'value',
																								'');
																			} else {
																				nhnForm.navercheckout.value = "";
																			}

																			nhnForm.target = "";
																			nhnForm.ordertype.value = "";
																			if (!ie9_chk) {
																				for (var i = 0; i < nhnForm.navercheckout.length; i++) {
																					nhnForm.navercheckout[i].value = "";
																				}
																			}
																		}
																		function nhn_buy_nc_order() {

																			var type = "N";
																			if (type == "N") {
																				window
																						.open(
																								"order.html?navercheckout=2",
																								"");
																			} else {
																				location.href = "order.html?navercheckout=2";
																			}
																			return false;
																		}
																		function nhn_wishlist_nc(
																				url) {
																			window
																					.open(
																							url,
																							"",
																							"scrollbars=yes,width=400,height=267");
																			return false;
																		}
																	</script>
																	<div id="nhn_btn" style="zoom: 1;">
																		<script type="text/javascript">
																			//<![CDATA[
																			naver.NaverPayButton
																					.apply({
																						BUTTON_KEY : "4F7A6458-B519-41A4-A724-16E80207DDC1", // 체크아웃에서 제공받은 버튼 인증 키 입력
																						TYPE : "B", // 버튼 모음 종류 설정
																						COLOR : 1, // 버튼 모음의 색 설정
																						COUNT : 2, // 버튼 개수 설정. 구매하기 버튼만 있으면(장바구니 페이지) 1, 찜하기 버튼도 있으면(상품 상세 페이지) 2를 입력.
																						ENABLE : "Y", // 품절 등의 이유로 버튼 모음을 비활성화할 때에는 "N" 입력
																						BUY_BUTTON_HANDLER : nhn_buy_nc_baro, // 구매하기 버튼 이벤트 Handler 함수 등록. 품절인 경우 not_buy_nc 함수 사용
																						BUY_BUTTON_LINK_URL : "", // 링크 주소 (필요한 경우만 사용)
																						WISHLIST_BUTTON_HANDLER : nhn_wishlist_nc, // 찜하기 버튼 이벤트 Handler 함수 등록
																						WISHLIST_BUTTON_LINK_URL : "shopdetail.html?mode=wish&branduid=24348&navercheckout=2", // 찜하기 팝업 링크 주소
																						EMBED_ID : "nhn_btn",
																						"" : ""
																					});
																			//]]>
																		</script>
																		<div id="NC_ID_1592981993858371" class="npay_storebtn_bx npay_type_B_2">
																			<div id="NPAY_BUTTON_BOX_ID" class="npay_button_box ">
																				<div class="npay_button">
																					<div class="npay_text">
																						<span class="npay_blind">NAVER 네이버 ID로 간편구매 네이버페이</span>
																					</div>
																					<table class="npay_btn_list" cellspacing="0" cellpadding="0">
																						<tbody>
																							<tr>
																								<td class="npay_btn_item"><a id="NPAY_BUY_LINK_IDNC_ID_1592981993858371" href="#" class="npay_btn_link npay_btn_pay btn_green" style="box-sizing: content-box;" title="새창"><span
																										class="npay_blind">네이버페이 구매하기</span></a></td>
																								<td class="npay_btn_item btn_width"><a id="NPAY_WISH_LINK_IDNC_ID_1592981993858371" href="shopdetail.html?mode=wish&amp;branduid=24348&amp;navercheckout=2"
																									class="npay_btn_link npay_btn_zzim " style="box-sizing: content-box;" title="새창"><span class="npay_blind">찜하기</span></a></td>
																								<td class="npay_btn_item btn_width"><a id="NPAY_TALK_LINK_IDNC_ID_1592981993858371" href="#" class="npay_btn_link npay_btn_talk " style="box-sizing: content-box;"
																									title="새창"><span class="npay_blind">톡톡</span></a></td>
																							</tr>
																						</tbody>
																					</table>
																				</div>
																				<div id="NPAY_EVENT_ID" class="npay_event">
																					<a id="NPAY_PROMOTION_PREV_IDNC_ID_1592981993858371" href="#" class="npay_more npay_more_prev"><span class="npay_blind">이전</span></a>
																					<p id="NPAY_PROMOTION_IDNC_ID_1592981993858371" class="npay_event_text">
																						<strong class="event_title">네이버통장</strong><a class="event_link" href="https://campaign.naver.com/npay/naver-account-open/" target="_blank" title="새창">지금 바로 만들어보세요!</a>
																					</p>
																					<a id="NPAY_PROMOTION_NEXT_IDNC_ID_1592981993858371" href="#" class="npay_more npay_more_next"><span class="npay_blind">다음</span></a>
																				</div>
																			</div><!--end of class = npay_button_box -->
																		</div><!--end of class = npay_storebtn_bx npay_type_B_2 -->
																	</div>
																</div>
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
				<div id="videotalk_area"></div>
				<!-- [OPENEDITOR] -->
				<p align="center" style="margin: 0px; text-align: center;">
					<br> <br> <br> <br> <img src="http://pighip.jpg2.kr/eunbi/2020/06/23/20200623_78t_0.jpg">
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<strong><font color="#000000"></font></strong>&nbsp;
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<br>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<strong><font color="#000000"></font></strong>&nbsp;
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<br>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<strong><font color="#000000"></font></strong>&nbsp;
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<strong><font color="#000000"></font></strong>&nbsp;
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<strong><font color="#000000"></font></strong>&nbsp;
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<strong><font color="#000000"></font></strong>&nbsp;
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<strong><font color="#000000"></font></strong>&nbsp;
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<strong><font color="#000000">/ MD Comment</font></strong>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777">&nbsp;</font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777">&nbsp;</font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777">&nbsp;가운데에 큼지막한 지구 프린팅이 눈에 띄는 티셔츠예요 !</font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777"><br></font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777"><br></font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777">어깨선이 살짝 아래로 드롭되는 핏이면서&nbsp;</font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777"><br></font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777">소매와 네크라인에&nbsp;</font><span style="color: rgb(119, 119, 119); font-size: 9pt;">같은 컬러로 배색이 들어가</span>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<span style="color: rgb(119, 119, 119); font-size: 9pt;"><br></span>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<span style="color: rgb(119, 119, 119); font-size: 9pt;">전체적인 룩에 포인트가 되어 준답니다</span>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777"><br></font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777"><br></font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777">이런 박시한 스타일의 티셔츠는 캠핑갈 때나</font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777"><br></font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777">차타고 오래 이동할 때, 여행할 때 등 활동을 많이 하는 경우에</font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777"><br></font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777">활동하기가 편해서 더 빛을 발휘하는 것 같아요</font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777"><br></font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<br>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777">쇼츠, 조거 팬츠는 물론이고 86project_tap pants와 같은 상품과</font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777"><br></font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777">매치해도 멋스러우면서 간편하게 데일리로 입기 제격이라</font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777"><br></font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777">사심 담아 추천해 드리고 싶어요 &gt;&lt;</font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777"><br></font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777"><br></font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777">여유있는 품과 엉덩이를 충분히 가리는 기장감으로</font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777"><br></font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777">44-66 분들은 체형에 구애 없이 착용하기 좋고요</font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777"><br></font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777">남자분들도 100사이즈까지는 충분히 맞으실 거예요</font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777"><br></font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777"><br></font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777">컬러 다르게 해서 커플 아이템으로 맞춰도</font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777"><br></font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777">예쁘게 입으실 수 있어서 마음에 드실 거랍니다~~♥♥</font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777"><br></font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777"><br></font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777">가격대가 있는 만큼 탄탄한 면 소재에</font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777"><br></font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777">바이오 워싱과 텐타 가공을 거친 원단으로</font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777"><br></font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777">오래 입거나 세탁 후에도</font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777"><br></font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;"></p>
				<p align="center" style="margin: 0px; text-align: center;"></p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777">줄거나 뒤틀리는 일을 최소화 했답니다 !</font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777"><br></font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777">찬물로 조물조물 손세탁 하시면</font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777"><br></font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777">보다 오래 망가짐이 덜하실 거예요 :)</font>
				</p>
				<div style="text-align: center;">
					<font color="#777777"><br></font>
				</div>
				<div style="text-align: center;">
					<font color="#777777"><br></font>
				</div>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777"><br></font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777"><br></font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<br>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<br>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777"></font>&nbsp;
				</p>
				<font color="#777777"></font>
				<p align="center" style="margin: 0px; text-align: center;">
					<br> <font color="#000000"><strong>/ Size tip</strong></font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777"></font>&nbsp;
				</p>
				<p align="center" style="margin: 0px; text-align: center; color: rgb(85, 85, 85); letter-spacing: -0.25px; font-family: Verdana, Dotum, AppleGothic, Helvetica, sans-serif; font-size: 11px;">
					&nbsp;<span style="color: rgb(119, 119, 119); letter-spacing: 0px;">여성분들 44-66 모두 권장해드리구요</span>
				</p>
				<p align="center" style="margin: 0px; text-align: center; color: rgb(85, 85, 85); letter-spacing: 0px; font-family: Verdana, Dotum, AppleGothic, Helvetica, sans-serif; font-size: 11px;">
					<font color="#777777"></font>
				</p>
				<p align="center" style="margin: 0px; text-align: center; color: rgb(85, 85, 85); letter-spacing: 0px; font-family: Verdana, Dotum, AppleGothic, Helvetica, sans-serif; font-size: 11px;">
					<font color="#777777"></font><font color="#777777"><span style="letter-spacing: 0px;"></span></font>
				</p>
				<p align="center" style="margin: 0px; text-align: center; color: rgb(85, 85, 85); letter-spacing: 0px; font-family: Verdana, Dotum, AppleGothic, Helvetica, sans-serif; font-size: 11px;">
					<font color="#777777"></font>
				</p>
				<p align="center" style="margin: 0px; text-align: center; color: rgb(85, 85, 85); letter-spacing: 0px; font-family: Verdana, Dotum, AppleGothic, Helvetica, sans-serif; font-size: 11px;">
					<font color="#777777"></font>
				</p>
				<p align="center" style="margin: 0px; text-align: center; color: rgb(85, 85, 85); letter-spacing: 0px; font-family: Verdana, Dotum, AppleGothic, Helvetica, sans-serif; font-size: 11px;">
					<font color="#777777"></font>
				</p>
				<p align="center" style="margin: 0px; text-align: center; color: rgb(85, 85, 85); letter-spacing: 0px; font-family: Verdana, Dotum, AppleGothic, Helvetica, sans-serif; font-size: 11px;">
					<font color="#777777"></font>
				</p>
				<p align="center" style="margin: 0px; text-align: center; color: rgb(85, 85, 85); letter-spacing: -0.25px; font-family: Verdana, Dotum, AppleGothic, Helvetica, sans-serif; font-size: 11px;">
					<font color="#777777"></font>
				</p>
				<p align="center" style="margin: 0px; text-align: center; color: rgb(85, 85, 85); letter-spacing: -0.25px; font-family: Verdana, Dotum, AppleGothic, Helvetica, sans-serif; font-size: 11px;">
					<font color="#777777"></font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777"></font>
				</p>
				<p align="center" style="margin: 0px; text-align: center; color: rgb(85, 85, 85); letter-spacing: 0px; font-family: Verdana, Dotum, AppleGothic, Helvetica, sans-serif; font-size: 11px;">
					<span style="letter-spacing: 0px;"><font color="#777777">남성분들은 100사이즈까지 잘 맞으실거랍니다 ♡</font></span>
				</p>
				<p align="center" style="margin: 0px; text-align: center; color: rgb(85, 85, 85); letter-spacing: 0px; font-family: Verdana, Dotum, AppleGothic, Helvetica, sans-serif; font-size: 11px;">
					<span style="letter-spacing: 0px;"><font color="#777777"><br></font></span>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777">-</font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777"></font>&nbsp;
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777">어깨넓이58&nbsp; 암홀28&nbsp; 팔길이25&nbsp; 팔단면20&nbsp; 가슴넓이64&nbsp; 총길이79</font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777"></font>&nbsp;
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777">-</font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777"></font>&nbsp;
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777">측정 방법에 따라 1-3cm 오차가 있을 수 있으며,</font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777">하단의 [size tip!] 버튼을 눌러 측정법을 확인 해주세요</font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777"></font>&nbsp;
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777"></font>&nbsp;
				</p>
				<p align="center" style="margin: 0px; text-align: center;">&nbsp;</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<strong><font color="#000000">/ Color</font></strong>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777"></font>&nbsp;
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777">그린 퍼플 블루 차콜 블랙 (5color)</font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777"></font>&nbsp;
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777"></font>&nbsp;
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777"></font>&nbsp;
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<br> <strong><font color="#000000">/ Model Fitting</font></strong>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777"></font>&nbsp;
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777">model : 윤희(160cm/45kg) 블랙 free size</font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<br>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<br>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777"></font>&nbsp;
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777"></font>&nbsp;
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<br> <strong><font color="#000000">/ Information</font></strong>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777"></font>&nbsp;
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777">fabric : 면100 (바이오워싱, 텐타가공)</font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777"><br></font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777">cleaning :&nbsp;찬물세탁 &amp; 단독세탁</font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777">(건조기 사용금지)</font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777">&nbsp;</font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777">-</font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<font color="#777777">&nbsp;</font>
				</p>
				<p align="center" style="margin: 0px; text-align: center;">
					<span style="color: rgb(119, 119, 119); font-size: 9pt;">신축성보통, 두께적당</span><span style="font-size: 9pt;">&nbsp;</span><br>
				</p>
				<center>
					<br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <img src="http://pighip.jpg2.kr/eunbi/2020/06/23/20200623_78t_c.jpg">
				</center>
				<center>
					<br>
				</center>
				<center>
					<br>
				</center>
				<center>
					<br> <br> <br> <br> <br> <br> <br> <br> <br>
				</center>
				<center>
					<br>
				</center>
				<center>
					<strong># 블랙</strong>
				</center>
				<center>
					<br> <img src="http://pighip.jpg2.kr/eunbi/2020/06/23/20200623_78t_01.jpg"> 
					<img src="http://pighip.jpg2.kr/eunbi/2020/06/23/20200623_78t_02.jpg"> 
					<img src="http://pighip.jpg2.kr/eunbi/2020/06/23/20200623_78t_03.jpg"> 
					<img src="http://pighip.jpg2.kr/eunbi/2020/06/23/20200623_78t_04.jpg"> <br> <br> <br> <br> <br>
					<br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> 
					<img src="http://pighip.jpg2.kr/eunbi/2020/06/23/20200623_78t_00.jpg">
				</center>
				<center style="margin: 0px; text-align: center;">
					<br> <br> <br> <br>&nbsp;
				</center>
				<center></center>
				<center style="margin: 0px; text-align: center;">&nbsp;</center>
				<center></center>
				<center style="margin: 0px; text-align: center;">&nbsp;</center>
				<center></center>
				<center style="margin: 0px; text-align: center;">
					<br> <br> <br> <br> <br> <br> <img src="http://pighip.jpg2.kr/eunbi/2018/05/28/dv.jpg">&nbsp;
				</center>
				<center></center>
				<center style="margin: 0px; text-align: center;">
					<br> <img src="http://pighip.jpg2.kr/eunbi/2020/06/23/20200623_78t_d.jpg">
				</center>
				<center></center>
				<center style="margin: 0px; text-align: center;">
					<br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>&nbsp;
				</center>
				<center></center>
				<center style="margin: 0px; text-align: center;">
					<br>
				</center>
				<center></center>
				<center>
					<a href="http://www.pighip.co.kr/board/board.html?code=pighip_board1&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=999941&amp;num2=00000&amp;number=2&amp;lock=N">
						<img src="http://pighip.jpg2.kr/yj/2018/01/23/s-tip.jpg">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					</a>
					<a href="http://www.pighip.co.kr/board/board.html?code=pighip_board1&amp;page=1&amp;type=v&amp;board_cate=&amp;num1=999906&amp;num2=00000&amp;number=10&amp;lock=N">
						<img src="http://pighip.jpg2.kr/yj/2018/01/23/w-tip.jpg">
					</a>
				</center>
				<center></center>
				<center style="margin: 0px; text-align: center;">
					<br> <br> <br> <br> <br> <br> <img src="http://pighip.jpg2.kr/eunbi/2020/06/01/kr.jpg"><br>
				</center>
				<center></center>
				<!-- s: 상품 일반정보(상품정보제공 고시) -->
				<!-- e: 상품 일반정보(상품정보제공 고시) -->
				<!-- 쿠폰 관련 부분 -->
				<!-- 쿠폰관련 부분 끝 -->
				<!-- 몰티비 플레이어 노출 위치 -->
				<div id="malltb_video_player" style="margin-top: 10px; margin-bottom: 10px; text-align: center; display: none;"></div>
			</div>
			<!-- 메뉴바 -->
			<div class="detailmenu" id="withitem">
				<ul>
					<li><a href="#detail">DETAIL</a></li>
					<li class="selected"><a href="#withitem">WITH ITEM</a></li>
					<li><a href="#review">REVIEW</a></li>
					<li><a href="#qna">QNA</a></li>
					<li><a href="#readme">READ ME</a></li>
				</ul>
			</div>
			<form name="allbasket" method="post" action="/shop/basket.html">
				<h3 class="detail-title">WITH ITEM</h3>
				<div class="prd-list">
					<table summary="상품이미지, 상품 설명, 가격">
						<caption>관련 상품 리스트</caption>
						<tbody>
							<tr>
								<td width="16.666%;">
									<table border="0" cellpadding="0" cellspacing="0" style="width: 170px; margin: 0 auto;">
										<tbody>
											<tr>
												<td><div class="thumb">
														<a href="/shop/shopdetail.html?branduid=23321&amp;xcode=&amp;mcode=&amp;scode=&amp;GfDT=am93UA%3D%3D">
														<img class="MS_prod_img_s" src="/shopimages/pighip/0340010004763.gif?1590737949" alt="상품 섬네일" title="상품 섬네일"></a>
													</div></td>
											</tr>
											<tr>
												<td><div class="prd-name">
														<a href="/shop/shopdetail.html?branduid=23321&amp;xcode=&amp;mcode=&amp;scode=&amp;GfDT=am93UA%3D%3D">86project_boy pants 유니언니가 인스타에서 추천한 바지 ♥♥<br> 색감 하나하나 너무 예뻐요 !<br> 컬러
															추가되어 재진행합니다 :)
														</a>
													</div></td>
											</tr>
											<tr>
												<td>
													<div -class="prd-price">

														<ul>
															<li class="prd-price">22,000원</li>
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
											<tr>
												<td>
													<div class="option_select">
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
														<div>
															사이즈 : <select id="optionlist0_1" name="optionlist0[]" onchange="seloptvalue();display_coll_option_stock('PS', 0);" mandatory="Y" class="MS_related_option vo_value_list">
																<option value="">--- 필수 옵션입니다 ---</option>
																<option value="S" origin="S">S</option>
																<option value="M" origin="M">M</option>
															</select><input type="hidden" id="uid0" name="uid0" value="23321"> <input type="hidden" id="option_type0" name="option_type0" value="PS"> <input type="hidden" name="spcode">
															<input type="hidden" name="spcode2"> <input type="hidden" id="JsonData0" name="JsonData0" value="YY"> <input type="hidden" id="collprice0" name="collprice0"
																value="22000"><input type="hidden" id="colloptprice0_1" name="colloptprice0_1" value="0"><input type="hidden" id="colloptprice0_2" name="colloptprice0_2" value="0">
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div class="prd-amount">
														<input type="text" name="quantity" value="1" size="4" style="text-align: right; float: left;" class="MS_related_quantity"> <span class="btns"> <a class="btn-up"
															href="javascript:collquan_control('0', 'up');">수량증가</a> <a class="btn-dw" href="javascript:collquan_control('0', 'down');">수량감소</a>
														</span>
													</div>
												</td>
											</tr>
											<tr>
												<td><div class="prd-check">
														<input type="checkbox" name="collbasket" value="034001000476" class="MS_related_checkbox">
													</div></td>
											</tr>
										</tbody>
									</table>
								</td>
								<td width="16.666%;">
									<table border="0" cellpadding="0" cellspacing="0" style="width: 170px; margin: 0 auto;">
										<tbody>
											<tr>
												<td><div class="thumb">
														<a href="/shop/shopdetail.html?branduid=23900&amp;xcode=&amp;mcode=&amp;scode=&amp;GfDT=aGt3UA%3D%3D">
														<img class="MS_prod_img_s" src="/shopimages/pighip/0140130004853.gif?1579222241" alt="상품 섬네일" title="상품 섬네일"></a>
													</div></td>
											</tr>
											<tr>
												<td><div class="prd-name">
														<a href="/shop/shopdetail.html?branduid=23900&amp;xcode=&amp;mcode=&amp;scode=&amp;GfDT=aGt3UA%3D%3D">silver.루덴E 확실히 포인트 되면서도<br> 얼굴 작아 보이게 만들어주는<br> 사랑스러운 이어링이에요 ♥
														</a>
													</div></td>
											</tr>
											<tr>
												<td>
													<div -class="prd-price">

														<ul>
															<li class="prd-price">34,000원</li>
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
											<tr>
												<td>
													<div class="option_select">
														<div>
															<input type="hidden" name="spcode">
														</div>
														<div>
															<input type="hidden" name="spcode2">
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div class="prd-amount">
														<input type="text" name="quantity" value="1" size="4" style="text-align: right; float: left;" class="MS_related_quantity"> <span class="btns"> <a class="btn-up"
															href="javascript:collquan_control('1', 'up');">수량증가</a> <a class="btn-dw" href="javascript:collquan_control('1', 'down');">수량감소</a>
														</span>
													</div>
												</td>
											</tr>
											<tr>
												<td><div class="prd-check">
														<input type="checkbox" name="collbasket" value="014013000485" class="MS_related_checkbox">
													</div></td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="related-allbasket">
					<a href="javascript:send_multi('2', '', 'relation', '')"><img src="/shop/image/detail/allbasket.gif" align="absmiddle" border="0"></a>
				</div>
				<input type="hidden" name="collbasket"> 
				<input type="hidden" name="totalnum" value="2"> 
				<input type="hidden" name="spcode"> 
				<input type="hidden" name="spcode2"> 
				<input type="hidden" name="quantity"> 
				<input type="hidden" name="collbrandcode"> 
				<input type="hidden" name="aramount"> 
				<input type="hidden" name="arspcode"> 
				<input type="hidden" name="arspcode2"> 
				<input type="hidden" name="optionindex"> 
				<input type="hidden" name="alluid"> 
				<input type="hidden" name="alloptiontype"> 
				<input type="hidden" name="aropts"> 
				<input type="hidden" name="checktype"> 
				<input type="hidden" name="ordertype"> 
				<input type="hidden" name="brandcode" value="033001001272">
				<input type="hidden" name="branduid" value="24348"> 
				<input type="hidden" name="xcode" value="033"> 
				<input type="hidden" name="mcode" value="001"> 
				<input type="hidden" name="typep" value="X"> 
				<input type="hidden" name="allpackageuid"> 
				<input type="hidden" name="cart_free" value=""> 
				<input type="hidden" name="collbasket_type" value="Y">
			</form>


			<a name="reviewboard"></a>
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
			<div id="powerReview">
				<div class="hd-t">
					<h2>POWER REVIEW</h2>
					<div class="pr-btn-list">
						<a href="/board/power_review.html">전체리뷰</a>
					</div>
				</div>
				<!-- .hd-t -->
				<div id="writePowerReview">
					<div class="PR15N01-write">
						<form name="prw_form" id="prw_form" action="" method="post" autocomplete="off">
							<input type="hidden" name="action_type" value=""> 
							<input type="hidden" name="product_uid" value="24348"> 
							<input type="hidden" name="ordernum" value=""> 
							<input type="hidden" name="basketnum" value=""> 
							<input type="hidden" name="write_type" value="DETAIL"> 
							<input type="hidden" name="score1" value="5">
							<div class="pr-txtbox">
								<textarea name="content">리뷰 게시판은 ' 정상적으로 판매된 제품 ' 에 대한 고객님들의 의견 게시판입니다.
해당 게시판에 남겨주실 경우 구매 확정 의사가 있으신 걸로 간주됩니다.

오배송&amp;불량건 그 외의 이유로 대처를 해드려야 하는 경우의 리뷰건은 임의로 삭제처리되며, 
고객센터(02-457-0944) 또는 성격에 맞는 게시판으로 문의부탁드립니다 :) 

감사합니다 ♥ </textarea>
								<textarea style="display: none" name="board_writeword">리뷰 게시판은 ' 정상적으로 판매된 제품 ' 에 대한 고객님들의 의견 게시판입니다.
해당 게시판에 남겨주실 경우 구매 확정 의사가 있으신 걸로 간주됩니다.

오배송&amp;불량건 그 외의 이유로 대처를 해드려야 하는 경우의 리뷰건은 임의로 삭제처리되며, 
고객센터(02-457-0944) 또는 성격에 맞는 게시판으로 문의부탁드립니다 :) 

감사합니다 ♥ </textarea>
								<div class="thumb-wrap"></div>
							</div>
						</form>
					</div>
					<!-- .PR15N01-write -->
					<div class="PR15N01-recmd">
						<div class="star-list" star_key="1">
							<span class="bull">▼</span> <a href="#none"><em>★★★★★</em><span class="survey">아주만족</span></a>
							<ul>
								<li><a href="#none"><em>★★★★★</em><span class="survey">아주만족</span></a></li>
								<li><a href="#none"><em>★★★★</em><span class="survey">만족</span></a></li>
								<li><a href="#none"><em>★★★</em><span class="survey">보통</span></a></li>
								<li><a href="#none"><em>★★</em><span class="survey">미흡</span></a></li>
								<li><a href="#none"><em>★</em><span class="survey">불만족</span></a></li>
							</ul>
						</div>
						<div class="cvr good">
							<a class="lnk-good" href="javascript:power_review_like();"><span>좋아요 <em class="cnt-like">+0</em></span></a>
						</div>
						<div class="cvr tooltip">
							<a class="lnk-benefit" href="#tooltip"><span>리뷰혜택</span></a>
							<div id="tooltip">
								<span class="bull"></span>
								<p>
									글 (5줄이상) : 500원<br> 사진 (전신착용사진) : 500원<br> <br> 글(5줄이상) + 사진(전신착용사진) : 1,000원
								</p>
							</div>
							<!-- #tooltip -->
						</div>

						<div class="cvr">
							<div id="files" class="files"></div>
							<form name="prw_file_form" id="prw_file_form" action="http://board.makeshop.co.kr/upload.html" method="post" enctype="multipart/form-data">
								<input type="hidden" name="type" value="upload"> 
								<input type="hidden" name="servername" value="special16"> 
								<input type="hidden" name="url" value="www.pighip.co.kr"> 
								<input type="hidden" name="code" value="pighip_board3"> 
								<input type="hidden" name="size" value="2048000"> 
								<input type="hidden" name="org" value="pighip"> 
								<input type="hidden" name="maxsize" value=""> 
								<input type="hidden" name="Btype" value=""> 
								<input type="hidden" name="img_resize" value="N"> 
								<input type="hidden" name="img_maxwidth" value=""> 
								<input type="hidden" name="gallery_type"> 
								<input type="hidden" name="form_name" value="power_review"> 
								<input type="hidden" name="mini_bgcolor" value="">
								<input type="hidden" name="mini_size" value="100"> 
								<input type="hidden" name="mini_space" value=""> 
								<input type="hidden" name="fileobj_name" value="file_name1"> 
								<input type="hidden" name="device_type" value="PC"> 
									<a class="pr-lnk-photo" href="#none"><input type="file" name="file" class="trick file-attach" id="fileupload"><span>사진추가</span></a>
							</form>
						</div>
						<div class="cvr right">
							<a class="lnk-review" href="javascript:power_review_submit();"><span>리뷰등록</span></a>
						</div>
					</div>
					<!-- .PR15N01-recmd -->
				</div>
				<div class="PR15N01-info" style="padding-right: 393px;">
					<dl class="score">
						<dt>0.0</dt>
						<dd>
							총 리뷰 수 (<strong>0</strong>)
						</dd>
					</dl>
					<div class="chart">
						<ul>
							<li><span class="tit">아주만족</span> <span class="bar"> <span class="abs" style="width: 1%"></span> <span class="num" style="left: 100%">()</span>
							</span></li>
							<li><span class="tit">만족</span> <span class="bar"> <span class="abs" style="width: 1%"></span> <span class="num" style="left: 100%">()</span>
							</span></li>
							<li><span class="tit">보통</span> <span class="bar"> <span class="abs" style="width: 1%"></span> <span class="num" style="left: 100%">()</span>
							</span></li>
							<li><span class="tit">미흡</span> <span class="bar"> <span class="abs" style="width: 1%"></span> <span class="num" style="left: 100%">()</span>
							</span></li>
							<li><span class="tit">불만족</span> <span class="bar"> <span class="abs" style="width: 1%"></span> <span class="num" style="left: 100%">()</span>
							</span></li>
						</ul>
					</div>

					<div class="photo" style="width: 388px;">
						<p class="none">
							IMAGE<br> <br>리뷰를 작성해주세요.<br>첫 리뷰 작성 시, 특별한 혜택을 드립니다.
						</p>
					</div>
				</div>
				<!-- .PR15N01-info -->

				<div class="PR15N01-hd">
					<h2>
						프리미엄 상품평 <span>(0개)</span>
					</h2>
					<div class="pr-photo-toggle pr-photo-toggle-sort">
						<a href="javascript:power_review_list_toggle();">포토리뷰 모아보기</a>
					</div>
					<ul class="sort">
						<li class="now" val="date"><a href="javascript:power_review_sort('date');">최신 순</a></li>
						<li val="score"><a href="javascript:power_review_sort('score');">평점 순</a></li>
						<li "="" val="good"><a href="javascript:power_review_sort('good');">추천 순</a></li>
					</ul>
				</div>
				<!-- .PR15N01-hd -->
				<div id="listPowerReview" class="MS_power_review_list"></div>
				<div id="updatePowerReview" class="MS_power_review_update"></div>
				<div id="layerReplyModify" style="display: none">
					<div class="layer-wrap">
						<a class="close-layer" href="#layerReplyModify">닫기</a>
						<form name="pruc" id="pruc_form" action="/shop/power_review_comment.action.html" method="post" autocomplete="off">
							<div class="wrt">
								<textarea name="update_comment"></textarea>
							</div>
						</form>
						<div class="ctr">
							<a class="modify" href="javascript:power_review_update_comment();">수정</a>
						</div>
					</div>
					<!-- .layer-wrap -->
				</div>
				<!-- #layerReplyModify -->
			</div>
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
				<table summary="번호, 제목, 작성자, 작성일, 조회">
					<caption>QnA 리스트</caption>
					<tbody>
						<tr class="nbg ndata">
							<td colspan="5"><div class="tb-center">등록된 문의가 없습니다.</div></td>
						</tr>
					</tbody>
				</table>

				<ol class="paging">

					<li><a href="/shop/shopdetail.html?branduid=24348&amp;xcode=033&amp;mcode=001&amp;qnapage=1#brandqna_list">1</a></li>

				</ol>
			</div>
			<!-- .qna-list -->

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












	<%@ include file="../include/serviceArea.jsp"%>
</div>
<!-- end of content__box -->
<%@ include file="../include/aside.jsp"%>
<%@ include file="../include/footer.jsp"%>