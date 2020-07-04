<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/shop/css/product/review.css">
<script type="text/javascript" src="/shop/js/review.js"></script>
<script type="text/javascript" src="/shop/js/fileupload.js"></script>
<script type="text/javascript" src="/shop/js/myReview.js"></script>
<div id="powerReview">
	<div class="hd-t">
		<h2>POWER REVIEW</h2>
		<div class="pr-btn-list">
		<!-- 여기를 누르면 전체 리뷰를 볼 수 있는 곳으로 페이지 이동됨.. -->
			<a href="/board/power_review.html">전체리뷰</a>
		</div>
	</div>
	<!-- .hd-t -->
	<div id="writePowerReview">
		<div class="PR15N01-write">
			<form name="prw_form" id="prw_form" action="" method="post" autocomplete="off">
			<div class="pr-txtbox">
			
				<textarea name="content" onclick="this.value=''">리뷰 게시판은 ' 정상적으로 판매된 제품 ' 에 대한 고객님들의 의견 게시판입니다.
해당 게시판에 남겨주실 경우 구매 확정 의사가 있으신 걸로 간주됩니다.

오배송&amp;불량건 그 외의 이유로 대처를 해드려야 하는 경우의 리뷰건은 임의로 삭제처리되며, 
고객센터(02-457-0944) 또는 성격에 맞는 게시판으로 문의부탁드립니다 :) 
감사합니다 ♥

</textarea>
				<textarea style="display: none" name="board_writeword" onclick="this.value=''">
리뷰 게시판은 ' 정상적으로 판매된 제품 ' 에 대한 고객님들의 의견 게시판입니다.
해당 게시판에 남겨주실 경우 구매 확정 의사가 있으신 걸로 간주됩니다.

오배송&amp;불량건 그 외의 이유로 대처를 해드려야 하는 경우의 리뷰건은 임의로 삭제처리되며, 
고객센터(02-457-0944) 또는 성격에 맞는 게시판으로 문의부탁드립니다 :) 
감사합니다 ♥ 

</textarea>

					<div class="thumb-wrap"></div>
				</div>
			</form>
		</div>
		<!-- .PR15N01-write -->
		<!-- 리뷰 작성하는 기능들 모음 -->
		<div class="PR15N01-recmd">
			<!-- 사진 추가 버튼 -->
			<div class="cvr">
				<div id="files" class="files"></div>
				<form name="prw_file_form" id="prw_file_form" action="http://board.makeshop.co.kr/upload.html" method="post" enctype="multipart/form-data">
					<a class="pr-lnk-photo" href="#none">
						<input type="file" name="file" class="trick file-attach" id="fileupload">
						<span>사진추가</span>
					</a>
				</form>
			</div>
			<!-- 리뷰 등록하기 : 여기를 누르면 후기가 작성 됨 -->
			<div class="cvr right">
				<a class="lnk-review" href="javascript:power_review_submit();"><span>리뷰등록</span></a>
			</div>
		</div>
		<!-- .PR15N01-recmd -->
	</div>
	<!-- 리뷰정보 : 평균별점, 총 리뷰수, 5단계마다 갯수, 사진들 8장 -->
	<div class="PR15N01-info" style="padding-right: 393px;">
		<dl class="score">
			<dt>${dtos.starDto.sum/dtos.starDto.totalCount}</dt>
			<dd>
			<!-- 총 리뷰 수  -->
				총 리뷰 수 (<strong>${dtos.starDto.totalCount}</strong>)
			</dd>
		</dl>
		<div class="chart">
			<ul>
				<li>
					<span class="tit">아주만족</span> 
					<span class="bar"> 
					<!-- 각 단계 별 건수/총건수 width 값으로 넣기-->
						<span class="abs" style="width: ${dtos.starDto.five/dtos.starDto.totalCount*100}%"></span> 
						<!-- 단계마다 갯수 -->
						<span class="num" style="left: 100%">(${dtos.starDto.five})</span>
					</span>
				</li>
				<li>
					<span class="tit">만족</span> 
					<span class="bar"> 
						<span class="abs" style="width: ${dtos.starDto.four/dtos.starDto.totalCount*100}%"></span> 
						<!-- 단계마다 갯수 -->
						<span class="num" style="left: 100%">(${dtos.starDto.four})</span>
					</span>
				</li>
				<li>
					<span class="tit">보통</span> 
					<span class="bar"> 
						<span class="abs" style="width: ${dtos.starDto.three/dtos.starDto.totalCount*100}%"></span> 
						<!-- 단계마다 갯수 -->
						<span class="num" style="left: 100%">(${dtos.starDto.three})</span>
					</span>
				</li>
				<li>
					<span class="tit">미흡</span> 
					<span class="bar"> 
						<span class="abs" style="width: ${dtos.starDto.two/dtos.starDto.totalCount*100}%"></span> 
						<!-- 단계마다 갯수 -->
						<span class="num" style="left: 100%">(${dtos.starDto.two})</span>
					</span>
				</li>
				<li>
					<span class="tit">불만족</span> 
					<span class="bar"> 
						<span class="abs" style="width: ${dtos.starDto.one/dtos.starDto.totalCount*100}%"></span> 
						<!-- 단계마다 갯수 -->
						<span class="num" style="left: 100%">(${dtos.starDto.one})</span>
					</span>
				</li>
			</ul>
		</div>
