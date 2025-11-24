<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>주문내역 - OneTouch</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="/assets/images/favicon.svg" />
    
    <!-- Web Font -->
    <link href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/assets/css/LineIcons.2.0.css" />
    <link rel="stylesheet" href="/assets/css/animate.css" />
    <link rel="stylesheet" href="/assets/css/tiny-slider.css" />
    <link rel="stylesheet" href="/assets/css/glightbox.min.css" />
    <link rel="stylesheet" href="/assets/css/main.css" />
    
    <style>
        .mypage-section {
            padding: 40px 0;
            background: #f8f9fa;
        }
        .mypage-content {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            min-height: 500px;
        }
        .page-header {
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 2px solid #5830E0;
        }
        .page-header h3 {
            font-size: 24px;
            margin: 0;
        }
        .order-list {
            margin-top: 30px;
        }
        .order-card {
            background: #fff;
            border: 1px solid #e9ecef;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            transition: box-shadow 0.3s;
        }
        .order-card:hover {
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        .order-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-bottom: 15px;
            border-bottom: 1px solid #e9ecef;
            margin-bottom: 15px;
        }
        .order-date {
            color: #666;
            font-size: 14px;
        }
        .order-number {
            font-weight: 600;
            color: #333;
        }
        .order-status {
            display: inline-block;
            padding: 5px 15px;
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
        .order-products {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }
        .order-product-icon {
            width: 80px;
            height: 80px;
            background: #f8f9fa;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
            border-radius: 5px;
            border: 1px solid #e9ecef;
        }
        .order-product-icon i {
            font-size: 32px;
            color: #5830E0;
        }
        .order-product-info {
            flex: 1;
        }
        .order-product-name {
            font-size: 15px;
            margin-bottom: 5px;
            color: #333;
            font-weight: 500;
        }
        .order-product-detail {
            font-size: 13px;
            color: #666;
        }
        .order-amount {
            text-align: right;
        }
        .order-amount .price {
            font-size: 18px;
            font-weight: 600;
            color: #333;
        }
        .order-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-top: 15px;
            border-top: 1px solid #e9ecef;
        }
        .order-actions {
            display: flex;
            gap: 10px;
        }
        .empty-orders {
            text-align: center;
            padding: 60px 20px;
        }
        .empty-orders i {
            font-size: 60px;
            color: #ddd;
            margin-bottom: 20px;
        }
        .empty-orders h5 {
            color: #666;
            margin-bottom: 15px;
        }
        .filter-tabs {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }
        .filter-tabs button {
            padding: 8px 20px;
            border: 1px solid #ddd;
            background: white;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s;
        }
        .filter-tabs button.active {
            background: #5830E0;
            color: white;
            border-color: #5830E0;
        }
    </style>
