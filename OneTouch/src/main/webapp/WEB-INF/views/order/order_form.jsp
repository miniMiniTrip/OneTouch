<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>주문서 작성 - OneTouch</title>
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
    
    <!-- Daum 우편번호 API -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
    <style>
        .checkout-section {
            padding: 40px 0;
        }
        .checkout-form-list {
            background: #fff;
            padding: 30px;
            border: 1px solid #e9e9e9;
            border-radius: 5px;
            margin-bottom: 30px;
        }
        .checkout-form-list h3 {
            font-size: 20px;
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 1px solid #e9e9e9;
        }
        .order-summary {
            background: #f7f7f7;
            padding: 30px;
            border-radius: 5px;
            position: sticky;
            top: 20px;
        }
        .order-summary h4 {
            font-size: 18px;
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 1px solid #ddd;
        }
        .product-item {
            display: flex;
            align-items: center;
            padding: 15px 0;
            border-bottom: 1px solid #eee;
        }
        .product-item img {
            width: 60px;
            height: 60px;
            object-fit: cover;
            margin-right: 15px;
            border-radius: 5px;
        }
        .product-info {
            flex: 1;
        }
        .product-info h6 {
            font-size: 14px;
            margin-bottom: 5px;
        }
        .product-info span {
            color: #666;
            font-size: 13px;
        }
        .price-info {
            text-align: right;
        }
        .price-info .price {
            font-weight: 600;
            color: #333;
        }
        .summary-list {
            margin: 20px 0;
        }
        .summary-list li {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #eee;
        }
        .summary-list li.total {
            border-bottom: none;
            margin-top: 10px;
            padding-top: 20px;
            border-top: 2px solid #333;
            font-size: 18px;
            font-weight: 600;
        }
        .form-group label {
            font-weight: 500;
            margin-bottom: 8px;
        }
        .form-group input,
        .form-group select {
            width: 100%;
            padding: 10px 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .address-group {
            display: flex;
            gap: 10px;
            margin-bottom: 10px;
        }
        .address-group input:first-child {
            flex: 0 0 120px;
        }
        .address-group button {
            flex: 0 0 100px;
        }
        .payment-method {
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-bottom: 10px;
            cursor: pointer;
            transition: all 0.3s;
        }
        .payment-method:hover {
            border-color: #5830E0;
        }
        .payment-method.selected {
            border-color: #5830E0;
            background: #f8f8ff;
        }
        .payment-method input[type="radio"] {
            margin-right: 10px;
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
                        <h1 class="page-title">주문서 작성</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/"><i class="lni lni-home"></i> Home</a></li>
                        <li><a href="/cart/list.do">장바구니</a></li>
                        <li>주문서 작성</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Checkout Section -->
    <section class="checkout-section section">
        <div class="container">
            <form action="/order/order_insert.do" method="post" id="orderForm">
                <!-- Hidden fields -->
                <input type="hidden" name="order_type" value="${order_type}">
                <c:if test="${order_type eq 'direct'}">
                    <input type="hidden" name="product_idx" value="${product.product_idx}">
                    <input type="hidden" name="product_cnt" value="${param.product_cnt}">
                </c:if>
                <c:if test="${order_type eq 'cart'}">
                    <c:forEach var="cart_id" items="${cart_ids}">
                        <input type="hidden" name="cart_id" value="${cart_id}">
                    </c:forEach>
                </c:if>
                
                <div class="row">
                    <div class="col-lg-8 col-md-12 col-12">
                        <!-- 주문자 정보 -->
                        <div class="checkout-form-list">
                            <h3>주문자 정보</h3>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-12">
                                    <div class="form-group">
                                        <label>주문자명 <span>*</span></label>
                                        <input type="text" name="order_mem_name" placeholder="주문자명을 입력하세요" required>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-12">
                                    <div class="form-group">
                                        <label>연락처 <span>*</span></label>
                                        <input type="tel" name="order_phone" placeholder="010-0000-0000" required>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- 배송 정보 -->
                        <div class="checkout-form-list">
                            <h3>배송 정보</h3>
                            <div class="form-group">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="sameAsOrderer">
                                    <label class="custom-control-label" for="sameAsOrderer">주문자 정보와 동일</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <label>우편번호 <span>*</span></label>
                                        <div class="address-group">
                                            <input type="text" name="order_postal" id="order_postal" placeholder="우편번호" readonly required>
                                            <button type="button" class="btn btn-outline-secondary" onclick="findPostcode()">주소찾기</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label>주소 <span>*</span></label>
                                        <input type="text" name="order_address" id="order_address" placeholder="기본주소" readonly required>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label>상세주소</label>
                                        <input type="text" name="order_address_more" id="order_address_more" placeholder="상세주소를 입력하세요">
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- 결제 수단 -->
                        <div class="checkout-form-list">
                            <h3>결제 수단</h3>
                            <div class="payment-method selected">
                                <label>
                                    <input type="radio" name="payment_method" value="tosspay" checked>
                                    <strong>토스페이</strong>
                                    <small class="text-muted ml-2">간편하게 결제하세요</small>
                                </label>
                            </div>
<!--                   		<div class="payment-method">
                                <label>
                                    <input type="radio" name="payment_method" value="card">
                                    <strong>신용카드</strong>
                                </label>
                            </div>
                            <div class="payment-method">
                                <label>
                                    <input type="radio" name="payment_method" value="bank">
                                    <strong>실시간 계좌이체</strong>
                                </label>
                        	</div> -->
                        </div>
                    </div>
                    
                    <div class="col-lg-4 col-md-12 col-12">
                        <!-- 주문 요약 -->
                        <div class="order-summary">
                            <h4>주문 상품</h4>
                            
                            <!-- 단건 구매 -->
                            <c:if test="${order_type eq 'direct'}">
                                <div class="product-item">
                                    <img src="${pageContext.request.contextPath}/images/${product.product_image_url}"  alt="${product.product_name}">
                                    <div class="product-info">
                                        <h6>${product.product_name}</h6>
                                        <span>수량: ${param.product_cnt}개</span>
                                    </div>
                                    <div class="price-info">
                                        <div class="price">
                                            <fmt:formatNumber value="${product.product_price * param.product_cnt}" pattern="#,###"/>원
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                            
                            <!-- 장바구니 구매 -->
                            <c:if test="${order_type eq 'cart'}">
                                <c:forEach var="item" items="${cart_list}">
                                    <div class="product-item">
                                        <img src="${pageContext.request.contextPath}/images/${product.product_image_url}" alt="${item.product_name}">
                                        <div class="product-info">
                                            <h6>${item.product_name}</h6>
                                            <span>수량: ${item.cart_cnt}개</span>
                                        </div>
                                        <div class="price-info">
                                            <div class="price">
                                                <fmt:formatNumber value="${item.total_amount}" pattern="#,###"/>원
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                            
                            <ul class="summary-list">
                                <li>
                                    <span>상품 합계</span>
                                    <span><fmt:formatNumber value="${total_amount}" pattern="#,###"/>원</span>
                                </li>
                                <li>
                                    <span>배송비</span>
                                    <span>무료</span>
                                </li>
                                <li class="total">
                                    <span>총 결제금액</span>
                                    <span class="text-primary"><fmt:formatNumber value="${total_amount}" pattern="#,###"/>원</span>
                                </li>
                            </ul>
                            
                            <div class="button">
                                <button type="submit" class="btn btn-primary w-100">
                                    <fmt:formatNumber value="${total_amount}" pattern="#,###"/>원 결제하기
                                </button>
                            </div>
                            
                            <div class="mt-3 text-center">
                                <small class="text-muted">
                                    결제 진행 시 <a href="#">이용약관</a> 및 <a href="#">개인정보처리방침</a>에 동의하는 것으로 간주됩니다.
                                </small>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
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
        // 다음 우편번호 API
        function findPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    var addr = ''; // 주소 변수
                    
                    // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다
                    if (data.userSelectedType === 'R') { // 도로명 주소
                        addr = data.roadAddress;
                    } else { // 지번 주소
                        addr = data.jibunAddress;
                    }
                    
                    // 우편번호와 주소 정보를 입력
                    document.getElementById('order_postal').value = data.zonecode;
                    document.getElementById('order_address').value = addr;
                    
                    // 상세주소 입력란으로 포커스 이동
                    document.getElementById('order_address_more').focus();
                }
            }).open();
        }
        
        // 주문자 정보와 동일 체크박스
        $('#sameAsOrderer').on('change', function() {
            if ($(this).is(':checked')) {
                var orderName = $('input[name="order_mem_name"]').val();
                var orderPhone = $('input[name="order_phone"]').val();
                // 여기서는 실제로는 회원 정보에서 가져와야 함
                // 임시로 주문자 정보를 복사
            }
        });
        
        // 결제 수단 선택
        $('.payment-method').on('click', function() {
            $('.payment-method').removeClass('selected');
            $(this).addClass('selected');
            $(this).find('input[type="radio"]').prop('checked', true);
        });
        
        // 폼 유효성 검사
        $('#orderForm').on('submit', function(e) {
            var orderName = $('input[name="order_mem_name"]').val();
            var orderPhone = $('input[name="order_phone"]').val();
            var postal = $('input[name="order_postal"]').val();
            var address = $('input[name="order_address"]').val();
            
            if (!orderName || !orderPhone || !postal || !address) {
                e.preventDefault();
                alert('필수 정보를 모두 입력해주세요.');
                return false;
            }
            
            // 전화번호 형식 검사
            var phoneRegex = /^01[0-9]-?[0-9]{4}-?[0-9]{4}$/;
            if (!phoneRegex.test(orderPhone.replace(/-/g, ''))) {
                e.preventDefault();
                alert('올바른 전화번호 형식을 입력해주세요.');
                return false;
            }
            
            if (!confirm('주문을 진행하시겠습니까?')) {
                e.preventDefault();
                return false;
            }
        });
    </script>
</body>
</html>