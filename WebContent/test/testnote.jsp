<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp"%>
<%@ include file="/include/preloader.jsp"%>
<%@ include file="/include/header.jsp"%>
<%@ include file="/include/nav.jsp"%>	

<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script>
//JQuery 충돌 처리를한다 (function( $ ) { })( jQuery );
jQuery.noConflict();

(function( $ ) {
	$(document).ready(function() {
		$('#summernote').summernote({
			tabsize : 2,
			height : 300
		});
	});
})( jQuery );

</script>

<div class="content__box">
	<div class="container">
		<form action="/shop/board?cmd=noticeWriteProc" method="POST">
	
			<div class="form-group">
				<label for="title">Title:</label> <input type="text"
					class="form-control" placeholder="title" id="title" name="title">
			</div>
	
			<div class="form-group">
				<label for="content">Content:</label>
				<textarea id="summernote" class="form-control" rows="5" id="content"
					name="content"></textarea>
			</div>
	
			<button type="submit" class="btn btn-primary">글쓰기 등록</button>
		</form>
	</div>

<!-- end of content__box -->
	<%@ include file="/include/serviceArea.jsp"%>
</div>
<!-- end of content__box -->

<%@ include file="/include/aside.jsp"%>
<%@ include file="/include/footer.jsp"%>
