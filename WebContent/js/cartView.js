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

function updateCart(productId, memberId, idx) {
	if (document.getElementById('basket_form' + idx)) {
		var _form = document.getElementById('basket_form' + idx);
	} else {
		var _form = (document.getElementsByName('forms'))[idx];
	}
	var amount = parseInt(_form.amount.value);

	$.ajax({
			type : "get",
			url : "/shop/user?cmd=updateCart&productId="+ productId + "&memberId=" + memberId+ "&amount=" + amount,
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

// ///////////////////////////////////////////
function count_change(change_type, idx) {
	if (document.getElementById('basket_form' + idx)) {
		var _form = document.getElementById('basket_form' + idx);
	} else {
		var _form = (document.getElementsByName('forms'))[idx];
	}

	var amount = parseInt(_form.amount.value);
	if (typeof _form.min_add_amount == 'undefined') {
		var min_add_amount = 1;
	} else {
		var min_add_amount = parseInt(_form.min_add_amount.value);
	}

	if (change_type == 0 && amount < 10) {
		amount += min_add_amount;
	} else if (change_type == 1) {
		if (amount > 1) {
			amount -= min_add_amount;
		}
	}
	if ((amount % min_add_amount) != 0) {
		amount = Math.floor(amount / min_add_amount) * min_add_amount;
		if (amount == 0)
			amount = min_add_amount;
	}
	_form.amount.value = amount;
}


//시간이 난다면 promise를 사용
function go_cart(productId, memberId, wishId) {
	
	$.ajax({
		type : "get",
		url : "/shop/user?cmd=deleteWishList&wishId=" + wishId,
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType : "text"
	}).done(function(result) {
	}).fail(function(error) {
		alert("실패");
	});
	
	$.ajax({
		type : "get",
		url : "/shop/product?cmd=addCart&productId=" + productId + "&memberId=" + memberId,
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType : "text"
	}).done(function(result) {
	}).fail(function(error) {
			alert("실패");
	});
	setTimeout(function() {location.href = location.href}, 1000);
}

function go_wish(productId, memberId, cartId) {
	$.ajax({
		type : "get",
		url : "/shop/user?cmd=deleteCart&cartId=" + cartId,
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType : "text"
	}).done(function(result) {
	
	}).fail(function(error) {
		alert("실패");
	});
	
	$.ajax({
		type : "get",
		url : "/shop/product?cmd=addWishList&productId=" + productId + "&memberId=" + memberId,
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		dataType : "text"
	}).done(function(result) {
	
	}).fail(function(error) {
			alert("실패");
	});
	setTimeout(function() {location.href = location.href}, 1000);
}