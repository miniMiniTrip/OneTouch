<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.sidebar {
    width: 250px;
    background: #fafafa;
    border-right: 1px solid #e0e0e0;
    padding: 30px 0;
    min-height: calc(100vh - 400px);
}

.sidebar-header {
    padding: 15px 30px;
    font-size: 18px;
    font-weight: 700;
    color: #333;
}

.sidebar-subtitle {
    padding: 5px 30px 20px;
    font-size: 13px;
    color: #999;
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
</style>
<%@include file="/WEB-INF/views/common/header.jsp" %>

<!-- Breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6 col-md-6 col-12">
                <div class="breadcrumbs-content">
                    <h1 class="page-title">상품 목록</h1>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-12">
                <ul class="breadcrumb-nav">
                    <li><a href="${pageContext.request.contextPath}/"><i class="lni lni-home"></i> Home</a></li>
                    <li>Products</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- End Breadcrumbs -->

<!-- Product Grids -->
<section class="product-grids section">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-12">
                <!-- Start Product Sidebar -->
                <div class="sidebar">
                    <!-- Start Single Widget -->
                    <div class="single-widget search">
                        <h3>검색</h3>
                        <form action="${pageContext.request.contextPath}/product/list.do" method="get">
                            <input type="text" name="keyword" placeholder="제품명 검색..." value="${keyword}">
                            <c:if test="${not empty category}">
                                <input type="hidden" name="category" value="${category}">
                            </c:if>
                            <c:if test="${not empty sort}">
                                <input type="hidden" name="sort" value="${sort}">
                            </c:if>
                            <button type="submit"><i class="lni lni-search-alt"></i></button>
                        </form>
                    </div>
                    <!-- End Single Widget -->
                    
                    <!-- Start Single Widget -->
                    <div class="single-widget">
                        <h3>카테고리</h3>
                        <ul class="list">
                            <li>
                                <a href="${pageContext.request.contextPath}/product/list.do?category=1${not empty keyword ? '&keyword='.concat(keyword) : ''}${not empty sort ? '&sort='.concat(sort) : ''}" 
                                   class="${category eq '1' ? 'active' : ''}">
                                    스킨케어 
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/product/list.do?category=2${not empty keyword ? '&keyword='.concat(keyword) : ''}${not empty sort ? '&sort='.concat(sort) : ''}" 
                                   class="${category eq '2' ? 'active' : ''}">
                                    메이크업/선케어 
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/product/list.do?category=3${not empty keyword ? '&keyword='.concat(keyword) : ''}${not empty sort ? '&sort='.concat(sort) : ''}" 
                                   class="${category eq '3' ? 'active' : ''}">
                                    클렌징케어 
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/product/list.do${not empty keyword ? '?keyword='.concat(keyword) : ''}${not empty sort ? (not empty keyword ? '&' : '?').concat('sort=').concat(sort) : ''}" 
                                   class="${empty category ? 'active' : ''}">
                                    전체보기
                                </a>
                            </li>
                        </ul>
                    </div>
                    <!-- End Single Widget -->
                </div>
                <!-- End Product Sidebar -->
            </div>
            
            <div class="col-lg-9 col-12">
                <div class="product-grids-head">
                    <div class="product-grid-topbar">
                        <div class="row align-items-center">
                            <div class="col-lg-7 col-md-8 col-12">
                                <div class="product-sorting">
                                    <label for="sorting">정렬:</label>
                                    <select class="form-control" id="sorting" onchange="location.href=this.value;">
                                        <option value="${pageContext.request.contextPath}/product/list.do?${not empty category ? 'category='.concat(category).concat('&') : ''}${not empty keyword ? 'keyword='.concat(keyword).concat('&') : ''}sort=popular" 
                                                ${sort eq 'popular' or empty sort ? 'selected' : ''}>인기순</option>
                                        <option value="${pageContext.request.contextPath}/product/list.do?${not empty category ? 'category='.concat(category).concat('&') : ''}${not empty keyword ? 'keyword='.concat(keyword).concat('&') : ''}sort=newest" 
                                                ${sort eq 'newest' ? 'selected' : ''}>최신순</option>
                                        <option value="${pageContext.request.contextPath}/product/list.do?${not empty category ? 'category='.concat(category).concat('&') : ''}${not empty keyword ? 'keyword='.concat(keyword).concat('&') : ''}sort=price-low" 
                                                ${sort eq 'price-low' ? 'selected' : ''}>가격 낮은순</option>
                                        <option value="${pageContext.request.contextPath}/product/list.do?${not empty category ? 'category='.concat(category).concat('&') : ''}${not empty keyword ? 'keyword='.concat(keyword).concat('&') : ''}sort=price-high" 
                                                ${sort eq 'price-high' ? 'selected' : ''}>가격 높은순</option>
                                        <option value="${pageContext.request.contextPath}/product/list.do?${not empty category ? 'category='.concat(category).concat('&') : ''}${not empty keyword ? 'keyword='.concat(keyword).concat('&') : ''}sort=rating" 
                                                ${sort eq 'rating' ? 'selected' : ''}>평점순</option>
                                    </select>
                                    <h3 class="total-show-product">총 <span>${totalCount}</span>개 상품</h3>
                                </div>
                            </div>
                            <div class="col-lg-5 col-md-4 col-12">
                                <nav>
                                    <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                        <button class="nav-link active" id="nav-grid-tab" data-bs-toggle="tab"
                                            data-bs-target="#nav-grid" type="button" role="tab"
                                            aria-controls="nav-grid" aria-selected="true"><i class="lni lni-grid-alt"></i></button>
                                        <button class="nav-link" id="nav-list-tab" data-bs-toggle="tab"
                                            data-bs-target="#nav-list" type="button" role="tab"
                                            aria-controls="nav-list" aria-selected="false"><i class="lni lni-list"></i></button>
                                    </div>
                                </nav>
                            </div>
                        </div>
                    </div>
                    
                    <div class="tab-content" id="nav-tabContent">
                        <!-- Grid View -->
                        <div class="tab-pane fade show active" id="nav-grid" role="tabpanel"
                            aria-labelledby="nav-grid-tab">
                            <div class="row">
                                <c:choose>
                                    <c:when test="${empty list}">
                                        <div class="col-12">
                                            <div class="alert alert-info text-center" role="alert">
                                                <h4>검색 결과가 없습니다.</h4>
                                                <p>다른 검색어나 카테고리를 시도해보세요.</p>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach var="product" items="${list}">
                                            <div class="col-lg-4 col-md-6 col-12">
                                                <!-- Start Single Product -->
                                                <div class="single-product">
                                                    <div class="product-image">
                                                        <c:choose>
                                                            <c:when test="${not empty product.product_image_url}">
                                                                <img src="${pageContext.request.contextPath}/images/${product.product_image_url}"  alt="${product.product_name}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div class="no-image">이미지 준비중</div>
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <div class="button">
                                                            <a href="javascript:void(0);" 
                                                               onclick="addToCart(${product.product_idx})" 
                                                               class="btn"><i class="lni lni-cart"></i> 장바구니</a>
                                                        </div>
                                                        <!-- 찜하기 토글 버튼 -->
                                                        <span class="wishlist-toggle" 
                                                              onclick="toggleWishlist(${product.product_idx}, this)"
                                                              data-wishlist="${product.product_wishlist > 0 ? 'true' : 'false'}">
                                                            <i class="lni ${product.product_wishlist > 0 ? 'lni-heart-filled' : 'lni-heart'}"></i>
                                                        </span>
                                                    </div>
                                                    <div class="product-info">
                                                        <span class="category">${product.category_name}</span>
                                                        <h4 class="title">
                                                            <a href="${pageContext.request.contextPath}/product/detail?id=${product.product_idx}">
                                                                ${product.product_name}
                                                            </a>
                                                        </h4>
                                                        <div class="price">
                                                            <span><fmt:formatNumber value="${product.product_price}" pattern="#,###"/>원</span>
                                                        </div>
                                                        <div class="product-stats">
                                                            <span class="stat-item">
                                                                <i class="lni lni-shopping-basket"></i> 판매 ${product.product_cnt}
                                                            </span>
                                                            <span class="stat-item">
                                                                <i class="lni lni-heart"></i> 찜 ${product.product_wishlist}
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- End Single Product -->
                                            </div>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            
                            <!-- Pagination -->
                            <c:if test="${totalPage > 0}">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="pagination left">
                                            <ul class="pagination-list">
                                                <c:if test="${startPage > 1}">
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/product/list.do?page=${startPage-1}&pageSize=${pageSize}&sort=${sort}<c:if test='${not empty keyword}'>&keyword=${keyword}</c:if><c:if test='${not empty category}'>&category=${category}</c:if>">
                                                            <i class="lni lni-chevron-left"></i>
                                                        </a>
                                                    </li>
                                                </c:if>
                                                
                                                <c:forEach var="i" begin="${startPage}" end="${endPage}">
                                                    <li class="${i eq currentPage ? 'active' : ''}">
                                                        <a href="${pageContext.request.contextPath}/product/list.do?page=${i}&pageSize=${pageSize}&sort=${sort}<c:if test='${not empty keyword}'>&keyword=${keyword}</c:if><c:if test='${not empty category}'>&category=${category}</c:if>">
                                                            ${i}
                                                        </a>
                                                    </li>
                                                </c:forEach>
                                                
                                                <c:if test="${endPage < totalPage}">
                                                    <li>
                                                        <a href="${pageContext.request.contextPath}/product/list.do?page=${endPage+1}&pageSize=${pageSize}&sort=${sort}<c:if test='${not empty keyword}'>&keyword=${keyword}</c:if><c:if test='${not empty category}'>&category=${category}</c:if>">
                                                            <i class="lni lni-chevron-right"></i>
                                                        </a>
                                                    </li>
                                                </c:if>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                        <!-- End Grid View -->
                        
                        <!-- List View -->
                        <div class="tab-pane fade" id="nav-list" role="tabpanel"
                            aria-labelledby="nav-list-tab">
                            <div class="row">
                                <c:forEach var="product" items="${list}">
                                    <div class="col-lg-12 col-md-12 col-12">
                                        <div class="single-product list-view">
                                            <div class="row align-items-center">
                                                <div class="col-lg-4 col-md-4 col-12">
                                                    <div class="product-image">
                                                        <c:choose>
                                                            <c:when test="${not empty product.product_image_url}">
                                                                <img src="${pageContext.request.contextPath}/images/${product.product_image_url}" alt="${product.product_name}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div class="no-image">이미지 준비중</div>
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <span class="wishlist-toggle" 
                                                              onclick="toggleWishlist(${product.product_idx}, this)"
                                                              data-wishlist="${product.product_wishlist > 0 ? 'true' : 'false'}">
                                                            <i class="lni ${product.product_wishlist > 0 ? 'lni-heart-filled' : 'lni-heart'}"></i>
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="col-lg-8 col-md-8 col-12">
                                                    <div class="product-info">
                                                        <span class="category">${product.category_name}</span>
                                                        <h4 class="title">
                                                            <a href="${pageContext.request.contextPath}/product/detail?id=${product.product_idx}">
                                                                ${product.product_name}
                                                            </a>
                                                        </h4>
                                                        <p class="description">${product.product_comment}</p>
                                                        <div class="price">
                                                            <span><fmt:formatNumber value="${product.product_price}" pattern="#,###"/>원</span>
                                                        </div>
                                                        <div class="product-stats">
                                                            <span class="stat-item">
                                                                <i class="lni lni-shopping-basket"></i> 판매 ${product.product_cnt}
                                                            </span>
                                                            <span class="stat-item">
                                                                <i class="lni lni-heart"></i> 찜 ${product.product_wishlist}
                                                            </span>
                                                        </div>
                                                        <div class="button-group">
                                                            <a href="javascript:void(0);" 
                                                               onclick="addToCart(${product.product_idx})" 
                                                               class="btn btn-primary"><i class="lni lni-cart"></i> 장바구니</a>
                                                            <a href="javascript:void(0);" 
                                                               onclick="buyNow(${product.product_idx})" 
                                                               class="btn btn-alt">즉시구매</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <!-- End List View -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End Product Grids -->

<style>
/* 상품 카드 기본 스타일 */
.single-product {
    margin-bottom: 30px;
    transition: all 0.3s ease;
}

.single-product:hover {
    transform: translateY(-5px);
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

/* 상품 이미지 영역 */
.product-image {
    position: relative;
    overflow: hidden;
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

/* 찜하기 버튼 */
.wishlist-toggle {
    position: absolute;
    top: 15px;
    right: 15px;
    width: 40px;
    height: 40px;
    background: white;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    transition: all 0.3s ease;
    z-index: 2;
}

.wishlist-toggle:hover {
    transform: scale(1.1);
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
}

.wishlist-toggle i {
    font-size: 20px;
    color: #ff4757;
}

/* 상품 정보 영역 */
.product-info {
    padding: 15px;
}

.product-info .category {
    font-size: 12px;
    color: #999;
    text-transform: uppercase;
    margin-bottom: 5px;
    display: block;
}

.product-info .title {
    font-size: 15px;
    margin: 10px 0;
    height: 42px;
    overflow: hidden;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
}

.product-info .title a {
    color: #333;
    font-weight: 600;
}

.product-info .title a:hover {
    color: #0167F3;
}

.product-info .price {
    font-size: 18px;
    color: #ff4757;
    font-weight: bold;
    margin: 10px 0;
}

/* 상품 통계 */
.product-stats {
    display: flex;
    gap: 15px;
    font-size: 13px;
    color: #666;
    margin-top: 10px;
}

.product-stats .stat-item {
    display: flex;
    align-items: center;
    gap: 5px;
}

.product-stats .stat-item i {
    font-size: 16px;
}

/* 버튼 그룹 스타일 */
.button-group {
    margin-top: 10px;
    display: flex;
    gap: 10px;
}

.button-group .btn {
    flex: 1;
}

/* 리스트뷰 스타일 */
.single-product.list-view {
    margin-bottom: 30px;
    border: 1px solid #eee;
    border-radius: 8px;
    padding: 20px;
}

.single-product.list-view .product-image {
    height: 250px;
}

.single-product.list-view .description {
    color: #666;
    margin: 10px 0;
    line-height: 1.6;
    display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
    overflow: hidden;
}

/* 카테고리 링크 활성화 */
.product-sidebar .list li a.active {
    color: #0167F3;
    font-weight: 600;
}

/* 반응형 */
@media (max-width: 767px) {
    .product-image {
        height: 200px;
    }
    
    .button-group {
        flex-direction: column;
    }
    
    .button-group .btn {
        width: 100%;
    }
}
</style>

<script>
const mem_idx = ${sessionScope.user != null ? sessionScope.user.mem_idx : 'null'};

console.log('현재 로그인 상태:', mem_idx !== null ? '로그인됨 (mem_idx: ' + mem_idx + ')' : '로그인 안 됨');

// 찜하기 토글 함수
function toggleWishlist(product_idx, element) {
    if (!mem_idx || mem_idx === null) {
        alert('로그인이 필요한 서비스입니다.');
        location.href = '${pageContext.request.contextPath}/user/login';
        return;
    }
    
    const isWishlisted = element.getAttribute('data-wishlist') === 'true';
    const icon = element.querySelector('i');
    
    // AJAX 요청으로 찜하기/취소 처리
    fetch('${pageContext.request.contextPath}/wishlist/toggle.do', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: 'mem_idx=' + mem_idx + '&product_idx=' + product_idx
    })
    .then(response => response.json())
    .then(data => {
        if (data.result === 'success') {
            // UI 업데이트
            if (isWishlisted) {
                icon.className = 'lni lni-heart';
                element.setAttribute('data-wishlist', 'false');
            } else {
                icon.className = 'lni lni-heart-filled';
                element.setAttribute('data-wishlist', 'true');
                
                // 애니메이션 효과
                element.style.transform = 'scale(1.2)';
                setTimeout(() => {
                    element.style.transform = 'scale(1)';
                }, 200);
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
    
    // 즉시구매는 수량을 1로 고정하여 주문서 페이지로 이동
    location.href = '${pageContext.request.contextPath}/order/direct_form.do?product_idx=' + product_idx + '&product_cnt=1';
}
</script>


<%@include file="/WEB-INF/views/common/footer.jsp" %>
