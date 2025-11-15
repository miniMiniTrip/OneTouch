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

/* 슬라이드 트랙 */
.carousel-inner {
     display: flex;
    transition: transform 0.4s ease-in-out, height 0.3s ease;
    width: 100%;
    cursor: grab;         /* 마우스 드래그 커서 */
}

/* 슬라이드 아이템 */
.carousel-item {
    display: flex;
    justify-content: center;  /* 가로 중앙 */
    align-items: center;      /* 세로 중앙 */
    
    flex: 0 0 100%;  /* 한 번에 하나의 아이템만 보이도록 */
    width:100%;
    height:100%;
}

/* 이미지 */
.post-image {
    width: auto;
    height: auto;
    border-radius: 10px; /* 선택사항: 모서리 둥글게 */
    display: block;
    /* object-fit: cover; */ /* 이미지 비율 유지하며 꽉 채움 */
    object-fit: fill;  /* 이미지가 잘리지 않게 비율 유지 */
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

/* 데스크탑에서 드래그 슬라이드 */
@media (min-width: 768px) {
    .image-carousel {
        aspect-ratio: 3 / 4; /* 3:4 비율 유지 */
    }

    .carousel-inner {
        cursor: grab; /* 마우스 드래그 커서 */
    }

    .carousel-item {
        width: 100%;
        height: auto;
        display: flex;
        align-items: center;
        justify-content: cover;
    }

    .post-image {
        width: 100%;
        height: auto;
        object-fit: conter;  /* 이미지 꽉 채우기 */
    }
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
/* 모바일에서 이미지 잘림 방지 */
@media (max-width: 767px) {
    .image-carousel {
        aspect-ratio: auto; /* 비율 제한 해제 */
        height: auto;
    }

    .carousel-item,
    .post-image {
        height: auto; 
        max-height: none;
        object-fit: contain; /* 이미지 잘림 방지 */
    }
}
/* 모바일에서 이미지 잘림 방지 + 슬라이드 정상화 */
@media (max-width: 767px) {

    /* 바깥 컨테이너는 비율 제거 */
    .image-carousel {
        aspect-ratio: auto; /* 모바일에서는 비율 해제 */
        height: auto;
    }

    /* 슬라이드 트랙은 flex 구조 유지 + 자동 높이 */
    .carousel-inner {
    	overflow-x: auto;
    	/* height:827; */
    	scroll-snap-type: x mandatory; /* 스냅 효과 */
        -webkit-overflow-scrolling: touch;
        display: flex;
        transition: none; /* transform 전환 제거 */
        /* transition: transform 0.4s ease-in-out; */
        height: auto; /* auto OK */
    }

    /* 슬라이드 아이템은 width 고정, height 자동 */
    .carousel-item {
        flex: 0 0 auto;
        scroll-snap-align: start;
        width: 100%;
        height: auto;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    /* 이미지가 슬라이드 높이를 자연스럽게 결정하도록 */
    .post-image {
        width: 100%;
        height: auto;
        object-fit: contain;
    }
}

/* 모바일 상품 슬라이드 가능하도록 수정 */
@media (max-width: 767px) {
    .product-section {
        overflow-x: auto;  /* 가로 스크롤 가능하게 변경 */
        -webkit-overflow-scrolling: touch; /* iOS 부드러운 스크롤 */
    }

    /* 스크롤바 숨기기 */
    .product-section::-webkit-scrollbar {
        display: none;
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
                    	<c:forEach var="productVo" items="${postVo.productList }">
	                        <div class="product-card">
	                        	<a href="/product/4" class="product-link">
				                            <img src="${pageContext.request.contextPath }/images/${productVo.product_image_url}" alt="제품" class="product-img">
				                            <p class="product-discount">${productVo.product_name }</p>
				                            <p class="product-price">${productVo.product_price }</p> 
		                        </a>    
	                        </div>
                     	</c:forEach>
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
                    	<c:forEach var="productVo" items="${postVo.productList }">
	                        <div class="product-card">
	                        	<a href="/product/4" class="product-link">
				                            <img src="${pageContext.request.contextPath }/images/${productVo.product_image_url}" alt="제품" class="product-img">
				                            <p class="product-discount">${productVo.product_name }</p>
				                            <p class="product-price">${productVo.product_price }</p> 
		                        </a>    
	                        </div>
                     	</c:forEach>
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

//=========================
//1. 이미지 캐러셀 기능 (데스크탑 + 모바일 통합)
//=========================
document.addEventListener("DOMContentLoaded", function () {

  const isMobile = window.innerWidth <= 767; // 모바일 여부 판단
  const carousels = document.querySelectorAll('.image-carousel'); // 모든 캐러셀 요소 선택

  carousels.forEach(carousel => {
      const inner = carousel.querySelector('.carousel-inner'); // 이미지 슬라이드 컨테이너
      const items = carousel.querySelectorAll('.carousel-item'); // 모든 슬라이드 아이템
      const prevBtn = carousel.querySelector('.carousel-control.prev'); // 이전 버튼
      const nextBtn = carousel.querySelector('.carousel-control.next'); // 다음 버튼
      const indicators = carousel.querySelectorAll('.indicator'); // 하단 인디케이터

      let currentIndex = 0; // 현재 슬라이드 인덱스
      const totalItems = items.length; // 전체 슬라이드 개수

      // =========================
      // 공통: 이미지 높이 자동 조정
      // =========================
      function adjustHeight(index) {
          const activeImg = items[index]?.querySelector('img');
          //if (activeImg) inner.style.height = activeImg.offsetHeight + 'px';
          if (activeImg) inner.style.height = '827px';
      }

      window.addEventListener('resize', () => adjustHeight(currentIndex));

      // =========================
      // 데스크탑 기능
      // =========================
      if (!isMobile) {

          // 슬라이드 표시 함수
          function showSlide(index) {
              if (index < 0) index = totalItems - 1;
              if (index >= totalItems) index = 0;
              currentIndex = index;

              // 슬라이드 활성화
              items.forEach((item, i) => item.classList.toggle('active', i === currentIndex));
              // 인디케이터 활성화
              indicators.forEach((ind, i) => ind.classList.toggle('active', i === currentIndex));
              // 높이 조정
              adjustHeight(currentIndex);
          }

          // 버튼 클릭 이벤트
          if (prevBtn) prevBtn.addEventListener('click', () => showSlide(currentIndex - 1));
          if (nextBtn) nextBtn.addEventListener('click', () => showSlide(currentIndex + 1));

          // 인디케이터 클릭 이벤트
          indicators.forEach((ind, i) => ind.addEventListener('click', () => showSlide(i)));

          // 초기 슬라이드 표시
          showSlide(0);

          // 자동 슬라이드 (3초 간격)
          let autoSlideInterval = setInterval(() => showSlide(currentIndex + 1), 10000);

          // 마우스 진입 시 자동 슬라이드 중지
          carousel.addEventListener('mouseenter', () => clearInterval(autoSlideInterval));
          // 마우스 떠나면 자동 슬라이드 재개
          carousel.addEventListener('mouseleave', () => {
              autoSlideInterval = setInterval(() => showSlide(currentIndex + 1), 10000);
          });

          // =========================
          // 마우스 드래그/스와이프 기능
          // =========================
          let isDragging = false;
          let startX = 0;
          let currentX = 0;

          // 커서 스타일 변경
          carousel.style.cursor = 'grab';

          // 마우스 드래그 시작
          carousel.addEventListener('mousedown', e => {
              isDragging = true;
              startX = e.clientX;
              carousel.style.cursor = 'grabbing';
              e.preventDefault();
          });

          // 마우스 이동 기록
          carousel.addEventListener('mousemove', e => {
              if (!isDragging) return;
              currentX = e.clientX;
          });

          // 마우스 드래그 종료
          carousel.addEventListener('mouseup', e => {
              if (!isDragging) return;
              isDragging = false;
              carousel.style.cursor = 'grab';

              const diff = e.clientX - startX;
              if (Math.abs(diff) > 50) {
                  if (diff > 0) showSlide(currentIndex - 1);
                  else showSlide(currentIndex + 1);
              }
          });

          // 마우스가 캐러셀 밖으로 나가도 드래그 종료 처리
          carousel.addEventListener('mouseleave', e => {
              if (isDragging) {
                  isDragging = false;
                  carousel.style.cursor = 'grab';
                  const diff = e.clientX - startX;
                  if (Math.abs(diff) > 50) {
                      if (diff > 0) showSlide(currentIndex - 1);
                      else showSlide(currentIndex + 1);
                  }
              }
          });

          // 터치 이벤트도 데스크탑과 동일하게 스와이프 처리
          carousel.addEventListener('touchstart', e => {
              isDragging = true;
              startX = e.touches[0].clientX;
          }, { passive: true });

          carousel.addEventListener('touchmove', e => {
              if (!isDragging) return;
              currentX = e.touches[0].clientX;
          }, { passive: true });

          carousel.addEventListener('touchend', e => {
              if (!isDragging) return;
              isDragging = false;
              const diff = e.changedTouches[0].clientX - startX;
              if (Math.abs(diff) > 50) {
                  if (diff > 0) showSlide(currentIndex - 1);
                  else showSlide(currentIndex + 1);
              }
          });

      } else {
          // =========================
          // 모바일 기능 (좌우 스크롤)
          // =========================
          let isDown = false;
          let startX = 0, scrollLeft = 0;

          // 터치 시작
          inner.addEventListener("touchstart", e => {
              isDown = true;
              startX = e.touches[0].pageX;
              scrollLeft = inner.scrollLeft;
          }, { passive: true });

          // 터치 이동
          inner.addEventListener("touchmove", e => {
              if (!isDown) return;
              const x = e.touches[0].pageX;
              const walk = startX - x;
              inner.scrollLeft = scrollLeft + walk;
          }, { passive: true });

          // 터치 종료
          inner.addEventListener("touchend", () => { isDown = false; });
          inner.addEventListener("touchcancel", () => { isDown = false; });

          // 이미지 드래그 방지
          items.forEach(item => {
              const img = item.querySelector('img');
              if (img) img.addEventListener('dragstart', e => e.preventDefault());
          });
      }

      // =========================
      // 초기 높이 조정
      // =========================
      adjustHeight(currentIndex);
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

     posts.forEach(post => post.style.display = 'none');

     const defaultTab = document.querySelector('.community-tab-item[data-tab="all"]');
     if (defaultTab) {
         defaultTab.classList.add('active');
         posts.forEach(post => { if (post.dataset.tab === 'all') post.style.display = 'block'; });
     }

     tabs.forEach(tab => {
         tab.addEventListener('click', function() {
             tabs.forEach(t => t.classList.remove('active'));
             this.classList.add('active');

             const tabType = this.dataset.tab;
             posts.forEach(post => {
                 post.style.display = (tabType === 'all') 
                     ? (post.dataset.tab === 'all' ? 'block' : 'none')
                     : (post.dataset.tab === tabType ? 'block' : 'none');
             });
         });
     });
 });

 // =========================
 // 4. 상품 스크롤 드래그 기능
 // =========================
 document.addEventListener('DOMContentLoaded', () => {
     const productSections = document.querySelectorAll('.product-section');

     productSections.forEach(productSection => {
         let isMouseDown = false;
         let startX = 0;
         let scrollLeft = 0;
         let isDragging = false;
         let clickTimeout;

         productSection.addEventListener('mousedown', (e) => {
             isMouseDown = true;
             isDragging = false;
             productSection.style.cursor = 'grabbing';
             startX = e.pageX - productSection.offsetLeft;
             scrollLeft = productSection.scrollLeft;
             e.preventDefault();
         });

         productSection.addEventListener('mouseleave', () => {
             isMouseDown = false;
             isDragging = false;
             productSection.style.cursor = 'grab';
         });

         productSection.addEventListener('mouseup', () => {
             isMouseDown = false;
             productSection.style.cursor = 'grab';
         });

         productSection.addEventListener('mousemove', (e) => {
             if (!isMouseDown) return;
             e.preventDefault();
             isDragging = true;
             const x = e.pageX - productSection.offsetLeft;
             const walk = (x - startX) * 2;
             requestAnimationFrame(() => { productSection.scrollLeft = scrollLeft - walk; });
         });

         const productLinks = productSection.querySelectorAll('.product-link');
         productLinks.forEach(link => {
             link.addEventListener('click', (e) => {
                 if (isDragging) {
                     e.preventDefault();
                     clearTimeout(clickTimeout);
                     clickTimeout = setTimeout(() => { window.location.href = link.href; }, 500);
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