<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>내 피부 프로필 - OneTouch</title>
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
/* .sidebar {
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
} */

/* ==================== 컨텐츠 영역 ==================== */
.content {
    flex: 1;
    padding: 50px 60px;
    background: #fff;
}

.content-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 40px;
    padding-bottom: 20px;
    border-bottom: 2px solid #5c6bc0;
}

.content-header h2 {
    font-size: 24px;
    color: #333;
    font-weight: 700;
    margin: 0;
}

/* ==================== 빈 상태 ==================== */
.empty-state {
    text-align: center;
    padding: 100px 20px;
    background: #fff;
    border-radius: 12px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.05);
}

.empty-state i {
    font-size: 80px;
    color: #dee2e6;
    margin-bottom: 20px;
}

.empty-state h4 {
    font-size: 20px;
    font-weight: 600;
    color: #495057;
    margin-bottom: 10px;
}

.empty-state p {
    color: #6c757d;
    font-size: 14px;
    margin-bottom: 30px;
    line-height: 1.6;
}

.empty-state .btn {
    background: #5c6bc0;
    color: white;
    padding: 14px 32px;
    border: none;
    border-radius: 8px;
    font-size: 15px;
    font-weight: 600;
    transition: all 0.3s;
    text-decoration: none;
    display: inline-block;
}

.empty-state .btn:hover {
    background: #4a5aaf;
    color: white;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(92, 107, 192, 0.3);
}

/* ==================== 프로필 카드 ==================== */
.profile-card {
    background: #fff;
    border-radius: 12px;
    padding: 30px;
    margin-bottom: 30px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.05);
    border: 1px solid #e0e0e0;
}

.profile-card-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 25px;
    padding-bottom: 20px;
    border-bottom: 2px solid #f0f0f0;
}

.profile-card-title {
    display: flex;
    align-items: center;
    gap: 12px;
}

