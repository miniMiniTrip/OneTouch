<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>장바구니 - OneTouch</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/images/favicon.svg">

    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/LineIcons.3.0.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/tiny-slider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/glightbox.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
    
    <style>
        .cart-item-image {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 5px;
        }
        .quantity-input {
            width: 80px;
            text-align: center;
        }
        .btn-quantity {
            padding: 5px 10px;
            font-size: 14px;
        }
        .total-price {
            font-weight: 600;
            color: #081828;
        }
        .empty-cart {
            text-align: center;
            padding: 100px 20px;
        }
        .empty-cart i {
            font-size: 80px;
            color: #dee2e6;
            margin-bottom: 20px;
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
    <%-- <jsp:include page="/WEB-INF/views/common/header.jsp" /> --%>
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
                        <li><a href="${pageContext.request.contextPath}/products">상품</a></li>
                        <li>장바구니</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    <!-- Shopping Cart -->
    <div class="shopping-cart section">
        <div class="container">
            <c:choose>
                <c:when test="${empty cartItems}">
                    <!-- Empty Cart -->
                    <div class="empty-cart">
                        <i class="lni lni-cart"></i>
                        <h3>장바구니가 비어있습니다</h3>
                        <p class="text-muted mb-4">원하는 상품을 장바구니에 담아보세요!</p>
                        <a href="${pageContext.request.contextPath}/products" class="btn">쇼핑 계속하기</a>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="cart-list-head">
                        <!-- Cart List Title -->
                        <div class="cart-list-title">
                            <div class="row">
                                <div class="col-lg-1 col-md-1 col-12">
                                    <input type="checkbox" id="selectAll" onclick="toggleSelectAll(this)">
                                </div>
                                <div class="col-lg-4 col-md-3 col-12">
                                    <p>상품명</p>
                                </div>
                                <div class="col-lg-2 col-md-2 col-12">
                                    <p>수량</p>
                                </div>
                                <div class="col-lg-2 col-md-2 col-12">
                                    <p>가격</p>
                                </div>
                                <div class="col-lg-2 col-md-2 col-12">
                                    <p>합계</p>
                                </div>
                                <div class="col-lg-1 col-md-2 col-12">
                                    <p>삭제</p>
                                </div>
                            </div>
                        </div>
                        <!-- End Cart List Title -->

                        <!-- Cart Items -->
                        <c:forEach var="item" items="${cartItems}">
                        <div class="cart-single-list">
                            <div class="row align-items-center">
                                <div class="col-lg-1 col-md-1 col-12">
                                    <input type="checkbox" class="cart-checkbox" 
                                           data-cart-id="${item.cartId}" 
                                           data-price="${item.product.price}" 
                                           data-quantity="${item.quantity}"
                                           onchange="updateTotal()">
                                </div>
                                <div class="col-lg-4 col-md-3 col-12">
                                    <div class="d-flex align-items-center">
                                        <a href="${pageContext.request.contextPath}/products/${item.product.productId}">
                                            <img src="${pageContext.request.contextPath}${item.product.mainImage}" 
                                                 alt="${item.product.name}" 
                                                 class="cart-item-image me-3">
                                        </a>
                                        <div>
                                            <h5 class="product-name">
                                                <a href="${pageContext.request.contextPath}/products/${item.product.productId}">
                                                    ${item.product.name}
                                                </a>
                                            </h5>
                                            <p class="product-des">
                                                <span><em>브랜드:</em> ${item.product.brand}</span>
                                                <c:if test="${not empty item.product.category}">
                                                    <span><em>카테고리:</em> ${item.product.category}</span>
                                                </c:if>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-2 col-md-2 col-12">
                                    <div class="input-group quantity-input">
                                        <button class="btn btn-sm btn-outline-secondary btn-quantity" 
                                                type="button" 
                                                onclick="updateQuantity(${item.cartId}, -1)">
                                            <i class="lni lni-minus"></i>
                                        </button>
                                        <input type="text" 
                                               class="form-control text-center" 
                                               id="quantity-${item.cartId}" 
                                               value="${item.quantity}" 
                                               readonly>
                                        <button class="btn btn-sm btn-outline-secondary btn-quantity" 
                                                type="button" 
                                                onclick="updateQuantity(${item.cartId}, 1)">
                                            <i class="lni lni-plus"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="col-lg-2 col-md-2 col-12">
                                    <p><fmt:formatNumber value="${item.product.price}" type="number" groupingUsed="true"/>원</p>
                                </div>
                                <div class="col-lg-2 col-md-2 col-12">
                                    <p class="total-price" id="item-total-${item.cartId}">
                                        <fmt:formatNumber value="${item.product.price * item.quantity}" type="number" groupingUsed="true"/>원
                                    </p>
                                </div>
                                <div class="col-lg-1 col-md-2 col-12">
                                    <a class="remove-item" href="javascript:void(0)" onclick="removeItem(${item.cartId})">
                                        <i class="lni lni-close"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                        <!-- End Cart Items -->
                    </div>

                    <!-- Total Amount Section -->
                    <div class="row mt-4">
                        <div class="col-12">
                            <div class="total-amount">
                                <div class="row">
                                    <div class="col-lg-8 col-md-6 col-12">
                                        <div class="left">
                                            <div class="button">
                                                <button class="btn btn-danger" onclick="removeSelected()">
                                                    선택 상품 삭제
                                                </button>
                                                <button class="btn btn-outline-secondary ms-2" onclick="removeAll()">
                                                    전체 삭제
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6 col-12">
                                        <div class="right">
                                            <ul>
                                                <li>상품 금액<span id="subtotal">0원</span></li>
                                                <li>배송비<span>무료</span></li>
                                                <li class="last">총 결제금액<span id="total" class="text-danger fw-bold">0원</span></li>
                                            </ul>
                                            <div class="button">
                                                <button class="btn" onclick="checkout()">주문하기</button>
                                                <a href="${pageContext.request.contextPath}/products" class="btn btn-alt">쇼핑 계속하기</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <!--/ End Shopping Cart -->

    <!-- Start Footer Area -->
   <%--  <jsp:include page="/WEB-INF/views/common/footer.jsp" /> --%>
    <!-- End Footer Area -->

    <!-- ========================= JS here ========================= -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/tiny-slider.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/glightbox.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

    <script>
        // 전체 선택/해제
        function toggleSelectAll(checkbox) {
            const checkboxes = document.querySelectorAll('.cart-checkbox');
            checkboxes.forEach(cb => {
                cb.checked = checkbox.checked;
            });
            updateTotal();
        }

        // 총액 계산
        function updateTotal() {
            const checkboxes = document.querySelectorAll('.cart-checkbox:checked');
            let subtotal = 0;
            
            checkboxes.forEach(cb => {
                const price = parseInt(cb.dataset.price);
                const quantity = parseInt(cb.dataset.quantity);
                subtotal += price * quantity;
            });
            
            document.getElementById('subtotal').textContent = subtotal.toLocaleString() + '원';
            document.getElementById('total').textContent = subtotal.toLocaleString() + '원';
        }

        // 수량 변경
        function updateQuantity(cartId, change) {
            const input = document.getElementById('quantity-' + cartId);
            let quantity = parseInt(input.value) + change;
            
            if (quantity < 1) {
                if (confirm('상품을 장바구니에서 삭제하시겠습니까?')) {
                    removeItem(cartId);
                }
                return;
            }
            
            if (quantity > 99) {
                alert('최대 구매 수량은 99개입니다.');
                return;
            }
            
            // AJAX로 수량 업데이트
            fetch('${pageContext.request.contextPath}/cart/update', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    cartId: cartId,
                    quantity: quantity
                })
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    input.value = quantity;
                    // 해당 아이템 총액 업데이트
                    const checkbox = document.querySelector(`[data-cart-id="${cartId}"]`);
                    checkbox.dataset.quantity = quantity;
                    const price = parseInt(checkbox.dataset.price);
                    const itemTotal = document.getElementById('item-total-' + cartId);
                    itemTotal.textContent = (price * quantity).toLocaleString() + '원';
                    updateTotal();
                } else {
                    alert('수량 변경에 실패했습니다.');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('오류가 발생했습니다.');
            });
        }

        // 개별 상품 삭제
        function removeItem(cartId) {
            if (!confirm('이 상품을 장바구니에서 삭제하시겠습니까?')) {
                return;
            }
            
            fetch('${pageContext.request.contextPath}/cart/remove/' + cartId, {
                method: 'DELETE'
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    location.reload();
                } else {
                    alert('삭제에 실패했습니다.');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('오류가 발생했습니다.');
            });
        }

        // 선택 상품 삭제
        function removeSelected() {
            const checkboxes = document.querySelectorAll('.cart-checkbox:checked');
            if (checkboxes.length === 0) {
                alert('삭제할 상품을 선택해주세요.');
                return;
            }
            
            if (!confirm('선택한 상품을 삭제하시겠습니까?')) {
                return;
            }
            
            const cartIds = Array.from(checkboxes).map(cb => cb.dataset.cartId);
            
            fetch('${pageContext.request.contextPath}/cart/remove-multiple', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ cartIds: cartIds })
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    location.reload();
                } else {
                    alert('삭제에 실패했습니다.');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('오류가 발생했습니다.');
            });
        }

        // 전체 삭제
        function removeAll() {
            if (!confirm('장바구니의 모든 상품을 삭제하시겠습니까?')) {
                return;
            }
            
            fetch('${pageContext.request.contextPath}/cart/clear', {
                method: 'DELETE'
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    location.reload();
                } else {
                    alert('삭제에 실패했습니다.');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('오류가 발생했습니다.');
            });
        }

        // 주문하기
        function checkout() {
            const checkboxes = document.querySelectorAll('.cart-checkbox:checked');
            if (checkboxes.length === 0) {
                alert('주문할 상품을 선택해주세요.');
                return;
            }
            
            const cartIds = Array.from(checkboxes).map(cb => cb.dataset.cartId);
            const form = document.createElement('form');
            form.method = 'POST';
            form.action = '${pageContext.request.contextPath}/checkout';
            
            cartIds.forEach(id => {
                const input = document.createElement('input');
                input.type = 'hidden';
                input.name = 'cartIds';
                input.value = id;
                form.appendChild(input);
            });
            
            document.body.appendChild(form);
            form.submit();
        }

        // 페이지 로드 시 총액 계산
        window.addEventListener('DOMContentLoaded', () => {
            updateTotal();
        });
    </script>
</body>
</html>
