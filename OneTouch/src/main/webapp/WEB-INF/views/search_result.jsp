<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
					<h1 class="page-title">"${keyword}" 검색 결과</h1>
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-12">
				<ul class="breadcrumb-nav">
					<li><a href="${pageContext.request.contextPath}/"><i class="lni lni-home"></i>Home</a></li>
					<li>검색</li>
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
	margin: 5px 0;
	min-height: 48px;
}

.product-info .title a {
	color: #333;
	text-decoration: none;
	font-size: 15px;
	font-weight: 600;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	overflow: hidden;
	line-height: 1.4;
}

.product-info .title a:hover {
	color: #5c6bc0;
}

.product-info .description {
	color: #666;
	font-size: 13px;
	line-height: 1.5;
	margin: 5px 0;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	overflow: hidden;
}

.product-info .price {
	font-size: 18px;
	font-weight: 700;
	color: #5c6bc0;
	margin: 10px 0;
}

.product-stats {
	display: flex;
	gap: 12px;
	margin: 8px 0;
	font-size: 13px;
	color: #666;
}

.stat-item {
	display: flex;
	align-items: center;
	gap: 4px;
}

.stat-item i {
	font-size: 14px;
}

.button-group {
	display: flex;
	gap: 8px;
	margin-top: auto;
}

.button-group .btn {
	flex: 1;
	padding: 8px 12px;
	font-size: 13px;
	border-radius: 6px;
	text-align: center;
	transition: all 0.3s;
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 5px;
}

.btn-primary {
	background: #5c6bc0;
	color: white;
	border: 1px solid #5c6bc0;
}

.btn-primary:hover {
	background: #4a5aa8;
	color: white;
}

.btn-secondary {
	background: white;
	color: #5c6bc0;
	border: 1px solid #5c6bc0;
}

.btn-secondary:hover {
	background: #f0f0f0;
	color: #5c6bc0;
}

