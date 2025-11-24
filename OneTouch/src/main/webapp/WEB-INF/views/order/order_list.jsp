<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>주문/배송 조회 - OneTouch</title>
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
    padding: 12px 28px;
    border: none;
    border-radius: 6px;
    font-size: 14px;
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

/* ==================== 필터 탭 ==================== */
.filter-tabs {
    display: flex;
    gap: 10px;
    margin-bottom: 30px;
    flex-wrap: wrap;
}

.filter-tabs button {
    padding: 10px 20px;
    border: 1px solid #e0e0e0;
    background: white;
    border-radius: 8px;
    cursor: pointer;
    transition: all 0.3s;
    font-size: 14px;
    color: #666;
}

.filter-tabs button:hover {
    background: #f5f7fa;
}

.filter-tabs button.active {
    background: #5c6bc0;
    color: white;
    border-color: #5c6bc0;
}

/* ==================== 주문 카드 ==================== */
.order-card {
    border: 1px solid #e0e0e0;
    border-radius: 12px;
    padding: 24px;
    margin-bottom: 16px;
    transition: all 0.3s;
    background: #fff;
}

.order-card:hover {
    box-shadow: 0 4px 12px rgba(0,0,0,0.08);
}

.order-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding-bottom: 16px;
    border-bottom: 1px solid #e9ecef;
    margin-bottom: 16px;
}

.order-date {
    color: #666;
    font-size: 14px;
}

.order-number {
    font-weight: 600;
    color: #333;
    margin-left: 16px;
}

