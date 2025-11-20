<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>주문 내역 - OneTouch</title>
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

/* ==================== 빈 상태 (공통) ==================== */
.empty-state {
    text-align: center;
    padding: 100px 20px;
    background: #fff;
    border-radius: 8px;
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
}

.empty-state .btn {
    background: #5c6bc0;
    color: white;
    padding: 12px 28px;
    border: none;
    border-radius: 6px;
    font-size: 14px;
    font-weight: 600;
    transition: all 0.3s;
}

.empty-state .btn:hover {
    background: #4a5aaf;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(92, 107, 192, 0.3);
}

/* ==================== 공통 버튼 스타일 ==================== */
.btn-primary-custom {
    background: #5c6bc0;
    color: white;
    padding: 8px 20px;
    border: none;
    border-radius: 6px;
    font-size: 13px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s;
}

.btn-primary-custom:hover {
    background: #4a5aaf;
    color: white;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(92, 107, 192, 0.3);
}

/* ==================== 주문 테이블 스타일 ==================== */
.order-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
    background: #fff;
}

.order-table thead {
    background: #f8f9fa;
    border-top: 2px solid #5c6bc0;
    border-bottom: 2px solid #e0e0e0;
}

.order-table th {
    padding: 18px 15px;
    font-size: 14px;
    font-weight: 600;
    color: #333;
    text-align: center;
}

.order-table tbody tr {
    border-bottom: 1px solid #e0e0e0;
    transition: all 0.2s;
}

.order-table tbody tr:hover {
    background: #f8f9fa;
}

.order-table td {
    padding: 18px 15px;
    font-size: 14px;
    color: #666;
    text-align: center;
    vertical-align: middle;
}

/* 주문 상태 뱃지 */
.status-badge {
    display: inline-block;
    padding: 6px 14px;
    border-radius: 14px;
    font-size: 12px;
    font-weight: 600;
}

.status-waiting {
    background: #fff3e0;
    color: #f57c00;
}

.status-paid {
    background: #e3f2fd;
    color: #1976d2;
}

.status-shipping {
    background: #f3e5f5;
    color: #7b1fa2;
}

.status-completed {
    background: #e8f5e9;
    color: #388e3c;
}

.status-canceled {
    background: #ffebee;
    color: #d32f2f;
}

/* ==================== 반응형 ==================== */
@media (max-width: 1200px) {
    .content {
        padding: 40px 40px;
    }
}

@media (max-width: 992px) {
    .mypage-container {
        flex-direction: column;
    }
    
    .sidebar {
        width: 100%;
        border-right: none;
        border-bottom: 1px solid #e0e0e0;
        min-height: auto;
    }
    
    .content {
        padding: 30px 20px;
    }
    
    .order-table th,
    .order-table td {
        padding: 12px 8px;
        font-size: 13px;
    }
}

@media (max-width: 768px) {
    .content-header {
        flex-direction: column;
        align-items: flex-start;
        gap: 15px;
    }
    
    .content-header h2 {
        font-size: 20px;
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
                        <h1 class="page-title">주문 내역</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="${pageContext.request.contextPath}/"><i class="lni lni-home"></i> 홈</a></li>
                        <li>마이페이지</li>
                        <li>주문 내역</li>
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
                        <!-- 장바구니 -->
                        <a href="${pageContext.request.contextPath}/cart/list.do?mem_idx=${sessionScope.mem_idx}" 
                           class="menu-item">
                            🛒 장바구니
                        </a>
                        
                        <!-- 찜 목록 -->
                        <a href="${pageContext.request.contextPath}/wishlist/list.do?mem_idx=${sessionScope.mem_idx}" 
                           class="menu-item">
                            💝 찜
                        </a>
                        
                        <!-- 주문/배송 조회 - 현재 페이지 (active) -->
                        <a href="${pageContext.request.contextPath}/order/list.do?mem_idx=${sessionScope.mem_idx}" 
                           class="menu-item active">
                            🎯 주문/배송 조회
                        </a>
                    </div>
                    
                    <!-- 나의 활동 -->
                    <div class="menu-section">
                        <div class="menu-title">나의 활동</div>
                        
                        <!-- 상품 Q&A -->
                        <a href="${pageContext.request.contextPath}/qna/list.do?mem_idx=${sessionScope.mem_idx}" 
                           class="menu-item">
                            💬 상품 Q&A
                        </a>
                    </div>
                    
                    <!-- 회원 정보 -->
                    <div class="menu-section">
                        <div class="menu-title">회원 정보</div>
                        
                        <!-- 회원정보 수정 -->
                        <a href="${pageContext.request.contextPath}/member/modify.do" 
                           class="menu-item">
                            👥 회원정보 수정
                        </a>
                        
                        <!-- 배송지 관리 -->
                        <a href="${pageContext.request.contextPath}/member/address.do" 
                           class="menu-item">
                            🔒 배송지 관리
                        </a>
                        
                        <!-- 알림톡신청 관리 -->
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
                        <h2>주문 내역</h2>
                    </div>
                    
                    <!-- ==================== 주문 내역 컨텐츠 ==================== -->
                    
                    <!-- 주문이 있는 경우 -->
                    <c:if test="${not empty order_list}">
                        <table class="order-table">
                            <thead>
                                <tr>
                                    <th style="width: 120px;">주문번호</th>
                                    <th style="width: 110px;">주문일자</th>
                                    <th>상품명</th>
                                    <th style="width: 120px;">결제금액</th>
                                    <th style="width: 100px;">주문상태</th>
                                    <th style="width: 100px;">상세보기</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="order" items="${order_list}">
                                    <tr>
                                        <td>${order.order_no}</td>
                                        <td>
                                            <fmt:formatDate value="${order.order_time}" pattern="yyyy-MM-dd"/>
                                        </td>
                                        <td style="text-align: left; padding-left: 20px;">
                                            ${order.order_name}
                                        </td>
                                        <td>
                                            <fmt:formatNumber value="${order.total_amount}" pattern="#,###"/>원
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${order.order_status == '결제대기'}">
                                                    <span class="status-badge status-waiting">결제대기</span>
                                                </c:when>
                                                <c:when test="${order.order_status == '결제완료'}">
                                                    <span class="status-badge status-paid">결제완료</span>
                                                </c:when>
                                                <c:when test="${order.order_status == '배송중'}">
                                                    <span class="status-badge status-shipping">배송중</span>
                                                </c:when>
                                                <c:when test="${order.order_status == '배송완료'}">
                                                    <span class="status-badge status-completed">배송완료</span>
                                                </c:when>
                                                <c:when test="${order.order_status == '주문취소'}">
                                                    <span class="status-badge status-canceled">주문취소</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="status-badge">${order.order_status}</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <button class="btn-primary-custom" 
                                                    onclick="location.href='/order/detail.do?order_id=${order.order_id}'">
                                                상세보기
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                    
                    <!-- 주문이 없는 경우 -->
                    <c:if test="${empty order_list}">
                        <div class="empty-state">
                            <i class="lni lni-inbox"></i>
                            <h4>주문 내역이 없습니다</h4>
                            <p>첫 주문을 시작해보세요!</p>
                            <button class="btn" onclick="location.href='/product/list.do'">
                                쇼핑하러 가기
                            </button>
                        </div>
                    </c:if>
                    
                    <!-- ==================== 컨텐츠 끝 ==================== -->
                    
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
    
    // 주문 상세 페이지로 이동
    function viewOrderDetail(orderId) {
        location.href = '/order/detail.do?order_id=' + orderId;
    }
    
    </script>
    
</body>
</html>
