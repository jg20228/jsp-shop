function send(id,totalPrice) {
	
	var IMP = window.IMP; // 생략가능
	IMP.init('imp59848808'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	
	IMP.request_pay({
	    pg : 'inicis', // version 1.1.0부터 지원.
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '주문명:결제테스트',
	    amount : totalPrice,
	    buyer_email : '${sessionScope.principal.email}',
	    buyer_name : '${sessionScope.principal.name}',
	    buyer_tel : '${sessionScope.principal.phone}',
	    buyer_addr : '${sessionScope.principal.address}',
	    buyer_postcode : '123-456',
	    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
	}, function(rsp) {
	    if ( rsp.success ) {
	        var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	        $.ajax({
	    		type: "post",
	    		url: "/shop/user?cmd=paymentProc",
	    		data: "id="+id+"&totalPrice="+totalPrice,
	    		contentType: "application/x-www-form-urlencoded; charset=utf-8",
	    		dataType: "text"
	    	}).done(function(result){
	    		location.href="/shop/user?cmd=order&id="+id;
	    	}).fail(function(error){
	    		alert("결제가 비정상적으로 처리됨. 관리자에게 문의 하세요.");
	    	});
	        
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	});
}