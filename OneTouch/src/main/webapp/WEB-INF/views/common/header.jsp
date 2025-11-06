<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <!-- j쿼리 -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<!-- Start Header Area -->
<header class="header navbar-area">
	<!-- Start Topbar -->
	<div class="topbar">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-4 col-md-4 col-12">
					<div class="top-left">
						<ul class="menu-top-link">
							<li><a href="${pageContext.request.contextPath}/about">소개</a></li>
							<li><a href="${pageContext.request.contextPath}/contact">문의</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-12">
					<div class="top-middle">
						<ul class="useful-links">
							<li><a href="${pageContext.request.contextPath}/">홈</a></li>
							<li><a href="${pageContext.request.contextPath}/products">상품</a></li>
							<li><a href="${pageContext.request.contextPath}/community">커뮤니티</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-12">
					<div class="top-end">
						<c:choose>
							<c:when test="${not empty sessionScope.user}">
								<div class="user">
									<i class="lni lni-user"></i> ${sessionScope.user.mem_name}님
								</div>
								<ul class="user-login">
									<li><a href="${pageContext.request.contextPath}/mypage">마이페이지</a></li>
									<li><a href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
								</ul>
							</c:when>
							<c:otherwise>
								<div class="user">
									<i class="lni lni-user"></i> 환영합니다
								</div>
								<ul class="user-login">
									<li><a href="${pageContext.request.contextPath}/user/login">로그인</a></li>
									<li><a href="${pageContext.request.contextPath}/user/register">회원가입</a></li>
								</ul>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Topbar -->

	<!-- Start Header Middle -->
	<div class="header-middle">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-3 col-md-3 col-7">
					<a class="navbar-brand" href="${pageContext.request.contextPath}/">
						<img
						src="${pageContext.request.contextPath}/assets/images/logo/logo.svg"
						alt="OneTouch">
					</a>
				</div>
				<div class="col-lg-5 col-md-7 d-xs-none">
					<div class="main-menu-search">
						<div class="navbar-search search-style-5">
							<div class="search-input">
								<input type="text" id="search-input" placeholder="상품을 검색하세요...">
							</div>
							<div class="search-btn">
								<button onclick="performSearch()">
									<i class="lni lni-search-alt"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-2 col-5">
					<div class="middle-right-area">
						<div class="nav-hotline">
							<i class="lni lni-phone"></i>
							<h3>
								고객센터 <span>1588-0000</span>
							</h3>
						</div>
						<div class="navbar-cart">
							<div class="wishlist">
								<a href="${pageContext.request.contextPath}/wishlist"> <i
									class="lni lni-heart"></i> <span class="total-items">0</span>
								</a>
							</div>
							<div class="cart-items">
								<a href="javascript:void(0)" class="main-btn" id="cart-toggle">
									<i class="lni lni-cart"></i> <span class="total-items"
									id="cart-count">0</span>
								</a>

								<!-- Shopping Cart Dropdown -->
								<div class="shopping-item" id="cart-dropdown">
									<div class="dropdown-cart-header">
										<span id="cart-item-count">0개 상품</span> <a
											href="${pageContext.request.contextPath}/cart">장바구니 보기</a>
									</div>
									
									<!-- dropdown list -->
									<ul id="cart-dropdown-list">
									</ul>

									<div class="bottom">
										<div class="total">
											<span>총 금액</span> <span class="total-amount"
												id="cart-dropdown-total">0원</span>
										</div>
										<div class="button">
											<a href="${pageContext.request.contextPath}/checkout"
												class="btn animate">결제하기</a>
										</div>
									</div>
								</div>
								<!--/ End Shopping Cart Dropdown -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Header Middle -->

	<!-- Start Header Bottom -->
	<div class="container">
		<div class="row align-items-center">
			<div class="col-lg-8 col-md-6 col-12">
				<div class="nav-inner">
					<nav class="navbar navbar-expand-lg">
						<button class="navbar-toggler mobile-menu-btn" type="button"
							data-bs-toggle="collapse"
							data-bs-target="#navbarSupportedContent"
							aria-controls="navbarSupportedContent" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="toggler-icon"></span> <span class="toggler-icon"></span>
							<span class="toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse sub-menu-bar"
							id="navbarSupportedContent">
							<ul id="nav" class="navbar-nav ms-auto">
								<li class="nav-item"><a
									href="${pageContext.request.contextPath}/">홈</a></li>
								<li class="nav-item"><a class="dd-menu collapsed"
									href="javascript:void(0)" data-bs-toggle="collapse"
									data-bs-target="#submenu-1-1"
									aria-controls="navbarSupportedContent" aria-expanded="false">카테고리</a>
									<ul class="sub-menu collapse" id="submenu-1-1">
										<li class="nav-item"><a
											href="${pageContext.request.contextPath}/products?category=skincare">스킨케어</a></li>
										<li class="nav-item"><a
											href="${pageContext.request.contextPath}/products?category=cleansing">클렌징</a></li>
										<li class="nav-item"><a
											href="${pageContext.request.contextPath}/products?category=haircare">헤어케어</a></li>
										<li class="nav-item"><a
											href="${pageContext.request.contextPath}/products?category=bodycare">바디케어</a></li>
									</ul></li>
								<li class="nav-item"><a
									href="${pageContext.request.contextPath}/product/product_list">전체 상품</a></li>
								<li class="nav-item"><a
									href="${pageContext.request.contextPath}/community">커뮤니티</a></li>
								<li class="nav-item"><a
									href="${pageContext.request.contextPath}/skintest">피부 진단</a></li>
								<li class="nav-item"><a class="dd-menu collapsed"
									href="javascript:void(0)" data-bs-toggle="collapse"
									data-bs-target="#submenu-1-2"
									aria-controls="navbarSupportedContent" aria-expanded="false">마이페이지</a>
									<ul class="sub-menu collapse" id="submenu-1-2">
										<li class="nav-item"><a
											href="${pageContext.request.contextPath}/mypage">내 정보</a></li>
										<li class="nav-item"><a
											href="${pageContext.request.contextPath}/orders">주문 내역</a></li>
										<li class="nav-item"><a
											href="${pageContext.request.contextPath}/cart">장바구니</a></li>
										<li class="nav-item"><a
											href="${pageContext.request.contextPath}/wishlist">찜한 상품</a></li>
									</ul></li>
							</ul>
						</div>
					</nav>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 col-12">
				<div class="nav-social">
					<h5 class="title">Follow Us:</h5>
					<ul>
						<li><a href="javascript:void(0)"><i
								class="lni lni-facebook-filled"></i></a></li>
						<li><a href="javascript:void(0)"><i
								class="lni lni-twitter-original"></i></a></li>
						<li><a href="javascript:void(0)"><i
								class="lni lni-instagram"></i></a></li>
						<li><a href="javascript:void(0)"><i
								class="lni lni-youtube"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- End Header Bottom -->
</header>
<!-- End Header Area -->

<script>
function performSearch() {
    const keyword = document.getElementById('search-input').value.trim();
    if (keyword) {
        location.href = '${pageContext.request.contextPath}/products?search=' + encodeURIComponent(keyword);
    }
}

document.getElementById('search-input')?.addEventListener('keypress', function(e) {
    if (e.key === 'Enter') {
        performSearch();
    }
});

function updateHeaderCartCount() {
    fetch('${pageContext.request.contextPath}/cart/count')
        .then(response => response.json())
        .then(data => {
            document.getElementById('cart-count').textContent = data.count;
        })
        .catch(error => console.error('Error:', error));
}

document.addEventListener('DOMContentLoaded', function() {
    updateHeaderCartCount();
});
</script>