.order-status {
    display: inline-block;
    padding: 6px 16px;
    border-radius: 20px;
    font-size: 13px;
    font-weight: 500;
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

/* 주문 상품 */
.order-products {
    display: flex;
    align-items: center;
    gap: 16px;
    padding: 16px 0;
}

.order-icon {
    width: 60px;
    height: 60px;
    background: #f8f9fa;
    border-radius: 8px;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-shrink: 0;
}

.order-icon svg {
    width: 30px;
    height: 30px;
    color: #5c6bc0;
}

.order-info {
    flex: 1;
}

.order-product-name {
    font-size: 16px;
    font-weight: 600;
    color: #333;
    margin-bottom: 6px;
}

.order-product-detail {
    font-size: 14px;
    color: #666;
}

.order-amount {
    text-align: right;
}

.order-amount .price {
    font-size: 20px;
    font-weight: 700;
    color: #5c6bc0;
}

/* 주문 푸터 */
.order-footer {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding-top: 16px;
    border-top: 1px solid #e9ecef;
    margin-top: 16px;
}

.order-actions {
    display: flex;
    gap: 8px;
}

.order-actions .btn {
    padding: 8px 16px;
    font-size: 14px;
    border-radius: 6px;
    transition: all 0.3s;
}

.order-actions .btn-outline-primary {
    background: white;
    color: #5c6bc0;
    border: 1px solid #5c6bc0;
}

.order-actions .btn-outline-primary:hover {
    background: #5c6bc0;
    color: white;
}

.order-actions .btn-primary {
    background: #5c6bc0;
    color: white;
    border: 1px solid #5c6bc0;
}

.order-actions .btn-primary:hover {
    background: #4a5aaf;
    border-color: #4a5aaf;
}

.order-actions .btn-outline-danger {
    background: white;
    color: #dc3545;
    border: 1px solid #dc3545;
}

.order-actions .btn-outline-danger:hover {
    background: #dc3545;
    color: white;
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
    
    .order-header {
        flex-direction: column;
        align-items: flex-start;
        gap: 10px;
    }
    
    .order-footer {
        flex-direction: column;
        align-items: flex-start;
        gap: 15px;
    }
    
    .order-actions {
        width: 100%;
        flex-direction: column;
    }
    
    .order-actions .btn {
        width: 100%;
    }
}

@media (max-width: 768px) {
    .order-products {
        flex-direction: column;
        align-items: flex-start;
    }
    
    .order-amount {
        width: 100%;
        text-align: left;
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
                        <h1 class="page-title">주문/배송 조회</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="${pageContext.request.contextPath}/"><i class="lni lni-home"></i> 홈</a></li>
                        <li>마이페이지</li>
                        <li>주문/배송 조회</li>
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
                        
                        <!-- 주문/배송 조회 - 현재 페이지 -->
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
                        <h2>주문/배송 조회</h2>
                    </div>
                    
                    <!-- 필터 탭 -->
                    <div class="filter-tabs">
                        <button class="active" data-filter="all">전체</button>
                        <button data-filter="pending">결제대기</button>
                        <button data-filter="paid">결제완료</button>
                        <button data-filter="shipping">배송중</button>
                        <button data-filter="completed">배송완료</button>
                        <button data-filter="cancelled">취소/반품</button>
                    </div>
                    
                    <!-- 주문 목록 -->
                    <c:choose>
                        <c:when test="${empty order_list}">
                            <div class="empty-state">
                                <i class="lni lni-package"></i>
                                <h4>주문 내역이 없습니다</h4>
                                <p>원하는 상품을 장바구니에 담고 주문해보세요!</p>
                                <button class="btn" onclick="location.href='${pageContext.request.contextPath}/product/list.do'">
                                    쇼핑하러 가기
                                </button>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="order" items="${order_list}">
                                <div class="order-card" data-status="${order.order_status}">
                                    <!-- 주문 헤더 -->
                                    <div class="order-header">
                                        <div>
                                            <span class="order-date">
                                                <fmt:formatDate value="${order.order_time}" pattern="yyyy.MM.dd"/>
                                            </span>
                                            <span class="order-number">주문번호: ${order.order_no}</span>
                                        </div>
                                        <span class="order-status 
                                            <c:choose>
                                                <c:when test="${order.order_status == '결제대기'}">status-pending</c:when>
                                                <c:when test="${order.order_status == '결제완료'}">status-paid</c:when>
                                                <c:when test="${order.order_status == '배송중'}">status-shipping</c:when>
                                                <c:when test="${order.order_status == '배송완료'}">status-completed</c:when>
                                                <c:when test="${order.order_status == '취소'}">status-cancelled</c:when>
                                            </c:choose>
                                        ">
                                            ${order.order_status}
                                        </span>
                                    </div>
                                    
                                    <!-- 주문 상품 -->
                                    <div class="order-products">
                                        <div class="order-icon">
                                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                                                <path stroke-linecap="round" stroke-linejoin="round" d="M20.25 7.5l-.625 10.632a2.25 2.25 0 01-2.247 2.118H6.622a2.25 2.25 0 01-2.247-2.118L3.75 7.5M10 11.25h4M3.375 7.5h17.25c.621 0 1.125-.504 1.125-1.125v-1.5c0-.621-.504-1.125-1.125-1.125H3.375c-.621 0-1.125.504-1.125 1.125v1.5c0 .621.504 1.125 1.125 1.125z" />
                                            </svg>
                                        </div>
                                        <div class="order-info">
                                            <div class="order-product-name">${order.order_name}</div>
                                            <div class="order-product-detail">
                                                주문일시: <fmt:formatDate value="${order.order_time}" pattern="yyyy.MM.dd HH:mm"/>
                                            </div>
                                        </div>
                                        <div class="order-amount">
                                            <div class="price">
                                                <fmt:formatNumber value="${order.total_amount}" pattern="#,###"/>원
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <!-- 주문 푸터 -->
                                    <div class="order-footer">
                                        <div class="text-muted" style="font-size: 14px;">
                                            배송지: ${order.order_address}
                                        </div>
                                        <div class="order-actions">
                                            <a href="${pageContext.request.contextPath}/order/detail.do?order_id=${order.order_id}" 
                                               class="btn btn-outline-primary">상세보기</a>
                                            
                                            <c:choose>
                                                <c:when test="${order.order_status == '결제대기'}">
                                                    <button class="btn btn-primary" onclick="payOrder(${order.order_id})">결제하기</button>
                                                    <button class="btn btn-outline-danger" onclick="cancelOrder(${order.order_id})">주문취소</button>
                                                </c:when>
                                                <c:when test="${order.order_status == '배송완료'}">
                                                    <a href="${pageContext.request.contextPath}/review/write.do?order_id=${order.order_id}" 
                                                       class="btn btn-primary">리뷰작성</a>
                                                </c:when>
                                                <c:when test="${order.order_status == '배송중'}">
                                                    <button class="btn btn-outline-primary" onclick="trackShipping('${order.order_no}')">배송조회</button>
                                                </c:when>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
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
    
    // 필터 탭 기능
    document.querySelectorAll('.filter-tabs button').forEach(button => {
        button.addEventListener('click', function() {
            document.querySelectorAll('.filter-tabs button').forEach(btn => btn.classList.remove('active'));
            this.classList.add('active');
            
            const filter = this.dataset.filter;
            
            document.querySelectorAll('.order-card').forEach(card => {
                const status = card.dataset.status;
                
                if (filter === 'all') {
                    card.style.display = 'block';
                } else if (filter === 'pending' && status === '결제대기') {
                    card.style.display = 'block';
                } else if (filter === 'paid' && status === '결제완료') {
                    card.style.display = 'block';
                } else if (filter === 'shipping' && status === '배송중') {
                    card.style.display = 'block';
                } else if (filter === 'completed' && status === '배송완료') {
                    card.style.display = 'block';
                } else if (filter === 'cancelled' && (status === '취소' || status === '반품')) {
                    card.style.display = 'block';
                } else {
                    card.style.display = 'none';
                }
            });
        });
    });
    
    // 주문 취소
    function cancelOrder(orderId) {
        if (confirm('주문을 취소하시겠습니까?')) {
            fetch('${pageContext.request.contextPath}/order/cancel.do', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: 'order_id=' + orderId
            })
            .then(response => response.json())
            .then(data => {
                if (data.result === 'success') {
                    alert('주문이 취소되었습니다.');
                    location.reload();
                } else {
                    alert('주문 취소에 실패했습니다.');
                }
            })
            .catch(error => {
                alert('주문 취소 중 오류가 발생했습니다.');
            });
        }
    }
    
    // 배송 조회
    function trackShipping(orderNo) {
        window.open('${pageContext.request.contextPath}/order/track.do?order_no=' + orderNo, 'shipping', 'width=600,height=700');
    }
    
    // 결제하기
    function payOrder(orderId) {
        location.href = '${pageContext.request.contextPath}/order/payment.do?order_id=' + orderId;
    }
    
    </script>
    
</body>
</html>
