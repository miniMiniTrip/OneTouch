<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="/WEB-INF/views/common/header.jsp"%>

<!-- Breadcrumbs -->
<div class="breadcrumbs">
	<div class="container">
		<div class="row align-items-center">
			<div class="col-lg-6 col-md-6 col-12">
				<div class="breadcrumbs-content">
					<h1 class="page-title">#${hashtag.hashtag_name} 검색 결과</h1>
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-12">
				<ul class="breadcrumb-nav">
					<li><a href="${pageContext.request.contextPath}/"><i class="lni lni-home"></i>Home</a></li>
					<li><a href="${pageContext.request.contextPath}/hashtag/list.do">Hashtag</a></li>
					<li>#${hashtag.hashtag_name}</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- End Breadcrumbs -->

<style>
.product-hashtags {
	display: flex;
	flex-wrap: wrap;
	gap: 3px;
	margin: 10px 0;
	max-height: 50px;
	overflow: hidden;
}

.hashtag-badge {
	display: inline-block;
	padding: 1px 4px;
	background-color: #f0f0f0;
	color: #555;
	border-radius: 8px;
	font-size: 11px;
	text-decoration: none;
	transition: all 0.2s ease;
	border: 1px solid #e0e0e0;
	line-height: 1.2;
}

.hashtag-badge:hover {
	background-color: #5c6bc0;
	color: white;
	border-color: #5c6bc0;
	transform: translateY(-1px);
	box-shadow: 0 1px 3px rgba(92, 107, 192, 0.3);
}

/* ==================== 전체 레이아웃 ==================== */
.product-grids {
	padding: 50px 0;
	background-color: #fff;
}

.product-container {
	width: 100%;
	margin: 0 auto;
}

/* ==================== 사이드바 스타일 (사용 안 함) ==================== */
/*
.sidebar {
	width: 250px;
	background: #fafafa;
	border-right: 1px solid #e0e0e0;
	padding: 30px 0;
	min-height: calc(100vh - 400px);
}

.menu-section {
	margin: 25px 0;
}

.menu-title {
	padding: 10px 30px;
	font-size: 12px;
	color: #999;
	font-weight: 600;
	text-transform: uppercase;
	letter-spacing: 0.5px;
}

.title a {
    white-space: normal !important;
    overflow: visible !important;
    text-overflow: clip !important;
    display: inline-block;
    word-break: keep-all;
}

.menu-item {
	padding: 14px 30px;
	font-size: 14px;
	color: #333;
	cursor: pointer;
	display: flex;
	align-items: center;
	transition: all 0.3s;
	border-left: 3px solid transparent;
	text-decoration: none;
}

.menu-item:hover {
	background: #f0f0f0;
	padding-left: 35px;
	color: #333;
}

.menu-item.active {
	background: #e8eaf6;
	color: #5c6bc0;
	font-weight: 600;
	border-left: 3px solid #5c6bc0;
}

.search-widget {
	padding: 0 30px 30px;
	border-bottom: 1px solid #e0e0e0;
}

.search-widget h3 {
	font-size: 14px;
	font-weight: 600;
	color: #333;
	margin-bottom: 15px;
}

.search-widget form {
	position: relative;
}

.search-widget input[type="text"] {
	width: 100%;
	padding: 10px 40px 10px 15px;
	border: 1px solid #e0e0e0;
	border-radius: 6px;
	font-size: 14px;
	transition: all 0.3s;
}

.search-widget input[type="text"]:focus {
	outline: none;
	border-color: #5c6bc0;
	box-shadow: 0 0 0 3px rgba(92, 107, 192, 0.1);
}

.search-widget button {
	position: absolute;
	right: 5px;
	top: 50%;
	transform: translateY(-50%);
	background: none;
	border: none;
	color: #666;
	font-size: 18px;
	cursor: pointer;
	padding: 5px 10px;
	transition: color 0.3s;
}

.search-widget button:hover {
	color: #5c6bc0;
}
*/

/* ==================== 컨텐츠 영역 ==================== */
.content {
	width: 100%;
	padding: 0;
	background: #fff;
}

/* 품절임박 작고 귀여운 네모 박스 */
.low-stock-alert {
	background: #ff4757;
	color: white;
	font-size: 10px;
	font-weight: bold;
	padding: 2px 3px;
	border-radius: 2px;
	display: inline-block;
	margin: 2px 0;
	animation: blink 1.5s infinite;
	letter-spacing: -0.5px;
	white-space: nowrap;
	line-height: 1;
	width: fit-content;
}