/* 구분선 */
.section-divider {
	height: 2px;
	background: linear-gradient(to right, transparent, #e0e0e0, transparent);
	margin: 60px 0 40px 0;
}

.section-title {
	display: flex;
	align-items: center;
	gap: 10px;
	margin-bottom: 30px;
	font-size: 24px;
	font-weight: 600;
	color: #333;
}

.count-badge {
	background: #5c6bc0;
	color: white;
	padding: 4px 12px;
	border-radius: 20px;
	font-size: 14px;
	font-weight: 500;
}

/* 결과 없음 스타일 */
.no-results {
	text-align: center;
	padding: 80px 20px;
	color: #999;
	background: #fafafa;
	border-radius: 12px;
}

.no-results i {
	font-size: 64px;
	margin-bottom: 20px;
	color: #ddd;
}

.no-results p {
	font-size: 16px;
	margin: 0;
}

/* 포스트 리스트 스타일 */
.post-list {
	list-style: none;
	padding: 0;
	margin: 0;
}

.post-item {
	padding: 20px;
	border: 1px solid #e0e0e0;
	border-radius: 8px;
	margin-bottom: 15px;
	transition: all 0.3s ease;
	background: white;
}

.post-item:hover {
	border-color: #5c6bc0;
	box-shadow: 0 2px 8px rgba(92, 107, 192, 0.1);
}

.post-category {
	display: inline-block;
	background: #f0f0f0;
	color: #666;
	padding: 4px 10px;
	border-radius: 4px;
	font-size: 12px;
	font-weight: 500;
	margin-bottom: 10px;
}

.post-title {
	margin: 10px 0;
}

.post-title a {
	color: #333;
	text-decoration: none;
	font-size: 18px;
	font-weight: 600;
}

.post-title a:hover {
	color: #5c6bc0;
}

.post-meta {
	display: flex;
	gap: 15px;
	color: #999;
	font-size: 13px;
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

/* 페이징 스타일 */
.pagination-wrapper {
	display: flex;
	justify-content: center;
	margin: 40px 0;
}

.pagination {
	display: flex;
	gap: 5px;
	list-style: none;
	padding: 0;
	margin: 0;
}

.pagination li a,
.pagination li span {
	display: inline-block;
	padding: 8px 14px;
	border: 1px solid #e0e0e0;
	border-radius: 6px;
	text-decoration: none;
	color: #333;
	transition: all 0.3s ease;
	font-size: 14px;
}

.pagination li a:hover {
	background: #5c6bc0;
	color: white;
	border-color: #5c6bc0;
}

.pagination li.active span {
	background: #5c6bc0;
	color: white;
	border-color: #5c6bc0;
	font-weight: 600;
}

.pagination li.disabled span {
	color: #ccc;
	cursor: not-allowed;
	pointer-events: none;
}
</style>

<section class="product-grids section">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="content">
					
					<!-- ==================== 상품 섹션 ==================== -->
					<div class="section-title">
						<i class="lni lni-shopping-basket" style="color: #5c6bc0;"></i>
						<span>상품</span>
						<span class="count-badge">${productTotalCount}</span>
					</div>

					<c:choose>
						<c:when test="${empty product_list}">
							<div class="no-results">
								<i class="lni lni-cart"></i>
								<p>검색된 상품이 없습니다.</p>
							</div>
						</c:when>
						<c:otherwise>
							<div class="row">
								<c:forEach var="product" items="${product_list}">
									<div class="col-lg-4 col-md-6 col-12">
										<div class="single-product">
											<div class="product-image">
												<c:choose>
													<c:when test="${not empty product.product_image_url}">
														<img src="${pageContext.request.contextPath}/images/products_list/${product.product_image_url}" 
															 alt="${product.product_name}">
													</c:when>
													<c:otherwise>
														<div class="no-image">이미지 없음</div>
													</c:otherwise>
												</c:choose>
												
												<!-- 찜하기 버튼 -->
												<a href="javascript:void(0);" 
												   class="wishlist-toggle" 
												   data-product-idx="${product.product_idx}"
												   data-wishlist="false"
												   onclick="toggleWishlist(${product.product_idx}, this)">
													<i class="lni lni-heart"></i>
												</a>
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
							</div>
							
							<!-- 상품 페이징 -->
							<c:if test="${productTotalPage > 1}">
								<div class="pagination-wrapper">
									<ul class="pagination">
										<!-- 이전 버튼 -->
										<c:choose>
											<c:when test="${productPage > 1}">
												<li>
													<a href="${pageContext.request.contextPath}/search?keyword=${keyword}&productPage=${productPage - 1}&postPage=${postPage}">
														<i class="lni lni-chevron-left"></i>
													</a>
												</li>
											</c:when>
											<c:otherwise>
												<li class="disabled">
													<span>
														<i class="lni lni-chevron-left"></i>
													</span>
												</li>
											</c:otherwise>
										</c:choose>
										
										<!-- 페이지 번호 -->
										<c:forEach var="i" begin="${productStartPage}" end="${productEndPage}">
											<c:choose>
												<c:when test="${i == productPage}">
													<li class="active">
														<span>${i}</span>
													</li>
												</c:when>
												<c:otherwise>
													<li>
														<a href="${pageContext.request.contextPath}/search?keyword=${keyword}&productPage=${i}&postPage=${postPage}">
															${i}
														</a>
													</li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										
										<!-- 다음 버튼 -->
										<c:choose>
											<c:when test="${productPage < productTotalPage}">
												<li>
													<a href="${pageContext.request.contextPath}/search?keyword=${keyword}&productPage=${productPage + 1}&postPage=${postPage}">
														<i class="lni lni-chevron-right"></i>
													</a>
												</li>
											</c:when>
											<c:otherwise>
												<li class="disabled">
													<span>
														<i class="lni lni-chevron-right"></i>
													</span>
												</li>
											</c:otherwise>
										</c:choose>
									</ul>
								</div>
							</c:if>
						</c:otherwise>
					</c:choose>

					<!-- ==================== 포스트 섹션 ==================== -->
					<div class="section-divider"></div>
					<div class="section-title" id="post-section">
						<i class="lni lni-comments" style="color: #5c6bc0;"></i>
						<span>커뮤니티 포스트</span>
						<span class="count-badge">${postTotalCount}</span>
					</div>

					<c:choose>
						<c:when test="${empty post_list}">
							<div class="no-results">
								<i class="lni lni-comments"></i>
								<p>검색된 포스트가 없습니다.</p>
							</div>
						</c:when>
						<c:otherwise>
							<ul class="post-list">
								<c:forEach var="post" items="${post_list}">
									<li class="post-item">
										<span class="post-category">${post.post_category}</span>
										<h3 class="post-title">
											<%-- 카테고리에 따라 tab 파라미터 설정 --%>
											<c:set var="tabParam" value="all" />
											<c:if test="${post.post_category == '스킨 에디터'}">
												<c:set var="tabParam" value="skin" />
											</c:if>
											<c:if test="${post.post_category == '리뷰'}">
												<c:set var="tabParam" value="review" />
											</c:if>
											<c:if test="${post.post_category == '자유게시판'}">
												<c:set var="tabParam" value="free" />
											</c:if>
											
											<a href="${pageContext.request.contextPath}/post/list?tab=${tabParam}&post_idx=${post.post_idx}">
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
							
							<!-- 포스트 페이징 -->
							<c:if test="${postTotalPage > 1}">
								<div class="pagination-wrapper">
									<ul class="pagination">
										<!-- 이전 버튼 -->
										<c:choose>
											<c:when test="${postPage > 1}">
												<li>
													<a href="${pageContext.request.contextPath}/search?keyword=${keyword}&productPage=${productPage}&postPage=${postPage - 1}#post-section">
														<i class="lni lni-chevron-left"></i>
													</a>
												</li>
											</c:when>
											<c:otherwise>
												<li class="disabled">
													<span>
														<i class="lni lni-chevron-left"></i>
													</span>
												</li>
											</c:otherwise>
										</c:choose>
										
										<!-- 페이지 번호 -->
										<c:forEach var="i" begin="${postStartPage}" end="${postEndPage}">
											<c:choose>
												<c:when test="${i == postPage}">
													<li class="active">
														<span>${i}</span>
													</li>
												</c:when>
												<c:otherwise>
													<li>
														<a href="${pageContext.request.contextPath}/search?keyword=${keyword}&productPage=${productPage}&postPage=${i}#post-section">
															${i}
														</a>
													</li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										
										<!-- 다음 버튼 -->
										<c:choose>
											<c:when test="${postPage < postTotalPage}">
												<li>
													<a href="${pageContext.request.contextPath}/search?keyword=${keyword}&productPage=${productPage}&postPage=${postPage + 1}#post-section">
														<i class="lni lni-chevron-right"></i>
													</a>
												</li>
											</c:when>
											<c:otherwise>
												<li class="disabled">
													<span>
														<i class="lni lni-chevron-right"></i>
													</span>
												</li>
											</c:otherwise>
										</c:choose>
									</ul>
								</div>
							</c:if>
						</c:otherwise>
					</c:choose>

				</div>
				<!-- End Content -->
			</div>
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
