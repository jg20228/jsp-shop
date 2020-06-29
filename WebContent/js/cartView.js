function overcase(obj, cnt) {
	obj._tid = setTimeout('imgview(' + cnt + ')', 200);
}

function outcase(obj, cnt) {
	document.getElementById('deliverycase' + cnt).style.display = 'none';
	clearTimeout(obj._tid);
}

function imgview(cnt) {
	document.getElementById('deliverycase' + cnt).style.display = 'block';
}

function basket_estimate() {
	window.open('about:blank', 'basket_estimate',
			'height=600,width=750,scrollbars=yes');
	document.getElementById('estform').submit();
}

function deleteCart(cartId) {
	$.ajax({
		type : "get",
		url : "/shop/user?cmd=deleteCart&cartId=" + cartId,
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType : "text"
	}).done(function(result) {
		location.href = location.href;
	}).fail(function(error) {
		alert("실패");
	});
}

function deleteWish(wishId) {
	$.ajax({
		type : "get",
		url : "/shop/user?cmd=deleteWishList&wishId=" + wishId,
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType : "text"
	}).done(function(result) {
		location.href = location.href;
	}).fail(function(error) {
		alert("실패");
	});
}