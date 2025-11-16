<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>주문서 작성 - OneTouch</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/assets/images/favicon.svg">

    <!-- Web Font -->
    <link href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">

    <!-- ShopGrids CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/LineIcons.2.0.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/tiny-slider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/glightbox.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css">
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

    <!-- Header -->
    <%@include file="/WEB-INF/views/common/header.jsp" %>

    <!-- Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">주문서 작성</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="${pageContext.request.contextPath}/"><i class="lni lni-home"></i> Home</a></li>
                        <li><a href="${pageContext.request.contextPath}/cart/list.do">장바구니</a></li>
                        <li>주문서 작성</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- Checkout Section -->
    <section class="checkout-wrapper section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="checkout-steps-form-style-1">
                        <h3>주문/결제</h3>
                        
                        <!-- Checkout Form -->
                        <form action="${pageContext.request.contextPath}/order/order_insert.do" method="post" id="orderForm">
                            
                            <!-- Hidden Fields -->
                            <input type="hidden" name="order_type" value="${order_type}">
                            
                            <c:if test="${order_type == 'cart'}">
                                <c:forEach var="cart_id" items="${cart_ids}">
                                    <input type="hidden" name="cart_id" value="${cart_id}">
                                </c:forEach>
                            </c:if>
                            
                            <c:if test="${order_type == 'direct'}">
                                <input type="hidden" name="product_idx" value="${product.product_idx}">
                                <input type="hidden" name="product_cnt" value="${product_cnt}">
                            </c:if>
                            
                            <!-- Step 1: 주문 상품 확인 -->
                            <section>
                                <h5 class="title">주문 상품</h5>
                                
                                <c:if test="${order_type == 'cart'}">
                                    <div class="table-responsive">
                                        <table class="table shopping-summery">
                                            <thead>
                                                <tr class="main-hading">
                                                    <th>상품</th>
                                                    <th>상품명</th>
                                                    <th class="text-center">수량</th>
                                                    <th class="text-center">단가</th>
                                                    <th class="text-center">금액</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="item" items="${cart_list}">
                                                    <tr>
                                                        <td class="image" data-title="No">
                                                            <img src="${pageContext.request.contextPath}${item.product_image_url}" alt="${item.product_name}">
                                                        </td>
                                                        <td class="product-des" data-title="Description">
                                                            <p class="product-name">${item.product_name}</p>
                                                        </td>
                                                        <td class="qty text-center" data-title="Qty">
                                                            ${item.cart_cnt}개
                                                        </td>
                                                        <td class="price text-center" data-title="Price">
                                                            <fmt:formatNumber value="${item.product_price}" pattern="#,###"/>원
                                                        </td>
                                                        <td class="total-amount text-center" data-title="Total">
                                                            <fmt:formatNumber value="${item.total_amount}" pattern="#,###"/>원
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </c:if>
                                
                                <c:if test="${order_type == 'direct'}">
                                    <div class="single-product">
                                        <div class="row align-items-center">
                                            <div class="col-md-2">
                                                <img src="${pageContext.request.contextPath}${product.product_image_url}" alt="${product.product_name}">
                                            </div>
                                            <div class="col-md-6">
                                                <h5>${product.product_name}</h5>
                                                <p class="text-muted">${product.product_brand}</p>
                                            </div>
                                            <div class="col-md-2 text-center">
                                                <p>${product_cnt}개</p>
                                            </div>
                                            <div class="col-md-2 text-end">
                                                <h6><fmt:formatNumber value="${total_amount}" pattern="#,###"/>원</h6>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </section>
                            
                            <!-- Step 2: 배송지 정보 -->
                            <section>
                                <h5 class="title">배송지 정보</h5>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>받는 분 이름<span class="text-danger">*</span></label>
                                            <input class="form-control" type="text" name="order_mem_name" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>연락처<span class="text-danger">*</span></label>
                                            <input class="form-control" type="text" name="order_phone" placeholder="010-0000-0000" required>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>우편번호<span class="text-danger">*</span></label>
                                            <div class="input-group">
                                                <input class="form-control" type="text" name="order_postal" id="order_postal" readonly required>
                                                <button class="btn btn-primary" type="button" onclick="searchAddress()">
                                                    <i class="lni lni-search"></i> 주소 찾기
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label>기본 주소<span class="text-danger">*</span></label>
                                            <input class="form-control" type="text" name="order_address" id="order_address" readonly required>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label>상세 주소</label>
                                            <input class="form-control" type="text" name="order_address_more" placeholder="상세 주소를 입력하세요">
                                        </div>
                                    </div>
                                </div>
                            </section>
                            
                            <!-- Step 3: 결제 정보 -->
                            <section>
                                <h5 class="title">결제 정보</h5>
                                <div class="order-details">
                                    <div class="single-order d-flex justify-content-between">
                                        <p>주문명:</p>
                                        <p class="order-name">${order_name}</p>
                                    </div>
                                    <div class="single-order d-flex justify-content-between">
                                        <p>상품 금액:</p>
                                        <p><fmt:formatNumber value="${total_amount}" pattern="#,###"/>원</p>
                                    </div>
                                    <div class="single-order d-flex justify-content-between">
                                        <p>배송비:</p>
                                        <p>무료</p>
                                    </div>
                                    <div class="single-order d-flex justify-content-between total">
                                        <p><strong>총 결제금액:</strong></p>
                                        <p><strong><fmt:formatNumber value="${total_amount}" pattern="#,###"/>원</strong></p>
                                    </div>
                                </div>
                            </section>
                            
                            <!-- Submit Button -->
                            <div class="button">
                                <button class="btn btn-lg btn-primary w-100" type="submit">
                                    <i class="lni lni-credit-cards"></i> 결제하기
                                </button>
                            </div>
                            
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <%@include file="/WEB-INF/views/common/footer.jsp" %>

    <!-- ShopGrids JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/tiny-slider.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/glightbox.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
    
    <!-- Daum 주소 API -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
    <script>
    // 주소 검색
    function searchAddress() {
        new daum.Postcode({
            oncomplete: function(data) {
                document.getElementById('order_postal').value = data.zonecode;
                document.getElementById('order_address').value = data.address;
            }
        }).open();
    }
    
    // 폼 유효성 검사
    document.getElementById('orderForm').addEventListener('submit', function(e) {
        const postal = document.getElementById('order_postal').value;
        if (!postal) {
            e.preventDefault();
            alert('주소를 입력해주세요.');
            return false;
        }
    });
    </script>
</body>
</html>
