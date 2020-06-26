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