<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp"%>
<%@ include file="/include/preloader.jsp"%>
<%@ include file="/include/header.jsp"%>
<%@ include file="/include/nav.jsp"%>

<style>
/* BASIC css start */
/*#content {width:1240px;}*/

#content { width: 1160px; padding:40px 125px 0 35px;}
#prdSearch .search-wrap { width: 755px; padding:35px 65px; margin:0 auto; border:1px solid #ccc;}
#prdSearch .search-wrap table {margin:0 auto; width:auto;}
#prdSearch .search-wrap .search-hd { display:none; }
#prdSearch .search-wrap .search-cont { }
#prdSearch .search-wrap .search-cont th { font-weight: normal; text-align: right; }
#prdSearch .search-wrap .search-cont th,
#prdSearch .search-wrap .search-cont td {padding:3px 0 3px 10px;}
#prdSearch .search-wrap .search-cont .input-keyword,
#prdSearch .search-wrap .search-cont .input-price { padding: 1px; border: 1px solid #d1d1d1; margin-right: 0; }
#prdSearch .search-wrap .search-cont .input-keyword { width: 180px; }
#prdSearch .search-wrap .search-cont .input-price { width: 83px; }
/* BASIC css end */
</style>

<div class="content__box">
	<div id="content">
		<div id="prdSearch">
			<h2 class="tit-page">SEARCH</h2>
			<div class="search-wrap">
				<form name="form_search" id="search_form" action="shopbrand.html"
					method="POST">
					<input type="hidden" name="search_category" value=""> <input
						type="hidden" name="search" value=""> <input type="hidden"
						name="more" value="">
					<fieldset>
						<legend>상품 검색 폼</legend>
						<h3 class="search-hd">검색어: </h3>
						<div class="search-cont">
							<table summary="제품명/키워드">
								<caption>상품 검색 정보</caption>
								<colgroup>
									<col width="50">
									<col width="200">
									<col width="90">
									<col width="200">
									<col width="">
								</colgroup>
								<tbody>
									<tr>
										<th>제품명/키워드</th>
										<td><input type="text" name="prize1"
											class="MS_input_txt input-keyword" size="16" value=""
											onkeydown="SearchKey(event);"></td>
										<td rowspan="2"><a href="javascript:mk_search();"><img
												src="/shop/image/btn_search.gif" alt="검색" title="검색"></a></td>
									</tr>
								</tbody>
							</table>
						</div>
					</fieldset>
				</form>
			</div>
			<div class="item-wrap">
				<div class="item-info">
					<div class="item-total">
						총 <span>1</span>개의 상품이 검색되었습니다.
					</div>
					<ul class="item-order">
						<li><a href="javascript:sendsort('price')">낮은가격</a><span>|</span></li>
						<li><a href="javascript:sendsort('price2')">높은가격</a><span>|</span></li>
						<li><a href="javascript:sendsort('brandname')">상품명</a><span>|</span></li>
						<li><a href="javascript:sendsort('product')">제조사</a><span>|</span></li>
						<li><a href="javascript:sendsort('order');">신상품</a><span>|</span></li>
						<li><a href="javascript:sendsort('sellcnt')">인기상품</a></li>
					</ul>
				</div>
				<div class="item-cont">

					<dl class="item-list">
						<!-- foreach -->
						<dt>
							<!-- 사진 + 링크 -->
							<a
								href="/shop/shopdetail.html?branduid=24371&amp;search=%25B7%25B9%25C0%25CC%25C3%25BF&amp;sort=order&amp;xcode=021&amp;mcode=002&amp;scode=&amp;GfDT=aWp3UQ%3D%3D"><img
								class="MS_prod_img_s"
								src="/shopimages/pighip/0210020002593.jpg?1593496488"
								alt="상품 섬네일" title="상품 섬네일"></a>
						</dt>
						<dd>
							<ul>
								<li class="prd-name"><span class="MK-product-icons"><img
										src="/shopimages/pighip/prod_icons/106?1516184274"
										class="MK-product-icon-2"></span> 레이첼cardigan</li>

								<li class="prd-price">15,000원</li>

								<li class="subname">활용도 높은 반팔 니트 가디건이에요 ♥<br> 얇은 소재로
									여름에도 입기 좋아요 !
								</li>
								<li class="preview"><a
									href="javascript:viewdetail('021002000259', '', '');"><img
										src="/images/common/view_shopdetail.gif" alt="미리보기"
										title="미리보기"></a></li>
								<li class="soldout"></li>
							</ul>
						</dd>
						<!-- foreach -->
					</dl>
				</div>
			</div>
		</div>
		<!-- #prdSearch -->
	</div>
</div>
<!-- end of content__box -->
<%@ include file="/include/aside.jsp"%>
<script src="/shop/js/cart.js"></script>
<%@ include file="/include/footer.jsp"%>