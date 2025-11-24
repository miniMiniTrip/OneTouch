<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>피부 진단 결과 - OneTouch</title>
    <meta name="description" content="2030 남성 뷰티 쇼핑몰 OneTouch">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/images/favicon.svg">

    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/LineIcons.3.0.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/tiny-slider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/glightbox.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
    
    <style>
/* ==================== 전체 레이아웃 ==================== */
.mypage-section {
    padding: 0;
    background-color: #fff;
    min-height: calc(100vh - 400px);
}

.mypage-container {
    display: flex;
    max-width: 100%;
    margin: 0;
    background: transparent;
    border-radius: 0;
    overflow: visible;
    box-shadow: none;
}

/* ==================== 사이드바 스타일 ==================== */
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

/* ==================== 컨텐츠 영역 ==================== */
.content {
    flex: 1;
    padding: 50px 60px;
    background: #fff;
}

.content-header {
    text-align: center;
    margin-bottom: 50px;
    padding-bottom: 30px;
    border-bottom: 2px solid #5c6bc0;
}

.content-header h2 {
    font-size: 32px;
    color: #333;
    font-weight: 700;
    margin-bottom: 15px;
}

.content-subtitle {
    color: #666;
    font-size: 16px;
    line-height: 1.6;
}

/* ==================== 축하 배너 ==================== */
.celebration-banner {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    padding: 40px;
    border-radius: 16px;
    text-align: center;
    margin-bottom: 40px;
    box-shadow: 0 8px 24px rgba(102, 126, 234, 0.3);
}

.celebration-icon {
    font-size: 64px;
    margin-bottom: 20px;
    animation: bounce 2s infinite;
}

@keyframes bounce {
    0%, 100% { transform: translateY(0); }
    50% { transform: translateY(-10px); }
}

.celebration-title {
    font-size: 28px;
    font-weight: 700;
    margin-bottom: 15px;
}

.celebration-message {
    font-size: 16px;
    opacity: 0.95;
    line-height: 1.6;
}

/* ==================== 결과 카드 ==================== */
.result-card {
    background: #fff;
    border-radius: 12px;
    padding: 35px;
    margin-bottom: 30px;
    box-shadow: 0 2px 12px rgba(0,0,0,0.08);
    border: 1px solid #e0e0e0;
}

.result-card-header {
    display: flex;
    align-items: center;
    gap: 15px;
    margin-bottom: 25px;
    padding-bottom: 20px;
    border-bottom: 2px solid #f0f0f0;
}

.result-icon {
    width: 50px;
    height: 50px;
    background: linear-gradient(135deg, #5c6bc0 0%, #7e8fd4 100%);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 24px;
    flex-shrink: 0;
}

.result-card h3 {
    font-size: 22px;
    font-weight: 700;
    color: #333;
    margin: 0;
}

/* ==================== 해시태그 배지 ==================== */
.hashtag-container {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    justify-content: center;
    margin: 25px 0;
}

.hashtag-badge {
    display: inline-flex;
    align-items: center;
    padding: 12px 24px;
    background: linear-gradient(135deg, #5c6bc0 0%, #7e8fd4 100%);
    color: white;
    border-radius: 25px;
    font-size: 16px;
    font-weight: 600;
    box-shadow: 0 4px 12px rgba(92, 107, 192, 0.3);
    transition: all 0.3s;
}

.hashtag-badge:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 16px rgba(92, 107, 192, 0.4);
}

.hashtag-badge::before {
    content: '#';
    margin-right: 4px;
    opacity: 0.8;
}

/* ==================== 추천 상품 ==================== */
.product-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
    gap: 20px;
    margin-top: 30px;
}

.product-card {
    background: #fff;
    border: 1px solid #e0e0e0;
    border-radius: 12px;
    padding: 20px;
    transition: all 0.3s;
    cursor: pointer;
}

.product-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 20px rgba(0,0,0,0.1);
    border-color: #5c6bc0;
}

.product-name {
    font-size: 18px;
    font-weight: 600;
    color: #333;
    margin-bottom: 8px;
    line-height: 1.4;
}

.product-brand {
    font-size: 13px;
    color: #999;
    margin-bottom: 12px;
}

.product-comment {
    font-size: 14px;
    color: #666;
    line-height: 1.5;
    margin-bottom: 15px;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
}

.product-footer {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 15px;
    padding-top: 15px;
    border-top: 1px solid #f0f0f0;
}

.product-price {
    font-size: 20px;
    font-weight: 700;
    color: #5c6bc0;
}

.btn-view-product {
    background: #5c6bc0;
    color: white;
    padding: 8px 20px;
    border: none;
    border-radius: 6px;
    font-size: 14px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s;
    text-decoration: none;
    display: inline-block;
}

