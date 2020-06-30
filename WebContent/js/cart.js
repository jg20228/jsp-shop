function addCart(productId, memberId) {
	$.ajax({
		type : "get",
		url : "/shop/product?cmd=addCart&productId="+productId+"&memberId="+memberId,
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType : "text"
	}).done(function(result) {
		if(result==0){
			alert("10개를 초과 할 수 없습니다.")
		}else{
			alert("성공");
		}
		
	}).fail(function(error) {
		alert("실패");
	});
}

function addWishList(productId, memberId){
	$.ajax({
		type : "get",
		url : "/shop/product?cmd=addWishList&productId="+productId+"&memberId="+memberId,
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType : "text"
	}).done(function(result) {
		if(result==1){
			alert("추가되었습니다.");
		}else{
			alert("이미 있는 물품입니다.");
		}
	}).fail(function(error) {
		alert("실패");
	});
}