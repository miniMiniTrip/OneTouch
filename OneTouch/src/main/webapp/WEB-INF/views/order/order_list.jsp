<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OneTouch - 주문내역</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/LineIcons.3.0.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/tiny-slider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/glightbox.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
        
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

        /* 컨테이너 */
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

        /* 레이아웃 */
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

        /* 메인 컨텐츠 */
        .section-card {
            background: white;
            border-radius: 12px;
            padding: 30px;
            margin-bottom: 20px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }

        /* 필터 탭 */
        .filter-tabs {
            display: flex;
            gap: 10px;
            margin-bottom: 24px;
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
            background: #1a237e;
            color: white;
            border-color: #1a237e;
        }

        /* 주문 카드 */
        .order-card {
            border: 1px solid #e0e0e0;
            border-radius: 12px;
            padding: 24px;
            margin-bottom: 16px;
            transition: all 0.3s;
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
            margin-bottom: 16px;
        }

        .order-icon {
            width: 80px;
            height: 80px;
            background: #f5f7fa;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }

        .order-icon svg {
            width: 40px;
            height: 40px;
            stroke: #1a237e;
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
            min-width: 120px;
        }

        .order-amount .price {
            font-size: 20px;
            font-weight: 600;
            color: #1a237e;
        }

        /* 주문 푸터 */
        .order-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-top: 16px;
            border-top: 1px solid #e9ecef;
        }

        .order-actions {
            display: flex;
            gap: 8px;
        }

        /* 버튼 */
        .btn {
            padding: 8px 16px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 500;
            border: none;
            cursor: pointer;
            transition: all 0.3s;
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

        .btn-primary {
            background: #1a237e;
            color: white;
        }

        .btn-primary:hover {
            background: #3949ab;
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

        /* 빈 주문내역 */
        .empty-orders {
            text-align: center;
            padding: 80px 20px;
        }

        .empty-orders svg {
            width: 80px;
            height: 80px;
            stroke: #ddd;
            margin-bottom: 24px;
        }

        .empty-orders h5 {
            color: #666;
            margin-bottom: 12px;
            font-size: 18px;
        }

        .empty-orders p {
            color: #999;
            margin-bottom: 24px;
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
    
    <div class="container">
        <h1 class="page-title">마이페이지</h1>
        <p class="page-subtitle">${user.mem_name}님, 안녕하세요!</p>

        <div class="mypage-layout">
            <!-- 사이드바 -->
            <aside class="sidebar">
                <ul class="sidebar-menu">
                    <li><a href="${pageContext.request.contextPath}/cart/list.do">장바구니</a></li>
                    <li><a href="${pageContext.request.contextPath}/wishlist/list.do">찜 목록</a></li>
                    <li><a href="${pageContext.request.contextPath}/order/list.do" class="active">주문내역</a></li>
                    <li><a href="${pageContext.request.contextPath}/review/list.do">내 리뷰</a></li>
                    <li><a href="${pageContext.request.contextPath}/qna/list.do">문의내역</a></li>
                    <li><a href="${pageContext.request.contextPath}/mypage/profile.do">회원정보</a></li>
                </ul>
            </aside>

            <!-- 메인 컨텐츠 -->
            <main class="main-content">
                <div class="section-card">
                    <h2 class="mb-4">주문내역</h2>
                    
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
                    <c:if test="${empty order_list}">
                        <div class="empty-orders">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M20.25 7.5l-.625 10.632a2.25 2.25 0 01-2.247 2.118H6.622a2.25 2.25 0 01-2.247-2.118L3.75 7.5M10 11.25h4M3.375 7.5h17.25c.621 0 1.125-.504 1.125-1.125v-1.5c0-.621-.504-1.125-1.125-1.125H3.375c-.621 0-1.125.504-1.125 1.125v1.5c0 .621.504 1.125 1.125 1.125z" />
                            </svg>
                            <h5>주문 내역이 없습니다</h5>
                            <p>원하는 상품을 장바구니에 담고 주문해보세요!</p>
                            <a href="${pageContext.request.contextPath}/product/list.do" class="btn btn-primary">쇼핑하러 가기</a>
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
                </div>
            </main>
        </div>
    </div>

    <!-- Footer Include -->
    <c:import url="../common/footer.jsp" />>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
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
    </script>
</body>
</html>
