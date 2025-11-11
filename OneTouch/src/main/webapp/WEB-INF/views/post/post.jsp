<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>커뮤니티</title>
    <meta name="description" content="해시태그 기반 맞춤 추천으로 나에게 딱 맞는 뷰티 제품을 찾아보세요" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/images/favicon.svg" />

    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/LineIcons.3.0.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/tiny-slider.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/glightbox.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Google Fonts - Noto Sans KR -->
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
        
        /* 커뮤니티 메인 스타일 */
        .onetouch-community-section {
            padding: 40px 0 60px;
            background-color: #f9f9f9;
        }
        
        .onetouch-community-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 15px;
        }
        
        .onetouch-community-header {
            margin-bottom: 30px;
            text-align: center;
        }
        
        .onetouch-community-header h2 {
            font-size: 28px;
            font-weight: 700;
            color: var(--onetouch-navy);
            margin-bottom: 10px;
        }
        
        .onetouch-community-header p {
            color: #666;
            font-size: 16px;
        }
        
        /* 탭 스타일 */
        .onetouch-community-tabs-container {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.05);
            margin-bottom: 30px;
            overflow: hidden;
        }
        
        .onetouch-community-tabs {
            display: flex;
            border-bottom: 1px solid var(--onetouch-border);
            background-color: #fff;
            padding: 0;
        }
        
        .onetouch-community-tab {
            flex: 1;
            text-align: center;
            padding: 15px 10px;
            color: #666;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
            position: relative;
            font-size: 15px;
        }
        
        .onetouch-community-tab.active {
            color: var(--onetouch-navy);
            font-weight: 600;
        }
        
        .onetouch-community-tab.active::after {
            content: '';
            position: absolute;
            bottom: -1px;
            left: 0;
            width: 100%;
            height: 2px;
            background-color: var(--onetouch-navy);
        }
        
        /* 글쓰기 버튼 */
        .onetouch-write-button {
            text-align: right;
            margin: 0 0 20px;
        }
        
        .onetouch-btn-write {
            background-color: var(--onetouch-navy);
            color: #fff;
            border: none;
            padding: 8px 20px;
            border-radius: 50px;
            font-size: 14px;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            transition: all 0.3s;
        }
        
        .onetouch-btn-write i {
            margin-right: 6px;
        }
        
        .onetouch-btn-write:hover {
            background-color: var(--onetouch-light-blue);
            color: #fff;
            transform: translateY(-2px);
        }
        
        /* 게시글 카드 */
        .onetouch-community-post {
            background-color: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 0 15px rgba(0,0,0,0.05);
            margin-bottom: 25px;
            transition: all 0.3s;
        }
        
        .onetouch-community-post:hover {
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            transform: translateY(-3px);
        }
        
        .onetouch-post-header {
            display: flex;
            align-items: center;
            padding: 15px;
            border-bottom: 1px solid #f1f1f1;
        }
        
        .onetouch-post-profile-img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid #f1f1f1;
            margin-right: 10px;
        }
        
        .onetouch-post-username {
            font-weight: 600;
            color: var(--onetouch-navy);
            font-size: 15px;
            margin: 0;
        }
        
        .onetouch-post-time {
            color: #999;
            font-size: 12px;
            margin: 0;
        }
        
        .onetouch-post-actions {
            margin-left: auto;
            display: flex;
            align-items: center;
        }
        
        .onetouch-post-category {
            display: inline-block;
            font-size: 12px;
            padding: 3px 10px;
            border-radius: 50px;
            margin-right: 10px;
            font-weight: 500;
        }
        
        .onetouch-category-free {
            background-color: #e6f0ff;
            color: var(--onetouch-light-blue);
        }
        
        .onetouch-category-review {
            background-color: #ffe6f0;
            color: var(--onetouch-accent);
        }
        
        .onetouch-category-question {
            background-color: #e6e6ff;
            color: #6666cc;
        }
        
        /* 게시글 이미지 캐러셀 */
        .onetouch-post-carousel {
            position: relative;
        }
        
        .onetouch-carousel-container {
            position: relative;
            overflow: hidden;
        }
        
        .onetouch-post-image {
            width: 100%;
            height: auto;
            max-height: 400px;
            object-fit: contain;
        }
        
        .onetouch-carousel-arrow {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            width: 36px;
            height: 36px;
            background-color: rgba(255,255,255,0.8);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            z-index: 10;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }
        
        .onetouch-carousel-arrow.prev {
            left: 10px;
        }
        
        .onetouch-carousel-arrow.next {
            right: 10px;
        }
        
        /* 게시글 콘텐츠 */
        .onetouch-post-content {
            padding: 15px;
        }
        
        .onetouch-post-text {
            margin-bottom: 15px;
            color: #333;
            font-size: 15px;
            line-height: 1.6;
        }
        
        .onetouch-post-tags {
            margin-bottom: 15px;
        }
        
        .onetouch-post-tag {
            color: var(--onetouch-light-blue);
            font-size: 14px;
        }
        
        /* 게시글 인터랙션 */
        .onetouch-post-interactions {
            display: flex;
            padding: 0 15px 15px;
            border-top: 1px solid #f1f1f1;
            padding-top: 15px;
        }
        
        .onetouch-interaction-btn {
            background: none;
            border: none;
            color: #666;
            font-size: 16px;
            margin-right: 20px;
            cursor: pointer;
            transition: all 0.3s;
            padding: 0;
        }
        
        .onetouch-interaction-btn:hover {
            color: var(--onetouch-accent);
        }
        
        .onetouch-interaction-btn i {
            margin-right: 5px;
        }
        
        .onetouch-likes-count {
            font-weight: 600;
            color: #333;
            font-size: 14px;
            margin: 0 15px 15px;
        }
        
        /* 상품 캐러셀 */
        .onetouch-product-section {
            padding: 0 15px;
            margin-bottom: 15px;
            position: relative;
        }
        
        .onetouch-product-section-title {
            font-size: 16px;
            font-weight: 600;
            color: #333;
            margin-bottom: 15px;
        }
        
        .onetouch-product-carousel-container {
            position: relative;
            overflow: hidden;
        }
        
        .onetouch-product-carousel {
            display: flex;
            transition: transform 0.3s ease;
        }
        
        .onetouch-product-card {
            min-width: 120px;
            margin-right: 10px;
            text-align: center;
            background-color: #fff;
            border-radius: 8px;
            padding: 10px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
            transition: all 0.3s;
        }
        
        .onetouch-product-card:hover {
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transform: translateY(-3px);
        }
        
        .onetouch-product-img {
            width: 100%;
            height: 100px;
            object-fit: cover;
            border-radius: 6px;
            margin-bottom: 10px;
        }
        
        .onetouch-product-discount {
            color: var(--onetouch-accent);
            font-size: 12px;
            font-weight: 600;
            margin: 0 0 5px;
        }
        
        .onetouch-product-price {
            font-size: 14px;
            font-weight: 700;
            color: #333;
            margin: 0;
        }
        
        .onetouch-product-carousel-arrow {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            width: 30px;
            height: 30px;
            background-color: rgba(255,255,255,0.9);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            z-index: 10;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        
        .onetouch-product-carousel-arrow.prev {
            left: 5px;
        }
        
        .onetouch-product-carousel-arrow.next {
            right: 5px;
        }
        
        /* 댓글 영역 */
        .onetouch-comment-section {
            padding: 15px;
            border-top: 1px solid #f1f1f1;
        }
        
        .onetouch-comment-input {
            display: flex;
        }
        
        .onetouch-comment-input input {
            flex: 1;
            border: 1px solid #e0e0e0;
            border-radius: 50px;
            padding: 10px 15px;
            font-size: 14px;
        }
        
        .onetouch-comment-input input:focus {
            outline: none;
            border-color: var(--onetouch-light-blue);
        }
        
        /* 사이드바 */
        .onetouch-sidebar {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.05);
            overflow: hidden;
            margin-bottom: 25px;
        }
        
        .onetouch-sidebar-header {
            background-color: var(--onetouch-navy);
            color: #fff;
            padding: 15px;
            font-weight: 600;
            font-size: 16px;
        }
        
        .onetouch-sidebar-content {
            padding: 15px;
        }
        
        .onetouch-popular-posts li {
            padding: 10px 0;
            border-bottom: 1px solid #f1f1f1;
        }
        
        .onetouch-popular-posts li:last-child {
            border-bottom: none;
        }
        
        .onetouch-popular-posts a {
            color: #333;
            font-size: 14px;
            display: block;
            font-weight: 500;
            line-height: 1.4;
            transition: all 0.3s;
        }
        
        .onetouch-popular-posts a:hover {
            color: var(--onetouch-light-blue);
        }
        
        .onetouch-post-meta-info {
            display: flex;
            align-items: center;
            margin-top: 5px;
            font-size: 12px;
            color: #999;
        }
        
        .onetouch-post-meta-info span {
            margin-right: 10px;
            display: flex;
            align-items: center;
        }
        
        .onetouch-post-meta-info span i {
            margin-right: 3px;
        }
        
        .onetouch-tag-cloud {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
        }
        
        .onetouch-tag {
            background-color: var(--onetouch-light-gray);
            color: #666;
            padding: 5px 10px;
            border-radius: 50px;
            font-size: 12px;
            transition: all 0.3s;
        }
        
        .onetouch-tag:hover {
            background-color: var(--onetouch-light-blue);
            color: #fff;
        }
        
        /* 페이지네이션 */
        .onetouch-pagination {
            display: flex;
            justify-content: center;
            margin: 30px 0 0;
        }
        
        .onetouch-pagination-item {
            width: 36px;
            height: 36px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 3px;
            border-radius: 5px;
            color: #666;
            background-color: #fff;
            font-weight: 500;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
            transition: all 0.3s;
        }
        
        .onetouch-pagination-item.active {
            background-color: var(--onetouch-navy);
            color: #fff;
        }
        
        .onetouch-pagination-item:hover:not(.active) {
            background-color: var(--onetouch-light-gray);
        }
        
        /* 반응형 설정 */
        @media (max-width: 991px) {
            .onetouch-sidebar {
                margin-top: 30px;
            }
        }
        
        @media (max-width: 767px) {
            .onetouch-community-tabs {
                overflow-x: auto;
                flex-wrap: nowrap;
            }
            
            .onetouch-community-tab {
                white-space: nowrap;
                min-width: 100px;
            }
            
            .onetouch-post-header {
                flex-wrap: wrap;
            }
            
            .onetouch-post-actions {
                margin-left: 0;
                margin-top: 10px;
                width: 100%;
            }
            
            .onetouch-post-interactions {
                justify-content: space-between;
            }
            
            .onetouch-interaction-btn {
                margin-right: 0;
            }
        }
        
        /* 호환성 스타일 */
        .onetouch-post-content p {
            margin-bottom: 0;
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
    <%@include file="/WEB-INF/views/common/header.jsp" %>
    <!-- End Header Area -->

    <!-- Start Breadcrumbs -->
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
    <!-- End Breadcrumbs -->

    <!-- Start Community Section -->
    <section class="onetouch-community-section">
        <div class="onetouch-community-container">
            <!-- 커뮤니티 헤더 -->
            <div class="onetouch-community-header">
                <h2>OneTouch 커뮤니티</h2>
                <p>다양한 사용자들과 함께 정보와 경험을 공유해보세요!</p>
            </div>
            
            <div class="row">
                <div class="col-lg-8">
                    <!-- 커뮤니티 탭 -->
                    <div class="onetouch-community-tabs-container">
                        <div class="onetouch-community-tabs">
                            <div class="onetouch-community-tab active" data-tab="all">전체</div>
                            <div class="onetouch-community-tab" data-tab="skincare">스킨케어팁</div>
                            <div class="onetouch-community-tab" data-tab="review">리뷰 (구매후기)</div>
                            <div class="onetouch-community-tab" data-tab="free">자유게시판</div>
                        </div>
                    </div>
                    
                    <!-- 글쓰기 버튼 -->
                    <div class="onetouch-write-button">
                        <a href="#" class="onetouch-btn-write">
                            <i class="fas fa-pencil-alt"></i> 글쓰기
                        </a>
                    </div>
                    
                    <!-- 게시글 목록 -->
                    <div class="onetouch-community-posts">
                        <c:if test="${not empty postVo_array}">
                            <c:forEach var="postVo" items="${postVo_array}">
                                <!-- 게시글 아이템 -->
                                <div class="onetouch-community-post">
                                    <div class="onetouch-post-header">
                                        <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="프로필 이미지" class="onetouch-post-profile-img">
                                        <div>
                                            <p class="onetouch-post-username">회원 ${postVo.mem_idx}</p>
                                            <p class="onetouch-post-time">2시간 전</p>
                                        </div>
                                        <div class="onetouch-post-actions">
                                            <span class="onetouch-post-category onetouch-category-free">자유</span>
                                        </div>
                                    </div>
                                    
                                    <!-- 게시글 이미지 -->
                                    <c:if test="${not empty postVo.post_image}">
                                        <div class="onetouch-post-carousel">
                                            <div class="onetouch-carousel-container">
                                                <img src="${postVo.post_image}" alt="게시글 이미지" class="onetouch-post-image">
                                            </div>
                                        </div>
                                    </c:if>
                                    
                                    <!-- 게시글 콘텐츠 -->
                                    <div class="onetouch-post-content">
                                        <p class="onetouch-post-text">${postVo.post_content}</p>
                                        
                                        <div class="onetouch-post-tags">
                                            <span class="onetouch-post-tag">#남자화장품 #스킨케어 #뷰티</span>
                                        </div>
                                    </div>
                                    
                                    <!-- 게시글 인터랙션 -->
                                    <div class="onetouch-post-interactions">
                                        <button class="onetouch-interaction-btn">
                                            <i class="far fa-heart"></i> 좋아요 (${postVo.like})
                                        </button>
                                        <button class="onetouch-interaction-btn">
                                            <i class="far fa-comment"></i> 댓글 (5)
                                        </button>
                                        <button class="onetouch-interaction-btn">
                                            <i class="far fa-bookmark"></i> 저장
                                        </button>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                        
                        <c:if test="${empty postVo_array}">
                            <!-- 샘플 게시글 -->
                            <!-- 게시글 1 -->
                            <div class="onetouch-community-post">
                                <div class="onetouch-post-header">
                                    <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="프로필 이미지" class="onetouch-post-profile-img">
                                    <div>
                                        <p class="onetouch-post-username">SkinCare01</p>
                                        <p class="onetouch-post-time">2시간 전</p>
                                    </div>
                                    <div class="onetouch-post-actions">
                                        <span class="onetouch-post-category onetouch-category-review">리뷰</span>
                                    </div>
                                </div>
                                
                                <!-- 게시글 이미지 -->
                                <div class="onetouch-post-carousel">
                                    <div class="onetouch-carousel-container">
                                        <img src="https://via.placeholder.com/600x400?text=제품+사진" alt="게시글 이미지" class="onetouch-post-image">
                                        <div class="onetouch-carousel-arrow prev">
                                            <i class="fas fa-chevron-left"></i>
                                        </div>
                                        <div class="onetouch-carousel-arrow next">
                                            <i class="fas fa-chevron-right"></i>
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- 상품 추천 캐러셀 -->
                                <div class="onetouch-product-section">
                                    <h3 class="onetouch-product-section-title">이 게시글에 포함된 제품</h3>
                                    <div class="onetouch-product-carousel-container">
                                        <div class="onetouch-product-carousel">
                                            <div class="onetouch-product-card">
                                                <img src="https://via.placeholder.com/100?text=제품1" alt="상품 이미지" class="onetouch-product-img">
                                                <p class="onetouch-product-discount">15% 할인</p>
                                                <p class="onetouch-product-price">32,000원</p>
                                            </div>
                                            <div class="onetouch-product-card">
                                                <img src="https://via.placeholder.com/100?text=제품2" alt="상품 이미지" class="onetouch-product-img">
                                                <p class="onetouch-product-discount">10% 할인</p>
                                                <p class="onetouch-product-price">28,500원</p>
                                            </div>
                                            <div class="onetouch-product-card">
                                                <img src="https://via.placeholder.com/100?text=제품3" alt="상품 이미지" class="onetouch-product-img">
                                                <p class="onetouch-product-discount">20% 할인</p>
                                                <p class="onetouch-product-price">42,000원</p>
                                            </div>
                                            <div class="onetouch-product-card">
                                                <img src="https://via.placeholder.com/100?text=제품4" alt="상품 이미지" class="onetouch-product-img">
                                                <p class="onetouch-product-price">35,000원</p>
                                            </div>
                                        </div>
                                        <div class="onetouch-product-carousel-arrow prev">
                                            <i class="fas fa-chevron-left"></i>
                                        </div>
                                        <div class="onetouch-product-carousel-arrow next">
                                            <i class="fas fa-chevron-right"></i>
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- 게시글 콘텐츠 -->
                                <div class="onetouch-post-content">
                                    <p class="onetouch-post-text">겨울철 건조한 피부를 위한 제품을 찾다가 OneTouch 수분크림을 사용해봤어요. 가볍게 발리면서도 보습력이 좋아서 하루종일 당김 없이 촉촉하게 유지돼요. 특히 향이 은은해서 부담스럽지 않고 민감한 피부에도 자극 없이 잘 사용하고 있습니다.</p>
                                    
                                    <div class="onetouch-post-tags">
                                        <span class="onetouch-post-tag">#원터치 #수분크림 #겨울철피부관리 #건성피부 #데일리</span>
                                    </div>
                                </div>
                                
                                <!-- 게시글 인터랙션 -->
                                <div class="onetouch-post-interactions">
                                    <button class="onetouch-interaction-btn">
                                        <i class="far fa-heart"></i> 좋아요 (42)
                                    </button>
                                    <button class="onetouch-interaction-btn">
                                        <i class="far fa-comment"></i> 댓글 (12)
                                    </button>
                                    <button class="onetouch-interaction-btn">
                                        <i class="far fa-bookmark"></i> 저장
                                    </button>
                                </div>
                                
                                <!-- 댓글 입력 -->
                                <div class="onetouch-comment-section">
                                    <div class="onetouch-comment-input">
                                        <input type="text" placeholder="댓글을 작성해보세요...">
                                    </div>
                                </div>
                            </div>
                            
                            <!-- 게시글 2 -->
                            <div class="onetouch-community-post">
                                <div class="onetouch-post-header">
                                    <img src="https://randomuser.me/api/portraits/men/41.jpg" alt="프로필 이미지" class="onetouch-post-profile-img">
                                    <div>
                                        <p class="onetouch-post-username">beaumale</p>
                                        <p class="onetouch-post-time">1일 전</p>
                                    </div>
                                    <div class="onetouch-post-actions">
                                        <span class="onetouch-post-category onetouch-category-question">질문</span>
                                    </div>
                                </div>
                                
                                <!-- 게시글 콘텐츠 -->
                                <div class="onetouch-post-content">
                                    <p class="onetouch-post-text">30대 남성입니다. 스스로가 귀차니즘이 심한데 스킨케어 꾸준히 하긴 해야할 것 같네요. 지금 쓰는 거 다 떨어져서 새로 사려고 하는데, 시간 절약할 수 있는 좋은 올인원 제품 추천해주실 분 계신가요? 지성 피부에 좋은 제품이면 더 좋겠습니다.</p>
                                    
                                    <div class="onetouch-post-tags">
                                        <span class="onetouch-post-tag">#올인원 #남자화장품 #지성피부 #제품추천</span>
                                    </div>
                                </div>
                                
                                <!-- 게시글 인터랙션 -->
                                <div class="onetouch-post-interactions">
                                    <button class="onetouch-interaction-btn">
                                        <i class="far fa-heart"></i> 좋아요 (15)
                                    </button>
                                    <button class="onetouch-interaction-btn">
                                        <i class="far fa-comment"></i> 댓글 (8)
                                    </button>
                                    <button class="onetouch-interaction-btn">
                                        <i class="far fa-bookmark"></i> 저장
                                    </button>
                                </div>
                                
                                <!-- 댓글 입력 -->
                                <div class="onetouch-comment-section">
                                    <div class="onetouch-comment-input">
                                        <input type="text" placeholder="댓글을 작성해보세요...">
                                    </div>
                                </div>
                            </div>
                            
                            <!-- 게시글 3 -->
                            <div class="onetouch-community-post">
                                <div class="onetouch-post-header">
                                    <img src="https://randomuser.me/api/portraits/men/67.jpg" alt="프로필 이미지" class="onetouch-post-profile-img">
                                    <div>
                                        <p class="onetouch-post-username">smooth10</p>
                                        <p class="onetouch-post-time">3일 전</p>
                                    </div>
                                    <div class="onetouch-post-actions">
                                        <span class="onetouch-post-category onetouch-category-free">자유</span>
                                    </div>
                                </div>
                                
                                <!-- 게시글 이미지 -->
                                <div class="onetouch-post-carousel">
                                    <div class="onetouch-carousel-container">
                                        <img src="https://via.placeholder.com/600x400?text=면도+후+관리" alt="게시글 이미지" class="onetouch-post-image">
                                    </div>
                                </div>
                                
                                <!-- 게시글 콘텐츠 -->
                                <div class="onetouch-post-content">
                                    <p class="onetouch-post-text">2주간 서울역에서 진행하는 남성 피부과 이벤트가 있어서 방문해 봤는데 정말 만족스러웠네요. 특히 면도후 자극과 관련된 피부 트러블 상담을 받았는데, 전문의 선생님께서 알려주신 꿀팁을 공유드립니다. 면도 후에는 즉시 차가운 물로 세안하고 알코올 성분이 없는 수분 진정 제품을 바르는 것이 좋다고 하네요. 또한 면도는 가능한 샤워 후에 하는 것이 모공이 열려 있어 더 부드럽게 할 수 있다고 합니다.</p>
                                    
                                    <div class="onetouch-post-tags">
                                        <span class="onetouch-post-tag">#면도팁 #피부트러블 #면도자극 #남자피부관리</span>
                                    </div>
                                </div>
                                
                                <!-- 게시글 인터랙션 -->
                                <div class="onetouch-post-interactions">
                                    <button class="onetouch-interaction-btn">
                                        <i class="far fa-heart"></i> 좋아요 (24)
                                    </button>
                                    <button class="onetouch-interaction-btn">
                                        <i class="far fa-comment"></i> 댓글 (5)
                                    </button>
                                    <button class="onetouch-interaction-btn">
                                        <i class="far fa-bookmark"></i> 저장
                                    </button>
                                </div>
                                
                                <!-- 댓글 입력 -->
                                <div class="onetouch-comment-section">
                                    <div class="onetouch-comment-input">
                                        <input type="text" placeholder="댓글을 작성해보세요...">
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </div>
                    
                    <!-- 페이지네이션 -->
                    <div class="onetouch-pagination">
                        <a href="#" class="onetouch-pagination-item"><i class="fas fa-angle-left"></i></a>
                        <a href="#" class="onetouch-pagination-item active">1</a>
                        <a href="#" class="onetouch-pagination-item">2</a>
                        <a href="#" class="onetouch-pagination-item">3</a>
                        <a href="#" class="onetouch-pagination-item">4</a>
                        <a href="#" class="onetouch-pagination-item">5</a>
                        <a href="#" class="onetouch-pagination-item"><i class="fas fa-angle-right"></i></a>
                    </div>
                </div>
                
                <div class="col-lg-4">
                    <!-- 사이드바 - 인기 게시물 -->
                    <div class="onetouch-sidebar">
                        <div class="onetouch-sidebar-header">
                            <i class="fas fa-fire"></i> 인기 게시물
                        </div>
                        <div class="onetouch-sidebar-content">
                            <ul class="onetouch-popular-posts list-unstyled">
                                <li>
                                    <a href="#">겨울철 피부 관리 꿀팁</a>
                                    <div class="onetouch-post-meta-info">
                                        <span><i class="far fa-user"></i> SkinCare01</span>
                                        <span><i class="far fa-heart"></i> 42</span>
                                    </div>
                                </li>
                                <li>
                                    <a href="#">면도 후 피부 진정 방법</a>
                                    <div class="onetouch-post-meta-info">
                                        <span><i class="far fa-user"></i> smooth10</span>
                                        <span><i class="far fa-heart"></i> 36</span>
                                    </div>
                                </li>
                                <li>
                                    <a href="#">건성 피부 보습제 추천</a>
                                    <div class="onetouch-post-meta-info">
                                        <span><i class="far fa-user"></i> hydra_king</span>
                                        <span><i class="far fa-heart"></i> 29</span>
                                    </div>
                                </li>
                                <li>
                                    <a href="#">남자 피부 관리 루틴 공유</a>
                                    <div class="onetouch-post-meta-info">
                                        <span><i class="far fa-user"></i> man_beauty</span>
                                        <span><i class="far fa-heart"></i> 24</span>
                                    </div>
                                </li>
                                <li>
                                    <a href="#">여드름 관리 방법 질문</a>
                                    <div class="onetouch-post-meta-info">
                                        <span><i class="far fa-user"></i> clear_skin</span>
                                        <span><i class="far fa-heart"></i> 18</span>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    
                    <!-- 사이드바 - 태그 -->
                    <div class="onetouch-sidebar">
                        <div class="onetouch-sidebar-header">
                            <i class="fas fa-tags"></i> 인기 태그
                        </div>
                        <div class="onetouch-sidebar-content">
                            <div class="onetouch-tag-cloud">
                                <a href="#" class="onetouch-tag">#스킨케어</a>
                                <a href="#" class="onetouch-tag">#올인원</a>
                                <a href="#" class="onetouch-tag">#면도</a>
                                <a href="#" class="onetouch-tag">#보습</a>
                                <a href="#" class="onetouch-tag">#클렌징</a>
                                <a href="#" class="onetouch-tag">#수분크림</a>
                                <a href="#" class="onetouch-tag">#선크림</a>
                                <a href="#" class="onetouch-tag">#건성피부</a>
                                <a href="#" class="onetouch-tag">#지성피부</a>
                                <a href="#" class="onetouch-tag">#피부타입</a>
                                <a href="#" class="onetouch-tag">#남자화장품</a>
                                <a href="#" class="onetouch-tag">#데일리</a>
                                <a href="#" class="onetouch-tag">#뷰티그램</a>
                                <a href="#" class="onetouch-tag">#원터치</a>
                                <a href="#" class="onetouch-tag">#꿀팁</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Community Section -->

    <!-- Start Footer Area -->
    <%@include file="/WEB-INF/views/common/footer.jsp" %>
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
    
    <script type="text/javascript">
        // 프리로더 제거
        window.addEventListener('load', function() {
            const preloader = document.querySelector('.preloader');
            if (preloader) {
                preloader.style.opacity = '0';
                setTimeout(() => preloader.style.display = 'none', 500);
            }
        });

        // 탭 기능
        document.addEventListener('DOMContentLoaded', function() {
            const tabItems = document.querySelectorAll('.onetouch-community-tab');
            
            tabItems.forEach(item => {
                item.addEventListener('click', function() {
                    tabItems.forEach(tab => tab.classList.remove('active'));
                    this.classList.add('active');
                    
                    // 실제 탭 기능을 구현하려면 여기에 탭 컨텐츠 전환 로직 추가
                    // const tabId = this.getAttribute('data-tab');
                    // 해당 탭에 맞는 컨텐츠만 표시하도록 처리
                });
            });
            
            // 이미지 캐러셀 화살표 기능
            const carouselArrows = document.querySelectorAll('.onetouch-carousel-arrow');
            carouselArrows.forEach(arrow => {
                arrow.addEventListener('click', function() {
                    const direction = this.classList.contains('prev') ? -1 : 1;
                    const carousel = this.closest('.onetouch-post-carousel').querySelector('.onetouch-carousel-container');
                    // 여기에 이미지 슬라이드 기능 구현
                    // 실제로는 여러 이미지가 있을 경우 해당 방향으로 이동하는 로직이 필요함
                });
            });
            
            // 상품 캐러셀 화살표 기능
            const productArrows = document.querySelectorAll('.onetouch-product-carousel-arrow');
            productArrows.forEach(arrow => {
                arrow.addEventListener('click', function() {
                    const direction = this.classList.contains('prev') ? -1 : 1;
                    const carousel = this.closest('.onetouch-product-section').querySelector('.onetouch-product-carousel');
                    // 여기에 상품 슬라이드 기능 구현
                });
            });
            
            // 인터랙션 버튼 (좋아요, 댓글, 저장) 기능
            const interactionBtns = document.querySelectorAll('.onetouch-interaction-btn');
            interactionBtns.forEach(btn => {
                btn.addEventListener('click', function() {
                    // 좋아요, 댓글, 저장 버튼 액션 구현
                    // 좋아요 버튼이면 아이콘과 카운트 변경 등의 처리
                });
            });
        });
    </script>
</body>
</html>