/* 반짝이는 애니메이션 */
@keyframes blink {
  0%, 50% {
    opacity: 1;
    background: #ff4757;
  }
  51%, 100% {
    opacity: 0.7;
    background: #ff6b7a;
  }
}

/* 상품 카드 기본 스타일 */
.single-product {
	margin-bottom: 30px;
	transition: all 0.3s ease;
	display: flex;
	flex-direction: column;
	height: 100%;
}

.single-product:hover {
	transform: translateY(-5px);
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

/* 상품 이미지 영역 */
.product-image {
	position: relative;
	border-radius: 8px;
	height: 280px;
	background: #f5f5f5;
}

.product-image img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	transition: transform 0.3s ease;
}

.product-image:hover img {
	transform: scale(1.05);
}

.no-image {
	width: 100%;
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
	background: #e0e0e0;
	color: #999;
	font-size: 14px;
}

/* 찜 하기 버튼 */
.wishlist-toggle {
	position: absolute;
	top: 15px;
	right: 15px;
	width: 40px;
	height: 40px;
	background: white;
	border-radius: 50%;
	display: flex !important;
	align-items: center;
	justify-content: center;
	cursor: pointer;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
	transition: all 0.3s ease;
	z-index: 10;
}

.wishlist-toggle:hover {
	transform: scale(1.1);
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
}

.wishlist-toggle i {
	font-size: 20px;
	color: #ff4757;
	transition: all 0.3s ease;
}

/* 상품 정보 영역 */
.product-info {
	padding: 10px 15px;
	min-height: 250px;
	display: flex;
	flex-direction: column;
	justify-content: flex-start;
	gap: 5px;
}

.product-info .category {
	color: #666;
	font-size: 12px;
	text-transform: uppercase;
	letter-spacing: 0.5px;
	margin-bottom: 5px;
}

.product-info .title {
	font-size: 16px;
	font-weight: 600;
	margin-bottom: 8px;
	line-height: 1.4;
}

.product-info .title a {
	color: #333;
	text-decoration: none;
	transition: color 0.3s;
}

.product-info .title a:hover {
	color: #5c6bc0;
}

.product-info .description {
	font-size: 13px;
	color: #666;
	margin-bottom: 10px;
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	line-height: 1.5;
}

.product-info .price {
	font-size: 18px;
	font-weight: bold;
	color: #5c6bc0;
	margin: 10px 0;
}

.product-stats {
	display: flex;
	gap: 15px;
	font-size: 12px;
	color: #666;
	margin: 10px 0;
}

.stat-item {
	display: flex;
	align-items: center;
	gap: 4px;
}

.stat-item i {
	font-size: 14px;
	color: #999;
}

.button-group {
	display: flex;
	gap: 10px;
	margin-top: auto;
}

.button-group .btn {
	flex: 1;
	padding: 10px 0;
	font-size: 13px;
	border-radius: 6px;
	transition: all 0.3s;
	text-align: center;
}

.btn-primary {
	background: #5c6bc0;
	border: 1px solid #5c6bc0;
	color: white;
}

.btn-primary:hover {
	background: #4a5ab3;
	border-color: #4a5ab3;
}

.btn-secondary {
	background: white;
	border: 1px solid #5c6bc0;
	color: #5c6bc0;
}

.btn-secondary:hover {
	background: #5c6bc0;
	color: white;
}

/* List View 스타일 */
.single-product.list-view {
	margin-bottom: 20px;
	border: 1px solid #e0e0e0;
	border-radius: 8px;
	overflow: hidden;
}

.single-product.list-view .product-image {
	height: 250px;
}

.single-product.list-view .product-info {
	height: auto;
	padding: 20px;
}

/* 섹션 구분선 */
.section-divider {
	border-top: 2px solid #e0e0e0;
	margin: 50px 0 30px 0;
	padding-top: 30px;
}

.section-title {
	font-size: 24px;
	font-weight: 600;
	color: #333;
	margin-bottom: 20px;
	margin-left: 0px;
	display: flex;
	align-items: center;
	gap: 10px;
}

.section-title .count-badge {
	background: #5c6bc0;
	color: white;
	font-size: 14px;
	padding: 4px 12px;
	border-radius: 20px;
	font-weight: normal;
}

.no-results {
	text-align: center;
	padding: 60px 20px;
	color: #999;
}

.no-results i {
	font-size: 60px;
	margin-bottom: 20px;
	display: block;
	color: #ddd;
}

