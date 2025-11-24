<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>장바구니 - OneTouch</title>
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
.cart-section {
    padding: 0;
    background-color: #fff;
    min-height: calc(100vh - 400px);
}

.cart-container {
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
}

.menu-item:hover {
    background: #f0f0f0;
    padding-left: 35px;
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

/* ==================== 장바구니 테이블 헤더 ==================== */
.cart-list-head {
    background: #f8f9fa;
    border-radius: 8px 8px 0 0;
    padding: 20px 30px;
    margin-bottom: 0;
    box-shadow: 0 2px 4px rgba(0,0,0,0.05);
}

.cart-list-head .row > div {
    display: flex;
    align-items: center;
    justify-content: center;
}

.cart-list-head h6 {
    font-size: 14px;
    font-weight: 600;
    color: #495057;
    margin: 0;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

/* ==================== 장바구니 아이템 ==================== */
.cart-single-list {
    padding: 25px 30px !important;
    background: #fff;
    margin-bottom: 2px;
    border: none;
    border-radius: 0;
    transition: all 0.3s;
}

.cart-single-list:last-child {
    border-radius: 0 0 8px 8px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.05);
}

.cart-single-list:hover {
    background: #f8f9fa;
    transform: translateX(5px);
}

/* 행 정렬 - 높이 통일 */
.cart-single-list .row {
    align-items: center;
    min-height: 120px;
}

.cart-single-list .row > div {
    display: flex;
    align-items: center;
    justify-content: center;
}

.cart-single-list .row > div:nth-child(3) {
    justify-content: flex-start;
}

/* ==================== 상품 이미지 ==================== */
.product-image {
    position: relative;
    overflow: hidden;
    border-radius: 8px;
    background: #f5f5f5;
    width: 100px;
    height: 100px;
}

.product-image img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    display: block;
    border-radius: 8px;
    transition: transform 0.3s;
}

.product-image:hover img {
    transform: scale(1.05);
}

/* ==================== 상품명 ==================== */
.cart-single-list h5 {
    font-size: 16px;
    font-weight: 600;
    margin: 0;
    line-height: 1.4;
}

.cart-single-list h5 a {
    color: #212529;
    text-decoration: none;
    transition: color 0.3s;
}

.cart-single-list h5 a:hover {
    color: #5c6bc0;
}

/* ==================== 가격 ==================== */
.price {
    font-size: 16px;
    font-weight: 600;
    color: #212529;
}

/* ==================== 체크박스 스타일 ==================== */
.checkbox-style {
    position: relative;
    display: inline-block;
}

.checkbox-style input[type="checkbox"] {
    width: 20px;
    height: 20px;
    cursor: pointer;
    accent-color: #5c6bc0;
}

/* ==================== 수량 조절 ==================== */
.qty-container {
    display: inline-flex;
    align-items: center;
    gap: 0;
    border: 1px solid #dee2e6;
    border-radius: 6px;
    overflow: hidden;
    background: #fff;
}

.qty-decrease,
.qty-increase {
    width: 36px;
    height: 36px;
    border: none;
    background: #f8f9fa;
    color: #495057;
    font-size: 18px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.2s;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 0;
}

.qty-decrease:hover,
.qty-increase:hover {
    background: #e9ecef;
    color: #212529;
}

.qty-decrease:active,
.qty-increase:active {
    background: #dee2e6;
}

.qty-input {
    width: 50px;
    height: 36px;
    text-align: center;
    border: none;
    border-left: 1px solid #dee2e6;
    border-right: 1px solid #dee2e6;
    padding: 0;
    font-size: 14px;
    font-weight: 600;
    color: #212529;
    background: #fff;
}

.qty-input:focus {
    outline: none;
    background: #f8f9fa;
}

/* ==================== 소계 ==================== */
.subtotal {
    font-size: 16px;
    font-weight: 700;
    color: #5c6bc0;
}

/* ==================== 삭제 버튼 ==================== */
.remove-item {
    width: 36px;
    height: 36px;
    border: 1px solid #dc3545;
    background: #fff;
    color: #dc3545;
    border-radius: 6px;
    cursor: pointer;
    transition: all 0.3s;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    padding: 0;
}

.remove-item i {
    font-size: 16px;
}

.remove-item:hover {
    background: #dc3545;
    color: #fff;
    transform: scale(1.05);
}

/* ==================== 총 금액 영역 ==================== */
.total-amount {
    padding: 30px;
    background: #fff;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.05);
    margin-top: 30px;
}

.total-amount .left {
    display: flex;
    gap: 10px;
}

.total-amount .right ul {
    list-style: none;
    padding: 0;
    margin: 0 0 20px 0;
}

.total-amount .right ul li {
    display: flex;
    justify-content: space-between;
    padding: 12px 0;
    font-size: 15px;
    border-bottom: 1px solid #e9ecef;
}

.total-amount .right ul li.last {
    border-bottom: 2px solid #5c6bc0;
    font-size: 18px;
    font-weight: 700;
    color: #333;
    padding-top: 20px;
}

.total-amount .right ul li.last span {
    color: #5c6bc0;
    font-size: 20px;
}

.total-amount .button .btn {
    width: 100%;
    background: #5c6bc0;
    color: white;
    padding: 15px;
    border: none;
    border-radius: 6px;
    font-size: 16px;
    font-weight: 600;
    transition: all 0.3s;
}

.total-amount .button .btn:hover {
    background: #4a5aaf;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(92, 107, 192, 0.3);
}

/* ==================== 빈 장바구니 ==================== */
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

/* ==================== 반응형 ==================== */
@media (max-width: 1200px) {
    .content {
        padding: 40px 40px;
    }
}

