<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
                <div class="product-sidebar">
                    <!-- Start Single Widget -->
                    <div class="single-widget search">
                        <h3>검색</h3>
                        <form action="${pageContext.request.contextPath}/products" method="get">
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
                                <a href="${pageContext.request.contextPath}/products?category=skincare${not empty keyword ? '&keyword='.concat(keyword) : ''}${not empty sort ? '&sort='.concat(sort) : ''}" 
                                   class="${category eq 'skincare' ? 'active' : ''}">
                                    스킨케어 
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/products?category=cleansing${not empty keyword ? '&keyword='.concat(keyword) : ''}${not empty sort ? '&sort='.concat(sort) : ''}" 
                                   class="${category eq 'cleansing' ? 'active' : ''}">
                                    클렌징 
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/products?category=haircare${not empty keyword ? '&keyword='.concat(keyword) : ''}${not empty sort ? '&sort='.concat(sort) : ''}" 
                                   class="${category eq 'haircare' ? 'active' : ''}">
                                    헤어케어 
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/products?category=bodycare${not empty keyword ? '&keyword='.concat(keyword) : ''}${not empty sort ? '&sort='.concat(sort) : ''}" 
                                   class="${category eq 'bodycare' ? 'active' : ''}">
                                    바디케어 
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/products${not empty keyword ? '?keyword='.concat(keyword) : ''}${not empty sort ? (not empty keyword ? '&' : '?').concat('sort=').concat(sort) : ''}" 
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
                                        <option value="${pageContext.request.contextPath}/products?${not empty category ? 'category='.concat(category).concat('&') : ''}${not empty keyword ? 'keyword='.concat(keyword).concat('&') : ''}sort=popular" 
                                                ${sort eq 'popular' or empty sort ? 'selected' : ''}>인기순</option>
                                        <option value="${pageContext.request.contextPath}/products?${not empty category ? 'category='.concat(category).concat('&') : ''}${not empty keyword ? 'keyword='.concat(keyword).concat('&') : ''}sort=newest" 
                                                ${sort eq 'newest' ? 'selected' : ''}>최신순</option>
                                        <option value="${pageContext.request.contextPath}/products?${not empty category ? 'category='.concat(category).concat('&') : ''}${not empty keyword ? 'keyword='.concat(keyword).concat('&') : ''}sort=price-low" 
                                                ${sort eq 'price-low' ? 'selected' : ''}>가격 낮은순</option>
                                        <option value="${pageContext.request.contextPath}/products?${not empty category ? 'category='.concat(category).concat('&') : ''}${not empty keyword ? 'keyword='.concat(keyword).concat('&') : ''}sort=price-high" 
                                                ${sort eq 'price-high' ? 'selected' : ''}>가격 높은순</option>
                                        <option value="${pageContext.request.contextPath}/products?${not empty category ? 'category='.concat(category).concat('&') : ''}${not empty keyword ? 'keyword='.concat(keyword).concat('&') : ''}sort=wishlist" 
                                                ${sort eq 'wishlist' ? 'selected' : ''}>찜 많은순</option>
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
                                                        <img src="${product.product_image_url}" alt="${product.product_name}">
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
                                                        <p class="brand">${product.product_brand}</p>
                                                        <div class="price">
                                                            <span><fmt:formatNumber value="${product.product_price}" pattern="#,###"/>원</span>
                                                        </div>
                                                        <div class="product-stats">
                                                            <span class="stat-item"><i class="lni lni-heart"></i> ${product.product_wishlist}</span>
                                                            <span class="stat-item"><i class="lni lni-cart"></i> ${product.product_cnt}</span>
                                                        </div>
                                                        <div class="button-group">
                                                            <a href="javascript:void(0);" 
                                                               onclick="buyNow(${product.product_idx})" 
                                                               class="btn btn-primary btn-sm">즉시구매</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- End Single Product -->
                                            </div>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        
                        <!-- List View -->
                        <div class="tab-pane fade" id="nav-list" role="tabpanel" aria-labelledby="nav-list-tab">
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
                                            <div class="col-12">
                                                <!-- Start Single Product -->
                                                <div class="single-product list-view">
                                                    <div class="row align-items-center">
                                                        <div class="col-lg-4 col-md-4 col-12">
                                                            <div class="product-image">
                                                                <img src="${product.product_image_url}" alt="${product.product_name}">
                                                                <!-- 찜하기 토글 버튼 -->
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
                                                                <p class="brand">${product.product_brand}</p>
                                                                <p class="description">${fn:substring(product.product_comment, 0, 100)}...</p>
                                                                <div class="price">
                                                                    <span><fmt:formatNumber value="${product.product_price}" pattern="#,###"/>원</span>
                                                                </div>
                                                                <div class="product-stats">
                                                                    <span class="stat-item"><i class="lni lni-heart"></i> 찜 ${product.product_wishlist}</span>
                                                                    <span class="stat-item"><i class="lni lni-cart"></i> 구매 ${product.product_cnt}</span>
                                                                </div>
                                                                <div class="button-group mt-3">
                                                                    <a href="javascript:void(0);" 
                                                                       onclick="buyNow(${product.product_idx})" 
                                                                       class="btn btn-primary">즉시구매</a>
                                                                    <a href="javascript:void(0);" 
                                                                       onclick="addToCart(${product.product_idx})" 
                                                                       class="btn btn-outline-primary ms-2"><i class="lni lni-cart"></i> 장바구니</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- End Single Product -->
                                            </div>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Pagination -->
                <c:if test="${totalPage > 0}">
                    <div class="row">
                        <div class="col-12">
                            <div class="pagination left">
                                <ul class="pagination-list">
                                    <!-- 이전 페이지 -->
                                    <c:if test="${currentPage > 1}">
                                        <li>
                                            <a href="${pageContext.request.contextPath}/products?page=${currentPage - 1}${not empty category ? '&category='.concat(category) : ''}${not empty keyword ? '&keyword='.concat(keyword) : ''}${not empty sort ? '&sort='.concat(sort) : ''}">
                                                <i class="lni lni-chevron-left"></i>
                                            </a>
                                        </li>
                                    </c:if>
                                    
                                    <!-- 페이지 번호 -->
                                    <c:forEach var="i" begin="${startPage}" end="${endPage}">
                                        <li class="${i eq currentPage ? 'active' : ''}">
                                            <a href="${pageContext.request.contextPath}/products?page=${i}${not empty category ? '&category='.concat(category) : ''}${not empty keyword ? '&keyword='.concat(keyword) : ''}${not empty sort ? '&sort='.concat(sort) : ''}">
                                                ${i}
                                            </a>
                                        </li>
                                    </c:forEach>
                                    
                                    <!-- 다음 페이지 -->
                                    <c:if test="${currentPage < totalPage}">
                                        <li>
                                            <a href="${pageContext.request.contextPath}/products?page=${currentPage + 1}${not empty category ? '&category='.concat(category) : ''}${not empty keyword ? '&keyword='.concat(keyword) : ''}${not empty sort ? '&sort='.concat(sort) : ''}">
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
        </div>
    </div>
