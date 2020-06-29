function addCart(id) {
	$.ajax({
		type : "get",
		url : "/shop/product?cmd=addCart&id="+id+"&cart="+document.cookie,
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType : "text"
	}).done(function(result) {
		alert("성공");
	}).fail(function(error) {
		alert("실패");
	});
}

function addCartTest(productId, memberId) {
	$.ajax({
		type : "get",
		url : "/shop/product?cmd=addCartTest&productId="+productId+"&memberId="+memberId,
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType : "text"
	}).done(function(result) {
		alert("성공");
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