.no-results p {
	font-size: 16px;
	margin: 10px 0;
}

/* 포스트 리스트 스타일 */
.post-list {
	list-style: none;
	padding: 0;
}

.post-item {
	border: 1px solid #e0e0e0;
	border-radius: 8px;
	padding: 20px;
	margin-bottom: 15px;
	transition: all 0.3s ease;
	background: white;
}

.post-item:hover {
	transform: translateY(-3px);
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

.post-item .post-category {
	display: inline-block;
	background: #e8eaf6;
	color: #5c6bc0;
	padding: 4px 12px;
	border-radius: 15px;
	font-size: 11px;
	font-weight: 600;
	margin-bottom: 10px;
	text-transform: uppercase;
}

.post-item .post-title {
	font-size: 18px;
	font-weight: 600;
	margin-bottom: 10px;
}

.post-item .post-title a {
	color: #333;
	text-decoration: none;
}

.post-item .post-title a:hover {
	color: #5c6bc0;
}

.post-item .post-meta {
	display: flex;
	gap: 15px;
	font-size: 13px;
	color: #999;
	margin-top: 10px;
}

.post-meta-item {
	display: flex;
	align-items: center;
	gap: 5px;
}

.post-meta-item i {
	font-size: 14px;
}

/* 해시태그 정보 박스 */
.hashtag-info-box {
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	color: white;
	padding: 30px;
	border-radius: 12px;
	margin-bottom: 30px;
	box-shadow: 0 5px 20px rgba(102, 126, 234, 0.3);
}

.hashtag-info-box h2 {
	font-size: 32px;
	margin-bottom: 10px;
	font-weight: bold;
}

.hashtag-info-box .stats {
	display: flex;
	gap: 30px;
	margin-top: 15px;
}

.hashtag-info-box .stat {
	display: flex;
	align-items: center;
	gap: 8px;
	font-size: 14px;
}

.hashtag-info-box .stat i {
	font-size: 18px;
}
</style>

<!-- Product Grids -->
<section class="product-grids section">
	<div class="container">
		<div class="product-container">
			<!-- Content -->
			<div class="content">
				<!-- 해시태그 정보 박스 -->
				<div class="hashtag-info-box">
					<h2>#${hashtag.hashtag_name}</h2>
					<div class="stats">
						<div class="stat">
							<i class="lni lni-shopping-basket"></i>
							<span>상품 ${fn:length(product_list)}개</span>
						</div>
						<div class="stat">
							<i class="lni lni-comments"></i>
							<span>포스트 ${fn:length(post_list)}개</span>
						</div>
						<c:if test="${not empty hashtag.use_count}">
							<div class="stat">
								<i class="lni lni-graph"></i>
								<span>총 ${hashtag.use_count}회 사용</span>
							</div>
						</c:if>
					</div>
				</div>

				<!-- ==================== 상품 섹션 ==================== -->
				<div class="section-title">
					<span>상품</span>
					<span class="count-badge">${fn:length(product_list)}</span>
				</div>

				<div class="row">
					<c:choose>
						<c:when test="${empty product_list}">
							<div class="col-12">
								<div class="no-results">
									<i class="lni lni-inbox"></i>
									<p>해당 해시태그가 포함된 상품이 없습니다.</p>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<!-- Grid View 상품 리스트 -->
							<c:forEach var="product" items="${product_list}">
								<div class="col-lg-4 col-md-6 col-12">
									<div class="single-product">
										<div class="product-image">
											<c:choose>
												<c:when test="${not empty product.product_image_url}">
													<img src="${pageContext.request.contextPath}/images/products_list/${product.product_image_url}" onclick="location.href='${pageContext.request.contextPath}/product/detail?id=${product.product_idx}'"
						                                             alt="${product.product_name}"
						                                             onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/images/default.png'; this.style.opacity='0.5';">
												</c:when>
												<c:otherwise>
													<div class="no-image">이미지 준비중</div>
												</c:otherwise>
											</c:choose>
											<span class="wishlist-toggle" onclick="toggleWishlist(${product.product_idx}, this)"
												data-product-idx="${product.product_idx}" data-wishlist="false">
												<i class="lni lni-heart"></i>
											</span>
										</div>
										<div class="product-info">
											<span class="category">${product.category_name}</span>
											<h4 class="title">
												<a href="${pageContext.request.contextPath}/product/detail?id=${product.product_idx}">
													${product.product_name}
												</a>
											</h4>
											<p class="description">${product.product_comment}</p>
											
											<!-- 품절임박 알림 -->
											<c:if test="${product.product_cnt <= 30}">
												<div class="low-stock-alert">품절임박</div>
											</c:if>
											
											<!-- 해시태그 -->
											<c:if test="${not empty product.hashtag_list}">
												<div class="product-hashtags">
													<c:forEach var="tag" items="${product.hashtag_list}">
														<a href="${pageContext.request.contextPath}/hashtag/search.do?hashtag_idx=${tag.hashtag_idx}"
															class="hashtag-badge" title="#${tag.hashtag_name} 검색">
															#${tag.hashtag_name}
														</a>
													</c:forEach>
												</div>
											</c:if>
											
											<div class="price">
												<span><fmt:formatNumber value="${product.product_price}" pattern="#,###" />원</span>
											</div>
											<div class="product-stats">
												<span class="stat-item">
													<i class="lni lni-shopping-basket"></i> 재고 ${product.product_cnt}
												</span>
												<span class="stat-item">
													<i class="lni lni-heart"></i> 찜 ${product.product_wishlist}
												</span>
											</div>
											
											<div class="button-group">
												<a href="javascript:void(0);" onclick="addToCart(${product.product_idx})" class="btn btn-primary">
													<i class="lni lni-cart"></i> 장바구니
												</a>
												<a href="javascript:void(0);" onclick="buyNow(${product.product_idx})" class="btn btn-secondary">즉시구매</a>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>

				<!-- ==================== 포스트 섹션 ==================== -->
				<div class="section-divider"></div>
				<div class="section-title">
					<span>커뮤니티 포스트</span>
					<span class="count-badge">${fn:length(post_list)}</span>
				</div>

				<c:choose>
					<c:when test="${empty post_list}">
						<div class="no-results">
							<i class="lni lni-comments"></i>
							<p>해당 해시태그가 포함된 포스트가 없습니다.</p>
						</div>
					</c:when>
					<c:otherwise>
						<ul class="post-list">
							<c:forEach var="post" items="${post_list}">
								<li class="post-item">
									<span class="post-category">${post.post_category}</span>
									<h3 class="post-title">
										<a href="${pageContext.request.contextPath}/post/view?post_idx=${post.post_idx}">
											${post.post_title}
										</a>
									</h3>
									
									<!-- 해시태그 -->
									<c:if test="${not empty post.hashtagList}">
										<div class="product-hashtags">
											<c:forEach var="tag" items="${post.hashtagList}">
												<a href="${pageContext.request.contextPath}/hashtag/search.do?hashtag_idx=${tag.hashtag_idx}"
													class="hashtag-badge" title="#${tag.hashtag_name} 검색">
													#${tag.hashtag_name}
												</a>
											</c:forEach>
										</div>
									</c:if>
									
									<div class="post-meta">
										<span class="post-meta-item">
											<i class="lni lni-user"></i> ${post.mem_id}
										</span>
										<span class="post-meta-item">
											<i class="lni lni-heart"></i> ${post.post_like}
										</span>
										<span class="post-meta-item">
											<i class="lni lni-comments"></i> ${post.post_comment_count}
										</span>
										<span class="post-meta-item">
											<i class="lni lni-calendar"></i> 
											<c:choose>
												<c:when test="${post.post_time != null}">
													${fn:substring(post.post_time, 0, 10)}
												</c:when>
												<c:otherwise>
													-
												</c:otherwise>
											</c:choose>
										</span>
									</div>
								</li>
							</c:forEach>
						</ul>
					</c:otherwise>
				</c:choose>

			</div>
			<!-- End Content -->
		</div>
	</div>
</section>
<!-- End Product Grids -->

<script>
const mem_idx = ${sessionScope.user != null ? sessionScope.user.mem_idx : 'null'};

console.log('현재 로그인 상태:', mem_idx !== null ? '로그인됨 (mem_idx: ' + mem_idx + ')' : '로그인 안 됨');

function getCurrentMemIdx() {
    return ${sessionScope.user != null ? sessionScope.user.mem_idx : 'null'};
}

// 페이지 표시 시
window.addEventListener('pageshow', function(event) {
    if (mem_idx && mem_idx !== null) {
        syncWishlistStatus();
    } else {
		resetWishlistIcons();
    }
});

// 페이지 로드 시
document.addEventListener('DOMContentLoaded', function() {
    if (mem_idx && mem_idx !== null) {
        syncWishlistStatus();
    } else {
		resetWishlistIcons();
    }
});

// 찜 상태 동기화
function syncWishlistStatus() {
    const wishlistButtons = document.querySelectorAll('.wishlist-toggle');
    
    if (wishlistButtons.length === 0) return;
    
    const productIds = Array.from(wishlistButtons).map(btn => 
        btn.getAttribute('data-product-idx')
    );

    fetch('${pageContext.request.contextPath}/wishlist/check_status.do', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            product_ids: productIds
        })
    })
    .then(response => response.json())
    .then(data => {
        if (data.result === 'success') {
            wishlistButtons.forEach(button => {
                const productIdx = button.getAttribute('data-product-idx');
                const isWishlisted = data.wishlist_status[productIdx] || false;
                const icon = button.querySelector('i');
                
                if (isWishlisted) {
                    icon.className = 'lni lni-heart-filled';
                    button.setAttribute('data-wishlist', 'true');
                } else {
                    icon.className = 'lni lni-heart';
                    button.setAttribute('data-wishlist', 'false');
                }
            });
        } else if (data.result === 'not_login') {
        	resetWishlistIcons();
        }
    })
    .catch(error => {
        console.error('찜 상태 동기화 실패:', error);
    });
}

