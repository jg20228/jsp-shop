function now(id, sort){
    this.sort = sort;
    var _val = sort.length > 0 ? sort : 'new';
    $('ul.sort > li', '#powerReview').removeClass('now');
    $('ul.sort > li[val='+_val+']', '#powerReview').addClass('now');
	$.ajax({
		type : "post",
	   	url: "/shop/review?cmd=now",
	   	data : "id="+id,
	   	contentType : "application/x-www-form-urlencoded; charset=utf-8",
	   	dataType: "json"
	}).done(function (result){
		$("#reviewList").empty();
		renderTableList(result);
	}).fail(function(){
		alert("실패");
	})
	
}

function score(id, sort){
	this.sort = sort;
	var _val = sort.length > 0 ? sort : 'new';
    $('ul.sort > li', '#powerReview').removeClass('now');
    $('ul.sort > li[val='+_val+']', '#powerReview').addClass('now');
	$.ajax({
		type : "post",
	   	url: "/shop/review?cmd=score",
	   	data : "id=" +id,
	   	contentType : "application/x-www-form-urlencoded; charset=utf-8",
	   	dataType: "json"
	}).done(function (result){
		$("#reviewList").empty();
		renderTableList(result);
	}).fail(function(){
		alert("실패");
	})

}

function renderTableList(reviewDtos) {
		
	for (var reviewDto of reviewDtos) {
		$("#reviewList").append(makeTableItem(reviewDto));
	}
		
}

function makeTableItem(reviewDto) {
	var html = `<li id="power_review_block856384" class="power-review-list-box">`;
	html += `<div class="hd-box">`;
	html += `<ul class="desc">`;
	html += `<li class="pr-list-writer">작성자 : ${reviewDto.username}</li>`;
	html += `<li class="pr-list-date">등록일 : ${reviewDto.review.reviewDate}</li>`;
	html += 	`</ul>`;
	html += 	`<div class="star-icon">`;
	html +=		`<span class="star">`;
	html +=		`<em>`;
	for (var i = 1; i<=`${reviewDto.review.star}`;i++) {
		html +=	`★`;
		}
	/*html +=		`<c:forEach var="i" begin="1" end="${reviewDto.review.star}">`;

	html +=		`</c:forEach>`;*/
	
	html +=		`</em>`;
	html +=		`</span>`;
	html +=		`<span class="survey">${reviewDto.level}</span>`;
	html +=	 `</div>`;
	html += `</div>`;
	html += `<!-- <dl class="pr-options" style="display: block;">`;
	html += `<dt class="emp">구매한 옵션</dt>`;
	html += 	`<dd class="emp">색상 : 크림</dd>`;
	html += `</dl>  -->	`;
	html += `<div class="content">`;
	html += 	`<p class="content_p">`;
	html += 	`<a href="javascript:power_review_more('856384', '00000');" class="more-options">`;
	html +=  `${reviewDto.review.content}`;
	html += 	`</a>`;
	html += `<a class="pr-close"	href="javascript:power_review_more_close('856384');">...`;
	html += `<span>▲ 닫기</span>`;
	html += `</a>`;
	html +=`</p>`;
	html += `</div>`;
	html += `</li>`;
		
return 	html;
}

// 관리자를 위한 것 
function deleteById(id){
	$.ajax({
		type: "post",
		url: "/MVC/productController?cmd=deleteProc",
		data: "id="+id,
		contentType: "application/x-www-form-urlencoded; charset=utf-8",
		dataType: "text"
	}).done(function(result){
		if(result =="1"){
			alert("아이템 삭제 성공");
			var item = $("#item-"+id);
			item.remove();
		} else{
			alert("아이템 삭제 실패");
		}
		
	}).fail(function(error){
		alert("아이템 삭제 실패2");
	});
}