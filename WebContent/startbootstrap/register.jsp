<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/startbootstrap/include/head.jsp"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- 섬머노트 -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<body class="bg-gradient-primary">
	<div class="container">
		<form action="/shop/admin?cmd=productRegistrationProc" method="post" enctype="multipart/form-data">
			<div class="card o-hidden border-0 shadow-lg my-5">
				<div class="card-body p-0">
					<div class="my-5"></div>
					<!-- Nested Row within Card Body -->
					<div class="row">
						<div class="col-lg-12">
							<!-- d-flex를 주면 안에있는 div들이 block->inline으로 바뀜 -->
							<div class="row">
								<!-- 애들이 inline으로 바뀌고 정렬이 힘들어서 div로 또 감싸서 함 -->
								<div class="form-group col-lg-12">
									<p style="text-align: center;">
										<img id="img__wrap" onerror="/shop/startbootstrap/img/plzW.png" src="/shop/startbootstrap/img/plzW.png"
											width="850px" height="560px" align="middle"/>
									</p>
								</div>
								
								<!-- form이 이 사이에 여백을 만들어줌 -->
								<div class="col-lg-4"></div>
								<div class="form-group bg-light col-lg-4">
									<!-- name 정확하게, id 미리보기에 쓸려고 + id는 -를 안쓰고 _를 쓴다 라이브러리는 _, 내가만든건 __ -->
									<input type="file" name="thumbnailW" id="img__preview" />
								</div>
								<div class="col-lg-4"></div>
							</div>
							
							<div>
								<div class="row">
									<!-- 가로 -->
									<div class="col-lg-4"></div>
									<div class="form-group col-lg-4">
										<img id="img__wrap2" onerror="/shop/startbootstrap/img/plzH.png" src="/shop/startbootstrap/img/plzH.png"
											width="275px" height="360px" />
									</div>
									<div class="col-lg-4"></div>
								</div>
								<div class="row">
									<!-- 세로 -->
									<div class="col-lg-4"></div>
									<!-- form이 이 사이에 여백을 만들어줌 -->
									<div class="form-group col-lg-4 bg-light">
										<!-- name 정확하게, id 미리보기에 쓸려고 + id는 -를 안쓰고 _를 쓴다 라이브러리는 _, 내가만든건 __ -->
										<input type="file" name="thumbnailH" id="img__preview2" />
									</div>
									<div class="col-lg-4"></div>
								</div>
							</div>
						</div>
						
						<div class="col-lg-12">
							<div class="p-5">
								<div class="text-center">
									<h1 class="h4 text-gray-900 mb-4">Create an Product!</h1>
								</div>
								<div class="form-group row">
								
									<div class="col-sm-4 mb-3 mb-sm-0">
										<input type="text" class="form-control form-control-user"
											name="name" id="name" placeholder="상품 이름">
									</div>
									
									<div class="col-sm-4">
										<select name="type" id="type" class="form-control form-control-user">
											<c:forEach var="opt" items="${categories}">
												<option value="${opt.type},${opt.id}">${opt.type}</option>
											</c:forEach>
										</select>
									</div>
									
									<div class="col-sm-4">
										<input type="number" class="form-control form-control-user"
											name="price" id="price" placeholder="price">
									</div>
								</div>
								<div class="form-group">
									<input type="text" class="form-control form-control-user"
										name="titleComment" id="titleComment" placeholder="titleComment">
								</div>
								<!-- 섬머노트 -->
								<div class="form-group">
									<label for="contents">Contents:</label>
									<textarea id="summernote" class="form-control" rows="5"
										id="contents" name="contents"></textarea>
								</div>
								<div class="form-group">
									<button class="btn btn-primary w-100">상품 등록</button>
								</div>

								<hr>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>

	<script>
		(function($) {
			$(document).ready(function() {
				$('#summernote').summernote({
					tabsize : 2,
					height : 300
				});
			});
		})(jQuery);

		$("#img__preview").on("change", function(e) {
			console.log(e.target.files);

			// 이미지 2가지 방법
			console.log(e.target.files[0].type.match("image*"));
			console.log(e.target.files[0].type.includes("image"));

			// files에 사진이 여러개 돌아가면 배열로 돌려서 찾아야한다!
			var f = e.target.files[0];

			// 자바스크립트에 match는 정규식으로 형태가 맞는지 아닌지 찾음
			if (!f.type.match("image*")) {
				alert("이미지만 첨부할 수 있습니다.");
				$("#img__preview").val('');
				return;
			}

			var reader = new FileReader();

			// 바인딩된 이벤트
			reader.onload = function(e) {
				$("#img__wrap").attr("src", e.target.result);
				// console.log(e.target.result);
			};

			// 비동기 실행
			reader.readAsDataURL(f);
		});

		$("#img__preview2").on("change", function(e) {
			console.log(e.target.files);

			// 이미지 2가지 방법
			console.log(e.target.files[0].type.match("image*"));
			console.log(e.target.files[0].type.includes("image"));

			// files에 사진이 여러개 돌아가면 배열로 돌려서 찾아야한다!
			var f = e.target.files[0];

			// 자바스크립트에 match는 정규식으로 형태가 맞는지 아닌지 찾음
			if (!f.type.match("image*")) {
				alert("이미지만 첨부할 수 있습니다.");
				$("#img__preview").val('');
				return;
			}

			var reader = new FileReader();

			// 바인딩된 이벤트
			reader.onload = function(e) {
				$("#img__wrap2").attr("src", e.target.result);
				// console.log(e.target.result);
			};

			// 비동기 실행
			reader.readAsDataURL(f);
		});
	</script>

	<!-- Bootstrap core JavaScript-->
	<script src="/shop/startbootstrap/vendor/jquery/jquery.min.js"></script>
	<script
		src="/shop/startbootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="/shop/startbootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/shop/startbootstrap/js/sb-admin-2.min.js"></script>

</body>

</html>
