<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>커뮤니티</title>
    <meta name="description" content="해시태그 기반 맞춤 추천으로 나에게 딱 맞는 뷰티 제품을 찾아보세요" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/images/favicon.svg" />

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/LineIcons.3.0.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/tiny-slider.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/glightbox.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
    
    <style>
       /* OneTouch 커뮤니티 스타일 */
:root {
    --onetouch-navy: #000033;
    --onetouch-light-blue: #3366cc;
    --onetouch-accent: #ff3366;
    --onetouch-text: #333333;
    --onetouch-light-gray: #f4f5f7;
    --onetouch-border: #e0e0e0;
}

body {
    background-color: #f9f9f9;
    font-family: 'Noto Sans KR', sans-serif;
    color: var(--onetouch-text);
}

/* 커뮤니티 메인 스타일 */
.community-content {
    max-width: 620px;
    margin: 0 auto;
    padding-bottom: 50px;
}

/* 상단 탭 내비게이션 */
.community-tabs {
    display: flex;
    justify-content: space-around;
    border-bottom: 1px solid #ddd;
    margin-bottom: 20px;
    background-color: #fff;
    padding: 0;
    position: sticky; 
    top: 0;
    z-index: 100;
}

.community-tab-item {
    flex: 1;
    text-align: center;
    padding: 15px 5px;
    font-size: 15px;
    color: #666;
    cursor: pointer;
    position: relative;
    transition: all 0.3s ease;
}

.community-tab-item.active {
    color: var(--onetouch-navy);
    font-weight: 500;
}

.community-tab-item.active::after {
    content: '';
    position: absolute;
    bottom: -1px;
    left: 0;
    width: 100%;
    height: 2px;
    background-color: var(--onetouch-navy);
}

/* 게시물 스타일 */
.community-post {
    background-color: #fff;
    border-radius: 0;
    overflow: hidden;
    margin-bottom: 10px;
}

.post-header {
    display: flex;
    align-items: center;
    padding: 12px 15px;
}

.profile-img {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    margin-right: 10px;
}

.username {
    font-weight: 600;
    font-size: 14px;
    margin: 0;
    color: #333;
}

.post-actions {
    margin-left: auto;
}

.follow-btn {
    background: none;
    border: none;
    color: #999;
    cursor: pointer;
    font-size: 20px;
}

/* 이미지 캐러셀 */
.image-carousel {
    position: relative;
    width: 100%;
    aspect-ratio: 3/4;  /* 스크롤 이미지 비율 조정하는곳 현재 4:3으로 되어있음 */
    overflow: hidden;
}

.carousel-inner {
    display: flex;
    transition: transform 0.4s ease-in-out, height 0.3s ease;
    width: 100%;
}

.carousel-item {
    /* flex: 0 0 100%; */
    width:100%;
    height:100%;
}

.post-image {
    width: 100%;
    height: 100%;
    display: block;
    /* object-fit: cover; */ /* 이미지 비율 유지하며 꽉 채움 */
    object-fit: contain;  /* 이미지가 잘리지 않게 비율 유지 */
    object-position: center;
    /* background-color: #000; */ /* 여백 부분 색 (선택사항) */
}

/* 캐러셀 컨트롤 */
.carousel-control {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    width: 32px;
    height: 32px;
    background-color: rgba(0,0,0,0.4);
    color: #fff;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    z-index: 10;
    box-shadow: 0 2px 4px rgba(0,0,0,0.2);
    opacity: 0.8;
    transition: opacity 0.3s;
    font-size: 14px;
}

.carousel-control:hover {
    opacity: 1;
}

.carousel-control.prev {
    left: 10px;
}

.carousel-control.next {
    right: 10px;
}

.carousel-indicators {
    position: absolute;
    bottom: 10px;
    left: 0;
    right: 0;
    display: flex;
    justify-content: center;
    gap: 5px;
    padding: 0;
    margin: 0;
}

.indicator {
    width: 7px;
    height: 7px;
    border-radius: 50%;
    background-color: rgba(255,255,255,0.5);
    cursor: pointer;
    transition: background-color 0.3s;
}

.indicator.active {
    background-color: var(--onetouch-light-blue);
}

/* 제품 정보 섹션 */
.product-section {
    padding: 15px;
    border-top: 1px solid #f5f5f5;
    display: flex;
    overflow-x: auto;
    gap: 10px;
    cursor: grab; /* 마우스 포인터를 '잡기' 아이콘으로 설정 */
    user-select: none; /* 텍스트 선택 방지 */
    overflow-x: hidden; /* 스크롤바 숨기기 */
    scroll-behavior: smooth; /* 부드러운 스크롤 효과 */
}

/* 상품 카드 */
.product-card {
    flex: 0 0 auto;  /* 카드가 크기를 고정되도록 설정 */
    width: 85px;  /* 카드의 고정 너비 */
    text-align: center;
    scroll-snap-align: start;  /* 카드가 스크롤될 때 시작 부분에 맞춰지도록 */
    border: 1px solid #ddd;  /* 카드 테두리 */
    border-radius: 3px;
    background-color: #fff;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); /* 약간의 그림자 효과 */
    padding: 5px;  /* 카드 내 여백 */
}

/* 링크 스타일 제거 */
.product-link {
    display: block;
    text-decoration: none; /* 기본 링크 스타일 제거 */
}

