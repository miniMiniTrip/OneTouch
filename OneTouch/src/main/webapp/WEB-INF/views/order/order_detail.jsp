<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
	<c:if test="${not empty message}">
	    <div class="alert alert-info alert-dismissible fade show" role="alert">
	        ${message}
	        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
	    </div>
	</c:if>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>주문 상세 - OneTouch</title>
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

/* ==================== 주문 상태 배지 ==================== */
.order-status-badge {
    padding: 8px 20px;
    border-radius: 20px;
    font-weight: 600;
    font-size: 14px;
}

.status-pending {
    background: #fff3cd;
    color: #856404;
}

.status-paid {
    background: #d4edda;
    color: #155724;
}

.status-shipping {
    background: #d1ecf1;
    color: #0c5460;
}

.status-completed {
    background: #d4edda;
    color: #155724;
}

.status-cancelled {
    background: #f8d7da;
    color: #721c24;
}

/* ==================== 섹션 카드 ==================== */
.section-card {
    background: #fff;
    border-radius: 12px;
    padding: 30px;
    margin-bottom: 20px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.05);
    border: 1px solid #e0e0e0;
}

.section-card-header {
    display: flex;
    align-items: center;
    gap: 12px;
    margin-bottom: 20px;
    padding-bottom: 15px;
    border-bottom: 2px solid #f0f0f0;
}

