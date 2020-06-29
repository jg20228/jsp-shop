<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/shop/css/product/review.css">
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
				<input type="hidden" name="action_type" value=""> <input type="hidden" name="product_uid" value="24155"> <input type="hidden" name="ordernum" value=""> <input type="hidden"
					name="basketnum" value=""> <input type="hidden" name="write_type" value="DETAIL"> <input type="hidden" name="score1" value="5">
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
				<a class="lnk-good" href="javascript:power_review_like();"><span>좋아요 <em class="cnt-like">+1</em></span></a>
			</div>
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
			<div class="cvr right">
				<a class="lnk-review" href="javascript:power_review_submit();"><span>리뷰등록</span></a>
			</div>
		</div>
		<!-- .PR15N01-recmd -->
	</div>
	<div class="PR15N01-info" style="padding-right: 393px;">
		<dl class="score">
			<dt>5.0</dt>
			<dd>
				총 리뷰 수 (<strong>21</strong>)
			</dd>
		</dl>
		<div class="chart">
			<ul>
				<li><span class="tit">아주만족</span> <span class="bar"> <span class="abs" style="width: 95%"></span> <span class="num" style="left: 100%">(20)</span>
				</span></li>
				<li><span class="tit">만족</span> <span class="bar"> <span class="abs" style="width: 5%"></span> <span class="num" style="left: 100%">(1)</span>
				</span></li>
				<li><span class="tit">보통</span> <span class="bar"> <span class="abs" style="width: 0%"></span> <span class="num" style="left: 100%">(0)</span>
				</span></li>
				<li><span class="tit">미흡</span> <span class="bar"> <span class="abs" style="width: 0%"></span> <span class="num" style="left: 100%">(0)</span>
				</span></li>
				<li><span class="tit">불만족</span> <span class="bar"> <span class="abs" style="width: 0%"></span> <span class="num" style="left: 100%">(0)</span>
				</span></li>
			</ul>
		</div>

		<div class="photo" style="width: 388px;">
			<ul>
				<li><a href="javascript:power_review_view_show('856654','00000', 0, 'photo');"><span></span><img
						src="http://board.makeshop.co.kr/board/special16/pighip_board3/square::20200427_172721_2.jpg" alt=""></a></li>
				<li><a href="javascript:power_review_view_show('856730','00000', 0, 'photo');"><span></span><img src="http://board.makeshop.co.kr/board/special16/pighip_board3/square::200425130214.jpeg"
						alt=""></a></li>
				<li><a href="javascript:power_review_view_show('856731','00000', 0, 'photo');"><span></span><img src="http://board.makeshop.co.kr/board/special16/pighip_board3/square::200425125859.jpeg"
						alt=""></a></li>
				<li><a href="javascript:power_review_view_show('856742','00000', 0, 'photo');"><span></span><img src="http://board.makeshop.co.kr/board/special16/pighip_board3/square::200424222141.jpeg"
						alt=""></a></li>
				<li><a href="javascript:power_review_view_show('856846','00000', 0, 'photo');"><span></span><img
						src="http://board.makeshop.co.kr/board/special16/pighip_board3/square::200421162102_ro.jpeg" alt=""></a></li>
				<li><a href="javascript:power_review_view_show('856940','00000', 0, 'photo');"><span></span><img
						src="http://board.makeshop.co.kr/board/special16/pighip_board3/square::200418133405_ro.jpeg" alt=""></a></li>
				<li><a href="javascript:power_review_view_show('857027','00000', 0, 'photo');"><span></span><img
						src="http://board.makeshop.co.kr/board/special16/pighip_board3/square::20200416_124140_1.jpg" alt=""></a></li>
			</ul>
		</div>
	</div>
	<!-- .PR15N01-info -->

	<div class="PR15N01-hd">
		<h2>
			프리미엄 상품평 <span>(21개)</span>
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
	<div id="listPowerReview" class="MS_power_review_list">

		<ul class="PR15N01-review-wrap">
			<li id="power_review_block856384" class="power-review-list-box">
				<div class="hd-box">
					<ul class="desc">
						<li class="pr-list-writer">작성자 : cli******</li>
						<li class="pr-list-date">등록일 : 2020-05-08</li>
						<li class="pr-list-hit">조회수 : <span id="power_review_showhits">22</span></li>
					</ul>
					<div class="star-icon">
						<span class="star"><em>★★★★★</em></span> <span class="survey">아주만족</span> <span class="icon"> <img src="/images/d3/modern_simple/ico_mobile_h38.png" alt="mobile">
						</span>
					</div>
				</div>
				<dl class="pr-options" style="display: block;">
					<dt class="emp">구매한 옵션</dt>
					<dd class="emp">색상 : 크림</dd>
				</dl>
				<div class="content">
					<p class="content_p">
						<a href="javascript:power_review_more('856384', '00000');" class="more-options">배송빠르고감사핮니당다른색상두사구싶어용ㅋㅌㅋㅋ재질두좋앗어용!ㅋ가격대비괜찮은상품인거같아용ㅋㅋㅌ</a><a class="pr-close"
							href="javascript:power_review_more_close('856384');">...<span>▲ 닫기</span></a>

					</p>
					<div class="ctr"></div>
				</div>
				<div class="reply">
					<a class="cnt" href="javascript:power_review_view_comment('856384', '856384');">1 ▼</a> <span class="pr-txt">이 리뷰가 도움이 되셨나요?</span> <a class="yes"
						href="javascript:power_review_good('856384', 'N', 'shopdetail');"><span>0</span></a> <a class="no" href="javascript:power_review_bad('856384', 'N', 'shopdetail');"><span>0</span></a>
				</div>
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
										<a class="modify" href="replace_link_modify">수정</a> <a class="delete" href="replace_link_del">삭제</a>
									</div>
								</dd>
							</dl>
						</li>
					</ul>
				</div>
			</li>
			<li id="power_review_block856446" class="power-review-list-box">
				<div class="hd-box">
					<ul class="desc">
						<li class="pr-list-writer">작성자 : kjh*****</li>
						<li class="pr-list-date">등록일 : 2020-05-07</li>
						<li class="pr-list-hit">조회수 : <span id="power_review_showhits">57</span></li>
					</ul>
					<div class="star-icon">
						<span class="star"><em>★★★★★</em></span> <span class="survey">아주만족</span> <span class="icon"> <img src="/images/d3/modern_simple/ico_mobile_h38.png" alt="mobile">
						</span>
					</div>
				</div>
				<dl class="pr-options" style="display: block;">
					<dt class="emp">구매한 옵션</dt>
					<dd class="emp">색상 : 라이트퍼플</dd>
				</dl>
				<div class="content">
					<p class="pr-content-simple">
						<a href="javascript:power_review_more('856446', '00000');">생각보다 날씨가 더워져서 ㅠ 낮엔 조금 다울 것 같고<br> 밤 낮으로 좋겠어용! 그렇다고 절대 두꺼운 재질은 아닌데<br> 얇지도 않은 그냥 보통 !!<br> 키 165-166쯤 되는데 길이 너무 괜찮아요<br>
							적당히 발목까지 툭 !
						</a><a class="pr-more" href="javascript:power_review_more('856446', '00000');">...<span>▼ 더보기</span></a>
					</p>
					<p class="pr-content-all">
						<a href="javascript:power_review_more_close('856446');">생각보다 날씨가 더워져서 ㅠ 낮엔 조금 다울 것 같고<br> 밤 낮으로 좋겠어용! 그렇다고 절대 두꺼운 재질은 아닌데<br> 얇지도 않은 그냥 보통 !!<br> 키 165-166쯤 되는데 길이 너무 괜찮아요<br>
							적당히 발목까지 툭 !<br> 지금 살 쪄서 66쯤 되는데도 편하구<br> 고무줄도 나름 탄탄 ㅋㅋ 색상도 똑같고 이쁘구<br> 가을쯤 재입고 해줌다면 다른색상두 살고에욤<br>
						</a><a class="pr-close" href="javascript:power_review_more_close('856446');">...<span>▲ 닫기</span></a>
					</p>
					<div class="ctr"></div>
				</div>
				<div class="reply">
					<a class="cnt" href="javascript:power_review_view_comment('856446', '856446');">1 ▼</a> <span class="pr-txt">이 리뷰가 도움이 되셨나요?</span> <a class="yes"
						href="javascript:power_review_good('856446', 'N', 'shopdetail');"><span>0</span></a> <a class="no" href="javascript:power_review_bad('856446', 'N', 'shopdetail');"><span>0</span></a>
				</div>
				<div class="reply-wrap" style="display: none;">
					<div class="wrt">
						<textarea name="comment">댓글을 작성해 주세요~</textarea>
						<a href="javascript:power_review_comment_write('856446', '856446');">입력</a>
					</div>
					<ul class="lst">
						<li class="cw"></li>
						<li class="block_comment">
							<dl>
								<dt class="replace_icon">replace_writer</dt>
								<dd>
									<p>replace_comment</p>
									<div class="ctr" replace_btn="">
										<a class="modify" href="replace_link_modify">수정</a> <a class="delete" href="replace_link_del">삭제</a>
									</div>
								</dd>
							</dl>
						</li>
					</ul>
				</div>
			</li>
			<li id="power_review_block856540" class="power-review-list-box">
				<div class="hd-box">
					<ul class="desc">
						<li class="pr-list-writer">작성자 : khm******</li>
						<li class="pr-list-date">등록일 : 2020-05-03</li>
						<li class="pr-list-hit">조회수 : <span id="power_review_showhits">45</span></li>
					</ul>
					<div class="star-icon">
						<span class="star"><em>★★★★★</em></span> <span class="survey">아주만족</span> <span class="icon"> <img src="/images/d3/modern_simple/ico_mobile_h38.png" alt="mobile">
						</span>
					</div>
				</div>
				<dl class="pr-options" style="display: block;">
					<dt class="emp">구매한 옵션</dt>
					<dd class="emp">색상 : 그레이</dd>
				</dl>
				<div class="content">
					<p class="content_p">
						<a href="javascript:power_review_more('856540', '00000');" class="more-options">하체비만이라 걱정했는데 품도 낙낙하고 길이도 좋네요<br> 하루종일 입으니 무릎나오는건 있지만<br> 그런건 어떤 바지든 있으니 어쩔 수 없고 ㅋㅋ<br> 다른컬러도
							사고싶네요!
						</a><a class="pr-close" href="javascript:power_review_more_close('856540');">...<span>▲ 닫기</span></a>

					</p>
					<div class="ctr"></div>
				</div>
				<div class="reply">
					<a class="cnt" href="javascript:power_review_view_comment('856540', '856540');">1 ▼</a> <span class="pr-txt">이 리뷰가 도움이 되셨나요?</span> <a class="yes"
						href="javascript:power_review_good('856540', 'N', 'shopdetail');"><span>0</span></a> <a class="no" href="javascript:power_review_bad('856540', 'N', 'shopdetail');"><span>0</span></a>
				</div>
				<div class="reply-wrap" style="display: none;">
					<div class="wrt">
						<textarea name="comment">댓글을 작성해 주세요~</textarea>
						<a href="javascript:power_review_comment_write('856540', '856540');">입력</a>
					</div>
					<ul class="lst">
						<li class="cw"></li>
						<li class="block_comment">
							<dl>
								<dt class="replace_icon">replace_writer</dt>
								<dd>
									<p>replace_comment</p>
									<div class="ctr" replace_btn="">
										<a class="modify" href="replace_link_modify">수정</a> <a class="delete" href="replace_link_del">삭제</a>
									</div>
								</dd>
							</dl>
						</li>
					</ul>
				</div>
			</li>
			<li id="power_review_block856654" class="power-review-list-box">
				<div class="hd-box">
					<ul class="desc">
						<li class="pr-list-writer">작성자 : blu******</li>
						<li class="pr-list-date">등록일 : 2020-04-27</li>
						<li class="pr-list-hit">조회수 : <span id="power_review_showhits">408</span></li>
					</ul>
					<div class="star-icon">
						<span class="star"><em>★★★★★</em></span> <span class="survey">아주만족</span> <span class="icon"> <img src="/images/d3/modern_simple/ico_camera_h38.png" alt="camera"> <img
							src="/images/d3/modern_simple/ico_mobile_h38.png" alt="mobile">
						</span>
					</div>
				</div>
				<dl class="pr-options" style="display: block;">
					<dt class="emp">구매한 옵션</dt>
					<dd class="emp">색상 : 크림</dd>
				</dl>
				<div class="content">
					<p class="content_p">
						<a href="javascript:power_review_more('856654', '00000');" class="more-options">겨울에 피그힙에서 샀던 조커팬츠 너무 잘 입었던지라 또 사고 싶었는데 키169 길이감 때문에 망설이다가 딱 업뎃되서 주문했어요 길이감좋구 만족해요 이뻐요~^^</a><a class="pr-close"
							href="javascript:power_review_more_close('856654');">...<span>▲ 닫기</span></a>

					</p>
					<div class="ctr"></div>
				</div>
				<div class="photo-list">
					<ul>
						<li><a href="javascript:power_review_view_show('856654', '00000', '0', 'detail');"><span></span><img
								src="http://board.makeshop.co.kr/board/special16/pighip_board3/square::20200427_172721_2.jpg" alt=""></a>
						<div class="attach-preview"></div></li>
					</ul>
				</div>
				<div class="reply">
					<a class="cnt" href="javascript:power_review_view_comment('856654', '856654');">1 ▼</a> <span class="pr-txt">이 리뷰가 도움이 되셨나요?</span> <a class="yes"
						href="javascript:power_review_good('856654', 'N', 'shopdetail');"><span>0</span></a> <a class="no" href="javascript:power_review_bad('856654', 'N', 'shopdetail');"><span>0</span></a>
				</div>
				<div class="reply-wrap" style="display: none;">
					<div class="wrt">
						<textarea name="comment">댓글을 작성해 주세요~</textarea>
						<a href="javascript:power_review_comment_write('856654', '856654');">입력</a>
					</div>
					<ul class="lst">
						<li class="cw"></li>
						<li class="block_comment">
							<dl>
								<dt class="replace_icon">replace_writer</dt>
								<dd>
									<p>replace_comment</p>
									<div class="ctr" replace_btn="">
										<a class="modify" href="replace_link_modify">수정</a> <a class="delete" href="replace_link_del">삭제</a>
									</div>
								</dd>
							</dl>
						</li>
					</ul>
				</div>
			</li>
			<li id="power_review_block856730" class="power-review-list-box">
				<div class="hd-box">
					<ul class="desc">
						<li class="pr-list-writer">작성자 : edc**</li>
						<li class="pr-list-date">등록일 : 2020-04-25</li>
						<li class="pr-list-hit">조회수 : <span id="power_review_showhits">361</span></li>
					</ul>
					<div class="star-icon">
						<span class="star"><em>★★★★★</em></span> <span class="survey">아주만족</span> <span class="icon"> <img src="/images/d3/modern_simple/ico_camera_h38.png" alt="camera"> <img
							src="/images/d3/modern_simple/ico_mobile_h38.png" alt="mobile">
						</span>
					</div>
				</div>
				<dl class="pr-options" style="display: block;">
					<dt class="emp">구매한 옵션</dt>
					<dd class="emp">색상 : 그레이</dd>
				</dl>
				<div class="content">
					<p class="pr-content-simple">
						<a href="javascript:power_review_more('856730', '00000');">무난한 그레이색상<br> 여기저기 다 입기좋아요 ㅎㅎ<br> 넉넉하구 핏도 예뻐요<br> 조거팬츠사면 제가 큰키가 아님에도 불구하고<br> 길이가 좀 짧은게 많더라구요ㅠㅜ 키 163
						</a><a class="pr-more" href="javascript:power_review_more('856730', '00000');">...<span>▼ 더보기</span></a>
					</p>
					<p class="pr-content-all">
						<a href="javascript:power_review_more_close('856730');">무난한 그레이색상<br> 여기저기 다 입기좋아요 ㅎㅎ<br> 넉넉하구 핏도 예뻐요<br> 조거팬츠사면 제가 큰키가 아님에도 불구하고<br> 길이가 좀 짧은게 많더라구요ㅠㅜ 키 163<br> 근데
							이 팬츠는 허리를 좀 올려 입어도 길이감이 좋아용<br> 다만 고무줄이 잘 돌아가요ㅠㅠ 입고벗을때 조심해야겠어요!!
						</a><a class="pr-close" href="javascript:power_review_more_close('856730');">...<span>▲ 닫기</span></a>
					</p>
					<div class="ctr"></div>
				</div>
				<div class="photo-list">
					<ul>
						<li><a href="javascript:power_review_view_show('856730', '00000', '0', 'detail');"><span></span><img
								src="http://board.makeshop.co.kr/board/special16/pighip_board3/square::200425130214.jpeg" alt=""></a>
						<div class="attach-preview"></div></li>
					</ul>
				</div>
				<div class="reply">
					<a class="cnt" href="javascript:power_review_view_comment('856730', '856730');">1 ▼</a> <span class="pr-txt">이 리뷰가 도움이 되셨나요?</span> <a class="yes"
						href="javascript:power_review_good('856730', 'N', 'shopdetail');"><span>0</span></a> <a class="no" href="javascript:power_review_bad('856730', 'N', 'shopdetail');"><span>0</span></a>
				</div>
				<div class="reply-wrap" style="display: none;">
					<div class="wrt">
						<textarea name="comment">댓글을 작성해 주세요~</textarea>
						<a href="javascript:power_review_comment_write('856730', '856730');">입력</a>
					</div>
					<ul class="lst">
						<li class="cw"></li>
						<li class="block_comment">
							<dl>
								<dt class="replace_icon">replace_writer</dt>
								<dd>
									<p>replace_comment</p>
									<div class="ctr" replace_btn="">
										<a class="modify" href="replace_link_modify">수정</a> <a class="delete" href="replace_link_del">삭제</a>
									</div>
								</dd>
							</dl>
						</li>
					</ul>
				</div>
			</li>
		</ul>
		<!-- .PR15N01-review-wrap -->
		<div class="paging">
			<a class="now" href="#none"><span>1</span></a> <a href="javascript:power_review_page('2');"><span>2</span></a> <a href="javascript:power_review_page('3');"><span>3</span></a> <a
				href="javascript:power_review_page('4');"><span>4</span></a> <a href="javascript:power_review_page('5');"><span>5</span></a> <a class="nnext" href="javascript:power_review_page('5');"><img
				src="/images/d3/modern_simple/btn/btn_h15_review_nnext.gif" alt=""></a>
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