/* 상품 이미지 */
.product-img {
    width: 100%;
    height: 85px;
    object-fit: cover;
    border-radius: 3px;
    margin-bottom: 5px;
}

/* 할인 정보 */
.product-discount {
    color: var(--onetouch-accent);
    font-size: 11px;
    font-weight: 500;
    margin: 0;
}

/* 상품 가격 */
.product-price {
    font-size: 12px;
    font-weight: 600;
    margin: 0;
    color: #333;
}


/* ================================== */

/* 게시물 콘텐츠 */
.post-title {
  font-size: 16px;
  font-weight: 700;
  color: #333;
  /* margin: 10px 15px; */
}

.post-content {
    padding: 15px;
}

.post-likes {
    font-weight: 600;
    font-size: 14px;
    margin-bottom: 8px;
}

.post-text {
    font-size: 14px;
    margin-bottom: 8px;
}

.post-tags {
    color: var(--onetouch-light-blue);
    font-size: 13px;
    margin-bottom: 10px;
}

.post-time {
    color: #999;
    font-size: 12px;
    margin: 0;
}

/* 인터랙션 영역 */
.post-interactions {
    display: flex;
    padding: 10px 15px;
    gap: 20px;
}

.interaction-btn {
    background: none;
    border: none;
    color: #333;
    font-size: 22px;
    cursor: pointer;
}

.interaction-btn.active {
    color: var(--onetouch-accent);
}

/* 댓글 입력 */
.comment-input {
    padding: 10px 15px 15px;
    display: flex;
    align-items: center;
    border-top: 1px solid #f5f5f5;
}

.comment-input input {
    flex: 1;
    border: none;
    font-size: 14px;
    outline: none;
    padding: 8px 0;
}

.comment-input input::placeholder {
    color: #999;
}

.comment-submit {
    background: none;
    border: none;
    color: var(--onetouch-light-blue);
    font-weight: 600;
    font-size: 14px;
    cursor: pointer;
}

/* 페이지네이션 */
.community-pagination {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 20px;
    gap: 5px;
}

.pagination-link {
    width: 30px;
    height: 30px;
    display: flex;
    align-items: center;
    justify-content: center;
    border: 1px solid #ddd;
    color: #666;
    text-decoration: none;
    font-size: 13px;
}

.pagination-link.active {
    background-color: var(--onetouch-navy);
    color: #fff;
    border-color: var(--onetouch-navy);
}

/* 반응형 설정 */
@media (max-width: 767px) {
    .community-content {
        padding: 0;
    }
}

@media (max-width: 768px) {
    .product-card {
        width: 70px;  /* 모바일에서 카드 크기 줄이기 */
    }
}

@media (min-width: 1024px) {
    .product-card {
        width: 100px;  /* 데스크탑에서 카드 크기 늘리기 */
    }
}

    </style>
</head>

