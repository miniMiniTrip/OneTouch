<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>장바구니 - OneTouch</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="/assets/images/favicon.svg" />
    
    <!-- Web Font -->
    <link href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/LineIcons.3.0.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/tiny-slider.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/glightbox.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
    
    <style>
        .shopping-cart {
            padding: 40px 0;
        }
        .cart-list-head {
            border-bottom: 1px solid #e9e9e9;
            padding-bottom: 15px;
            margin-bottom: 25px;
            padding-left: 20px;
            padding-right: 20px;
        }
        .cart-list-head h6 {
            font-size: 16px;
            font-weight: 600;
            color: #333;
        }
        .cart-single-list {
            padding: 20px;
            background: #fff;
            margin-bottom: 20px;
            border: 1px solid #e9e9e9;
            border-radius: 5px;
        }
        .product-image img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 5px;
        }
        .qty-container {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .qty-container input {
            width: 60px;
            text-align: center;
            border: 1px solid #ddd;
            padding: 5px;
            border-radius: 3px;
        }
        .qty-increase, .qty-decrease{
			width: 25px;
			height: 25px;
			text-align: center;        
        }
        .remove-item{
        	width: 60px;
        	height: 30px;
        }
        .total-amount {
            background: #f7f7f7;
            padding: 30px;
            border-radius: 5px;
        }
        .checkbox-style {
            position: relative;
            display: inline-block;
        }
        .checkbox-style input {
            width: 18px;
            height: 18px;
            cursor: pointer;
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
                        <h1 class="page-title">장바구니</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/"><i class="lni lni-home"></i> Home</a></li>
                        <li>장바구니</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Shopping Cart -->
    <div class="shopping-cart section">
        <div class="container">
            <form id="cartForm" action="/order/cart_form.do" method="post">
                <div class="cart-list-head" style="padding-left: 0; padding-right: 0;">
                    <div class="row">
                        <div class="col-lg-1 col-md-1 col-12">
                            <div class="checkbox-style">
                                <input type="checkbox" id="checkAll" checked>
                                <label for="checkAll"></label>
                            </div>
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
                
                <c:if test="${empty cart_list}">
                    <div class="text-center py-5">
                        <i class="lni lni-cart" style="font-size: 60px; color: #ddd;"></i>
                        <h4 class="mt-3">장바구니가 비어있습니다</h4>
                        <p>원하는 상품을 장바구니에 담아보세요!</p>
                        <a href="/product/list.do" class="btn btn-primary mt-3">쇼핑 계속하기</a>
                    </div>
                </c:if>
                
                <c:forEach var="cart" items="${cart_list}">
                    <div class="cart-single-list" style="padding: 20px 0;">
                        <div class="row align-items-center">
                            <div class="col-lg-1 col-md-1 col-12">
                                <div class="checkbox-style">
                                    <input type="checkbox" name="cart_id" value="${cart.cart_id}" class="cart-check" checked>
                                </div>
                            </div>
							<div class="col-lg-2 col-md-2 col-12">
							    <div class="product-image">
							        <a href="/product/detail.do?product_idx=${cart.product_idx}">
							            <c:choose>
							                <c:when test="${not empty cart.product_image_url}">
							                    <img src="${pageContext.request.contextPath}/images/${cart.product_image_url}" 
							                         alt="${cart.product_name}"
							                         onerror="this.src='${pageContext.request.contextPath}/images/no-image.png'">
							                </c:when>
							                <c:otherwise>
							                    <img src="${pageContext.request.contextPath}/images/no-image.png" 
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
                                    <i class="lni lni-trash"></i>삭제
                                </button>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </form>
            
            <c:if test="${not empty cart_list}">
                <div class="row">
                    <div class="col-12">
                        <!-- Total Amount -->
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
        </div>
    </div>
    
    <!-- 푸터 포함 -->
    <%@include file="/WEB-INF/views/common/footer.jsp" %>
    
    <!-- JavaScript -->
    <script src="/assets/js/bootstrap.min.js"></script>
    <script src="/assets/js/tiny-slider.js"></script>
    <script src="/assets/js/glightbox.min.js"></script>
    <script src="/assets/js/main.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <script>
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