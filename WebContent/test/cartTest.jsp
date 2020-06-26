<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<button onclick=addCart(1)>1234</button>
</body>

<script>
function addCart(id) {
	var cart=`${cart}`;
	if(typeof cart == "undefined"){
		alert("값 알수업승ㅁ");
	}else{
		alert(cart);
	}

	data = {
			add : id,
			cart : `${cart}`
	}
	
	$.ajax({
		type : "post",
		url : "/shop/product?cmd=addCart",
		data : data,
		contentType : "application/json; charset=utf-8",
		dataType : "text"
	}).done(function(result) {
		alert("성공");
	}).fail(function(error) {
		alert("실패");
	});
}
</script>
</html>