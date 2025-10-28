<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>상품 목록 - OneTouch</title>
    <meta name="description" content="2030 남성 뷰티 쇼핑몰 OneTouch">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/images/favicon.svg">

    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/LineIcons.3.0.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/tiny-slider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/glightbox.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
</head>

<body>
    <!-- Preloader -->
    <div class="preloader">
        <div class="preloader-inner">
            <div class="preloader-icon">
                <span></span>
                <span></span>
            </div>
        </div>
    </div>
    <!-- /End Preloader -->

    <!-- Start Header Area -->
    <c:import url="/WEB-INF/views/include/header.jsp" />
    <!-- End Header Area -->

    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">
                            <c:choose>
                                <c:when test="${not empty categoryName}">${categoryName}</c:when>
                                <c:when test="${not empty searchKeyword}">검색: ${searchKeyword}</c:when>
                                <c:otherwise>전체 상품</c:otherwise>
                            </c:choose>
                        </h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="${pageContext.request.contextPath}/"><i class="lni lni-home"></i> 홈</a></li>
                        <li>상품</li>
                        <c:if test="${not empty categoryName}">
                            <li>${categoryName}</li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    <!-- Start Product Grids -->
    <section class="product-grids section">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-12">
                    <!-- Start Product Sidebar -->
                    <div class="product-sidebar">
                        <!-- Start Single Widget - Search -->
                        <div class="single-widget search">
                            <h3>상품 검색</h3>
                            <form action="${pageContext.request.contextPath}/product/search" method="get">
                                <input type="text" name="keyword" placeholder="검색어를 입력하세요..." 
                                       value="${searchKeyword}">
                                <button type="submit"><i class="lni lni-search-alt"></i></button>
                            </form>
                        </div>
                        <!-- End Single Widget -->
                        
                        <!-- Start Single Widget - Categories -->
                        <div class="single-widget">
                            <h3>카테고리</h3>
                            <ul class="list">
                                <c:forEach var="category" items="${categories}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/product/list?categoryId=${category.categoryId}"
                                           class="${categoryId == category.categoryId ? 'active' : ''}">
                                            ${category.name}
                                        </a>
                                        <span>(${category.productCount})</span>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <!-- End Single Widget -->
                        
                        <!-- Start Single Widget - Hashtags (OneTouch 특화) -->
                        <div class="single-widget">
                            <h3>해시태그</h3>
                            <div class="hashtag-container">
                                <c:forEach var="hashtag" items="${popularHashtags}">
                                    <a href="${pageContext.request.contextPath}/product/list?hashtagId=${hashtag.hashtagId}" 
                                       class="badge bg-primary me-1 mb-2" 
                                       style="font-size: 0.9rem; padding: 0.5rem 0.8rem;">
                                        #${hashtag.name}
                                    </a>
                                </c:forEach>
                            </div>
                            <small class="text-muted">내 추천 해시태그는 
                                <a href="${pageContext.request.contextPath}/user/mypage">마이페이지</a>에서 확인하세요
                            </small>
                        </div>
                        <!-- End Single Widget -->
                        
                        <!-- Start Single Widget - Price Range -->
                        <div class="single-widget range">
                            <h3>가격 범위</h3>
                            <form id="priceRangeForm">
                                <input type="range" class="form-range" name="maxPrice" 
                                       step="1000" min="0" max="500000" 
                                       value="${maxPrice != null ? maxPrice : 500000}" 
                                       id="priceRange">
                                <div class="range-inner">
                                    <label>최대</label>
                                    <input type="text" id="priceDisplay" value="500,000" readonly>
                                    <label>원</label>
                                </div>
                            </form>
                        </div>
                        <!-- End Single Widget -->
                        
                        <!-- Start Single Widget - Filter by Price -->
                        <div class="single-widget condition">
                            <h3>가격대별</h3>
                            <div class="form-check">
                                <input class="form-check-input price-filter" type="checkbox" 
                                       value="0-30000" id="price1">
                                <label class="form-check-label" for="price1">
                                    3만원 이하
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input price-filter" type="checkbox" 
                                       value="30000-50000" id="price2">
                                <label class="form-check-label" for="price2">
                                    3만원 - 5만원
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input price-filter" type="checkbox" 
                                       value="50000-100000" id="price3">
                                <label class="form-check-label" for="price3">
                                    5만원 - 10만원
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input price-filter" type="checkbox" 
                                       value="100000-999999" id="price4">
                                <label class="form-check-label" for="price4">
                                    10만원 이상
                                </label>
                            </div>
                        </div>
                        <!-- End Single Widget -->
                        
                        <!-- Start Single Widget - Filter by Brand (OneTouch는 브랜드 대신 스킨타입) -->
                        <div class="single-widget condition">
                            <h3>피부 타입</h3>
                            <div class="form-check">
                                <input class="form-check-input skin-filter" type="checkbox" 
                                       value="건성" id="skin1">
                                <label class="form-check-label" for="skin1">
                                    건성
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input skin-filter" type="checkbox" 
                                       value="지성" id="skin2">
                                <label class="form-check-label" for="skin2">
                                    지성
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input skin-filter" type="checkbox" 
                                       value="복합성" id="skin3">
                                <label class="form-check-label" for="skin3">
                                    복합성
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input skin-filter" type="checkbox" 
                                       value="민감성" id="skin4">
                                <label class="form-check-label" for="skin4">
                                    민감성
                                </label>
                            </div>
                        </div>
                        <!-- End Single Widget -->
                        
                        <!-- 필터 초기화 버튼 -->
                        <div class="single-widget">
                            <button class="btn btn-outline-secondary w-100" id="resetFilters">
                                <i class="lni lni-reload"></i> 필터 초기화
                            </button>
                        </div>
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
                                        <select class="form-control" id="sorting" onchange="location.href=this.value">
                                            <option value="?sort=popularity" ${sort == 'popularity' ? 'selected' : ''}>인기순</option>
                                            <option value="?sort=sales" ${sort == 'sales' ? 'selected' : ''}>판매량순</option>
                                            <option value="?sort=price_asc" ${sort == 'price_asc' ? 'selected' : ''}>낮은 가격순</option>
                                            <option value="?sort=price_desc" ${sort == 'price_desc' ? 'selected' : ''}>높은 가격순</option>
                                            <option value="?sort=rating" ${sort == 'rating' ? 'selected' : ''}>평점순</option>
                                            <option value="?sort=newest" ${sort == 'newest' ? 'selected' : ''}>최신순</option>
                                        </select>
                                        <h3 class="total-show-product">
                                            표시: <span>${startNum} - ${endNum}개 / 전체 ${totalCount}개</span>
                                        </h3>
                                    </div>
                                </div>
                                <div class="col-lg-5 col-md-4 col-12">
                                    <nav>
                                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                            <button class="nav-link active" id="nav-grid-tab" 
                                                    data-bs-toggle="tab" data-bs-target="#nav-grid" 
                                                    type="button" role="tab" aria-controls="nav-grid" 
                                                    aria-selected="true">
                                                <i class="lni lni-grid-alt"></i>
                                            </button>
                                            <button class="nav-link" id="nav-list-tab" 
                                                    data-bs-toggle="tab" data-bs-target="#nav-list" 
                                                    type="button" role="tab" aria-controls="nav-list" 
                                                    aria-selected="false">
                                                <i class="lni lni-list"></i>
                                            </button>
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
                                    <c:forEach var="product" items="${products}">
                                        <div class="col-lg-4 col-md-6 col-12">
                                            <!-- Start Single Product -->
                                            <div class="single-product">
                                                <div class="product-image">
                                                    <img src="${pageContext.request.contextPath}${product.imageUrl}" 
                                                         alt="${product.name}">
                                                    
                                                    <!-- 할인 태그 -->
                                                    <c:if test="${product.discountRate > 0}">
                                                        <span class="sale-tag">-${product.discountRate}%</span>
                                                    </c:if>
                                                    
                                                    <!-- 신상품 태그 -->
                                                    <c:if test="${product.isNew}">
                                                        <span class="new-tag">NEW</span>
                                                    </c:if>
                                                    
                                                    <div class="button">
                                                        <a href="${pageContext.request.contextPath}/product/detail/${product.productId}" 
                                                           class="btn">
                                                            <i class="lni lni-cart"></i> 장바구니
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="product-info">
                                                    <span class="category">${product.categoryName}</span>
                                                    <h4 class="title">
                                                        <a href="${pageContext.request.contextPath}/product/detail/${product.productId}">
                                                            ${product.name}
                                                        </a>
                                                    </h4>
                                                    
                                                    <!-- 별점 -->
                                                    <ul class="review">
                                                        <c:forEach begin="1" end="5" var="i">
                                                            <li>
                                                                <i class="lni lni-star${i <= product.avgRating ? '-filled' : ''}"></i>
                                                            </li>
                                                        </c:forEach>
                                                        <li><span>${product.avgRating} (${product.reviewCount})</span></li>
                                                    </ul>
                                                    
                                                    <!-- 가격 -->
                                                    <div class="price">
                                                        <c:choose>
                                                            <c:when test="${product.discountRate > 0}">
                                                                <span><fmt:formatNumber value="${product.salePrice}" pattern="#,###"/>원</span>
                                                                <span class="discount-price">
                                                                    <fmt:formatNumber value="${product.price}" pattern="#,###"/>원
                                                                </span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span><fmt:formatNumber value="${product.price}" pattern="#,###"/>원</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                    
                                                    <!-- 해시태그 (OneTouch 특화) -->
                                                    <c:if test="${not empty product.hashtags}">
                                                        <div class="product-hashtags mt-2">
                                                            <c:forEach var="hashtag" items="${product.hashtags}" end="2">
                                                                <small class="badge bg-light text-dark me-1">
                                                                    #${hashtag}
                                                                </small>
                                                            </c:forEach>
                                                        </div>
                                                    </c:if>
                                                </div>
                                            </div>
                                            <!-- End Single Product -->
                                        </div>
                                    </c:forEach>
                                    
                                    <!-- 상품이 없을 때 -->
                                    <c:if test="${empty products}">
                                        <div class="col-12">
                                            <div class="alert alert-info text-center" role="alert">
                                                <i class="lni lni-sad" style="font-size: 3rem;"></i>
                                                <h4 class="mt-3">검색 결과가 없습니다</h4>
                                                <p>다른 키워드나 필터로 다시 검색해보세요.</p>
                                                <a href="${pageContext.request.contextPath}/product/list" 
                                                   class="btn btn-primary mt-2">
                                                    전체 상품 보기
                                                </a>
                                            </div>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                            
                            <!-- List View -->
                            <div class="tab-pane fade" id="nav-list" role="tabpanel" 
                                 aria-labelledby="nav-list-tab">
                                <div class="row">
                                    <c:forEach var="product" items="${products}">
                                        <div class="col-lg-12 col-md-12 col-12">
                                            <!-- Start Single Product -->
                                            <div class="single-product">
                                                <div class="row align-items-center">
                                                    <div class="col-lg-4 col-md-4 col-12">
                                                        <div class="product-image">
                                                            <img src="${pageContext.request.contextPath}${product.imageUrl}" 
                                                                 alt="${product.name}">
                                                            
                                                            <c:if test="${product.discountRate > 0}">
                                                                <span class="sale-tag">-${product.discountRate}%</span>
                                                            </c:if>
                                                            
                                                            <c:if test="${product.isNew}">
                                                                <span class="new-tag">NEW</span>
                                                            </c:if>
                                                            
                                                            <div class="button">
                                                                <a href="${pageContext.request.contextPath}/product/detail/${product.productId}" 
                                                                   class="btn">
                                                                    <i class="lni lni-cart"></i> 장바구니
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-8 col-md-8 col-12">
                                                        <div class="product-info">
                                                            <span class="category">${product.categoryName}</span>
                                                            <h4 class="title">
                                                                <a href="${pageContext.request.contextPath}/product/detail/${product.productId}">
                                                                    ${product.name}
                                                                </a>
                                                            </h4>
                                                            
                                                            <!-- 간단한 설명 추가 -->
                                                            <p class="text-muted">${product.description}</p>
                                                            
                                                            <ul class="review">
                                                                <c:forEach begin="1" end="5" var="i">
                                                                    <li>
                                                                        <i class="lni lni-star${i <= product.avgRating ? '-filled' : ''}"></i>
                                                                    </li>
                                                                </c:forEach>
                                                                <li><span>${product.avgRating} (${product.reviewCount})</span></li>
                                                            </ul>
                                                            
                                                            <div class="price">
                                                                <c:choose>
                                                                    <c:when test="${product.discountRate > 0}">
                                                                        <span><fmt:formatNumber value="${product.salePrice}" pattern="#,###"/>원</span>
                                                                        <span class="discount-price">
                                                                            <fmt:formatNumber value="${product.price}" pattern="#,###"/>원
                                                                        </span>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <span><fmt:formatNumber value="${product.price}" pattern="#,###"/>원</span>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </div>
                                                            
                                                            <!-- 해시태그 -->
                                                            <c:if test="${not empty product.hashtags}">
                                                                <div class="product-hashtags mt-2">
                                                                    <c:forEach var="hashtag" items="${product.hashtags}">
                                                                        <small class="badge bg-light text-dark me-1">
                                                                            #${hashtag}
                                                                        </small>
                                                                    </c:forEach>
                                                                </div>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- End Single Product -->
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Pagination -->
                        <c:if test="${totalPages > 1}">
                            <div class="row">
                                <div class="col-12">
                                    <div class="pagination left">
                                        <ul class="pagination-list">
                                            <!-- 이전 페이지 -->
                                            <c:if test="${currentPage > 1}">
                                                <li>
                                                    <a href="?page=${currentPage - 1}&sort=${sort}">
                                                        <i class="lni lni-chevron-left"></i>
                                                    </a>
                                                </li>
                                            </c:if>
                                            
                                            <!-- 페이지 번호 -->
                                            <c:forEach begin="${startPage}" end="${endPage}" var="i">
                                                <li class="${i == currentPage ? 'active' : ''}">
                                                    <a href="?page=${i}&sort=${sort}">${i}</a>
                                                </li>
                                            </c:forEach>
                                            
                                            <!-- 다음 페이지 -->
                                            <c:if test="${currentPage < totalPages}">
                                                <li>
                                                    <a href="?page=${currentPage + 1}&sort=${sort}">
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
        </div>
    </section>
    <!-- End Product Grids -->

    <!-- Start Footer Area -->
    <c:import url="/WEB-INF/views/include/footer.jsp" />
    <!-- End Footer Area -->

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top">
        <i class="lni lni-chevron-up"></i>
    </a>

    <!-- ========================= JS here ========================= -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/tiny-slider.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/glightbox.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
    
    <script>
        // 프리로더 제거
        window.addEventListener('load', function() {
            const preloader = document.querySelector('.preloader');
            if (preloader) {
                preloader.style.opacity = '0';
                setTimeout(() => preloader.style.display = 'none', 500);
            }
        });

        // 가격 범위 슬라이더
        const priceRange = document.getElementById('priceRange');
        const priceDisplay = document.getElementById('priceDisplay');
        
        if (priceRange && priceDisplay) {
            priceRange.addEventListener('input', function() {
                const value = parseInt(this.value);
                priceDisplay.value = value.toLocaleString('ko-KR');
            });
        }

        // 필터 초기화
        document.getElementById('resetFilters').addEventListener('click', function() {
            window.location.href = '${pageContext.request.contextPath}/product/list';
        });

        // 체크박스 필터 (선택사항 - 백엔드 미구현 시 주석처리)
        /*
        const priceFilters = document.querySelectorAll('.price-filter');
        const skinFilters = document.querySelectorAll('.skin-filter');
        
        function applyFilters() {
            const selectedPrices = Array.from(priceFilters)
                .filter(cb => cb.checked)
                .map(cb => cb.value);
            
            const selectedSkins = Array.from(skinFilters)
                .filter(cb => cb.checked)
                .map(cb => cb.value);
            
            const params = new URLSearchParams(window.location.search);
            
            if (selectedPrices.length > 0) {
                params.set('priceRange', selectedPrices.join(','));
            } else {
                params.delete('priceRange');
            }
            
            if (selectedSkins.length > 0) {
                params.set('skinType', selectedSkins.join(','));
            } else {
                params.delete('skinType');
            }
            
            window.location.search = params.toString();
        }
        
        priceFilters.forEach(cb => cb.addEventListener('change', applyFilters));
        skinFilters.forEach(cb => cb.addEventListener('change', applyFilters));
        */
    </script>
</body>
</html>