@media (max-width: 992px) {
    .cart-container {
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

    <!-- Start Cart Section -->
    <section class="cart-section">
        <div class="container">
            <div class="cart-container">
                <!-- Sidebar -->
               <!--  <div class="sidebar">
                    
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
                </div> -->
                 <!-- 사이드바 인크루드 -->
                  <%@include file="/WEB-INF/views/common/mypage_side_bar.jsp" %>
                 
                <!-- Content -->
                <div class="content">
                    
                    <!-- 장바구니에 상품이 있는 경우 -->
                    <c:if test="${not empty cart_list}">
                        <form id="cartForm" method="post" action="/order/cart_form.do">
                            <!-- 장바구니 헤더 -->
                            <div class="cart-list-head">
                                <div class="row align-items-center">
                                    <div class="col-lg-1 col-md-1 col-12">
                                        <h6>
                                            <input type="checkbox" id="checkAll" checked>
                                        </h6>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-12">
                                        <h6>상품이미지</h6>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-12">
                                        <h6>상품명</h6>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-12">
                                        <h6>가격</h6>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-12">
                                        <h6>수량</h6>
                                    </div>
                                    <div class="col-lg-1 col-md-1 col-12">
                                        <h6>소계</h6>
                                    </div>
                                    <div class="col-lg-1 col-md-1 col-12">
                                        <h6>삭제</h6>
                                    </div>
                                </div>
                            </div>

                            <!-- 장바구니 아이템 목록 -->
                            <c:forEach var="cart" items="${cart_list}">
                                <div class="cart-single-list">
                                    <div class="row align-items-center">
                                        <div class="col-lg-1 col-md-1 col-12">
                                            <div class="checkbox-style">
                                                <input type="checkbox" class="cart-check" name="cart_id" value="${cart.cart_id}" checked>
                                            </div>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <div class="product-image">
                                                <a href="/product/detail.do?product_idx=${cart.product_idx}">
                                                    <c:choose>
                                                        <c:when test="${not empty cart.product_image_url}">
                                                            <img src="${pageContext.request.contextPath}/images/${cart.product_image_url}" 
                                                                 alt="${cart.product_name}"
                                                                 onerror="this.src='${pageContext.request.contextPath}/images/default.png'">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <img src="${pageContext.request.contextPath}/images/default.png" 
                                                                 alt="이미지 없음">
                                                        </c:otherwise>
                                                    </c:choose>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-12">
                                            <h5>
                                                <a href="/product/detail.do?product_idx=${cart.product_idx}">
                                                    ${cart.product_name}
                                                </a>
                                            </h5>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <span class="price" data-price="${cart.product_price}">
                                                <fmt:formatNumber value="${cart.product_price}" pattern="#,###"/>원
                                            </span>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-12">
                                            <div class="qty-container">
                                                <button type="button" class="qty-decrease" data-cart-id="${cart.cart_id}">-</button>
                                                <input type="number" class="qty-input" value="${cart.cart_cnt}" 
                                                       data-cart-id="${cart.cart_id}" data-mem-idx="${cart.mem_idx}" min="1" max="99">
                                                <button type="button" class="qty-increase" data-cart-id="${cart.cart_id}">+</button>
                                            </div>
                                        </div>
                                        <div class="col-lg-1 col-md-1 col-12">
                                            <span class="subtotal" data-cart-id="${cart.cart_id}">
                                                <fmt:formatNumber value="${cart.total_amount}" pattern="#,###"/>원
                                            </span>
                                        </div>
                                        <div class="col-lg-1 col-md-1 col-12">
                                            <button type="button" class="remove-item" data-cart-id="${cart.cart_id}" data-mem-idx="${cart.mem_idx}">
                                                <i class="lni lni-trash"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </form>
                        
                        <!-- 총 금액 -->
                        <div class="row">
                            <div class="col-12">
                                <div class="total-amount">
                                    <div class="row">
                                        <div class="col-lg-8 col-md-6 col-12">
                                            <div class="left">
                                                <button type="button" class="btn btn-outline-secondary" onclick="deleteSelected()">
                                                    선택삭제
                                                </button>
                                                <button type="button" class="btn btn-outline-secondary ml-2" onclick="location.href='/product/list.do'">
                                                    계속 쇼핑하기
                                                </button>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-12">
                                            <div class="right">
                                                <ul>
                                                    <li>상품 합계
                                                        <span id="subtotal-amount">
                                                            <fmt:formatNumber value="${total_amount}" pattern="#,###"/>원
                                                        </span>
                                                    </li>
                                                    <li>배송비<span>무료</span></li>
                                                    <li class="last">총 결제금액
                                                        <span id="total-amount">
                                                            <fmt:formatNumber value="${total_amount}" pattern="#,###"/>원
                                                        </span>
                                                    </li>
                                                </ul>
                                                <div class="button">
                                                    <button type="button" class="btn" onclick="proceedToCheckout()">주문하기</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                    
                    <!-- 장바구니가 비어있는 경우 -->
                    <c:if test="${empty cart_list}">
                        <div class="empty-state">
                            <i class="lni lni-cart"></i>
                            <h4>장바구니가 비어있습니다</h4>
                            <p>원하시는 상품을 장바구니에 담아보세요!</p>
                            <button class="btn" onclick="location.href='/product/list'">
                                쇼핑 계속하기
                            </button>
                        </div>
                    </c:if>
                    
                </div>
            </div>
        </div>
    </section>
    <!-- End Cart Section -->
    <c:import url="../common/footer.jsp" />

    <%@include file="/WEB-INF/views/common/footer.jsp" %>
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
    </script>
    
</body>
</html>
