<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/shop/css/product/review.css">
<script type="text/javascript" src="/shop/js/review.js"></script>
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
				<input type="hidden" name="action_type" value=""> 
				<input type="hidden" name="product_uid" value="24155"> 
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
		<!-- 리뷰 작성하는 기능들 모음 -->
		<div class="PR15N01-recmd">
			<!-- 별기능 -->
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
			<!-- 좋아요 기능 -->
			<div class="cvr good">
				<a class="lnk-good" href="javascript:power_review_like();"><span>좋아요 <em class="cnt-like">+1</em></span></a>
			</div>
			<!-- 리뷰혜택 설명 -->
			<div class="cvr tooltip">
				<a class="lnk-benefit" href="#tooltip"><span>리뷰혜택</span></a>
				<div id="tooltip" style="display: none;">
					<span class="bull"></span>
					<p>
						글 (5줄이상) : 500원<br> 사진 (전신착용사진) : 500원<br> <br> 글(5줄이상) + 사진(전신착용사진) : 1,000원
					</p>
				</div>
				<!-- #tooltip -->
			</div>
			<!-- 사진 추가 버튼 -->
			<div class="cvr">
				<div id="files" class="files"></div>
				<form name="prw_file_form" id="prw_file_form" action="http://board.makeshop.co.kr/upload.html" method="post" enctype="multipart/form-data">
					<input type="hidden" name="type" value="upload"> 
					<input type="hidden" name="servername" value="special16"> 
					<input type="hidden" name="url" value="www.pighip.co.kr"> 
					<input type="hidden" name="code" value="pighip_board3"> 
					<input type="hidden" name="size" value="2048000"> 
					<input type="hidden" name="org" value="pighip"> 
					<input type="hidden" name="maxsize" value=""> <input type="hidden" name="Btype" value=""> 
					<input type="hidden" name="img_resize" value="N"> 
					<input type="hidden" name="img_maxwidth" value="">
					<input type="hidden" name="gallery_type"> 
					<input type="hidden" name="form_name" value="power_review"> 
					<input type="hidden" name="mini_bgcolor" value=""> 
					<input type="hidden" name="mini_size" value="100"> 
					<input type="hidden" name="mini_space" value=""> 
					<input type="hidden" name="fileobj_name" value="file_name1"> 
					<input type="hidden" name="device_type" value="PC"> 
					<a class="pr-lnk-photo" href="#none">
					<input type="file" name="file" class="trick file-attach" id="fileupload"><span>사진추가</span></a>
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
			<dt>5.0</dt>
			<dd>
			<!-- 총 리뷰 수  -->
				총 리뷰 수 (<strong>21</strong>)
			</dd>
		</dl>
		<div class="chart">
			<ul>
				<li>
					<span class="tit">아주만족</span> 
					<span class="bar"> 
						<span class="abs" style="width: 95%"></span> 
						<!-- 단계마다 갯수 -->
						<span class="num" style="left: 100%">(20)</span>
					</span>
				</li>
				<li>
					<span class="tit">만족</span> 
					<span class="bar"> 
						<span class="abs" style="width: 5%"></span> 
						<!-- 단계마다 갯수 -->
						<span class="num" style="left: 100%">(1)</span>
					</span>
				</li>
				<li>
					<span class="tit">보통</span> 
					<span class="bar"> 
						<span class="abs" style="width: 0%"></span> 
						<!-- 단계마다 갯수 -->
						<span class="num" style="left: 100%">(0)</span>
					</span>
				</li>
				<li>
					<span class="tit">미흡</span> 
					<span class="bar"> 
						<span class="abs" style="width: 0%"></span> 
						<!-- 단계마다 갯수 -->
						<span class="num" style="left: 100%">(0)</span>
					</span>
				</li>
				<li>
					<span class="tit">불만족</span> 
					<span class="bar"> 
						<span class="abs" style="width: 0%"></span> 
						<!-- 단계마다 갯수 -->
						<span class="num" style="left: 100%">(0)</span>
					</span>
				</li>
			</ul>
		</div>