<body>
    <div class="preloader">
        <div class="preloader-inner">
            <div class="preloader-icon">
                <span></span>
                <span></span>
            </div>
        </div>
    </div>
    <%@include file="/WEB-INF/views/common/header.jsp" %>
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">커뮤니티</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="${pageContext.request.contextPath}/"><i class="lni lni-home"></i> 홈</a></li>
                        <li>커뮤니티</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <input type="button" value="등록" onclick="location.href='/post/insert'">
    <section class="section">
        <div class="container">
            <div class="community-content">
                <div class="community-tabs">
                    <div class="community-tab-item active" data-tab="all">전체</div>
                    <div class="community-tab-item" data-tab="skin">스킨에디터</div>
                    <div class="community-tab-item" data-tab="review">리뷰</div>
                    <div class="community-tab-item" data-tab="free">자유게시판</div>
                </div>
                
                <!-- 커뮤니티 1개 ============================================================= -->
                
                <div class="community-post" data-tab="all">
                <c:forEach var="postVo" items="${postVo_array }" varStatus="loop">
                    <div class="post-header">
                        <img src="https://randomuser.me/api/portraits/women/44.jpg" alt="프로필" class="profile-img">
                        <p class="username">${postVo.mem_id }</p>
                        <div class="post-actions">
                        (${postVo.post_category })
                            <button class="follow-btn">
                                <i class="fas fa-ellipsis-h"></i>
                            </button>
                        </div>
                    </div>
                    
                    <div class="image-carousel" id="carousel-1">
                        <div class="carousel-inner">
                         <c:forTokens items="${postVo.post_image }" delims="*" var="img" varStatus="status">
                            <div class="carousel-item ${status.first ? 'active' : ''}">
                            ${pageContext.request.contextPath }
                                <img src="${pageContext.request.contextPath }/images/${img}" alt="${img }" class="post-image d-block w-100">
                            </div>
                         </c:forTokens>
                         
                        </div>
                        
                        <div class="carousel-control prev" data-carousel="carousel-${loop.index }">
                            <i class="fas fa-chevron-left"></i>
                        </div>
                        <div class="carousel-control next" data-carousel="carousel-${loop.index }">
                            <i class="fas fa-chevron-right"></i>
                        </div>
                        
                        <div class="carousel-indicators" id="indicators-${loop.index }">
                              <c:forTokens items="${postVo.post_image}" delims="*" var="img" varStatus="s">
							    <div class="indicator ${s.first ? 'active' : ''}" 
							         data-slide="${s.index}" data-carousel="carousel-${loop.index }"></div>
							  </c:forTokens>
                        </div>
                    </div>
                    
                    <div class="product-section">
                        <div class="product-card">
                        	<a href="/product/4" class="product-link">
	                            <img src="https://via.placeholder.com/100?text=제품" alt="제품" class="product-img">
	                            <p class="product-discount">19% 할인</p>
	                            <p class="product-price">55,900원</p>
	                        </a>    
                        </div>
                        <div class="product-card">
                        	<a href="/product/4" class="product-link">
	                            <img src="https://via.placeholder.com/100?text=제품" alt="제품" class="product-img">
	                            <p class="product-discount">19% 할인</p>
	                            <p class="product-price">55,900원</p>
	                        </a>    
                        </div>
                        <div class="product-card">
                        	<a href="/product/4" class="product-link">
	                            <img src="https://via.placeholder.com/100?text=제품" alt="제품" class="product-img">
	                            <p class="product-discount">19% 할인</p>
	                            <p class="product-price">55,900원</p>
	                        </a>    
                        </div>
                        <div class="product-card">
                        	<a href="/product/4" class="product-link">
	                            <img src="https://via.placeholder.com/100?text=제품" alt="제품" class="product-img">
	                            <p class="product-discount">19% 할인</p>
	                            <p class="product-price">55,900원</p>
	                        </a>    
                        </div>
                        <div class="product-card">
                        	<a href="/product/4" class="product-link">
	                            <img src="https://via.placeholder.com/100?text=제품" alt="제품" class="product-img">
	                            <p class="product-discount">19% 할인</p>
	                            <p class="product-price">55,900원</p>
	                        </a>    
                        </div>
                        <div class="product-card">
                        	<a href="/product/4" class="product-link">
	                            <img src="https://via.placeholder.com/100?text=제품" alt="제품" class="product-img">
	                            <p class="product-discount">19% 할인</p>
	                            <p class="product-price">55,900원</p>
	                        </a>    
                        </div>
                        <div class="product-card">
                        	<a href="/product/4" class="product-link">
	                            <img src="https://via.placeholder.com/100?text=제품" alt="제품" class="product-img">
	                            <p class="product-discount">19% 할인</p>
	                            <p class="product-price">55,900원</p>
	                        </a>    
                        </div>
                        <div class="product-card">
                        	<a href="/product/4" class="product-link">
	                            <img src="https://via.placeholder.com/100?text=제품" alt="제품" class="product-img">
	                            <p class="product-discount">19% 할인</p>
	                            <p class="product-price">55,900원</p>
	                        </a>    
                        </div>
                    </div>
                    
                    <div class="post-interactions">
                        <button class="interaction-btn">
                            <i class="far fa-heart"></i>
                        </button>
                        <button class="interaction-btn">
                            <i class="far fa-comment"></i>
                        </button>
                        <button class="interaction-btn">
                            <i class="far fa-share-square"></i>
                        </button>
                    </div>
                    
                    <div class="post-content">
                        <p class="post-likes">좋아요 503개</p>
                    	<p class="post-title">${postVo.post_title}</p>
                        <p class="post-text">${postVo.post_content }</p>
                        <p class="post-tags">#원터치 #남자화장품 #데일리 #스킨케어 #뷰티그램</p>
                        <p class="post-time">${postVo.post_time }</p>
                    </div>
                    
                    <div class="comment-input">
                        <input type="text" placeholder="댓글을 남겨보세요...">
                        <button class="comment-submit">댓글</button>
                    </div>
                </c:forEach>
                </div>
                <!-- /커뮤니티 전체 목록 ============================================================= -->


                <!-- 커뮤니티 스킨 목록 ============================================================= -->
                <div class="community-post" data-tab="skin">
                <c:forEach var="postVo" items="${postSkin_array }" varStatus="loop">
                    <div class="post-header">
                        <img src="https://randomuser.me/api/portraits/women/44.jpg" alt="프로필" class="profile-img">
                        <p class="username">${postVo.mem_id }</p>
                        <div class="post-actions">
                            <button class="follow-btn">
                                <i class="fas fa-ellipsis-h"></i>
                            </button>
                        </div>
                    </div>
                    
                    <div class="image-carousel" id="carousel-1">
                        <div class="carousel-inner">
                         <c:forTokens items="${postVo.post_image }" delims="*" var="img" varStatus="status">
                            <div class="carousel-item ${status.first ? 'active' : ''}">
                            ${pageContext.request.contextPath }
                                <img src="${pageContext.request.contextPath }/images/${img}" alt="${img }" class="post-image d-block w-100">
                            </div>
                         </c:forTokens>
                         
                        </div>
                        
                        <div class="carousel-control prev" data-carousel="carousel-${loop.index }">
                            <i class="fas fa-chevron-left"></i>
                        </div>
                        <div class="carousel-control next" data-carousel="carousel-${loop.index }">
                            <i class="fas fa-chevron-right"></i>
                        </div>
                        
                        <div class="carousel-indicators" id="indicators-${loop.index }">
                              <c:forTokens items="${postVo.post_image}" delims="*" var="img" varStatus="s">
							    <div class="indicator ${s.first ? 'active' : ''}" 
							         data-slide="${s.index}" data-carousel="carousel-${loop.index }"></div>
							  </c:forTokens>
                        </div>
                    </div>
                    
                    <div class="product-section">
                        <div class="product-card">
                            <img src="https://via.placeholder.com/100?text=제품" alt="제품" class="product-img">
                            <p class="product-discount">19% 할인</p>
                            <p class="product-price">55,900원</p>
                        </div>
                        <div class="product-card">
                            <img src="https://via.placeholder.com/100?text=제품" alt="제품" class="product-img">
                            <p class="product-discount">10% 할인</p>
                            <p class="product-price">25,800원</p>
                        </div>
                        <div class="product-card">
                            <img src="https://via.placeholder.com/100?text=제품" alt="제품" class="product-img">
                            <p class="product-price">33,000원</p>
                        </div>
                        <div class="product-card">
                            <img src="https://via.placeholder.com/100?text=제품" alt="제품" class="product-img">
                            <p class="product-discount">15% 할인</p>
                            <p class="product-price">42,500원</p>
                        </div>
                    </div>
                    
                    <div class="post-interactions">
                        <button class="interaction-btn">
                            <i class="far fa-heart"></i>
                        </button>
                        <button class="interaction-btn">
                            <i class="far fa-comment"></i>
                        </button>
                        <button class="interaction-btn">
                            <i class="far fa-share-square"></i>
                        </button>
                    </div>
                    
                    <div class="post-content">
                        <p class="post-likes">좋아요 503개</p>
                    	<p class="post-title">${postVo.post_title}</p>
                        <p class="post-text">최근에 구매한 원터치 화장품! 남자 피부에 딱 좋은 제품이네요.</p>
                        <p class="post-tags">#원터치 #남자화장품 #데일리 #스킨케어 #뷰티그램</p>
                        <p class="post-time">2일 전</p>
                    </div>
                    
                    <div class="comment-input">
                        <input type="text" placeholder="댓글을 남겨보세요...">
                        <button class="comment-submit">댓글</button>
                    </div>
                </c:forEach>
                </div>
                <!-- /커뮤니티 스킨 목록 ============================================================= -->
                
                <!-- 커뮤니티 리뷰 목록 ============================================================= -->
                <div class="community-post" data-tab="review">
                <c:forEach var="postVo" items="${postReview_array }" varStatus="loop">
                    <div class="post-header">
                        <img src="https://randomuser.me/api/portraits/women/44.jpg" alt="프로필" class="profile-img">
                        <p class="username">${postVo.mem_id }</p>
                        <div class="post-actions">
                            <button class="follow-btn">
                                <i class="fas fa-ellipsis-h"></i>
                            </button>
                        </div>
                    </div>
                    
                    <div class="image-carousel" id="carousel-1">
                        <div class="carousel-inner">
                         <c:forTokens items="${postVo.post_image }" delims="*" var="img" varStatus="status">
                            <div class="carousel-item ${status.first ? 'active' : ''}">
                            ${pageContext.request.contextPath }
                                <img src="${pageContext.request.contextPath }/images/${img}" alt="${img }" class="post-image d-block w-100">
                            </div>
                         </c:forTokens>
                         
                        </div>
                        
                        <div class="carousel-control prev" data-carousel="carousel-${loop.index }">
                            <i class="fas fa-chevron-left"></i>
                        </div>
                        <div class="carousel-control next" data-carousel="carousel-${loop.index }">
                            <i class="fas fa-chevron-right"></i>
                        </div>
                        
                        <div class="carousel-indicators" id="indicators-${loop.index }">
                              <c:forTokens items="${postVo.post_image}" delims="*" var="img" varStatus="s">
							    <div class="indicator ${s.first ? 'active' : ''}" 
							         data-slide="${s.index}" data-carousel="carousel-${loop.index }"></div>
							  </c:forTokens>
                        </div>
                    </div>
                    
                    <div class="product-section">
                        <div class="product-card">
                            <img src="https://via.placeholder.com/100?text=제품" alt="제품" class="product-img">
                            <p class="product-discount">19% 할인</p>
                            <p class="product-price">55,900원</p>
                        </div>
                        <div class="product-card">
                            <img src="https://via.placeholder.com/100?text=제품" alt="제품" class="product-img">
                            <p class="product-discount">10% 할인</p>
                            <p class="product-price">25,800원</p>
                        </div>
                        <div class="product-card">
                            <img src="https://via.placeholder.com/100?text=제품" alt="제품" class="product-img">
                            <p class="product-price">33,000원</p>
                        </div>
                        <div class="product-card">
                            <img src="https://via.placeholder.com/100?text=제품" alt="제품" class="product-img">
                            <p class="product-discount">15% 할인</p>
                            <p class="product-price">42,500원</p>
                        </div>
                    </div>
                    
                    <div class="post-interactions">
                        <button class="interaction-btn">
                            <i class="far fa-heart"></i>
                        </button>
                        <button class="interaction-btn">
                            <i class="far fa-comment"></i>
                        </button>
                        <button class="interaction-btn">
                            <i class="far fa-share-square"></i>
                        </button>
                    </div>
                    
                    <div class="post-content">
                        <p class="post-likes">좋아요 503개</p>
                    	<p class="post-title">${postVo.post_title}</p>
                        <p class="post-text">최근에 구매한 원터치 화장품! 남자 피부에 딱 좋은 제품이네요.</p>
                        <p class="post-tags">#원터치 #남자화장품 #데일리 #스킨케어 #뷰티그램</p>
                        <p class="post-time">2일 전</p>
                    </div>
                    
                    <div class="comment-input">
                        <input type="text" placeholder="댓글을 남겨보세요...">
                        <button class="comment-submit">댓글</button>
                    </div>
                </c:forEach>
                </div>
                <!-- /커뮤니티 리뷰 목록 ============================================================= -->

                <!-- 커뮤니티 자유게시판 목록 ============================================================= -->
                <div class="community-post" data-tab="free">
               	   <c:forEach var="postVo" items="${postFree_array }" varStatus="loop">
                    <div class="post-header">
                        <img src="https://randomuser.me/api/portraits/women/44.jpg" alt="프로필" class="profile-img">
                        <p class="username">${postVo.mem_id }</p>
                        <div class="post-actions">
                            <button class="follow-btn">
                                <i class="fas fa-ellipsis-h"></i>
                            </button>
                        </div>
                    </div>
                    
                    <div class="image-carousel" id="carousel-1">
                        <div class="carousel-inner">
                         <c:forTokens items="${postVo.post_image }" delims="*" var="img" varStatus="status">
                            <div class="carousel-item ${status.first ? 'active' : ''}">
                            ${pageContext.request.contextPath }
                                <img src="${pageContext.request.contextPath }/images/${img}" alt="${img }" class="post-image d-block w-100">
                            </div>
                         </c:forTokens>
                         
                        </div>
                        
                        <div class="carousel-control prev" data-carousel="carousel-${loop.index }">
                            <i class="fas fa-chevron-left"></i>
                        </div>
                        <div class="carousel-control next" data-carousel="carousel-${loop.index }">
                            <i class="fas fa-chevron-right"></i>
                        </div>
                        
                        <div class="carousel-indicators" id="indicators-${loop.index }">
                              <c:forTokens items="${postVo.post_image}" delims="*" var="img" varStatus="s">
							    <div class="indicator ${s.first ? 'active' : ''}" 
							         data-slide="${s.index}" data-carousel="carousel-${loop.index }"></div>
							  </c:forTokens>
                        </div>
                    </div>
                    
                    <div class="product-section">
                        <div class="product-card">
                        	<a href="#" class="product-link">
	                            <img src="https://via.placeholder.com/100?text=제품" alt="제품" class="product-img">
	                            <p class="product-discount">19% 할인</p>
	                            <p class="product-price">55,900원</p>
                            </a>
                        </div>
                        <div class="product-card">
                            <img src="https://via.placeholder.com/100?text=제품" alt="제품" class="product-img">
                            <p class="product-discount">10% 할인</p>
                            <p class="product-price">25,800원</p>
                        </div>
                        <div class="product-card">
                            <img src="https://via.placeholder.com/100?text=제품" alt="제품" class="product-img">
                            <p class="product-price">33,000원</p>
                        </div>
                        <div class="product-card">
                            <img src="https://via.placeholder.com/100?text=제품" alt="제품" class="product-img">
                            <p class="product-discount">15% 할인</p>
                            <p class="product-price">42,500원</p>
                        </div>
                    </div>
                    
                    <div class="post-interactions">
                        <button class="interaction-btn">
                            <i class="far fa-heart"></i>
                        </button>
                        <button class="interaction-btn">
                            <i class="far fa-comment"></i>
                        </button>
                        <button class="interaction-btn">
                            <i class="far fa-share-square"></i>
                        </button>
                    </div>
                    
                    <div class="post-content">
                        <p class="post-likes">좋아요 503개</p>
                    	<p class="post-title">${postVo.post_title}</p>
                        <p class="post-text">최근에 구매한 원터치 화장품! 남자 피부에 딱 좋은 제품이네요.</p>
                        <p class="post-tags">#원터치 #남자화장품 #데일리 #스킨케어 #뷰티그램</p>
                        <p class="post-time">2일 전</p>
                    </div>
                    
                    <div class="comment-input">
                        <input type="text" placeholder="댓글을 남겨보세요...">
                        <button class="comment-submit">댓글</button>
                    </div>
              	  </c:forEach>
                </div>
                <!-- /커뮤니티 자유게시판 목록 ============================================================= -->
                
                
                <div class="community-pagination">
                    <a href="#" class="pagination-link"><i class="fas fa-angle-double-left"></i></a>
                    <a href="#" class="pagination-link active">1</a>
                    <a href="#" class="pagination-link">2</a>
                    <a href="#" class="pagination-link">3</a>
                    <a href="#" class="pagination-link">4</a>
                    <a href="#" class="pagination-link">5</a>
                    <a href="#" class="pagination-link"><i class="fas fa-angle-double-right"></i></a>
                </div>
            </div>
        </div>
    </section>
    <%@include file="/WEB-INF/views/common/footer.jsp" %>
    <a href="#" class="scroll-top">
        <i class="lni lni-chevron-up"></i>
    </a>

    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/tiny-slider.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/glightbox.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
    
    <script type="text/javascript">
 // =========================
 // 0. 프리로더 제거
 // =========================
 window.addEventListener('load', function() {
     const preloader = document.querySelector('.preloader');
     if (preloader) {
         preloader.style.opacity = '0';
         setTimeout(() => preloader.style.display = 'none', 500);
     }
 });


 // =========================
 // 1. 이미지 캐러셀 기능
 // =========================
 document.addEventListener("DOMContentLoaded", function() {
     const carousels = document.querySelectorAll('.image-carousel');

     carousels.forEach((carousel, index) => {
         const inner = carousel.querySelector('.carousel-inner');
         const items = carousel.querySelectorAll('.carousel-item');
         const prevBtn = carousel.querySelector('.carousel-control.prev');
         const nextBtn = carousel.querySelector('.carousel-control.next');
         const indicators = carousel.querySelectorAll('.indicator');

         let currentIndex = 0;
         const totalItems = items.length;

         // 초기 슬라이드 설정
         function showSlide(index) {
             if (index < 0) index = totalItems - 1;
             if (index >= totalItems) index = 0;
             currentIndex = index;

             // active 클래스 업데이트
             items.forEach((item, i) => {
                 item.classList.toggle('active', i === currentIndex);
             });

             indicators.forEach((ind, i) => {
                 ind.classList.toggle('active', i === currentIndex);
             });
         }

         // 버튼 이벤트
         if (prevBtn) prevBtn.addEventListener('click', () => showSlide(currentIndex - 1));
         if (nextBtn) nextBtn.addEventListener('click', () => showSlide(currentIndex + 1));

         // 인디케이터 이벤트
         indicators.forEach((ind, i) => {
             ind.addEventListener('click', () => showSlide(i));
         });

         // 첫 이미지 로딩 시 높이 조정
         const firstImg = items[0]?.querySelector('img');
         if (firstImg) {
             if (firstImg.complete) {
                 inner.style.height = firstImg.offsetHeight + 'px';
             } else {
                 firstImg.addEventListener('load', () => {
                     inner.style.height = firstImg.offsetHeight + 'px';
                 });
             }
         }

         // 윈도우 리사이즈 시 높이 자동 조정
         window.addEventListener('resize', () => {
             const activeImg = items[currentIndex]?.querySelector('img');
             if (activeImg) inner.style.height = activeImg.offsetHeight + 'px';
         });

         // 초기 슬라이드 표시
         showSlide(0);
         
         // 3초마다 슬라이드 전환
         let autoSlideInterval = setInterval(() => {
        	    showSlide(currentIndex + 1);
        	}, 3000); // 3초마다 다음 슬라이드

        	// 마우스 올리면 멈추고, 나가면 다시 시작
        	carousel.addEventListener('mouseenter', () => clearInterval(autoSlideInterval));
        	carousel.addEventListener('mouseleave', () => {
        	    autoSlideInterval = setInterval(() => showSlide(currentIndex + 1), 5000);
        	});
        	
          //스와이프 기능
          let startX = 0;
			let endX = 0;
			
			carousel.addEventListener('touchstart', e => {
			    startX = e.touches[0].clientX;
			});
			carousel.addEventListener('touchend', e => {
			    endX = e.changedTouches[0].clientX;
			    handleSwipe();
			});
			
			carousel.addEventListener('mousedown', e => {
			    startX = e.clientX;
			});
			carousel.addEventListener('mouseup', e => {
			    endX = e.clientX;
			    handleSwipe();
			});
			
			function handleSwipe() {
			    const diff = endX - startX;
			    if (Math.abs(diff) > 50) {
			        if (diff > 0) {
			            showSlide(currentIndex - 1); // 왼→오 스와이프 → 이전
			        } else {
			            showSlide(currentIndex + 1); // 오→왼 스와이프 → 다음
			        }
			    }
			}
		   //end:스와이프 기능

			// 이미지 높이 조절		   
		   const activeImg = items[currentIndex]?.querySelector('img');
			if (activeImg) {
			  inner.style.height = activeImg.offsetHeight + 'px';
			}
     });
 });
