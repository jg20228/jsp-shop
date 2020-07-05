<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
											width="850px" height="560px" align="middle" />
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
										<input type="text" class="form-control form-control-user" name="name" id="name" placeholder="상품 이름">
									</div>

									<!-- 카테고리 -->
									<div class="col-sm-2">
										<select name="type" id="type" class="form-control form-control-user">
											<c:forEach var="opt" items="${dto.categories}">
												<option value="${opt.type},${opt.id}">${opt.type}</option>
											</c:forEach>
										</select>
									</div>

									<!-- with 아이템 -->
									<div class="col-sm-2">
										<input type="hidden" name="with" value="" id="with">
										<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">With Item</button>
									</div>

									<div class="col-sm-4">
										<input type="number" class="form-control form-control-user" name="price" id="price" placeholder="price">
									</div>
								</div>
								<div class="form-group">
									<input type="text" class="form-control form-control-user" name="titleComment" id="titleComment"
										placeholder="titleComment">
								</div>
								<!-- 섬머노트 -->
								<div class="form-group">
									<label for="contents">Contents:</label>
									<textarea id="summernote" class="form-control" rows="5" id="contents" name="contents"></textarea>
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


			<!-- The Modal -->
			<div class="modal fade" id="myModal">
				<div class="modal-dialog modal-dialog-centered modal-lg">
					<div class="modal-content">

						<!-- Modal Header -->
						<div class="modal-header">
							<div style="justify-content : space-between;">
								<div>
									<h4 class="modal-title">상품에 보여줄 아이템을 선택하세요.</h4>
								</div>
								
								<div id="input-form">
	       						    검색 : <input type="text" id="keyword"/>
							    </div>
							</div>
							
							<div>
							 	   <button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>
						</div>

						<!-- Modal body -->
						<div class="modal-body" style="display: flex;">
						
							<table id="products" class="table table-hover">
								<thead>
									<tr>
										<th>NAME</th>
										<th>TYPE</th>
										<th>PHOTO</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="product" items="${dto.products}" varStatus="status">
										<tr id="withItems${status.count}">
											<td>${product.name}</td>
											<td>${product.type}</td>
											<td>
												<a href="javascript:addId(${product.id},${status.count});"> 
													<img id="withItemsImg${status.count}" src="${product.thumbnailH}" height="200" alt="#">
													<br><br>
												</a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						
							<table class="table table-hover">
								<thead>
									<tr>
										<th>NAME</th>
										<th>TYPE</th>
										<th>PHOTO</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="product" items="${dto.products}" varStatus="status">
										<tr id="addWithItems${status.count}">
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>

						<!-- Modal footer -->
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						</div>

					</div>
				</div>
			</div>
		</form>
	</div>

	<script>
		//검색기능
		
        $(document).ready(function() {
            $("#keyword").keyup(function() {
                var k = $(this).val();
                $("#products > tbody > tr").hide();
                var temp = $("#products > tbody > tr > td:nth-child(1):contains('" + k + "')");

                $(temp).parent().show();
            })
        })

		$('input[type="text"]').keydown(function() {
		  if (event.keyCode === 13) {
		    event.preventDefault();
		  };
		});

	
		function addId(id, num) {
			var str = ""
				var tdArr = new Array();	// 배열 선언
				var checkBtn = $('#withItems'+num);
				
				// checkBtn.parent() : checkBtn의 부모는 <td>이다.
				// checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
				var tr = checkBtn;
				var td = tr.children();
				
				console.log("클릭한 Row의 모든 데이터 : "+tr.text());
				
				var name = td.eq(0).text();
				var type = td.eq(1).text();
				var img = "src="+document.getElementById("withItemsImg"+num).src+" height=200 alt='#'> <br><br>"

				tdArr.push(name);
				tdArr.push(type);
				tdArr.push(img);
				
				console.log("배열에 담긴 값 : "+tdArr);
				
				str +=	"<td>" + name + "</td> <td>" + type + "</td>";
				str +=	"<td><a href='javascript:removeId("+id+","+num+");'> <img id=addWithItemsImg"+num+" "+ img + "</td>";
				
				$("#addWithItems" + num).append(str);	
				var a = $('#with').val();
				$('#with').val(a + id + ",");
				
				$("#withItems" + num).empty();
		}

		function removeId(id, num) {
			var str = ""
				var tdArr = new Array();	// 배열 선언
				var checkBtn = $('#addWithItems'+num);
				
				// checkBtn.parent() : checkBtn의 부모는 <td>이다.
				// checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
				var tr = checkBtn;
				var td = tr.children();
				
				console.log("클릭한 Row의 모든 데이터 : "+tr.text());
				
				var name = td.eq(0).text();
				var type = td.eq(1).text();
				var img = "src="+document.getElementById("addWithItemsImg"+num).src+" height=200 alt='#'> <br><br>"

				tdArr.push(name);
				tdArr.push(type);
				tdArr.push(img);
				
				console.log("배열에 담긴 값 : "+tdArr);
				
				str +=	"<td>" + name + "</td> <td>" + type + "</td>";
				str +=	"<td><a href='javascript:addId("+id+","+num+");'> <img id=withItemsImg"+num+" "+ img + "</td>";
				
				$("#withItems" + num).append(str);	
				
				var a = $('#with').val();
				var b = a.split(",");
				b.splice(b.indexOf(id+""),1);
				$('#with').val(b);
				console.log(b);
				
				$("#addWithItems" + num).empty();
		}

		//섬머노트
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
	<script src="/shop/startbootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/shop/startbootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/shop/startbootstrap/js/sb-admin-2.min.js"></script>

</body>

</html>
