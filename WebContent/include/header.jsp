<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!-- Header -->
<!-- 최상단 메뉴들 (로그인,회원가입,장바구니,내정보,주문,출석체크,북마크) -->
<header class="header shop">
	<!-- Topbar -->
	<div class="topbar">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-12">
					<!-- Top Right -->
					<div class="right-content">
						<ul class="list-main">
<!-- 							<li><i class="ti-power-off"></i><a href="/shop/user?cmd=login">Login</a></li> -->
<!-- 							<li><i class="ti-location-pin"></i><a href="/shop/user?cmd=join">JOIN</a></li> -->
<!-- 							<li><i class="ti-location-pin"></i><a href="/shop/user?cmd=cart">CART</a></li> -->
<!-- 							<li><i class="ti-user"></i> <a href="/shop/user?cmd=update">MYPAGE</a></li> -->
<!-- 							<li><i class="ti-alarm-clock"></i> <a href="/shop/user?cmd=order">ORDER</a></li> -->
				<c:choose>
					<c:when test="${empty sessionScope.principal}">
						<li><i class="ti-power-off"></i><a href="/shop/user?cmd=login">Login</a></li>
							<li><i class="ti-location-pin"></i><a href="/shop/user?cmd=join">JOIN</a></li>
							<li><i class="ti-location-pin"></i><a href="/shop/user?cmd=cart">CART</a></li>
					</c:when>
					<c:otherwise>
						<li><i class="ti-location-pin"></i><a href="/shop/user?cmd=logout">LOGOUT</a></li>
							<li><i class="ti-location-pin"></i><a href="/shop/user?cmd=cart&id=${principal.id}">CART</a></li>
							<li><i class="ti-location-pin"></i><a href="/shop/user?cmd=cart">WISH LIST</a></li>
							<li><i class="ti-user"></i> <a href="/shop/user?cmd=update">MYPAGE</a></li>
							<li><i class="ti-alarm-clock"></i> <a href="/shop/user?cmd=order&id=${principal.id}">ORDER</a></li>
					</c:otherwise>
				</c:choose>
						</ul>
					</div>
					<!-- End Top Right -->
				</div>
			</div>
		</div>
	</div>
	<!-- End Topbar -->


	<!-- 로고, 검색창 있던 곳 -->
	<div class="middle-inner">
		<div class="container">
			<div class="row">
				<div class="col-lg-2 col-md-2 col-12">
					<!-- Logo -->
					<div class="logo">

						<a href="/shop/index.jsp">
							<img src="/shop/image/apparelLogo.png"alt="logo">

						</a>
					</div>
					<!--/ End Logo -->
					<!-- Search Form -->
					<div class="search-top">
						<div class="top-search">
							<a href="#0"><i class="ti-search"></i></a>
						</div>
						<!-- Search Form -->
						<div class="search-top">
							<form class="search-form">
								<input type="text" placeholder="Search here..." name="search">
								<button value="search" type="submit">
									<i class="ti-search"></i>
								</button>
							</form>
						</div>
						<!--/ End Search Form -->
					</div>
					<!--/ End Search Form -->
					<div class="mobile-nav"></div>
				</div>

				<div class="col-lg-2 col-md-3 col-12">
					<div class="right-bar">
						<!-- Search Form -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 로고, 검색창 있던 곳 끝 -->

	<!-- Header Inner -->
	<!--/ End Header Inner -->
</header>
<!--/ End Header -->
<hr />