//=========================
//✅ 모바일 스와이프 슬라이드 기능 추가 (기존 코드 유지 + 이거만 추가)
//=========================
document.querySelectorAll('.image-carousel').forEach(carousel => {
  let startX = 0;
  let endX = 0;

  // 터치 시작
  carousel.addEventListener('touchstart', e => {
      startX = e.touches[0].clientX;
  }, { passive: true });

  // 터치 이동 중 이미지 드래그 방지
  carousel.addEventListener('touchmove', e => {
      e.preventDefault();
  }, { passive: false });

  // 터치 종료 후 방향 판단
  carousel.addEventListener('touchend', e => {
      endX = e.changedTouches[0].clientX;
      const diff = startX - endX;
      const threshold = 50; // 감도 (50px 이상 움직이면 슬라이드 전환)

      if (Math.abs(diff) > threshold) {
          const nextBtn = carousel.querySelector('.carousel-control.next');
          const prevBtn = carousel.querySelector('.carousel-control.prev');

          if (diff > 0) {
              // 왼쪽으로 스와이프 → 다음 슬라이드
              nextBtn?.click();
          } else {
              // 오른쪽으로 스와이프 → 이전 슬라이드
              prevBtn?.click();
          }
      }
  });

  // 이미지 드래그 방지
  carousel.querySelectorAll('img').forEach(img => {
      img.addEventListener('dragstart', e => e.preventDefault());
  });
});



 // =========================
 // 2. 좋아요 하트 토글 기능
 // =========================
 document.addEventListener('click', function(e) {
     const btn = e.target.closest('.interaction-btn');
     if (!btn) return;

     const icon = btn.querySelector('i');
     if (icon && icon.classList.contains('fa-heart')) {
         const isLiked = btn.classList.toggle('active');
         if (isLiked) {
             icon.classList.remove('far');
             icon.classList.add('fas');
         } else {
             icon.classList.remove('fas');
             icon.classList.add('far');
         }
     }
 });


 // =========================
 // 3. 탭 클릭 기능
 // =========================
 document.addEventListener('DOMContentLoaded', function() {
     const tabs = document.querySelectorAll('.community-tab-item');
     const posts = document.querySelectorAll('.community-post');

     // 처음 페이지 로딩 시 모든 게시물 숨기기
     posts.forEach(post => {
         post.style.display = 'none';
     });
     
     // 기본 탭을 'all'로 설정하여 첫 번째 탭을 활성화 시킬 수 있도록 처리
     const defaultTab = document.querySelector('.community-tab-item[data-tab="all"]');
     if (defaultTab) {
         defaultTab.classList.add('active');
         // 'all' 탭이 클릭되면 모든 게시물이 보이도록 처리
         posts.forEach(post => {
             if (post.dataset.tab === 'all') {
                 post.style.display = 'block';
             }
         });
     }
     
     // 탭 클릭 이벤트 처리
     tabs.forEach(tab => {
         tab.addEventListener('click', function() {
             // 탭 활성화
             tabs.forEach(t => t.classList.remove('active'));
             this.classList.add('active');

             const tabType = this.dataset.tab;

             // 게시물 필터링 (실제 데이터 분류 시 서버 연동 가능)
             posts.forEach(post => {
                 // 예: post.dataset.category 값이 tabType과 같은 경우만 표시
                 if (tabType === 'all') {
                	    if (post.dataset.tab === 'all') {
                            post.style.display = 'block';  // 'all' 탭에 해당하는 게시물만 보이도록
                        } else {
                            post.style.display = 'none';  // 다른 탭에 해당하는 게시물은 숨김
                        }
                 } else {
                	 if(post.dataset.tab === tabType){
                     post.style.display = 'block';
                	 } else{
                     post.style.display = 'none';
                	 }
                 }
             });

             // 선택된 탭 이름 표시 (테스트용)
             console.log(`탭 변경됨: ${tabType}`);
         });
     });
 });
 
 /* ------------------------------------------------------------------------ */
 // 상품 스크린 움직이는 기능
 document.addEventListener('DOMContentLoaded', () => {
    // 각 .product-section에 대해서 개별적으로 드래그 기능을 적용
    const productSections = document.querySelectorAll('.product-section');
    
    productSections.forEach((productSection, index) => {
        let isMouseDown = false;
        let startX;
        let scrollLeft;
        let isDragging = false; // 드래그 상태 추적
        let clickTimeout; // 클릭 이벤트 딜레이를 위한 변수

        // 드래그 시작
        productSection.addEventListener('mousedown', (e) => {
            isMouseDown = true;
            isDragging = false; // 드래그 시작되지 않았다고 설정
            productSection.style.cursor = 'grabbing';  // 마우스가 클릭된 상태에서는 '잡고 있음' 포인터
            startX = e.pageX - productSection.offsetLeft;
            scrollLeft = productSection.scrollLeft;

            // 드래그가 시작될 때는 링크 클릭을 방지
            e.preventDefault(); // 클릭 이벤트 기본 동작을 방지
        });

        // 드래그 끝
        productSection.addEventListener('mouseleave', () => {
            isMouseDown = false;
            isDragging = false; // 마우스가 영역을 떠나면 드래그 상태를 리셋
            productSection.style.cursor = 'grab';  // 마우스가 영역을 떠나면 원래 포인터로 돌아감
        });

        productSection.addEventListener('mouseup', () => {
            isMouseDown = false;
            productSection.style.cursor = 'grab';  // 드래그가 끝나면 원래 포인터로 돌아감
        });

        // 드래그 중에 상품 이미지 영역을 이동
        productSection.addEventListener('mousemove', (e) => {
            if (!isMouseDown) return; // 마우스 클릭 상태에서만 동작
            e.preventDefault(); // 링크 클릭을 방지하여 드래그에만 집중
            isDragging = true; // 드래그 중임을 표시

            const x = e.pageX - productSection.offsetLeft;
            const walk = (x - startX) * 2;  // 이동 속도 조절

            // 부드러운 스크롤을 위해 requestAnimationFrame 사용
            const smoothScroll = () => {
                productSection.scrollLeft = scrollLeft - walk;
            };

            // requestAnimationFrame을 사용해 부드럽게 스크롤
            requestAnimationFrame(smoothScroll);
        });

        // 상품 카드 클릭 시 링크로 이동
        const productLinks = productSection.querySelectorAll('.product-link');
        productLinks.forEach(link => {
            link.addEventListener('click', (e) => {
                // 드래그가 끝났고, 마우스가 여전히 클릭 상태라면 링크로 이동
                if (isDragging) {
                    // 드래그가 끝났다고 처리하고 클릭을 막기 위해 잠시 딜레이
                    e.preventDefault();  // 링크 이동을 막음
                    clearTimeout(clickTimeout);  // 이전 클릭 딜레이 타이머를 리셋

                    // 드래그 종료 후 약간의 딜레이 후 링크로 이동
                    clickTimeout = setTimeout(() => {
                        window.location.href = link.href;
                    }, 500); // 500ms 후에 링크 이동
                } else {
                    // 드래그가 끝나고 클릭이 발생한 경우 바로 링크 이동
                    window.location.href = link.href;
                }
            });
        });
    });
});
 /* ------------------------------------------------------------------------ */
 
 
       //수정 전 코드 --------------------------------	
       /* 	document.addEventListener('DOMContentLoaded', function() {
            // 캐러셀 상태 관리 및 초기화
            const carousels = {};
            
            document.querySelectorAll('.image-carousel').forEach(carousel => {
                const carouselId = carousel.id;
                const carouselInner = carousel.querySelector('.carousel-inner');
                const slides = carouselInner.querySelectorAll('.carousel-item');
                
                carousels[carouselId] = {
                    element: carouselInner,
                    slides: slides,
                    currentIndex: 0,
                    totalSlides: slides.length
                };
            });
            
            // 캐러셀 이동 함수
            function moveCarousel(carouselId, direction) {
                const carousel = carousels[carouselId];
                if (!carousel) return;
                
                let newIndex = carousel.currentIndex + direction;
                
                // 범위 체크: 첫 번째/마지막 슬라이드에서 멈춤
                if (newIndex < 0) newIndex = 0;
                if (newIndex >= carousel.totalSlides) newIndex = carousel.totalSlides - 1;
                
                if (newIndex !== carousel.currentIndex) {
                    carousel.currentIndex = newIndex;
                    // translateX를 사용하여 슬라이드 이동
                    carousel.element.style.transform = `translateX(${-newIndex * 100}%)`;
                    
                    // 인디케이터 업데이트
                    updateIndicators(carouselId);
                }
            }
            
            // 특정 슬라이드로 이동
            function goToSlide(carouselId, slideIndex) {
                const carousel = carousels[carouselId];
                if (!carousel) return;
                
                if (slideIndex >= 0 && slideIndex < carousel.totalSlides) {
                    carousel.currentIndex = slideIndex;
                    carousel.element.style.transform = `translateX(${-slideIndex * 100}%)`;
                    
                    // 인디케이터 업데이트
                    updateIndicators(carouselId);
                }
            }
            
            // 인디케이터 업데이트
            function updateIndicators(carouselId) {
                // 캐러셀 ID를 기반으로 인디케이터 그룹을 찾습니다. (예: indicators-1)
                const indicators = document.querySelectorAll(`#indicators-${carouselId.split('-')[1]} .indicator`);
                const currentIndex = carousels[carouselId].currentIndex;
                
                indicators.forEach((indicator, index) => {
                	indicator.classList.toggle('active', index === currentIndex);
                });
            }
            
            // 이전/다음 버튼 이벤트 리스너
            document.querySelectorAll('.carousel-control').forEach(button => {
                button.addEventListener('click', function() {
                    const carouselId = this.dataset.carousel;
                    const direction = this.classList.contains('prev') ? -1 : 1;
                    moveCarousel(carouselId, direction);
                });
            });
            
            // 인디케이터 클릭 이벤트 리스너
            document.querySelectorAll('.indicator').forEach(indicator => {
                indicator.addEventListener('click', function() {
                    const slideIndex = parseInt(this.dataset.slide);
                    const carouselId = this.dataset.carousel;
                    goToSlide(carouselId, slideIndex);
                });
            }); */
            //---------------------------------


    /* 
            // =========================
            document.querySelectorAll('.interaction-btn').forEach(button => {
                // 좋아요 버튼에만 이벤트 리스너 추가
                if (button.querySelector('.fa-heart')) {
                    button.addEventListener('click', function() {
                        const icon = this.querySelector('i');
                        const isLiked = this.classList.toggle('active'); // active 클래스 토글

                        if (isLiked) {
                            icon.classList.remove('far'); // 빈 하트
                            icon.classList.add('fas'); // 채워진 하트
                        } else {
                            icon.classList.remove('fas');
                            icon.classList.add('far');
                        }
                    });
                }
            });


          
            // =========================
            document.querySelectorAll('.community-tab-item').forEach(tab => {
                tab.addEventListener('click', function() {
                    // 모든 탭의 active 클래스 제거
                    document.querySelectorAll('.community-tab-item').forEach(item => {
                        item.classList.remove('active');
                    });

                    // 클릭한 탭에 active 클래스 추가 (시각적 효과)
                    this.classList.add('active');
                    
                    const tabName = this.textContent.trim();
                    const tabData = this.dataset.tab;
                    
                    // 실제 탭 이동 로직 (Alert로 대체)
                    // 실제 구현 시, 이 부분에 AJAX를 이용한 게시물 로딩이나 페이지 리다이렉션을 구현해야 합니다.
                    console.log(`탭 전환 요청: ${tabData} (${tabName})`);
                    alert(`"${tabName}" 탭이 선택되었습니다. 실제 게시물 로딩 기능을 추가해야 합니다.`);
                });
            });
        }); */
    </script>
</body>
</html>