<!--  		사진8장 부분 foreach문으로?8장만? -->
		<div class="photo" style="width: 388px;">
			<ul>
			<!-- 포이치문 -->
			<c:forEach var="reviewDto" items="${dtos.reviewDtos}">
				<li>
					<a href="javascript:power_review_view_show('856654','00000', 0, 'photo');">
						<span></span>
						<img src="${reviewDto.review.photo}" alt="">
					</a>
				</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<!-- .PR15N01-info -->

	<div class="PR15N01-hd">
		<h2>
		<!-- 상품평이 몇개 - 이 상품의 후기가 총 몇개 인지 -->
			프리미엄 상품평 <span>(${dtos.starDto.totalCount}개)</span>
		</h2>
		<!-- 여기 누르는 곳 4개는 ajax로 할것같은데 -->
		
		<!-- ajax로 값퍼올리기 정렬하기 -->
		<ul class="sort">
			<li class="now" val="date">
				<a href="javascript:now(${dtos.product.id},'date');">최신 순</a>
			</li>
			<li val="score">
				<a href="javascript:score(${dtos.product.id},'score');">평점 순</a>
			</li>
			<!-- <li val="good">
				<a href="javascript:power_review_sort('good');" onclick="추천순()">추천 순</a>
			</li> -->
		</ul>
	</div>
	<!-- .PR15N01-hd -->
	<div id="listPowerReview" class="MS_power_review_list">
	<!-- 후기 하나 하나들 시작 -->
		<ul class="PR15N01-review-wrap" id="reviewList">
		<!-- 후기1 -->
		<!-- for each -->
		<c:forEach var="reviewDto" items="${dtos.reviewDtos}">
			<li id="power_review_block856384" class="power-review-list-box">
				<div class="hd-box">
					<ul class="desc">
														<!-- 작성자 product.username -->
						<li class="pr-list-writer">작성자 : ${reviewDto.username}</li>
														<!-- 등록일 review.reviewDate -->
						<li class="pr-list-date">등록일 : ${reviewDto.review.reviewDate}</li>
					</ul>
					<!-- 별점, 만족도, 아이콘 - 안쓸거면 지ㅇ ㅜ... -->
					<div class="star-icon">
						<!-- 별점 나타내기 -->
						<span class="star">
							<em>
							<c:forEach var="i" begin="1" end="${reviewDto.review.star}">
							★
							</c:forEach>
							</em>
						</span> 
						<!--  별점에 따른 만족도 나타내기 -->
						<span class="survey">${reviewDto.level}</span> 
					</div>
				</div>
				<!-- 옵션 나타내는 부분 -->
			<!-- <dl class="pr-options" style="display: block;">
					<dt class="emp">구매한 옵션</dt>
					<dd class="emp">색상 : 크림</dd>
				</dl>  -->	
				<!-- 드디어 상품 후기 내용 부분 -->
				<div class="content">
					<p class="content_p">
						<a href="javascript:power_review_more('856384', '00000');" class="more-options">
						<!-- el표현식{} 이 부분에 review.content 뿌리기-->
						 ${reviewDto.review.content}
						</a>
						<a class="pr-close"	href="javascript:power_review_more_close('856384');">...
							<span>▲ 닫기</span>
						</a>
					</p>
					<!--  이거 누르면 상품의 이 후기의 댓글 작성란이 나오게 되어있는 듯-->
					
				</div>
				<!-- 이 후기가 좋아요, 싫어요, 이 후기에 대한 댓글 작성란 나오게 하기 위해 누를 곳-->
				
				<!-- 댓글  작성, 수정, 삭제-->
			</li>
			</c:forEach>
			</ul>
			<!-- foreach문 끝! -->
			<!-- 그 다음 후기 -->
		<!-- .PR15N01-review-wrap -->
		<!-- 여기부터는 다 페이징 -->
		<div class="paging">
			<a class="now" href="#none"><span>1</span></a> 
			<a href="javascript:power_review_page('2');">
				<span>2</span>
			</a> 
			<a href="javascript:power_review_page('3');">
				<span>3</span>
			</a> 
			<a href="javascript:power_review_page('4');">
				<span>4</span>
			</a> 
			<a href="javascript:power_review_page('5');">
				<span>5</span>
			</a> 
			<a class="nnext" href="javascript:power_review_page('5');">
				<img src="/images/d3/modern_simple/btn/btn_h15_review_nnext.gif" alt="">
			</a>
		</div>
		<!-- .paging -->
	</div>
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


<script>


#prw_form)

</script>