.btn-view-product:hover {
    background: #4a5aaf;
    color: white;
    transform: translateY(-2px);
}

/* ==================== 빈 상태 ==================== */
.empty-products {
    text-align: center;
    padding: 60px 20px;
    background: #f8f9fa;
    border-radius: 12px;
    margin-top: 30px;
}

.empty-products i {
    font-size: 64px;
    color: #dee2e6;
    margin-bottom: 20px;
}

.empty-products h4 {
    font-size: 20px;
    color: #666;
    margin-bottom: 10px;
}

.empty-products p {
    color: #999;
    font-size: 14px;
}

/* ==================== 액션 버튼 ==================== */
.action-buttons {
    display: flex;
    gap: 15px;
    justify-content: center;
    margin-top: 50px;
    flex-wrap: wrap;
}

.btn-primary-custom {
    background: #5c6bc0;
    color: white;
    padding: 14px 32px;
    border: none;
    border-radius: 8px;
    font-size: 15px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s;
    text-decoration: none;
    display: inline-block;
}

.btn-primary-custom:hover {
    background: #4a5aaf;
    color: white;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(92, 107, 192, 0.3);
}

.btn-secondary-custom {
    background: #fff;
    color: #666;
    padding: 14px 32px;
    border: 2px solid #e0e0e0;
    border-radius: 8px;
    font-size: 15px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s;
    text-decoration: none;
    display: inline-block;
}

.btn-secondary-custom:hover {
    background: #f8f9fa;
    border-color: #999;
    color: #333;
}

.btn-outline-custom {
    background: transparent;
    color: #5c6bc0;
    padding: 14px 32px;
    border: 2px solid #5c6bc0;
    border-radius: 8px;
    font-size: 15px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s;
    text-decoration: none;
    display: inline-block;
}

.btn-outline-custom:hover {
    background: #5c6bc0;
    color: white;
}

/* ==================== 반응형 ==================== */
@media (max-width: 1200px) {
    .content {
        padding: 40px;
    }
    
    .product-grid {
        grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
    }
}

@media (max-width: 992px) {
    .mypage-container {
        flex-direction: column;
    }
    
    .sidebar {
        width: 100%;
        min-height: auto;
        border-right: none;
        border-bottom: 1px solid #e0e0e0;
    }
    
    .content {
        padding: 30px 20px;
    }
    
    .celebration-banner {
        padding: 30px 20px;
    }
    
    .celebration-title {
        font-size: 24px;
    }
}