.profile-icon {
    width: 40px;
    height: 40px;
    background: linear-gradient(135deg, #5c6bc0 0%, #7e8fd4 100%);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 20px;
    color: white;
}

.profile-card h3 {
    font-size: 20px;
    font-weight: 700;
    color: #333;
    margin: 0;
}

.btn-retest {
    background: transparent;
    color: #5c6bc0;
    padding: 8px 20px;
    border: 2px solid #5c6bc0;
    border-radius: 6px;
    font-size: 14px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s;
    text-decoration: none;
    display: inline-block;
}

.btn-retest:hover {
    background: #5c6bc0;
    color: white;
}

/* ==================== 프로필 정보 박스 ==================== */
.profile-info-box {
    background: #f8f9fa;
    padding: 25px;
    border-radius: 10px;
    margin-bottom: 25px;
}

.profile-row {
    display: flex;
    align-items: center;
    padding: 14px 16px;
    background: white;
    border-radius: 8px;
    margin-bottom: 10px;
    transition: all 0.3s;
}

.profile-row:last-child {
    margin-bottom: 0;
}

.profile-row:hover {
    box-shadow: 0 2px 8px rgba(0,0,0,0.05);
    transform: translateX(3px);
}

.profile-label {
    font-weight: 600;
    color: #666;
    min-width: 120px;
    font-size: 14px;
}

.profile-value {
    color: #5c6bc0;
    font-weight: 600;
    font-size: 15px;
}

/* ==================== 해시태그 ==================== */
.hashtag-section {
    margin-top: 25px;
    padding-top: 20px;
    border-top: 1px solid #e0e0e0;
}

.hashtag-section-title {
    font-weight: 600;
    color: #333;
    font-size: 15px;
    margin-bottom: 15px;
}

.hashtag-container {
    display: flex;
    flex-wrap: wrap;
    gap: 8px;
}

.hashtag-badge {
    display: inline-flex;
    align-items: center;
    padding: 8px 16px;
    background: linear-gradient(135deg, #5c6bc0 0%, #7e8fd4 100%);
    color: white;
    border-radius: 20px;
    font-size: 13px;
    font-weight: 600;
    box-shadow: 0 2px 6px rgba(92, 107, 192, 0.2);
}

.hashtag-badge::before {
    content: '#';
    margin-right: 3px;
    opacity: 0.8;
}

/* ==================== 진단 날짜 정보 ==================== */
.profile-meta {
    margin-top: 20px;
    padding: 15px;
    background: #f8f9fa;
    border-radius: 8px;
    font-size: 13px;
    color: #666;
}

.profile-meta strong {
    color: #333;
}

/* ==================== 추천 상품 ==================== */
.product-section {
    margin-top: 30px;
}

.product-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
    gap: 20px;
    margin-top: 20px;
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
    font-size: 16px;
    font-weight: 600;
    color: #333;
    margin-bottom: 8px;
    line-height: 1.4;
}

.product-brand {
    font-size: 12px;
    color: #999;
    margin-bottom: 12px;
}

.product-comment {
    font-size: 13px;
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
    font-size: 18px;
    font-weight: 700;
    color: #5c6bc0;
}

.btn-view-product {
    background: #5c6bc0;
    color: white;
    padding: 6px 16px;
    border: none;
    border-radius: 6px;
    font-size: 13px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s;
    text-decoration: none;
    display: inline-block;
}

.btn-view-product:hover {
    background: #4a5aaf;
    color: white;
}

/* ==================== 빈 상품 ==================== */
.empty-products {
    text-align: center;
    padding: 50px 20px;
    background: #f8f9fa;
    border-radius: 12px;
}

.empty-products i {
    font-size: 48px;
    color: #dee2e6;
    margin-bottom: 15px;
}

.empty-products p {
    color: #999;
    font-size: 14px;
    margin: 0;
}

/* ==================== 액션 버튼 ==================== */
.action-buttons {
    display: flex;
    gap: 15px;
    justify-content: center;
    margin-top: 40px;
    flex-wrap: wrap;
}

.btn-primary-custom {
    background: #5c6bc0;
    color: white;
    padding: 12px 28px;
    border: none;
    border-radius: 8px;
    font-size: 14px;
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
    padding: 12px 28px;
    border: 2px solid #e0e0e0;
    border-radius: 8px;
    font-size: 14px;
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

/* ==================== 반응형 ==================== */
@media (max-width: 1200px) {
    .content {
        padding: 40px;
    }
    
    .product-grid {
        grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
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
    
    .profile-card-header {
        flex-direction: column;
        align-items: flex-start;
        gap: 15px;
    }
}

@media (max-width: 768px) {
    .profile-card {
        padding: 20px;
    }
    
    .profile-row {
        flex-direction: column;
        align-items: flex-start;
        gap: 5px;
    }
    
    .profile-label {
        min-width: auto;
    }
    
    .product-grid {
        grid-template-columns: 1fr;
    }
    
    .action-buttons {
        flex-direction: column;
    }
    
    .btn-primary-custom,
    .btn-secondary-custom {
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
                        <h1 class="page-title">내 피부 프로필</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="${pageContext.request.contextPath}/"><i class="lni lni-home"></i> 홈</a></li>
                        <li>마이페이지</li>
                        <li>피부 프로필</li>
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

               <!--  사이드바 주소 -->
     				<%@include file="../common/mypage_side_bar.jsp" %>
                
                <!-- ==================== Content ==================== -->
                <div class="content">
                    
                    <c:choose>
                        <%-- 피부 프로필이 없는 경우 --%>
                        <c:when test="${!hasProfile}">
                            <div class="content-header">
                                <h2>피부 프로필</h2>
                            </div>
                            
                            <div class="empty-state">
                                <i class="lni lni-search-alt"></i>
                                <h4>아직 피부 진단을 하지 않으셨네요!</h4>
                                <p>
                                    간단한 5개 질문으로 당신의 피부 타입을 분석하고<br>
                                    맞춤형 화장품을 추천받아보세요.
                                </p>
                                <a href="${pageContext.request.contextPath}/skinprofile/form" class="btn">
                                    피부 진단 시작하기
                                </a>
                            </div>
                        </c:when>
                        
                        <%-- 피부 프로필이 있는 경우 --%>
                        <c:otherwise>
                            <div class="content-header">
                                <h2>내 피부 프로필</h2>
                            </div>
                            
                            <!-- 프로필 정보 카드 -->
                            <div class="profile-card">
                                <div class="profile-card-header">
                                    <div class="profile-card-title">
                                        <div class="profile-icon">🎯</div>
                                        <h3>피부 진단 정보</h3>
                                    </div>
                                    <a href="${pageContext.request.contextPath}/skinprofile/form.do" class="btn-retest">
                                        다시 진단하기
                                    </a>
                                </div>
                                
                                <div class="profile-info-box">
                                    <div class="profile-row">
                                        <span class="profile-label">🔹 피부 타입</span>
                                        <span class="profile-value">${skinProfile.sp_skin_type}</span>
                                    </div>
                                    <div class="profile-row">
                                        <span class="profile-label">🔹 피부 트러블</span>
                                        <span class="profile-value">${skinProfile.sp_trouble}</span>
                                    </div>
                                    <div class="profile-row">
                                        <span class="profile-label">🔹 색소 침착</span>
                                        <span class="profile-value">${skinProfile.sp_color_change}</span>
                                    </div>
                                    <div class="profile-row">
                                        <span class="profile-label">🔹 주름</span>
                                        <span class="profile-value">${skinProfile.sp_wrinkle}</span>
                                    </div>
                                    <div class="profile-row">
                                        <span class="profile-label">🔹 피부톤</span>
                                        <span class="profile-value">${skinProfile.sp_skin_tone}</span>
                                    </div>
                                </div>
                                
                                <div class="hashtag-section">
                                    <div class="hashtag-section-title">📌 맞춤 해시태그</div>
                                    <div class="hashtag-container">
                                        <c:forEach var="vo" items="${hashtag_list}">
                                            <span class="hashtag-badge">${vo.hashtag_name}</span>
                                        </c:forEach>
                                    </div>
                                </div>
                                
                                <div class="profile-meta">
                                    <strong>최초 진단:</strong> 
                                    <fmt:formatDate value="${skinProfile.sp_time}" pattern="yyyy년 MM월 dd일 HH:mm"/>
                                    <c:if test="${skinProfile.sp_update != null}">
                                        <br>
                                        <strong>마지막 업데이트:</strong> 
                                        <fmt:formatDate value="${skinProfile.sp_update}" pattern="yyyy년 MM월 dd일 HH:mm"/>
                                    </c:if>
                                </div>
                            </div>
                            
                            <!-- 추천 상품 섹션 -->
                            <div class="profile-card">
                                <div class="profile-card-header">
                                    <div class="profile-card-title">
                                        <div class="profile-icon">✨</div>
                                        <h3>맞춤 추천 상품</h3>
                                    </div>
                                </div>
                                
                                <c:choose>
                                    <c:when test="${empty product_list}">
                                        <div class="empty-products">
                                            <i class="lni lni-package"></i>
                                            <p>현재 매칭되는 상품이 없습니다. 곧 새로운 상품이 추가될 예정입니다.</p>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <p style="color: #666; font-size: 14px; margin-bottom: 20px;">
                                            총 <strong style="color: #5c6bc0;">${product_list.size()}개</strong>의 상품이 당신의 피부에 추천되었습니다
                                        </p>
                                        
                                        <div class="product-grid">
                                            <c:forEach var="product" items="${product_list}">
                                                <div class="product-card" onclick="location.href='${pageContext.request.contextPath}/product/detail?id=${product.product_idx}'">
                                                    <div class="product-name">${product.product_name}</div>
                                                    <div class="product-brand">${product.product_brand}</div>
                                                    <div class="product-comment">${product.product_comment}</div>
                                                    <div class="product-footer">
                                                        <div class="product-price">
                                                            <fmt:formatNumber value="${product.product_price}" pattern="#,###"/>원
                                                        </div>
                                                        <a href="${pageContext.request.contextPath}/product/detail?id=${product.product_idx}" 
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
                                <a href="${pageContext.request.contextPath}/cart/list.do" class="btn-secondary-custom">
                                    마이페이지로
                                </a>
                                <a href="${pageContext.request.contextPath}/product/list" class="btn-primary-custom">
                                    전체 상품 보기
                                </a>
                            </div>
                        </c:otherwise>
                    </c:choose>
                    
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
