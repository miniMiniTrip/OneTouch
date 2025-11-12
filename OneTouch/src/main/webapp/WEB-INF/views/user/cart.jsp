<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OneTouch - 장바구니</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- 기존 스타일 유지 -->
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

        /* 장바구니 */
        .section-card {
            background: white;
            border-radius: 12px;
            padding: 30px;
            margin-bottom: 20px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }

        .cart-item {
            display: flex;
            gap: 20px;
            padding: 24px;
            border: 1px solid #e0e0e0;
            border-radius: 12px;
            margin-bottom: 16px;
            transition: all 0.3s;
        }

        .cart-item:hover {
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
        }

        .cart-checkbox {
            display: flex;
            align-items: center;
        }

        .cart-checkbox input[type="checkbox"] {
            width: 20px;
            height: 20px;
            cursor: pointer;
        }

        .cart-image {
            width: 120px;
            height: 120px;
            border-radius: 8px;
            overflow: hidden;
            flex-shrink: 0;
        }

        .cart-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .cart-info {
            flex: 1;
        }

        .cart-product-name {
            font-size: 18px;
            font-weight: 600;
            color: #333;
            margin-bottom: 12px;
        }

        .quantity-control {
            display: flex;
            border: 1px solid #e0e0e0;
            border-radius: 6px;
            overflow: hidden;
            width: fit-content;
        }

        .quantity-btn {
            width: 32px;
            height: 32px;
            background: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
        }

        .quantity-input {
            width: 50px;
            text-align: center;
            border: none;
            border-left: 1px solid #e0e0e0;
            border-right: 1px solid #e0e0e0;
        }

        .cart-price {
            text-align: right;
            min-width: 120px;
        }

        .order-summary {
            background: #f8f9fa;
            border-radius: 12px;
            padding: 24px;
            position: sticky;
            top: 20px;
        }

        .btn-primary {
            background: #1a237e;
            border: none;
            padding: 12px 24px;
            border-radius: 8px;
            font-weight: 600;
        }

        .btn-primary:hover {
            background: #3949ab;
        }
    </style>