// 하트 초기화 함수
function resetWishlistIcons(){
	const wishlistButtons = document.querySelectorAll('.wishlist-toggle');
	wishlistButtons.forEach(button=> {
		const icon = button.querySelector('i');
		icon.className = 'lni lni-heart';
		button.setAttribute('data-wishlist', 'false');
	});
}

// 찜하기 토글 함수
function toggleWishlist(product_idx, element) {
    if (!mem_idx || mem_idx === null) {
        alert('로그인이 필요한 서비스입니다.');
        location.href = '${pageContext.request.contextPath}/user/login';
        return;
    }
    
    const isWishlisted = element.getAttribute('data-wishlist') === 'true';
    const icon = element.querySelector('i');
    
    fetch('${pageContext.request.contextPath}/wishlist/toggle.do', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: 'product_idx=' + product_idx
    })
    .then(response => response.json())
    .then(data => {
        if (data.result === 'success') {
            if (data.action === 'added') {
                icon.className = 'lni lni-heart-filled';
                element.setAttribute('data-wishlist', 'true');
                
                element.style.transform = 'scale(1.2)';
                setTimeout(() => {
                    element.style.transform = 'scale(1)';
                }, 200);
            } else if (data.action === 'removed') {
                icon.className = 'lni lni-heart';
                element.setAttribute('data-wishlist', 'false');
            }
        } else if (data.result === 'not_login') {
            alert('로그인이 필요한 서비스입니다.');
            location.href = '${pageContext.request.contextPath}/user/login';
        } else {
            alert('처리 중 오류가 발생했습니다.');
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('처리 중 오류가 발생했습니다.');
    });
}