@media (max-width: 768px) {
    .content-header h2 {
        font-size: 24px;
    }
    
    .result-card {
        padding: 25px 20px;
    }
    
    .product-grid {
        grid-template-columns: 1fr;
    }
    
    .action-buttons {
        flex-direction: column;
    }
    
    .btn-primary-custom,
    .btn-secondary-custom,
    .btn-outline-custom {
        width: 100%;
        text-align: center;
    }
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
    <c:import url="../common/header.jsp" />
    <!-- End Header Area -->

    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">피부 진단 결과</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="${pageContext.request.contextPath}/"><i class="lni lni-home"></i> 홈</a></li>
                        <li>마이페이지</li>
                        <li>피부 진단 결과</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    <!-- Start Mypage Section -->
    <section class="mypage-section">
        <div class="container">
            <div class="mypage-container">
                
                <!-- ==================== Sidebar ==================== -->
                <div class="sidebar">
                    <div class="sidebar-header">마이페이지</div>
                    <div class="sidebar-subtitle">${sessionScope.mem_name}님 환영합니다</div>
                    
                    <!-- 쇼핑 메뉴 -->
                    <div class="menu-section">
                        <a href="${pageContext.request.contextPath}/cart/list.do?mem_idx=${sessionScope.mem_idx}" 
                           class="menu-item">
                            🛒 장바구니
                        </a>
                        
                        <a href="${pageContext.request.contextPath}/wishlist/list.do?mem_idx=${sessionScope.mem_idx}" 
                           class="menu-item">
                            💝 찜
                        </a>
                        
                        <a href="${pageContext.request.contextPath}/order/list.do?mem_idx=${sessionScope.mem_idx}" 
                           class="menu-item">
                            🎯 주문/배송 조회
                        </a>
                    </div>
                    
                    <!-- 나의 활동 -->
                    <div class="menu-section">
                        <div class="menu-title">나의 활동</div>
                        
                        <a href="${pageContext.request.contextPath}/qna/list.do?mem_idx=${sessionScope.mem_idx}" 
                           class="menu-item">
                            💬 상품 Q&A
                        </a>
                        
                        <!-- 피부 진단 - 현재 페이지 -->
                        <a href="${pageContext.request.contextPath}/skinprofile/form.do" 
                           class="menu-item active">
                            🔬 피부 진단
                        </a>
                    </div>
                    
                    <!-- 회원 정보 -->
                    <div class="menu-section">
                        <div class="menu-title">회원 정보</div>
                        
                        <a href="${pageContext.request.contextPath}/member/modify.do" 
                           class="menu-item">
                            👥 회원정보 수정
                        </a>
                        
                        <a href="${pageContext.request.contextPath}/member/address.do" 
                           class="menu-item">
                            🔒 배송지 관리
                        </a>
                        
                        <a href="${pageContext.request.contextPath}/member/notification.do" 
                           class="menu-item">
                            📧 알림톡신청 관리
                        </a>
                    </div>
                    
                    <!-- 로그아웃 -->
                    <div class="menu-section">
                        <a href="${pageContext.request.contextPath}/member/logout.do" 
                           class="menu-item"
                           onclick="return confirm('로그아웃 하시겠습니까?');">
                            📝 로그아웃
                        </a>
                    </div>
                </div>
                
                <!-- ==================== Content ==================== -->
                <div class="content">
                    
                    <!-- 축하 배너 -->
                    <div class="celebration-banner">
                        <div class="celebration-icon">🎉</div>
                        <h2 class="celebration-title">진단이 완료되었습니다!</h2>
                        <p class="celebration-message">
                            ${sessionScope.mem_name}님의 피부 타입 분석이 완료되었습니다.<br>
                            아래 결과를 확인하고 맞춤 추천 상품을 만나보세요!
                        </p>
                    </div>
                    
                    <!-- 진단 결과 -->
                    <div class="result-card">
                        <div class="result-card-header">
                            <div class="result-icon">🎯</div>
                            <h3>당신의 피부 타입</h3>
                        </div>
                        
                        <div class="hashtag-container">
                            <c:forEach var="vo" items="${hashtag_list}">
                                <span class="hashtag-badge">${vo.hashtag_name}</span>
                            </c:forEach>
                        </div>
                        
                        <p style="text-align: center; color: #666; font-size: 15px; margin-top: 20px;">
                            위 해시태그를 기반으로 맞춤 제품을 추천해드립니다
                        </p>
                    </div>
                    
                    <!-- 추천 상품 -->
                    <div class="result-card">
                        <div class="result-card-header">
                            <div class="result-icon">✨</div>
                            <h3>당신을 위한 추천 상품</h3>
                        </div>
                        
                        <c:choose>
                            <c:when test="${empty product_list}">
                                <div class="empty-products">
                                    <i class="lni lni-package"></i>
                                    <h4>현재 매칭되는 상품이 없습니다</h4>
                                    <p>다른 조건으로 다시 진단하거나, 전체 상품을 둘러보세요</p>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <p style="color: #666; font-size: 15px; margin-bottom: 10px;">
                                    총 <strong style="color: #5c6bc0;">${product_list.size()}개</strong>의 상품이 추천되었습니다
                                </p>
                                
                                <div class="product-grid">
                                    <c:forEach var="product" items="${product_list}">
                                        <div class="product-card" onclick="location.href='${pageContext.request.contextPath}/product/detail.do?product_idx=${product.product_idx}'">
                                            <div class="product-name">${product.product_name}</div>
                                            <div class="product-brand">${product.product_brand}</div>
                                            <div class="product-comment">${product.product_comment}</div>
                                            <div class="product-footer">
                                                <div class="product-price">
                                                    <fmt:formatNumber value="${product.product_price}" pattern="#,###"/>원
                                                </div>
                                                <a href="${pageContext.request.contextPath}/product/detail.do?product_idx=${product.product_idx}" 
                                                   class="btn-view-product" onclick="event.stopPropagation();">
                                                    상세보기
                                                </a>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    
                    <!-- 액션 버튼 -->
                    <div class="action-buttons">
                        <a href="${pageContext.request.contextPath}/" class="btn-secondary-custom">
                            메인으로
                        </a>
                        <a href="${pageContext.request.contextPath}/product/list.do" class="btn-primary-custom">
                            전체 상품 보기
                        </a>
                        <a href="${pageContext.request.contextPath}/skinprofile/form.do" class="btn-outline-custom">
                            다시 진단하기
                        </a>
                    </div>
                    
                </div>
            </div>
        </div>
    </section>
    <!-- End Mypage Section -->

    <!-- Start Footer Area -->
    <c:import url="../common/footer.jsp" />
    <!-- End Footer Area -->

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top">
        <i class="lni lni-chevron-up"></i>
    </a>

    <!-- ========================= JS here ========================= -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
    </script>
    
</body>
</html>