</section>
<!-- End Product Grids -->

<style>
/* 찜하기 버튼 스타일 */
.wishlist-toggle {
    position: absolute;
    top: 15px;
    right: 15px;
    width: 40px;
    height: 40px;
    background: rgba(255, 255, 255, 0.9);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    transition: all 0.3s ease;
    z-index: 10;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.wishlist-toggle:hover {
    background: #fff;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
    transform: scale(1.1);
}

.wishlist-toggle i {
    font-size: 20px;
    color: #666;
    transition: all 0.3s ease;
}

.wishlist-toggle i.lni-heart-filled {
    color: #ff6b6b;
}

.wishlist-toggle:hover i {
    color: #ff6b6b;
}

/* 상품 통계 스타일 */
.product-stats {
    display: flex;
    gap: 15px;
    margin: 10px 0;
    font-size: 14px;
    color: #666;
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
}

.button-group .btn {
    width: 100%;
}

/* 리스트뷰 스타일 개선 */
.single-product.list-view {
    margin-bottom: 30px;
    border: 1px solid #eee;
    border-radius: 8px;
    padding: 20px;
    transition: all 0.3s ease;
}

.single-product.list-view:hover {
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

.single-product.list-view .product-image {
    position: relative;
    border-radius: 8px;
    overflow: hidden;
}

.single-product.list-view .description {
    color: #666;
    margin: 10px 0;
    line-height: 1.6;
}

/* 카테고리 링크 활성화 스타일 */
.product-sidebar .list li a.active {
    color: #081828;
    font-weight: 600;
}

/* 반응형 개선 */
@media (max-width: 767px) {
    .button-group .btn {
        font-size: 14px;
        padding: 8px 15px;
    }
    
    .wishlist-toggle {
        width: 35px;
        height: 35px;
    }
    
    .wishlist-toggle i {
        font-size: 18px;
    }
}
</style>

<script>
// 찜하기 토글 함수
function toggleWishlist(product_idx, element) {
    const mem_idx = ${sessionScope.mem_idx != null ? sessionScope.mem_idx : 'null'};
    
    if (!mem_idx) {
        alert('로그인이 필요한 서비스입니다.');
        location.href = '${pageContext.request.contextPath}/member/login.do';
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
        } else {
            alert('처리 중 오류가 발생했습니다.');
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('처리 중 오류가 발생했습니다.');
    });
}

// 장바구니 추가 함수
function addToCart(product_idx) {
    const mem_idx = ${sessionScope.mem_idx != null ? sessionScope.mem_idx : 'null'};
    
    if (!mem_idx) {
        alert('로그인이 필요한 서비스입니다.');
        location.href = '${pageContext.request.contextPath}/member/login.do';
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
    const mem_idx = ${sessionScope.mem_idx != null ? sessionScope.mem_idx : 'null'};
    
    if (!mem_idx) {
        alert('로그인이 필요한 서비스입니다.');
        location.href = '${pageContext.request.contextPath}/member/login.do';
        return;
    }
    
    // 즉시구매는 수량을 1로 고정하여 주문서 페이지로 이동
    location.href = '${pageContext.request.contextPath}/order/direct_form.do?product_idx=' + product_idx + '&product_cnt=1';
}
</script>

<%@include file="/WEB-INF/views/common/footer.jsp" %>