function addToCart(product_idx) {
    if (!mem_idx || mem_idx === null) {
        alert('로그인이 필요한 서비스입니다.');
        location.href = '${pageContext.request.contextPath}/user/login';
        return;
    }
    
    fetch('${pageContext.request.contextPath}/cart/insert.do', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: 'mem_idx=' + mem_idx + '&product_idx=' + product_idx + '&cart_cnt=1'
    })
    .then(response => response.json())
    .then(data => {
        if (data.result === 'success') {
            if (confirm('장바구니에 추가되었습니다.\n장바구니로 이동하시겠습니까?')) {
                location.href = '${pageContext.request.contextPath}/cart/list.do?mem_idx=' + mem_idx;
            }
        } else if (data.result === 'exist') {
            alert('이미 장바구니에 담긴 상품입니다.');
        } else if (data.result === 'not_login') {
            alert('로그인이 필요한 서비스입니다.');
            location.href = '${pageContext.request.contextPath}/user/login';
        } else {
            alert('장바구니 추가 중 오류가 발생했습니다.');
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('장바구니 추가 중 오류가 발생했습니다.');
    });
}

// 즉시구매 함수
function buyNow(product_idx) {
    if (!mem_idx || mem_idx === null) {
        alert('로그인이 필요한 서비스입니다.');
        location.href = '${pageContext.request.contextPath}/user/login';
        return;
    }
    
    location.href = '${pageContext.request.contextPath}/order/direct_form.do?product_idx=' + product_idx + '&product_cnt=1';
}

</script>

<%@include file="/WEB-INF/views/common/footer.jsp"%>

</body>
</html>