</head>
<body>
    <!-- Header Include -->
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <div class="container">
        <h1 class="page-title">마이페이지</h1>
        <p class="page-subtitle">${sessionScope.mem_name}님, 안녕하세요!</p>

        <div class="mypage-layout">
            <!-- 사이드바 -->
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

            <!-- 메인 컨텐츠 -->
            <main class="main-content">
                <div class="section-card">
                    <h2 class="mb-4">장바구니</h2>
                    
                    <!-- 전체 선택 -->
                    <div class="mb-3">
                        <label>
                            <input type="checkbox" id="selectAll" onchange="toggleSelectAll()">
                            <span class="ms-2">전체 선택</span>
                        </label>
                        <button type="button" class="btn btn-sm btn-outline-danger float-end" onclick="deleteSelected()">
                            선택 삭제
                        </button>
                    </div>

                    <!-- 장바구니 아이템 -->
                    <c:if test="${empty cart_list}">
                            <div class="text-center py-5">
                                <p class="text-muted">장바구니가 비어있습니다.</p>
                                <a href="${pageContext.request.contextPath}/product/list" class="btn btn-primary mt-3">
                                    쇼핑 계속하기
                                </a>
                            </div>
                    </c:if>
                            <form id="cart_form" method="post">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                
                                <c:forEach var="cart" items="${cartList}">
                                    <div class="cart-item" data-cart-id="${cart.cartId}">
                                        <div class="cart-checkbox">
                                            <input type="checkbox" name="cartIds" value="${cart.cartId}" 
                                                   class="cart-select" onchange="updateTotal()">
                                        </div>
                                        
                                        <div class="cart-image">
                                            <img src="${cart.productImage}" alt="${cart.productName}" 
                                                 onerror="this.src='${pageContext.request.contextPath}/resources/img/no-image.jpg'">
                                        </div>
                                        
                                        <div class="cart-info">
                                            <div class="cart-product-name">
                                                <a href="${pageContext.request.contextPath}/product/detail/${cart.productIdx}">
                                                    ${cart.productName}
                                                </a>
                                            </div>
                                            <div class="text-muted mb-3">${cart.productBrand}</div>
                                            
                                            <div class="quantity-control">
                                                <button type="button" class="quantity-btn" onclick="updateQuantity(${cart.cartId}, -1)">-</button>
                                                <input type="text" class="quantity-input" id="qty_${cart.cartId}" 
                                                       value="${cart.cartCnt}" readonly>
                                                <button type="button" class="quantity-btn" onclick="updateQuantity(${cart.cartId}, 1)">+</button>
                                            </div>
                                        </div>
                                        
                                        <div class="cart-price">
                                            <div class="text-muted text-decoration-line-through mb-1">
                                                <fmt:formatNumber value="${cart.productPrice}" pattern="#,###"/>원
                                            </div>
                                            <div class="fw-bold fs-5" id="price_${cart.cartId}">
                                                <fmt:formatNumber value="${cart.productPrice * cart.cartCnt}" pattern="#,###"/>원
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </form>
                </div>

                <!-- 주문 요약 -->
                <c:if test="${not empty cartList}">
                    <div class="order-summary">
                        <h3 class="mb-3">주문 요약</h3>
                        <div class="d-flex justify-content-between mb-2">
                            <span>상품 금액</span>
                            <span id="subtotal">0원</span>
                        </div>
                        <div class="d-flex justify-content-between mb-2">
                            <span>배송비</span>
                            <span id="shipping">3,000원</span>
                        </div>
                        <hr>
                        <div class="d-flex justify-content-between mb-4">
                            <strong>총 결제 금액</strong>
                            <strong class="text-primary fs-4" id="totalAmount">0원</strong>
                        </div>
                        <button type="button" class="btn btn-primary w-100" onclick="proceedToOrder()">
                            주문하기
                        </button>
                    </div>
                </c:if>
            </main>
        </div>
    </div>

    <!-- Footer Include -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Cart JavaScript -->
    <script>
        const contextPath = '${pageContext.request.contextPath}';
        
        // 전체 선택
        function toggleSelectAll() {
            const selectAll = document.getElementById('selectAll').checked;
            document.querySelectorAll('.cart-select').forEach(checkbox => {
                checkbox.checked = selectAll;
            });
            updateTotal();
        }
        
        // 수량 업데이트
        function updateQuantity(cartId, change) {
            const qtyInput = document.getElementById('qty_' + cartId);
            let quantity = parseInt(qtyInput.value) + change;
            
            if (quantity < 1) {
                if (confirm('장바구니에서 삭제하시겠습니까?')) {
                    deleteCartItem(cartId);
                }
                return;
            }
            
            // Ajax로 서버에 수량 업데이트
            fetch(contextPath + '/mypage/cart/update', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    '${_csrf.headerName}': '${_csrf.token}'
                },
                body: JSON.stringify({
                    cartId: cartId,
                    cartCnt: quantity
                })
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    qtyInput.value = quantity;
                    updateItemPrice(cartId, data.price, quantity);
                    updateTotal();
                } else {
                    alert('수량 업데이트에 실패했습니다.');
                }
            });
        }
        
        // 개별 상품 가격 업데이트
        function updateItemPrice(cartId, price, quantity) {
            const priceElement = document.getElementById('price_' + cartId);
            const totalPrice = price * quantity;
            priceElement.textContent = totalPrice.toLocaleString() + '원';
        }
        
        // 총 금액 계산
        function updateTotal() {
            let subtotal = 0;
            
            document.querySelectorAll('.cart-select:checked').forEach(checkbox => {
                const cartItem = checkbox.closest('.cart-item');
                const cartId = cartItem.dataset.cartId;
                const priceText = document.getElementById('price_' + cartId).textContent;
                const price = parseInt(priceText.replace(/[^0-9]/g, ''));
                subtotal += price;
            });
            
            const shipping = subtotal >= 50000 ? 0 : 3000;
            const total = subtotal + shipping;
            
            document.getElementById('subtotal').textContent = subtotal.toLocaleString() + '원';
            document.getElementById('shipping').textContent = 
                shipping === 0 ? '무료' : shipping.toLocaleString() + '원';
            document.getElementById('totalAmount').textContent = total.toLocaleString() + '원';
        }
        
        // 선택 삭제
        function deleteSelected() {
            const selectedItems = document.querySelectorAll('.cart-select:checked');
            
            if (selectedItems.length === 0) {
                alert('삭제할 상품을 선택해주세요.');
                return;
            }
            
            if (!confirm('선택한 상품을 삭제하시겠습니까?')) {
                return;
            }
            
            const cartIds = Array.from(selectedItems).map(cb => cb.value);
            
            fetch(contextPath + '/mypage/cart/delete', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    '${_csrf.headerName}': '${_csrf.token}'
                },
                body: JSON.stringify(cartIds)
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    location.reload();
                } else {
                    alert('삭제에 실패했습니다.');
                }
            });
        }
        
        // 개별 삭제
        function deleteCartItem(cartId) {
            fetch(contextPath + '/mypage/cart/delete', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    '${_csrf.headerName}': '${_csrf.token}'
                },
                body: JSON.stringify([cartId])
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    location.reload();
                } else {
                    alert('삭제에 실패했습니다.');
                }
            });
        }
        
        // 주문 진행
        function proceedToOrder() {
            const selectedItems = document.querySelectorAll('.cart-select:checked');
            
            if (selectedItems.length === 0) {
                alert('주문할 상품을 선택해주세요.');
                return;
            }
            
            // 선택된 상품 ID들을 form에 추가
            const form = document.createElement('form');
            form.method = 'POST';
            form.action = contextPath + '/order/checkout';
            
            const csrfInput = document.createElement('input');
            csrfInput.type = 'hidden';
            csrfInput.name = '${_csrf.parameterName}';
            csrfInput.value = '${_csrf.token}';
            form.appendChild(csrfInput);
            
            selectedItems.forEach(checkbox => {
                const input = document.createElement('input');
                input.type = 'hidden';
                input.name = 'cartIds';
                input.value = checkbox.value;
                form.appendChild(input);
            });
            
            document.body.appendChild(form);
            form.submit();
        }
        
        // 페이지 로드 시 총액 계산
        document.addEventListener('DOMContentLoaded', function() {
            updateTotal();
        });
    </script>
</body>
</html>