.section-icon {
    width: 36px;
    height: 36px;
    background: linear-gradient(135deg, #5c6bc0 0%, #7e8fd4 100%);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 18px;
    color: white;
}

.section-card h3 {
    font-size: 18px;
    font-weight: 700;
    color: #333;
    margin: 0;
}

/* ==================== 정보 테이블 ==================== */
.info-table {
    width: 100%;
}

.info-table tr {
    border-bottom: 1px solid #f0f0f0;
}

.info-table tr:last-child {
    border-bottom: none;
}

.info-table td {
    padding: 14px 0;
    vertical-align: top;
}

.info-table td:first-child {
    width: 140px;
    color: #666;
    font-size: 14px;
    font-weight: 500;
}

.info-table td:last-child {
    color: #333;
    font-size: 14px;
}

/* ==================== 상품 리스트 ==================== */
.product-list {
    border: 1px solid #e0e0e0;
    border-radius: 12px;
    overflow: hidden;
}

.product-header {
    background: #f8f9fa;
    padding: 16px 20px;
    font-weight: 600;
    color: #333;
    font-size: 15px;
    border-bottom: 1px solid #e0e0e0;
}

.product-item {
    display: flex;
    gap: 20px;
    padding: 24px;
    border-bottom: 1px solid #f0f0f0;
    transition: all 0.3s;
}

.product-item:last-child {
    border-bottom: none;
}

.product-item:hover {
    background: #f8f9fa;
}

.product-image {
    width: 100px;
    height: 100px;
    border-radius: 8px;
    overflow: hidden;
    flex-shrink: 0;
    background: #f5f5f5;
    display: flex;
    align-items: center;
    justify-content: center;
}

.product-image img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.product-image.no-image {
    color: #999;
    font-size: 12px;
}

.product-info {
    flex: 1;
        display: flex;
    flex-direction: column;   /* 세로 정렬 */
    align-items: center;      /* 가로 가운데 정렬 */
}

.product-name {
    font-size: 16px;
    font-weight: 600;
    margin-top:30px;
    margin-bottom: 8px;
    color: #333;

}

.product-name a {
    color: #333;
    text-decoration: none;
    transition: color 0.3s;
}

.product-name a:hover {
    color: #5c6bc0;
}

.product-detail {
    color: #666;
    font-size: 14px;
    line-height: 1.6;
}

.product-price {
    text-align: right;
    min-width: 120px;
        display: flex;
    flex-direction: column;   /* 세로 정렬 */
    align-items: center;      /* 가로 가운데 정렬 */
    
}

.product-price .price {
    font-size: 18px;
    font-weight: 700;
    color: #5c6bc0;
    margin-bottom: 4px;
    
}

.product-price .qty {
    font-size: 14px;
    color: #666;
}

/* ==================== 결제 요약 ==================== */
.payment-summary {
    background: #f8f9fa;
    padding: 24px;
    border-radius: 10px;
    margin-top: 20px;
}

.payment-summary-item {
    display: flex;
    justify-content: space-between;
    padding: 12px 0;
    font-size: 15px;
    color: #666;
}

.payment-summary-item:not(:last-child) {
    border-bottom: 1px solid #e0e0e0;
}

.payment-summary-item.total {
    font-size: 18px;
    font-weight: 700;
    color: #333;
    padding-top: 16px;
    margin-top: 8px;
    border-top: 2px solid #5c6bc0;
}

.payment-summary-item.total span:last-child {
    color: #5c6bc0;
    font-size: 22px;
}

/* ==================== 액션 버튼 ==================== */
.action-buttons {
    display: flex;
    gap: 12px;
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
    margin-top: 10px;
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

.btn-danger-custom {
    background: #dc3545;
    color: white;
    padding: 12px 28px;
    border: none;
    border-radius: 8px;
    font-size: 14px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s;
}

.btn-danger-custom:hover {
    background: #c82333;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(220, 53, 69, 0.3);
}

.btn-outline-danger-custom {
    background: transparent;
    color: #dc3545;
    padding: 12px 28px;
    border: 2px solid #dc3545;
    border-radius: 8px;
    font-size: 14px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s;
}

.btn-outline-danger-custom:hover {
    background: #dc3545;
    color: white;
}

/* ==================== 영수증 버튼 ==================== */
.btn-receipt {
    background: transparent;
    color: #5c6bc0;
    padding: 6px 16px;
    border: 1px solid #5c6bc0;
    border-radius: 6px;
    font-size: 13px;
    font-weight: 600;
    text-decoration: none;
    display: inline-block;
    transition: all 0.3s;
}

.btn-receipt:hover {
    background: #5c6bc0;
    color: white;
}

/* 리뷰 버튼 div 영역 */
.product-review{
	display: flex;
    justify-content: center;
    align-items: center;   /* 세로 정렬도 필요하면 추가 */
}

/* 리뷰완료버튼 css */
.btn-green {
    background-color: #28a745;   /* 초록색 */
    color: #fff;
    display: inline-block;
    text-decoration: none;
    cursor: pointer;
}

.btn-green:hover {
    background-color: #218838;
}
/* 비활성화 */
.btn-disabled {
    background-color: #ccc;
    color: #666;
    pointer-events: none; /* 클릭 막기 */
    cursor: default;
}

/* ==================== 반응형 ==================== */
@media (max-width: 1200px) {
    .content {
        padding: 40px;
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
    
    .content-header {
        flex-direction: column;
        align-items: flex-start;
        gap: 15px;
    }
}

@media (max-width: 768px) {
    .section-card {
        padding: 20px;
    }
    
    .product-item {
        flex-direction: column;
    }
    
    .product-image {
        width: 100%;
        height: 200px;
    }
    
    .product-price {
        text-align: left;
        width: 100%;
    }
    
    .info-table td:first-child {
        width: 100px;
    }
    
    .action-buttons {
        flex-direction: column;
    }
    
    .btn-primary-custom,
    .btn-secondary-custom,
    .btn-danger-custom,
    .btn-outline-danger-custom {
        width: 100%;
        text-align: center;
    }
}
    </style>
</head>
<body>
</div>
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
                        <h1 class="page-title">주문 상세</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="${pageContext.request.contextPath}/"><i class="lni lni-home"></i> 홈</a></li>
                        <li>마이페이지</li>
                        <li>주문 상세</li>
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
                        
                        <!-- 주문/배송 조회 - 현재 페이지 -->
                        <a href="${pageContext.request.contextPath}/order/list.do?mem_idx=${sessionScope.mem_idx}" 
                           class="menu-item active">
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
                    
                    <!-- Content Header -->
                    <div class="content-header">
                        <h2>주문 상세 정보</h2>
                        <span class="order-status-badge 
                            <c:choose>
                                <c:when test='${order.order_status == "결제대기"}'>status-pending</c:when>
                                <c:when test='${order.order_status == "결제완료"}'>status-paid</c:when>
                                <c:when test='${order.order_status == "배송중"}'>status-shipping</c:when>
                                <c:when test='${order.order_status == "배송완료"}'>status-completed</c:when>
                                <c:when test='${order.order_status == "취소"}'>status-cancelled</c:when>
                            </c:choose>
                        ">
                            ${order.order_status}
                        </span>
                    </div>
                    
                    <!-- 주문 정보 -->
                    <div class="section-card">
                        <div class="section-card-header">
                            <div class="section-icon">📋</div>
                            <h3>주문 정보</h3>
                        </div>
                        
                        <table class="info-table">
                            <tr>
                                <td>주문번호</td>
                                <td><strong>${order.order_no}</strong></td>
                            </tr>
                            <tr>
                                <td>주문일시</td>
                                <td><fmt:formatDate value="${order.order_time}" pattern="yyyy년 MM월 dd일 HH:mm"/></td>
                            </tr>
                            <tr>
                                <td>주문자명</td>
                                <td>${sessionScope.user.mem_name}</td>
                            </tr>
                            <tr>
                                <td>연락처</td>
                                <td>${order.order_phone}</td>
                            </tr>
                        </table>
                    </div>
                    
                    <!-- 배송 정보 -->
                    <div class="section-card">
                        <div class="section-card-header">
                            <div class="section-icon">🚚</div>
                            <h3>배송 정보</h3>
                        </div>
                        
                        <table class="info-table">
                            <tr>
                                <td>받는 분</td>
                                <td>${order.order_mem_name}</td>
                            </tr>
                            <tr>
                                <td>연락처</td>
                                <td>${order.order_phone}</td>
                            </tr>
                            <tr>
                                <td>배송지</td>
                                <td>
                                    ${order.order_address}
                                    <c:if test="${not empty order.order_address_more}">
                                        <br>${order.order_address_more}
                                    </c:if>
                                </td>
                            </tr>
                            <c:if test="${not empty order.order_postal}">
                                <tr>
                                    <td>우편번호</td>
                                    <td>${order.order_postal}</td>
                                </tr>
                            </c:if>
                        </table>
                    </div>
                    
                    <!-- 주문 상품 -->
                    <div class="section-card">
                        <div class="section-card-header">
                            <div class="section-icon">📦</div>
                            <h3>주문 상품</h3>
                        </div>
                        
                        <div class="product-list">
                            <div class="product-header">
                                상품 정보
                            </div>
                            
                            <c:forEach var="item" items="${order_items}">
                                <div class="product-item">
                                    <div class="product-image ${empty item.product_image_url ? 'no-image' : ''}">
                                        <c:choose>
                                            <c:when test="${not empty item.product_image_url}">
                                                <img src="${pageContext.request.contextPath}/images/products_list/${item.product_image_url}" 
                                                     alt="${item.product_name}">
                                            </c:when>
                                            <c:otherwise>
                                                이미지 없음
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="product-info">
                                        <div class="product-name">
                                            <a href="${pageContext.request.contextPath}/product/detail.do?product_idx=${item.product_idx}">
                                                ${item.product_name}
                                            </a>
                                        </div>
                                        <div class="product-detail">
                                            수량: ${item.product_cnt}개
                                        </div>
                                    </div>
                                    <div class="product-price">
                                        <div class="price">
                                            <fmt:formatNumber value="${item.total_amount}" pattern="#,###"/>원
                                        </div>
                                        <div class="qty">수량: ${item.product_cnt}개</div>
                                    <c:if test="${order.order_status == '배송완료' }">
	                                    <div class="product-review">
		                                    <c:if test="${item.use_review == 1}">
							               		<a href="${pageContext.request.contextPath}/post/insert?category=review&product_idx=${item.product_idx}&order_item_id=${item.order_item_id}" 
							                   class="btn-primary-custom">리뷰작성</a>
		                                    </c:if>
	                                    </div>
                                    </c:if>
                                    <c:if test="${order.order_status == '배송완료' }">
	                                    <div class="product-review ">
		                                    <c:if test="${item.use_review == 2}">
							               		<a href="${pageContext.request.contextPath}/post/insert?category=review&product_idx=${item.product_idx}&order_item_id=${item.order_item_id}" 
							                   class="btn-primary-custom btn-green btn-disabled">리뷰완료</a>
		                                    </c:if>
	                                    </div>
                                    </c:if>
                                    <c:if test="${order.order_status != '배송완료' }">
	                                    <div class="product-review ">
							               		<a href="${pageContext.request.contextPath}/post/insert?category=review&product_idx=${item.product_idx}&order_item_id=${item.order_item_id}" 
							                   class="btn-primary-custom btn-green btn-disabled">${order.order_status }</a>
	                                    </div>
                                    </c:if>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        
                        <!-- 결제 요약 -->
                        <div class="payment-summary">
                            <div class="payment-summary-item">
                                <span>상품 합계</span>
                                <span><fmt:formatNumber value="${order.total_amount}" pattern="#,###"/>원</span>
                            </div>
                            <div class="payment-summary-item">
                                <span>배송비</span>
                                <span>무료</span>
                            </div>
                            <div class="payment-summary-item">
                                <span>할인 금액</span>
                                <span style="color: #dc3545;">-0원</span>
                            </div>
                            <div class="payment-summary-item total">
                                <span>총 결제금액</span>
                                <span>
                                    <fmt:formatNumber value="${order.total_amount}" pattern="#,###"/>원
                                </span>
                            </div>
                        </div>
                    </div>
                    
                    <!-- 결제 정보 -->
                    <c:if test="${not empty payment}">
                        <div class="section-card">
                            <div class="section-card-header">
                                <div class="section-icon">💳</div>
                                <h3>결제 정보</h3>
                            </div>
                            
                            <table class="info-table">
                                <tr>
                                    <td>결제수단</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${payment.method == 'card' || payment.method == '카드'}">신용카드</c:when>
                                            <c:when test="${payment.method == 'bank'}">계좌이체</c:when>
                                            <c:when test="${payment.method == 'tosspay'}">토스페이</c:when>
                                            <c:otherwise>${payment.method}</c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                                <tr>
                                    <td>결제금액</td>
                                    <td><fmt:formatNumber value="${payment.amount}" pattern="#,###"/>원</td>
                                </tr>
                                <c:if test="${not empty payment.approved_at}">
                                    <tr>
                                        <td>결제일시</td>
                                        <td><fmt:formatDate value="${payment.approved_at}" pattern="yyyy년 MM월 dd일 HH:mm:ss"/></td>
                                    </tr>
                                </c:if>
                                <c:if test="${not empty payment.receipt_url}">
                                    <tr>
                                        <td>영수증</td>
                                        <td>
                                            <a href="${payment.receipt_url}" target="_blank" class="btn-receipt">
                                                영수증 보기
                                            </a>
                                        </td>
                                    </tr>
                                </c:if>
                            </table>
                        </div>
                    </c:if>
                    
                    <!-- 액션 버튼 -->
					<div class="action-buttons">
					    <a href="${pageContext.request.contextPath}/order/list.do" class="btn-secondary-custom">
					        목록으로
					    </a>
					    
					    <c:choose>
						        <c:when test="${order.order_status == '결제취소' || order.order_status == '결제실패'}">
					            <button class="btn-danger-custom" onclick="cancelOrder(${order.order_id})">
					                주문취소
					            </button>
					        </c:when>
					        
					        <c:when test="${order.order_status == '상품확인중' || order.order_status == '배송준비중'}">
					            <button class="btn-outline-danger-custom" onclick="refundOrder(${order.order_id})">
					                환불요청
					            </button>
					        </c:when>
					        
					  <%--       <c:when test="${order.order_status == '배송완료'}">
					            <c:if test="${not empty order_items and order_items.size() > 0}">
					                <a href="${pageContext.request.contextPath}/post/insert?category=review&product_idx=${order_items[0].product_idx}&order_item_id=${order_items[0].order_item_id}" 
					                   class="btn-primary-custom">리뷰작성</a>
					            </c:if>
					        </c:when> --%>
					                                                
					        <c:when test="${order.order_status == '환불'}">
					            <div class="alert alert-info">
					                <i class="lni lni-information"></i> 
					                환불 요청이 접수되었습니다. 관리자 확인 후 처리됩니다.
					            </div>
					        </c:when>
					        
					        <c:when test="${order.order_status == '취소'}">
					            <div class="alert alert-secondary">
					                <i class="lni lni-close"></i> 
					                주문이 취소되었습니다.
					            </div>
					        </c:when>
					    </c:choose>
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
    
    // 결제하기
    function payOrder(orderId) {
        location.href = '${pageContext.request.contextPath}/order/payment.do?order_id=' + orderId;
    }
    
	// 주문 취소
    function cancelOrder(orderId) {
        if (confirm('주문을 취소하시겠습니까?')) {
            location.href = '${pageContext.request.contextPath}/order/cancel.do?order_id=' + orderId;
        }
    }

    // 환불 요청
    function refundOrder(orderId) {
        if (confirm('환불을 요청하시겠습니까?\n관리자 확인 후 처리됩니다.')) {
            location.href = '${pageContext.request.contextPath}/order/refund.do?order_id=' + orderId;
        }
    }
    </script>
    
</body>
</html>