</head>
<body>
    <!-- 헤더 포함 -->
    <%@include file="/WEB-INF/views/common/header.jsp" %>
    
    <!-- Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">주문내역</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/"><i class="lni lni-home"></i> Home</a></li>
                        <li><a href="/mypage">마이페이지</a></li>
                        <li>주문내역</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    
    <!-- MyPage Section -->
    <section class="mypage-section section">
        <div class="container">
            <div class="row">
                <!-- Sidebar -->
                <aside class="sidebar">
                <ul class="sidebar-menu">
                    <li><a href="${pageContext.request.contextPath}/mypage/cart" class="active">장바구니</a></li>
                    <li><a href="${pageContext.request.contextPath}/mypage/wishlist">찜 목록</a></li>
                    <li><a href="${pageContext.request.contextPath}/mypage/orders">주문내역</a></li>
                    <li><a href="${pageContext.request.contextPath}/mypage/reviews">내 리뷰</a></li>
                    <li><a href="${pageContext.request.contextPath}/mypage/qna">문의내역</a></li>
                    <li><a href="${pageContext.request.contextPath}/mypage/profile">회원정보</a></li>
                </ul>
            </aside>
                
                <!-- Content -->
                <div class="col-lg-9">
                    <div class="mypage-content">
                        <div class="page-header">
                            <h3>주문내역</h3>
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
                        <div class="order-list">
                            <c:if test="${empty order_list}">
                                <div class="empty-orders">
                                    <i class="lni lni-package"></i>
                                    <h5>주문 내역이 없습니다</h5>
                                    <p>원하는 상품을 장바구니에 담고 주문해보세요!</p>
                                    <a href="/product/list.do" class="btn btn-primary">쇼핑하러 가기</a>
                                </div>
                            </c:if>
                            
                            <c:forEach var="order" items="${order_list}">
                                <div class="order-card" data-status="${order.order_status}">
                                    <!-- 주문 헤더 -->
                                    <div class="order-header">
                                        <div>
                                            <span class="order-date">
                                                <fmt:formatDate value="${order.order_time}" pattern="yyyy.MM.dd"/>
                                            </span>
                                            <span class="order-number ml-3">주문번호: ${order.order_no}</span>
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
                                    
                                    <!-- 주문 상품 (✅ order_items 제거, 아이콘으로 대체) -->
                                    <div class="order-products">
                                        <div class="order-product-icon">
                                            <i class="lni lni-package"></i>
                                        </div>
                                        <div class="order-product-info">
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
                                        <div class="order-info">
                                            <span class="text-muted">배송지: ${order.order_address}</span>
                                        </div>
                                        <div class="order-actions">
                                            <a href="/order/detail.do?order_id=${order.order_id}" 
                                               class="btn btn-sm btn-outline-primary">상세보기</a>
                                            <c:choose>
                                                <c:when test="${order.order_status == '결제대기'}">
                                                    <button class="btn btn-sm btn-primary" 
                                                            onclick="payOrder(${order.order_id})">결제하기</button>
                                                    <button class="btn btn-sm btn-outline-danger" 
                                                            onclick="cancelOrder(${order.order_id})">주문취소</button>
                                                </c:when>
                                                <c:when test="${order.order_status == '배송완료'}">
                                                    <a href="/post/review_form.do?order_id=${order.order_id}" 
                                                       class="btn btn-sm btn-primary">리뷰작성</a>
                                                </c:when>
                                                <c:when test="${order.order_status == '배송중'}">
                                                    <button class="btn btn-sm btn-outline-primary" 
                                                            onclick="trackShipping('${order.order_no}')">배송조회</button>
                                                </c:when>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- 푸터 포함 -->
    <%@include file="/WEB-INF/views/common/footer.jsp" %>
    
    <!-- JavaScript -->
    <script src="/assets/js/bootstrap.min.js"></script>
    <script src="/assets/js/tiny-slider.js"></script>
    <script src="/assets/js/glightbox.min.js"></script>
    <script src="/assets/js/main.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <script>
        // 필터 탭 기능
        $('.filter-tabs button').on('click', function() {
            $('.filter-tabs button').removeClass('active');
            $(this).addClass('active');
            
            var filter = $(this).data('filter');
            
            if (filter === 'all') {
                $('.order-card').show();
            } else {
                $('.order-card').hide();
                $('.order-card').each(function() {
                    var status = $(this).data('status');
                    if (filter === 'pending' && status === '결제대기') $(this).show();
                    if (filter === 'paid' && status === '결제완료') $(this).show();
                    if (filter === 'shipping' && status === '배송중') $(this).show();
                    if (filter === 'completed' && status === '배송완료') $(this).show();
                    if (filter === 'cancelled' && (status === '취소' || status === '반품')) $(this).show();
                });
            }
        });
        
        // 주문 취소
        function cancelOrder(orderId) {
            if (confirm('주문을 취소하시겠습니까?')) {
                $.ajax({
                    url: '/order/cancel.do',
                    type: 'POST',
                    data: { order_id: orderId },
                    success: function(response) {
                        if (response.result === 'success') {
                            alert('주문이 취소되었습니다.');
                            location.reload();
                        } else {
                            alert('주문 취소에 실패했습니다.');
                        }
                    },
                    error: function() {
                        alert('주문 취소 중 오류가 발생했습니다.');
                    }
                });
            }
        }
        
        // 결제하기
        function payOrder(orderId) {
            location.href = '/payment/pay.do?order_id=' + orderId;
        }
        
        // 배송 조회
        function trackShipping(orderNo) {
            window.open('/order/track.do?order_no=' + orderNo, 'shipping', 'width=600,height=700');
        }
    </script>
</body>
</html>
