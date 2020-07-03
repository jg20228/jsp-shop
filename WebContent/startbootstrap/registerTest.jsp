<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/startbootstrap/include/head.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- 섬머노트 -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>



<body class="bg-gradient-primary">

	<div class="container">

		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<div class="my-5"></div>
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-12 d-none d-lg-block">
						<!-- d-flex를 주면 안에있는 div들이 block->inline으로 바뀜 -->
						<div class="d-flex justify-content-center">
							<!-- 애들이 inline으로 바뀌고 정렬이 힘들어서 div로 또 감싸서 함 -->
							<form action="/shop/admin?cmd=" method="post"
								enctype="multipart/form-data">
								<div class="form-group">
									<img id="img__wrap" onerror="img/plz.png" src="img/plz.png" width="850px"
										height="560px" />
								</div>
								<!-- form이 이 사이에 여백을 만들어줌 -->
								<div class="form-group bg-light">
									<!-- name 정확하게, id 미리보기에 쓸려고 + id는 -를 안쓰고 _를 쓴다 라이브러리는 _, 내가만든건 __ -->
									<input type="file" name="userProfile" id="img__preview" />
								</div>

								<input type="hidden" name="id"
									value="${sessionScope.principal.id}" />
						</div>
					</div>
					<div class="col-lg-12">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
							</div>
							<div class="form-group row">
								<div class="col-sm-4 mb-3 mb-sm-0">
									<input type="text" class="form-control form-control-user"
										id="exampleFirstName" placeholder="상품 이름">
								</div>
								<div class="col-sm-4">
									<input type="text" class="form-control form-control-user"
										id="exampleLastName" placeholder="type">
								</div>
								<div class="col-sm-4">
									<input type="text" class="form-control form-control-user"
										id="exampleLastName" placeholder="price">
								</div>
							</div>
							<div class="form-group">
								<input type="email" class="form-control form-control-user"
									id="exampleInputEmail" placeholder="titleComment">
							</div>
							<!-- 섬머노트 -->
							<div class="form-group">
								<label for="content">Content:</label>
								<textarea id="summernote" class="form-control" rows="5"
									id="content" name="content"></textarea>
							</div>
							<div class="form-group">
								<button class="btn btn-primary w-100">상품 등록</button>
							</div>
							</form>
							<hr>
						</div>
					</div>
				</div>
			</div>
		</div>

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

			// 숙제
			// 여기서 이 사이즈를 넘어가면 2MB 넘어가므로 취소시킴
			// f.size= 1024*1024*2
			if (f.size > 1024 * 1024 * 2) {
				alert("이미지는 2MB 이하만 가능합니다.");
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
