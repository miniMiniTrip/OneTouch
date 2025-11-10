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
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap">
    
    <!-- 최적화된 CSS -->
    <style>
        :root {
            --navy-color: #38456e; /* 더 연한 네이비 색상 */
            --navy-light: #4a5883;
            --navy-pale: #eef0f6;
            --accent-color: #F6911E;
            --light-gray: #f8f9fa;
            --border-color: #e9ecef;
            --text-gray: #6c757d;
        }
        
        body {
            background-color: var(--light-gray);
            font-family: 'Noto Sans KR', sans-serif;
        }
        
        /* 페이지 헤더 스타일 - 연한 네이비 색상 */
        .page-header {
            padding: 12px 0;
            margin-bottom: 25px;
            background-color: var(--navy-color);
            position: relative;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        
        .page-title {
            font-size: 20px;
            font-weight: 500;
            margin: 0;
            color: white;
            text-align: center;
            letter-spacing: 0.5px;
        }
        
        /* 상품 제목 섹션 */
        .product-title-section {
            background-color: white;
            border-radius: 8px;
            padding: 18px 22px;
            margin-bottom: 20px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-left: 4px solid var(--navy-color);
        }
        
        .product-title {
            font-size: 18px;
            font-weight: 600;
            color: var(--navy-color);
            display: flex;
            align-items: center;
        }
        
        .product-title-icon {
            margin-right: 10px;
            width: 30px;
            height: 30px;
            background-color: var(--navy-pale);
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        
        .product-title-icon i {
            color: var(--navy-color);
            font-size: 16px;
        }
        
        /* 섹션 스타일 */
        .section {
            padding: 25px 0 40px;
        }
        
        /* 사이드바 스타일 개선 */
        .product-sidebar {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.03);
            padding: 18px;
            border: 1px solid var(--border-color);
        }
        
        .single-widget {
            margin-bottom: 22px;
            border-bottom: 1px solid var(--border-color);
            padding-bottom: 18px;
        }
        
        .single-widget:last-child {
            border-bottom: none;
            padding-bottom: 0;
            margin-bottom: 0;
        }
        
        .single-widget h3 {
            color: var(--navy-color);
            font-size: 16px;
            font-weight: 500;
            margin-bottom: 15px;
            padding-bottom: 8px;
            border-bottom: 1px solid var(--border-color);
            position: relative;
        }
        
        .single-widget h3:after {
            content: '';
            position: absolute;
            left: 0;
            bottom: -1px;
            width: 40px;
            height: 1px;
            background-color: var(--navy-color);
        }
        
        .list li {
            padding: 8px 0;
            border-bottom: 1px dashed var(--border-color);
        }
        
        .list li:last-child {
            border-bottom: none;
        }
        
        .list li a {
            color: var(--text-gray);
            transition: all 0.2s ease;
            font-size: 14px;
        }
        
        .list li a:hover, .list li a.active {
            color: var(--navy-color);
            padding-left: 5px;
        }
        
        /* 검색창 스타일 개선 */
        .search form {
            position: relative;
            margin-top: 10px;
        }
        
        .search input {
            width: 100%;
            padding: 12px 20px;
            border: 1px solid var(--border-color);
            border-radius: 50px;
            font-size: 14px;
            transition: all 0.3s ease;
            box-shadow: 0 2px 5px rgba(0,0,0,0.02);
        }
        
        .search input:focus {
            border-color: var(--navy-light);
            box-shadow: 0 0 0 3px rgba(56, 69, 110, 0.1);
            outline: none;
        }
        
        .search button {
            position: absolute;
            right: 5px;
            top: 5px;
            border: none;
            background-color: var(--navy-color);
            color: white;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .search button:hover {
            background-color: var(--navy-light);
        }
        
        /* 해시태그 스타일 개선 */
        .badge.bg-primary {
            background-color: var(--navy-pale) !important;
            color: var(--navy-color) !important;
            transition: all 0.2s ease;
            border: none;
            padding: 6px 10px;
            border-radius: 15px;
            font-weight: 400;
        }
        
        .badge.bg-primary:hover {
            background-color: var(--navy-light) !important;
            color: white !important;
        }
        
        .badge.bg-light {
            background-color: var(--navy-pale) !important;
            color: var(--navy-color) !important;
            transition: all 0.2s ease;
            border-radius: 15px;
        }
        
        .badge.bg-light:hover {
            background-color: var(--light-gray) !important;
        }
        
        /* 가격 범위 슬라이더 개선 */
        .range-inner {
            display: flex;
            align-items: center;
            margin-top: 10px;
        }
        
        .range-inner input[type="text"] {
            text-align: right;
            border: 1px solid var(--border-color);
            border-radius: 5px;
            padding: 5px 10px;
            margin: 0 10px;
            width: 120px;
            background-color: var(--light-gray);
        }
        
        .form-range {
            margin: 10px 0;
        }
        
        .form-range::-webkit-slider-thumb {
            background: var(--navy-color);
        }
        
        /* 체크박스 스타일 개선 */
        .form-check {
            margin-bottom: 8px;
        }
        
        .form-check-input:checked {
            background-color: var(--navy-color);
            border-color: var(--navy-color);
        }
        
        .form-check-label {
            font-size: 14px;
            color: var(--text-gray);
        }
        
        /* 필터 초기화 버튼 */
        .btn-outline-secondary {
            color: var(--navy-color);
            border-color: var(--navy-color);
        }
        
        .btn-outline-secondary:hover {
            background-color: var(--navy-color);
            color: white;
        }
        
        /* 메인 컨텐츠 영역 스타일 개선 */
        .product-grids-head {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.03);
            padding: 20px;
            border: 1px solid var(--border-color);
        }
        
        .product-grid-topbar {
            border-bottom: 1px solid var(--border-color);
            padding-bottom: 15px;
            margin-bottom: 20px;
        }
        
        /* 상품 개수 표시 - 더 작게 */
        .product-sorting label {
            color: var(--text-gray);
            font-size: 14px;
            margin-right: 10px;
        }
        
        .product-sorting select {
            border-radius: 20px;
            border: 1px solid var(--border-color);
            padding: 7px 15px;
            font-size: 14px;
        }
        
        .total-show-product {
            font-size: 12px;
            color: var(--text-gray);
            margin-top: 8px;
            opacity: 0.8;
        }
        
        /* 상품 카드 스타일 개선 */
        .single-product {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.03);
            transition: all 0.3s ease;
            margin-bottom: 25px;
            overflow: hidden;
            border: 1px solid var(--border-color);
        }
        
        .single-product:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
        }
        
        .product-image {
            position: relative;
            overflow: hidden;
        }
        
        .product-image img {
            transition: transform 0.5s ease;
        }
        
        .single-product:hover .product-image img {
            transform: scale(1.05);
        }
        
        .sale-tag, .new-tag {
            position: absolute;
            top: 15px;
            z-index: 2;
            padding: 4px 10px;
            border-radius: 20px;
            font-weight: 400;
            font-size: 12px;
        }
        
        .sale-tag {
            left: 15px;
            background-color: #ff6b6b;
            color: white;
        }
        
        .new-tag {
            right: 15px;
            background-color: var(--navy-color);
            color: white;
        }
        
        .product-image .button {
            position: absolute;
            bottom: -60px;
            left: 0;
            right: 0;
            text-align: center;
            transition: all 0.3s ease;
            opacity: 0;
        }
        
        .single-product:hover .button {
            bottom: 15px;
            opacity: 1;
        }
        
        .product-image .button .btn {
            background-color: var(--navy-color);
            color: white;
            border-radius: 50px;
            padding: 8px 20px;
            font-size: 14px;
            font-weight: 400;
            transition: all 0.3s ease;
        }
        
        .product-image .button .btn:hover {
            background-color: var(--navy-light);
        }
        
        .product-info {
            padding: 15px;
        }
        
        .category {
            display: inline-block;
            font-size: 12px;
            color: var(--text-gray);
            margin-bottom: 5px;
        }
        
        .product-info h4.title {
            font-weight: 500;
            margin-bottom: 10px;
            font-size: 16px;
            line-height: 1.3;
            height: 42px;
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
        }
        
        .product-info h4.title a {
            color: #333;
            transition: all 0.2s ease;
        }
        
        .product-info h4.title a:hover {
            color: var(--navy-color);
        }
        
        /* 별점 스타일 개선 */
        .review {
            margin-bottom: 10px;
        }
        
        .review li {
            display: inline-block;
            margin-right: 2px;
        }
        
        .review li i {
            color: #ddd;
            font-size: 14px;
        }
        
        .review li i.lni-star-filled {
            color: #FFCC00;
        }
        
        .review li span {
            font-size: 12px;
            color: var(--text-gray);
            margin-left: 5px;
        }
        
        /* 가격 스타일 개선 */
        .price {
            margin-top: 10px;
            font-weight: 500;
        }
        
        .price span {
            color: #333;
            font-size: 16px;
        }
        
        .discount-price {
            text-decoration: line-through;
            color: #888 !important;
            font-size: 13px !important;
            font-weight: 400;
            margin-left: 8px;
        }
        
        /* 페이지네이션 스타일 개선 */
        .pagination {
            margin-top: 30px;
            text-align: center;
        }
        
        .pagination-list {
            display: inline-flex;
            list-style: none;
            padding: 0;
            margin: 0;
        }
        
        .pagination-list li {
            margin: 0 3px;
        }
        
        .pagination-list li a {
            display: inline-block;
            width: 36px;
            height: 36px;
            line-height: 36px;
            text-align: center;
            border-radius: 4px;
            background-color: white;
            color: var(--text-gray);
            border: 1px solid var(--border-color);
            transition: all 0.3s ease;
        }
        
        .pagination-list li.active a, .pagination-list li a:hover {
            background-color: var(--navy-color);
            color: white;
            border-color: var(--navy-color);
        }
        
        /* 관리자 버튼 스타일 */
        .admin-button {
            position: fixed;
            bottom: 30px;
            right: 30px;
            z-index: 999;
            background-color: white;
            color: var(--navy-color);
            border: 1px solid var(--navy-color);
            border-radius: 50px;
            padding: 10px 20px;
            font-weight: 500;
            font-size: 14px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 8px;
            transition: all 0.3s ease;
        }
        
        .admin-button:hover {
            background-color: var(--navy-color);
            color: white;
        }
        
        .admin-button i {
            font-size: 16px;
        }
        
        /* 탭 네비게이션 */
        .nav-tabs .nav-link {
            border: none;
            padding: 8px 15px;
            color: var(--text-gray);
            background-color: #f8f9fa;
            border-radius: 4px;
            margin-right: 5px;
        }
        
        .nav-tabs .nav-link.active {
            color: white;
            background-color: var(--navy-color);
        }
        
        /* 목록 뷰 스타일 */
        #nav-list .single-product {
            margin-bottom: 15px;
        }
        
        #nav-list .product-image {
            height: 180px;
        }
        
        #nav-list .product-info {
            padding: 15px;
        }
        
        #nav-list .text-muted {
            font-size: 13px;
            margin-bottom: 10px;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        
        /* 검색 결과 없음 박스 크게 */
        .no-products-alert {
            padding: 40px 25px;
            border-radius: 8px;
            background-color: #f8f9fa;
            text-align: center;
            margin: 30px 0;
        }
        
        .no-products-alert i {
            font-size: 4rem;
            color: var(--text-gray);
            margin-bottom: 20px;
        }
        
        .no-products-alert h4 {
            font-size: 22px;
            margin-bottom: 15px;
            color: var(--navy-color);
        }
        
        .no-products-alert p {
            font-size: 16px;
            color: var(--text-gray);
            margin-bottom: 20px;
        }
        
        .no-products-alert .btn {
            padding: 10px 25px;
            background-color: var(--navy-color);
            border: none;
        }
        
        .no-products-alert .btn:hover {
            background-color: var(--navy-light);
        }
    </style>
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
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <!-- End Header Area -->

    <!-- 관리자 버튼 추가 -->
    <c:if test="${sessionScope.user.mem_role eq 'ADMIN' or sessionScope.user.mem_role eq 'admin'}">
        <a href="${pageContext.request.contextPath}/product/insert_form" class="admin-button">
            <i class="lni lni-cog"></i> 상품 등록
        </a>
    </c:if>

    <!-- 간단한 페이지 타이틀 (브레드크럼 대체) -->
    <div class="page-header">
        <div class="container">
            <h1 class="page-title">
                <c:choose>
                    <c:when test="${not empty categoryName}">${categoryName}</c:when>
                    <c:when test="${not empty searchKeyword}">검색: ${searchKeyword}</c:when>
                    <c:otherwise>전체 상품</c:otherwise>
                </c:choose>
            </h1>
        </div>
    </div>

    <!-- Start Product Grids -->
    <section class="product-grids section">
        <div class="container">
            <!-- 상품 제목 섹션 -->
            <div class="product-title-section">
                <div class="product-title">
                    <div class="product-title-icon">
                        <i class="lni lni-package"></i>
                    </div>
                    상품 목록
                </div>
            </div>
            
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
                                       class="badge bg-primary me-1 mb-2">
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
                                    
                                    <!-- 상품이 없을 때 - 더 크고 세련되게 -->
                                    <c:if test="${empty products}">
                                        <div class="col-12">
                                            <div class="no-products-alert">
                                                <i class="lni lni-search"></i>
                                                <h4>검색 결과가 없습니다</h4>
                                                <p>다른 키워드나 필터로 다시 검색해보세요.</p>
                                                <a href="${pageContext.request.contextPath}/product/list" 
                                                   class="btn btn-primary">
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
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
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
        
    </script>
</body>
</html>
