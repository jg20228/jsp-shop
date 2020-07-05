<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Start Footer Area -->
<footer class="footer" style="z-index: 1">
	<!-- Footer Top -->
	<div class="footer-top section">
		<div class="container">
			<div class="row">
				<div class="col-lg-5 col-md-6 col-12">
					<!-- Single Widget -->
					<div class="single-footer about">
						<div class="logo">
							<a href="index.html"><img
								src="/shop/image/apparelLogo.png" alt="#"></a>
						</div>
						<p class="text">Praesent dapibus, neque id cursus ucibus,
							tortor neque egestas augue, magna eros eu erat. Aliquam erat
							volutpat. Nam dui mi, tincidunt quis, accumsan porttitor,
							facilisis luctus, metus.</p>
						<p class="call">
							Got Question? Call us 24/7<span><a href="tel:123456789">+0123
									456 789</a></span>
						</p>
					</div>
					<!-- End Single Widget -->
				</div>
				<div class="col-lg-2 col-md-6 col-12">
					<!-- Single Widget -->
					<div class="single-footer links">
						<h4>Notice</h4>
						<ul>
							<li><a href="/shop/board?cmd=noticeBoard">공지사항</a></li>
							<li><a href="/shop/board?cmd=noticeMember">맴버쉽 혜택</a></li>
							<li><a href="/shop/board?cmd=noticeOverseas">해외배송</a></li>
							<li><a href="/shop/board?cmd=noticeSize">실측사이즈 측정법</a></li>
						</ul>
					</div>
					<!-- End Single Widget -->
				</div>
				<div class="col-lg-2 col-md-6 col-12">
					<!-- Single Widget -->
					<div class="single-footer links">
						<h4></h4>
						<ul>

							<c:choose>
								<c:when test="${empty sessionScope.principal}">
									<li><a href="shop/user/guide.jsp">GUIDE 이용안내</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="https://parcel.epost.go.kr/auth.EpostLogin.parcel">배송조회</a></li>
									<li><a href="/shop/user?cmd=order&id=${principal.id}">주문내역</a></li>
									<li><a href="/shop/user?cmd=update">MY PAGE</a></li>
									<li><a href="/shop/user/guide.jsp">GUIDE 이용안내</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
					<!-- End Single Widget -->
				</div>
				<div class="col-lg-3 col-md-6 col-12">
					<!-- Single Widget -->
					<div class="single-footer social" id="bank">
						<h4>Banking Info.</h4>
						<!-- Single Widget -->
						<div class="contact">
							<ul>
								<li>농협 301-0119-0000-81</li>
								<li>국민 000000-04-002466</li>
								<li>예금주: (주) apperal</li>
							</ul>
						</div>
						<!-- End Single Widget -->
						<ul>
							<li><a href="#"><i class="ti-facebook"></i></a></li>
							<li><a href="#"><i class="ti-twitter"></i></a></li>
							<li><a href="#"><i class="ti-flickr"></i></a></li>
							<li><a href="#"><i class="ti-instagram"></i></a></li>
						</ul>
					</div>
					<!-- End Single Widget -->
				</div>

			</div>
		</div>
	</div>
	<!-- End Footer Top -->
	<div class="copyright">
		<div class="container">
			<div class="inner">
				<div class="row">
					<div class="col-lg-6 col-12">
						<div class="left">
							<p>
								Copyright © 2020 <a href="http://www.wpthemesgrid.com"
									target="_blank">Wpthemesgrid</a> - All Rights Reserved.
							</p>
						</div>
					</div>
					<div class="col-lg-6 col-12">
						<div class="right">
							<img src="/shop/eshop-template/images/payments.png" alt="#">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>
<!-- /End Footer Area -->

<!-- Jquery -->
<script src="/shop/eshop-template/js/jquery.min.js"></script>
<script src="/shop/eshop-template/js/jquery-migrate-3.0.0.js"></script>
<script src="/shop/eshop-template/js/jquery-ui.min.js"></script>
<!-- Popper JS -->
<script src="/shop/eshop-template/js/popper.min.js"></script>
<!-- Bootstrap JS -->
<script src="/shop/eshop-template/js/bootstrap.min.js"></script>
<!-- Color JS -->
<script src="/shop/eshop-template/js/colors.js"></script>
<!-- Slicknav JS -->
<script src="/shop/eshop-template/js/slicknav.min.js"></script>
<!-- Owl Carousel JS -->
<script src="/shop/eshop-template/js/owl-carousel.js"></script>
<!-- Magnific Popup JS -->
<script src="/shop/eshop-template/js/magnific-popup.js"></script>
<!-- Waypoints JS -->
<script src="/shop/eshop-template/js/waypoints.min.js"></script>
<!-- Countdown JS -->
<script src="/shop/eshop-template/js/finalcountdown.min.js"></script>
<!-- Nice Select JS -->
<script src="/shop/eshop-template/js/nicesellect.js"></script>
<!-- Flex Slider JS -->
<script src="/shop/eshop-template/js/flex-slider.js"></script>
<!-- ScrollUp JS -->
<script src="/shop/eshop-template/js/scrollup.js"></script>
<!-- Onepage Nav JS -->
<script src="/shop/eshop-template/js/onepage-nav.min.js"></script>
<!-- Easing JS -->
<script src="/shop/eshop-template/js/easing.js"></script>
<!-- Active JS -->
<script src="/shop/eshop-template/js/active.js"></script>
</body>
</html>