<!--  		사진8장 부분 foreach문으로?8장만? -->
		<div class="photo" style="width: 388px;">
			<ul>
				<li>
					<a href="javascript:power_review_view_show('856654','00000', 0, 'photo');">
						<span></span>
						<!-- 사진한장 -->
						<img src="/shop/image/detail/review(1).jpg" alt="">
					</a>
				</li>
				<li>
					<a href="javascript:power_review_view_show('856730','00000', 0, 'photo');">
						<span></span>
						<!-- 사진 두장 -->
						<img src="http://board.makeshop.co.kr/board/special16/pighip_board3/square::200425130214.jpeg" alt="">
					</a>
				</li>
				<li>
					<a href="javascript:power_review_view_show('856731','00000', 0, 'photo');">
						<span></span>
						<!-- 사진 세장 -->
						<img src="http://board.makeshop.co.kr/board/special16/pighip_board3/square::200425125859.jpeg" alt="">
					</a>
				</li>
				<li>
					<a href="javascript:power_review_view_show('856742','00000', 0, 'photo');">
						<span></span>
						<img src="http://board.makeshop.co.kr/board/special16/pighip_board3/square::200424222141.jpeg" alt="">
					</a>
				</li>
				<li>
					<a href="javascript:power_review_view_show('856846','00000', 0, 'photo');">
						<span></span>
						<img src="http://board.makeshop.co.kr/board/special16/pighip_board3/square::200421162102_ro.jpeg" alt="">
					</a>
				</li>
				<li>
					<a href="javascript:power_review_view_show('856940','00000', 0, 'photo');">
						<span></span>
						<img src="http://board.makeshop.co.kr/board/special16/pighip_board3/square::200418133405_ro.jpeg" alt="">
					</a>
				</li>
				<li>
					<a href="javascript:power_review_view_show('857027','00000', 0, 'photo');">
						<span></span>
						<img src="http://board.makeshop.co.kr/board/special16/pighip_board3/square::20200416_124140_1.jpg" alt="">
					</a>
				</li>
			</ul>
		</div>
	</div>
	<!-- .PR15N01-info -->

	<div class="PR15N01-hd">
		<h2>
		<!-- 상품평이 몇개 - 이 상품의 후기가 총 몇개 인지 -->
			프리미엄 상품평 <span>(21개)</span>
		</h2>
		<!-- 여기 누르는 곳 4개는 ajax로 할것같은데 -->
		<div class="pr-photo-toggle pr-photo-toggle-sort">
			<a href="javascript:power_review_list_toggle();">포토리뷰 모아보기</a>
		</div>
		<ul class="sort">
			<li class="now" val="date">
				<a href="javascript:power_review_sort('date');">최신 순</a>
			</li>
			<li val="score">
				<a href="javascript:power_review_sort('score');">평점 순</a>
			</li>
			<li "="" val="good">
				<a href="javascript:power_review_sort('good');">추천 순</a>
			</li>
		</ul>
	</div>
	<!-- .PR15N01-hd -->
	<div id="listPowerReview" class="MS_power_review_list">
	<!-- 후기 하나 하나들 시작 -->
		<ul class="PR15N01-review-wrap">
		<!-- 후기1 -->
			<li id="power_review_block856384" class="power-review-list-box">
				<div class="hd-box">
					<ul class="desc">
														<!-- 작성자 product.username -->
						<li class="pr-list-writer">작성자 : cli******</li>
														<!-- 등록일 review.reviewDate -->
						<li class="pr-list-date">등록일 : 2020-05-08</li>
														<!-- 조회수 - 모델 review에 추가 할까 아님 여기를 지울까 -->
						<li class="pr-list-hit">조회수 : <span id="power_review_showhits">22</span></li>
					</ul>
					<!-- 별점, 만족도, 아이콘 - 안쓸거면 지ㅇ ㅜ... -->
					<div class="star-icon">
						<!-- 별점 나타내기 -->
						<span class="star"><em>★★★★★</em></span> 
						<!--  별점에 따른 만족도 나타내기 -->
						<span class="survey">아주만족</span> 
						<span class="icon"> 
						<!-- 이건 무엇을 위한 아이콘인지 모르겠음 -->
							<img src="/images/d3/modern_simple/ico_mobile_h38.png" alt="mobile">
						</span>
					</div>
				</div>
				<!-- 옵션 나타내는 부분 -->
				<dl class="pr-options" style="display: block;">
					<dt class="emp">구매한 옵션</dt>
					<dd class="emp">색상 : 크림</dd>
				</dl>
				<!-- 드디어 상품 후기 내용 부분 -->
				<div class="content">
					<p class="content_p">
						<a href="javascript:power_review_more('856384', '00000');" class="more-options">
						<!-- ${} 이 부분에 review.content 뿌리기-->
						</a>
						<a class="pr-close"	href="javascript:power_review_more_close('856384');">...
							<span>▲ 닫기</span>
						</a>
					</p>
					<!--  이거 누르면 상품의 이 후기의 댓글 작성란이 나오게 되어있는 듯-->
					<div class="ctr"></div>
				</div>
				<!-- 이 후기가 좋아요, 싫어요, 이 후기에 대한 댓글 작성란 나오게 하기 위해 누를 곳-->
				<div class="reply">
					<a class="cnt" href="javascript:power_review_view_comment('856384', '856384');">1 ▼</a> 
					<span class="pr-txt">이 리뷰가 도움이 되셨나요?</span> 
					<a class="yes" href="javascript:power_review_good('856384', 'N', 'shopdetail');">
						<span>0</span>
					</a> 
					<a class="no" href="javascript:power_review_bad('856384', 'N', 'shopdetail');">
						<span>0</span>
					</a>
				</div>
				<!-- 댓글  작성, 수정, 삭제-->
				<div class="reply-wrap" style="display: none;">
					<div class="wrt">
						<textarea name="comment">댓글을 작성해 주세요~</textarea>
						<a href="javascript:power_review_comment_write('856384', '856384');">입력</a>
					</div>
					<ul class="lst">
						<li class="cw"></li>
						<li class="block_comment">
							<dl>
								<dt class="replace_icon">replace_writer</dt>
								<dd>
									<p>replace_comment</p>
									<div class="ctr" replace_btn="">
										<a class="modify" href="replace_link_modify">수정</a> 
										<a class="delete" href="replace_link_del">삭제</a>
									</div>
								</dd>
							</dl>
						</li>
					</ul>
				</div>
			</li>
			<!-- 그 다음 후기 -->
			
		<!-- 후기 하나하나들 끝! -->
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