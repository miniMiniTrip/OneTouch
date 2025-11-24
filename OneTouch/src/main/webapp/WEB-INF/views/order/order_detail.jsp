<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OneTouch - 주문 상세</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Malgun Gothic', 'Apple SD Gothic Neo', sans-serif;
            background: #f5f7fa;
            color: #333;
        }

        .container {
            max-width: 1400px;
            margin: 40px auto;
            padding: 0 40px;
        }

        .page-title {
            font-size: 32px;
            font-weight: bold;
            color: #1a237e;
            margin-bottom: 10px;
        }

        .page-subtitle {
            color: #666;
            font-size: 16px;
            margin-bottom: 40px;
        }

        .mypage-layout {
            display: grid;
            grid-template-columns: 250px 1fr;
            gap: 30px;
        }

        /* 사이드바 */
        .sidebar {
            background: white;
            border-radius: 12px;
            padding: 30px 0;
            height: fit-content;
            position: sticky;
            top: 20px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }

        .sidebar-menu {
            list-style: none;
        }

        .sidebar-menu a {
            display: block;
            padding: 14px 24px;
            color: #666;
            text-decoration: none;
            font-size: 15px;
            transition: all 0.3s;
            border-left: 3px solid transparent;
        }

        .sidebar-menu a:hover {
            background: #f5f7fa;
            color: #1a237e;
        }

        .sidebar-menu a.active {
            background: #e8eaf6;
            color: #1a237e;
            font-weight: 600;
            border-left-color: #1a237e;
        }

        /* 섹션 카드 */
        .section-card {
            background: white;
            border-radius: 12px;
            padding: 30px;
            margin-bottom: 20px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-bottom: 20px;
            border-bottom: 2px solid #1a237e;
            margin-bottom: 24px;
        }

        .section-header h2 {
            font-size: 24px;
            color: #1a237e;
            margin: 0;
        }

        .order-status-badge {
            padding: 8px 20px;
            border-radius: 20px;
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

        /* 정보 테이블 */
        .info-table {
            width: 100%;
            margin-bottom: 24px;
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
        }

        .info-table td:last-child {
            color: #333;
            font-weight: 500;
        }

        /* 상품 리스트 */
        .product-list {
            border: 1px solid #e0e0e0;
            border-radius: 12px;
            overflow: hidden;
            margin-top: 16px;
        }

        .product-header {
            background: #f8f9fa;
            padding: 16px 20px;
            font-weight: 600;
            border-bottom: 1px solid #e0e0e0;
        }

        .product-item {
            display: flex;
            gap: 20px;
            padding: 24px;
            border-bottom: 1px solid #f0f0f0;
        }

        .product-item:last-child {
            border-bottom: none;
        }

        .product-image {
            width: 100px;
            height: 100px;
            border-radius: 8px;
            overflow: hidden;
            flex-shrink: 0;
            background: #f5f7fa;
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
        }

        .product-name {
            font-size: 16px;
            font-weight: 600;
            margin-bottom: 8px;
        }

        .product-name a {
            color: #333;
            text-decoration: none;
        }

        .product-name a:hover {
            color: #1a237e;
        }

        .product-detail {
            color: #666;
            font-size: 14px;
        }

        .product-price {
            text-align: right;
            min-width: 120px;
        }

        .product-price .price {
            font-size: 18px;
            font-weight: 600;
            color: #1a237e;
        }

        .product-price .qty {
            font-size: 14px;
            color: #666;
            margin-top: 4px;
        }

        /* 결제 요약 */
        .payment-summary {
            background: #f8f9fa;
            border-radius: 12px;
            padding: 24px;
            margin-top: 24px;
        }

        .payment-summary-item {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            font-size: 15px;
        }

        .payment-summary-item.total {
            margin-top: 12px;
            padding-top: 16px;
            border-top: 2px solid #dee2e6;
            font-size: 18px;
            font-weight: 600;
        }

        /* 배송 추적 */
        .tracking-info {
            background: #e3f2fd;
            padding: 16px;
            border-radius: 8px;
            margin-top: 16px;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .tracking-info svg {
            width: 24px;
            height: 24px;
            stroke: #1976d2;
        }

        /* 액션 버튼 */
        .action-buttons {
            display: flex;
            gap: 10px;
            justify-content: flex-end;
            margin-top: 24px;
        }

        .btn {
            padding: 10px 20px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 500;
            border: none;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-block;
        }

        .btn-outline-secondary {
            background: white;
            color: #666;
            border: 1px solid #ddd;
        }

        .btn-outline-secondary:hover {
            background: #f5f7fa;
        }

        .btn-primary {
            background: #1a237e;
            color: white;
        }

        .btn-primary:hover {
            background: #3949ab;
        }

        .btn-danger {
            background: #dc3545;
            color: white;
        }

        .btn-danger:hover {
            background: #c82333;
        }

        .btn-outline-danger {
            background: white;
            color: #dc3545;
            border: 1px solid #dc3545;
        }

        .btn-outline-danger:hover {
            background: #dc3545;
            color: white;
        }

        .btn-outline-primary {
            background: white;
            color: #1a237e;
            border: 1px solid #1a237e;
        }

        .btn-outline-primary:hover {
            background: #1a237e;
            color: white;
        }
    </style>
</head>
<body>
   <!-- Start Header Area -->
   <c:import url="../common/header.jsp" />
   <!-- End Header Area -->
    
   <!-- Start Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">장바구니</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="${pageContext.request.contextPath}/"><i class="lni lni-home"></i> 홈</a></li>
                        <li>마이페이지</li>
                        <li>장바구니</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->
    <section class="cart-section">
        <div class="container">
            <div class="cart-container">
                <!-- Sidebar -->
                <div class="sidebar">
                    
                    <div class="menu-section">
                        <div class="menu-item active">🛒 장바구니</div>
                        <div class="menu-item">💝 찜</div>
                        <div class="menu-item">🎯 주문/배송 조회</div>
                    </div>
                    
                    <div class="menu-section">
                        <div class="menu-title">나의 활동</div>
                        <div class="menu-item">💬 상품 Q&A</div>
                    </div>
                    
                    <div class="menu-section">
                        <div class="menu-title">회원 정보</div>
                        <div class="menu-item">👥 회원정보 수정</div>
                        <div class="menu-item">🔒 배송지 관리</div>
                        <div class="menu-item">📧 알림톡신청 관리</div>
                    </div>
                    
                    <div class="menu-section">
                        <div class="menu-item">📝 로그아웃</div>
                    </div>
                </div>


            <!-- 메인 컨텐츠 -->
            <main class="main-content">
                <!-- 주문 정보 -->
                <div class="section-card">
                    <div class="section-header">
                        <h2>주문 정보</h2>
                        <span class="order-status-badge 
                            <c:choose>
                                <c:when test="${order.order_status == '결제대기'}">status-pending</c:when>
                                <c:when test="${order.order_status == '결제완료'}">status-paid</c:when>
                                <c:when test="${order.order_status == '배송중'}">status-shipping</c:when>
                                <c:when test="${order.order_status == '배송완료'}">status-completed</c:when>
                            </c:choose>
                        ">
                            ${order.order_status}
                        </span>
                    </div>
                    
                    <table class="info-table">
                        <tr>
                            <td>주문번호</td>
                            <td>${order.order_no}</td>
                        </tr>
                        <tr>
                            <td>주문일시</td>
                            <td><fmt:formatDate value="${order.order_time}" pattern="yyyy년 MM월 dd일 HH:mm"/></td>
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
                <div class="section-card">
                    <h3 class="mb-3" style="font-size: 18px; font-weight: 600;">배송 정보</h3>
                    
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
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M8.25 18.75a1.5 1.5 0 01-3 0m3 0a1.5 1.5 0 00-3 0m3 0h6m-9 0H3.375a1.125 1.125 0 01-1.125-1.125V14.25m17.25 4.5a1.5 1.5 0 01-3 0m3 0a1.5 1.5 0 00-3 0m3 0h1.125c.621 0 1.125-.504 1.125-1.125v-11.25c0-.621-.504-1.125-1.125-1.125H3.375c-.621 0-1.125.504-1.125 1.125v11.25c0 .621.504 1.125 1.125 1.125M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                            </svg>
                            <strong>배송 추적:</strong>
                            <span>CJ대한통운 123456789</span>
                            <button class="btn btn-outline-primary btn-sm" style="margin-left: auto; padding: 6px 12px;">배송조회</button>
                        </div>
                    </c:if>
                </div>
                
                <!-- 주문 상품 -->
                <div class="section-card">
                    <h3 class="mb-3" style="font-size: 18px; font-weight: 600;">주문 상품</h3>
                    
                    <div class="product-list">
                        <div class="product-header">
                            총 ${fn:length(order_items)}개 상품
                        </div>
                        
                        <c:forEach var="item" items="${order_items}">
                            <div class="product-item">
                                <c:choose>
                                    <c:when test="${not empty item.product_image_url}">
                                        <div class="product-image">
                                            <img src="${pageContext.request.contextPath}/images/${item.product_image_url}" 
                                                 alt="${item.product_name}">
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="product-image no-image">
                                            이미지 없음
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                                
                                <div class="product-info">
                                    <div class="product-name">
                                        <a href="${pageContext.request.contextPath}/product/detail.do?product_idx=${item.product_idx}">
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
                            <span style="color: #1a237e;">
                                <fmt:formatNumber value="${order.total_amount}" pattern="#,###"/>원
                            </span>
                        </div>
                    </div>
                </div>
                
                <!-- 결제 정보 -->
                <c:if test="${not empty payment}">
                    <div class="section-card">
                        <h3 class="mb-3" style="font-size: 18px; font-weight: 600;">결제 정보</h3>
                        
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
                                        <a href="${payment.receipt_url}" target="_blank" class="btn btn-outline-primary btn-sm" style="padding: 6px 12px;">
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
                    <a href="${pageContext.request.contextPath}/order/list.do" class="btn btn-outline-secondary">목록으로</a>
                    
                    <c:choose>
                        <c:when test="${order.order_status == '결제대기'}">
                            <button class="btn btn-primary" onclick="payOrder(${order.order_id})">결제하기</button>
                            <button class="btn btn-danger" onclick="cancelOrder(${order.order_id})">주문취소</button>
                        </c:when>
                        <c:when test="${order.order_status == '결제완료'}">
                            <button class="btn btn-outline-danger" onclick="requestRefund(${order.order_id})">환불요청</button>
                        </c:when>
                        <c:when test="${order.order_status == '배송완료'}">
                            <a href="${pageContext.request.contextPath}/review/write.do?order_id=${order.order_id}" class="btn btn-primary">리뷰작성</a>
                            <button class="btn btn-outline-secondary" onclick="requestReturn(${order.order_id})">반품요청</button>
                        </c:when>
                    </c:choose>
                </div>
            </main>
        </div>
    </div>
</section>
    <!-- Footer Include -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/tiny-slider.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/glightbox.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
    
    <script type="text/javascript">
    // 전체 선택/해제
    $('#checkAll').on('change', function() {
        $('.cart-check').prop('checked', $(this).prop('checked'));
        updateTotalAmount();
    });
    
    // 개별 체크박스 변경
    $('.cart-check').on('change', function() {
        updateTotalAmount();
    });
    
    // 수량 증가
    $('.qty-increase').on('click', function() {
        let cartId = $(this).data('cart-id');
        let input = $('.qty-input[data-cart-id="' + cartId + '"]');
        let currentVal = parseInt(input.val());
        if (currentVal < 99) {
            input.val(currentVal + 1);
            updateCart(cartId, currentVal + 1);
        }
    });
    
    // 수량 감소
    $('.qty-decrease').on('click', function() {
        let cartId = $(this).data('cart-id');
        let input = $('.qty-input[data-cart-id="' + cartId + '"]');
        let currentVal = parseInt(input.val());
        if (currentVal > 1) {
            input.val(currentVal - 1);
            updateCart(cartId, currentVal - 1);
        }
    });
    
    // 수량 직접 입력
    $('.qty-input').on('change', function() {
        let cartId = $(this).data('cart-id');
        let qty = parseInt($(this).val());
        if (qty < 1) qty = 1;
        if (qty > 99) qty = 99;
        $(this).val(qty);
        updateCart(cartId, qty);
    });
    
    // 장바구니 수량 업데이트
    function updateCart(cartId, qty) {
        let memIdx = $('.qty-input[data-cart-id="' + cartId + '"]').data('mem-idx');
        
        $.ajax({
            url: '/cart/modify.do',
            type: 'POST',
            data: {
                cart_id: cartId,
                cart_cnt: qty,
                mem_idx: memIdx
            },
            success: function(response) {
                location.reload();
            }
        });
    }
    
    // 개별 삭제
    $('.remove-item').on('click', function() {
        if (confirm('상품을 삭제하시겠습니까?')) {
            let cartId = $(this).data('cart-id');
            let memIdx = $(this).data('mem-idx');
            
            $.ajax({
                url: '/cart/delete.do',
                type: 'POST',
                data: {
                    cart_id: cartId,
                    mem_idx: memIdx
                },
                success: function() {
                    location.reload();
                }
            });
        }
    });
    
    // 선택 삭제
    function deleteSelected() {
        let selected = $('.cart-check:checked');
        if (selected.length === 0) {
            alert('삭제할 상품을 선택해주세요.');
            return;
        }
        
        if (confirm('선택한 상품을 삭제하시겠습니까?')) {
            selected.each(function() {
                let cartId = $(this).val();
                let memIdx = $('.qty-input[data-cart-id="' + cartId + '"]').data('mem-idx');
                
                $.ajax({
                    url: '/cart/delete.do',
                    type: 'POST',
                    data: {
                        cart_id: cartId,
                        mem_idx: memIdx
                    }
                });
            });
            
            setTimeout(function() {
                location.reload();
            }, 500);
        }
    }
    
    // 총 금액 업데이트
    function updateTotalAmount() {
        let total = 0;
        $('.cart-check:checked').each(function() {
            let cartId = $(this).val();
            let subtotal = parseInt($('.subtotal[data-cart-id="' + cartId + '"]').text().replace(/[^0-9]/g, ''));
            total += subtotal;
        });
        
        $('#subtotal-amount').text(total.toLocaleString() + '원');
        $('#total-amount').text(total.toLocaleString() + '원');
    }
    
    // 주문하기
	function proceedToCheckout() {
	    let selected = $('.cart-check:checked');
	    if (selected.length === 0) {
	        alert('주문할 상품을 선택해주세요.');
	        return;
	    }

	    console.log("Selected items:", selected.length);
	    selected.each(function() {
	        console.log("cart_id:", $(this).val());
	    });
	    
	    $('#cartForm').submit(); 
	}
    
/* 	function payOrder(orderId) {
	    location.href = '${pageContext.request.contextPath}/order/repay_form.do?order_id=' + orderId;
	} */
    </script>
    
</body>
</html>

</body>
</html>
