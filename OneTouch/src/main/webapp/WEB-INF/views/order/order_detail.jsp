<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>주문 상세 - OneTouch</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="/assets/images/favicon.svg" />
    
    <!-- Web Font -->
    <link href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/assets/css/LineIcons.2.0.css" />
    <link rel="stylesheet" href="/assets/css/animate.css" />
    <link rel="stylesheet" href="/assets/css/tiny-slider.css" />
    <link rel="stylesheet" href="/assets/css/glightbox.min.css" />
    <link rel="stylesheet" href="/assets/css/main.css" />
    
    <style>
        .order-detail-section {
            padding: 40px 0;
            background: #f8f9fa;
        }
        .detail-card {
            background: #fff;
            border-radius: 10px;
            padding: 30px;
            margin-bottom: 20px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }
        .detail-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-bottom: 20px;
            border-bottom: 2px solid #5830E0;
            margin-bottom: 30px;
        }
        .detail-header h3 {
            font-size: 24px;
            margin: 0;
        }
        .order-status-badge {
            padding: 8px 20px;
            border-radius: 25px;
            font-weight: 500;
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
        .info-section {
            margin-bottom: 30px;
        }
        .info-title {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 15px;
            color: #333;
        }
        .info-table {
            width: 100%;
        }
        .info-table td {
            padding: 10px 0;
            vertical-align: top;
        }
        .info-table td:first-child {
            width: 150px;
            color: #666;
        }
        .info-table td:last-child {
            color: #333;
            font-weight: 500;
        }
        .product-list {
            border: 1px solid #e9ecef;
            border-radius: 8px;
            overflow: hidden;
        }
        .product-header {
            background: #f8f9fa;
            padding: 15px 20px;
            font-weight: 600;
            border-bottom: 1px solid #e9ecef;
        }
        .product-item {
            display: flex;
            align-items: center;
            padding: 20px;
            border-bottom: 1px solid #e9ecef;
        }
        .product-item:last-child {
            border-bottom: none;
        }
        .product-image {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 5px;
            margin-right: 20px;
        }
        .product-info {
            flex: 1;
        }
        .product-name {
            font-size: 16px;
            font-weight: 500;
            margin-bottom: 5px;
        }
        .product-detail {
            color: #666;
            font-size: 14px;
        }
        .product-price {
            text-align: right;
        }
        .product-price .price {
            font-size: 16px;
            font-weight: 600;
            color: #333;
        }
        .product-price .qty {
            font-size: 14px;
            color: #666;
            margin-top: 5px;
        }
        .payment-summary {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            margin-top: 20px;
        }
        .payment-summary-item {
            display: flex;
            justify-content: space-between;
            padding: 8px 0;
        }
        .payment-summary-item.total {
            margin-top: 10px;
            padding-top: 15px;
            border-top: 2px solid #dee2e6;
            font-size: 18px;
            font-weight: 600;
        }
        .action-buttons {
            display: flex;
            gap: 10px;
            justify-content: flex-end;
            margin-top: 20px;
        }
        .tracking-info {
            background: #e3f2fd;
            padding: 15px;
            border-radius: 5px;
            margin-top: 15px;
        }
        .tracking-info i {
            margin-right: 8px;
            color: #1976d2;
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
                        <h1 class="page-title">주문 상세</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/"><i class="lni lni-home"></i> Home</a></li>
                        <li><a href="/order/list.do">주문내역</a></li>
                        <li>주문 상세</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Order Detail Section -->
    <section class="order-detail-section">
        <div class="container">
            <div class="detail-card">
                <div class="detail-header">
                    <h3>주문 상세정보</h3>
                    <span class="order-status-badge 
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
                
                <!-- 주문 정보 -->
                <div class="info-section">
                    <h4 class="info-title">주문 정보</h4>
                    <table class="info-table">
                        <tr>
                            <td>주문번호</td>
                            <td>${order.order_no}</td>
                        </tr>
                        <tr>
                            <td>주문일시</td>
                            <td><fmt:formatDate value="${order.order_time}" pattern="yyyy년 MM월 dd일 HH:mm:ss"/></td>
                        </tr>
                        <tr>
                            <td>주문자명</td>
                            <td>${order.order_mem_name}</td>
                        </tr>
                        <tr>
                            <td>연락처</td>
                            <td>${order.order_phone}</td>
                        </tr>
                    </table>
                </div>
                
                <!-- 배송 정보 -->
                <div class="info-section">
                    <h4 class="info-title">배송 정보</h4>
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
                                (${order.order_postal}) ${order.order_address}
                                <c:if test="${not empty order.order_address_more}">
                                    <br>${order.order_address_more}
                                </c:if>
                            </td>
                        </tr>
                    </table>
                    
                    <c:if test="${order.order_status == '배송중' || order.order_status == '배송완료'}">
                        <div class="tracking-info">
                            <i class="lni lni-delivery"></i>
                            <strong>배송 추적:</strong>
                            <span>CJ대한통운 123456789</span>
                            <a href="#" class="btn btn-sm btn-primary ml-3">배송조회</a>
                        </div>
                    </c:if>
                </div>
                
                <!-- 주문 상품 -->
                <div class="info-section">
                    <h4 class="info-title">주문 상품</h4>
                    <div class="product-list">
                        <div class="product-header">
                            총 ${fn:length(order_items)}개 상품
                        </div>
                        <c:forEach var="item" items="${order_items}">
                            <div class="product-item">
                                <img src="${item.product_image_url}" alt="${item.product_name}" class="product-image">
                                <div class="product-info">
                                    <div class="product-name">
                                        <a href="/product/detail.do?product_idx=${item.product_idx}">
                                            ${item.product_name}
                                        </a>
                                    </div>
                                    <div class="product-detail">
                                        단가: <fmt:formatNumber value="${item.product_amount}" pattern="#,###"/>원
                                    </div>
                                </div>
                                <div class="product-price">
                                    <div class="price">
                                        <fmt:formatNumber value="${item.total_amount}" pattern="#,###"/>원
                                    </div>
                                    <div class="qty">수량: ${item.product_cnt}개</div>
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
                            <span class="text-danger">-0원</span>
                        </div>
                        <div class="payment-summary-item total">
                            <span>총 결제금액</span>
                            <span class="text-primary">
                                <fmt:formatNumber value="${order.total_amount}" pattern="#,###"/>원
                            </span>
                        </div>
                    </div>
                </div>
                
                <!-- 결제 정보 -->
                <c:if test="${not empty payment}">
                    <div class="info-section">
                        <h4 class="info-title">결제 정보</h4>
                        <table class="info-table">
                            <tr>
                                <td>결제수단</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${payment.method == 'card'}">신용카드</c:when>
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
                            <tr>
                                <td>결제일시</td>
                                <td><fmt:formatDate value="${payment.approved_at}" pattern="yyyy년 MM월 dd일 HH:mm:ss"/></td>
                            </tr>
                            <c:if test="${not empty payment.receipt_url}">
                                <tr>
                                    <td>영수증</td>
                                    <td>
                                        <a href="${payment.receipt_url}" target="_blank" class="btn btn-sm btn-outline-primary">
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
                    <a href="/order/list.do" class="btn btn-outline-secondary">목록으로</a>
                    
                    <c:choose>
                        <c:when test="${order.order_status == '결제대기'}">
                            <button class="btn btn-primary" onclick="payOrder(${order.order_id})">결제하기</button>
                            <button class="btn btn-danger" onclick="cancelOrder(${order.order_id})">주문취소</button>
                        </c:when>
                        <c:when test="${order.order_status == '결제완료'}">
                            <button class="btn btn-outline-danger" onclick="requestRefund(${order.order_id})">환불요청</button>
                        </c:when>
                        <c:when test="${order.order_status == '배송완료'}">
                            <a href="/post/review_form.do?order_id=${order.order_id}" class="btn btn-primary">리뷰작성</a>
                            <button class="btn btn-outline-secondary" onclick="requestReturn(${order.order_id})">반품요청</button>
                        </c:when>
                    </c:choose>
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
        function payOrder(orderId) {
            location.href = '/payment/pay.do?order_id=' + orderId;
        }
        
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
                    }
                });
            }
        }
        
        function requestRefund(orderId) {
            if (confirm('환불을 요청하시겠습니까?')) {
                // 환불 요청 처리
                alert('환불 요청이 접수되었습니다.\n고객센터에서 연락드리겠습니다.');
            }
        }
        
        function requestReturn(orderId) {
            if (confirm('반품을 요청하시겠습니까?')) {
                // 반품 요청 처리
                alert('반품 요청이 접수되었습니다.\n고객센터에서 연락드리겠습니다.');
            }
        }
    </script>
</body>
</html>