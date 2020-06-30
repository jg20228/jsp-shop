<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp"%>
<%@ include file="/include/preloader.jsp"%>
<%@ include file="/include/header.jsp"%>
<%@ include file="/include/nav.jsp"%>
<div class="content__box">
	<div id="content">
		<div id="myOrder">
			<h2 class="tit-page">ORDER</h2>
			<div class="page-body">
				<p class="t-box-msg">
					<strong>[이원재]</strong>님이 쇼핑몰에서 주문한 내역입니다.
				</p>
				<div class="table-d2-list">
					<table summary="번호, 주문일자, 상품명, 결제금액, 주문상세, 배송현황">
						<caption>주문내역</caption>
						<colgroup>
							<col width="90">
							<col width="115">
							<col width="*">
							<col width="120">
							<col width="90">
						</colgroup>
						<thead>
							<tr>
								<th scope="row"><div class="tb-center">번호</div></th>
								<th scope="row"><div class="tb-center">주문일자</div></th>
								<th scope="row"><div class="tb-center">상품명</div></th>
								<th scope="row"><div class="tb-center">결제금액</div></th>
								<th scope="row"><div class="tb-center">주문상세</div></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><div class="tb-center">번호</div></td>
								<td><div class="tb-center">2020-06-30</div></td>
								<td><div class="tb-center">test1</div></td>
								<td><div class="tb-center">30,000</div></td>
								<td><div class="tb-center">detail링크</div></td>
							</tr>
						</tbody>
						
<!-- 					<tbody>
							<tr>
								<td colspan="5"><div class="tb-center">주문내역이 없습니다.</div></td>
							</tr>
						</tbody> -->
					</table>
				</div>
				<ol class="paging">
				</ol>
				<ul class="foot-dsc">
					<li>상품명 또는 주문상세의 조회 버튼을 클릭하시면, 주문상세 내역을 확인하실 수 있습니다.</li>
					<li>배송현황의 조회 버튼을 클릭하시면, 해당 주문의 배송 현황을 한눈에 확인하실 수 있습니다.</li>
				</ul>
			</div>
			<!-- .page-body -->
		</div>
		<!-- #myOrder -->
	</div>
</div>
<%@ include file="/include/aside.jsp"%>
<%@ include file="/include/footer.jsp"%>