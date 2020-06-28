<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp"%>
<%@ include file="/include/preloader.jsp"%>
<%@ include file="/include/header.jsp"%>
<%@ include file="/include/nav.jsp"%>	

<div class="content__box">
	<div class="container">
		<form action="/blog5/board?cmd=writeProc" method="POST">
	
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
<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			tabsize : 2,
			height : 300
		});
	});
</script>
<!-- end of content__box -->
	<%@ include file="/include/serviceArea.jsp"%>
</div>
<!-- end of content__box -->

<%@ include file="/include/aside.jsp"%>
<%@ include file="/include/footer.jsp"%>
