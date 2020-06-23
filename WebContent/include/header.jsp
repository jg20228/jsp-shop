<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
							<li><i class="ti-power-off"></i><a href="/shop/user/login.jsp">Login</a></li>
							<li><i class="ti-location-pin"></i><a href="/shop/user/join.jsp">JOIN</a></li>
							<li><i class="ti-location-pin"></i><a href="/shop/user/cart.jsp">CART</a></li>
							<li><i class="ti-user"></i> <a href="/shop/user/myPage.jsp">MYPAGE</a></li>
							<li><i class="ti-alarm-clock"></i> <a href="#">ORDER</a></li>
							<li><i class="ti-alarm-clock"></i> <a href="#">ATTENDANCE</a></li>
							<li><i class="ti-alarm-clock"></i> <a href="#">BOOKMARK</a></li>

							<!-- 장바구니 시작 -->
							<li>
								<div class="sinlge-bar shopping">
									<a href="#" class="single-icon"><i class="ti-bag"></i> <span
										class="total-count">2</span></a>
									<!-- Shopping Item -->
									<div class="shopping-item">
										<div class="dropdown-cart-header">
											<span>2 Items</span> <a href="#">View Cart</a>
										</div>
										<ul class="shopping-list">
											<li><a href="#" class="remove" title="Remove this item"><i
													class="fa fa-remove"></i></a> <a class="cart-img" href="#"><img
													src="https://via.placeholder.com/70x70" alt="#"></a>
												<h4>
													<a href="#">Woman Ring</a>
												</h4>
												<p class="quantity">
													1x - <span class="amount">$99.00</span>
												</p></li>
											<li><a href="#" class="remove" title="Remove this item"><i
													class="fa fa-remove"></i></a> <a class="cart-img" href="#"><img
													src="https://via.placeholder.com/70x70" alt="#"></a>
												<h4>
													<a href="#">Woman Necklace</a>
												</h4>
												<p class="quantity">
													1x - <span class="amount">$35.00</span>
												</p></li>
										</ul>
										<div class="bottom">
											<div class="total">
												<span>Total</span> <span class="total-amount">$134.00</span>
											</div>
											<a href="checkout.html" class="btn animate">Checkout</a>
										</div>
									</div>
									<!--/ End Shopping Item -->
								</div>
							</li>
							<!-- 장바구니 끝 -->

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
						<a href="index.html"><img src="/shop/image/apparellogo.png"
							alt="logo"></a>
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