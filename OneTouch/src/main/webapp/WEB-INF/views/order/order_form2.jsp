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
    <!-- 토스페이먼츠 -->
	<script src="https://js.tosspayments.com/v2/standard"></script>
	<!-- jquery -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>    
    <!-- Web Font -->
    <link href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
    <!-- Daum 우편번호 API -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="/assets/js/bootstrap.min.js"></script>
    <script src="/assets/js/tiny-slider.js"></script>
    <script src="/assets/js/glightbox.min.js"></script>
    <script src="/assets/js/main.js"></script>
    <script>
		let tossPayments = null;
		
		$(document).ready(function() {
		    // ✅ v2: window.TossPayments 사용
		    tossPayments = window.TossPayments('클라이언트키');
		    console.log('✅ TossPayments 초기화 완료');
		});
		
		function requestTossPayment(orderData) {
		    // ✅ v2 형식
		    tossPayments.requestPayment({
		        method: "CARD",  // 대문자 상수
		        amount: {
		            currency: "KRW",
		            value: orderData.amount
		        },
		        orderId: orderData.payment_key,
		        orderName: orderData.order_name,
		        successUrl: window.location.origin + "/payment/success.do",
		        failUrl: window.location.origin + "/payment/fail.do",
		        customerName: "...",
		        customerMobilePhone: "..."
		    }).catch(function(error) {
		        console.error('결제 에러:', error);
		    });
		}
	</script>
    
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
            <!-- form action 제거, id만 유지 -->
            <form id="orderForm">
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
                                        <label>이름 <span>*</span></label>
                                        <input type="text" name="order_mem_name" value="${user.mem_name}" required>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-12">
                                    <div class="form-group">
                                        <label>휴대폰 <span>*</span></label>
                                        <input type="text" name="order_phone" placeholder="010-1234-5678" required>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- 배송지 정보 -->
                        <div class="checkout-form-list">
                            <h3>배송지 정보</h3>
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="sameAsOrderer">
                                            <label class="form-check-label" for="sameAsOrderer">
                                                주문자 정보와 동일
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-12">
                                    <div class="form-group">
                                        <label>수령인 <span>*</span></label>
                                        <input type="text" name="order_recipient" placeholder="수령인 이름" required>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-12">
                                    <div class="form-group">
                                        <label>연락처 <span>*</span></label>
                                        <input type="text" name="order_recipient_phone" placeholder="010-1234-5678" required>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label>우편번호 <span>*</span></label>
                                        <div class="address-group">
                                            <input type="text" name="order_postal" id="order_postal" placeholder="우편번호" readonly required>
                                            <button type="button" class="btn btn-secondary" onclick="findPostcode()">우편번호 찾기</button>
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
                                    <input type="radio" name="payment_method" value="CARD" checked>
                                    <strong>신용/체크카드</strong>
                                    <small class="text-muted ml-2">토스페이먼츠</small>
                                </label>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-4 col-md-12 col-12">
                        <!-- 주문 요약 -->
                        <div class="order-summary">
                            <h4>주문 상품</h4>
                            
                            <!-- 단건 구매 -->
                            <c:if test="${order_type eq 'direct'}">
                                <div class="product-item">
                                    <img src="${pageContext.request.contextPath}/images/${product.product_image_url}" alt="${product.product_name}">
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
                                        <img src="${pageContext.request.contextPath}/images/${item.product_image_url}" alt="${item.product_name}">
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
                                <!-- 🔥 type="button"으로 변경, id 추가 -->
                                <button type="button" id="payment-button" class="btn btn-primary w-100">
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

<script>
	let tossPayments = null;
	const tossClientKey = "test_gck_docs_Ovk5rk1EwkEbP0W43n07xlzm";
    const totalAmount = ${total_amount};
    
    // 다음 우편번호 API
    function findPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = '';
                
                if (data.userSelectedType === 'R') {
                    addr = data.roadAddress;
                } else {
                    addr = data.jibunAddress;
                }
                
                document.getElementById('order_postal').value = data.zonecode;
                document.getElementById('order_address').value = addr;
                document.getElementById('order_address_more').focus();
            }
        }).open();
    }
    
    // 결제 수단 선택
    $('.payment-method').on('click', function() {
        $('.payment-method').removeClass('selected');
        $(this).addClass('selected');
        $(this).find('input[type="radio"]').prop('checked', true);
    });
    
    // 🔥 결제 버튼 클릭 이벤트
    document.getElementById('payment-button').addEventListener('click', function() {
        
        // 1. 폼 유효성 검사
        var orderName = $('input[name="order_mem_name"]').val();
        var orderPhone = $('input[name="order_phone"]').val();
        var postal = $('input[name="order_postal"]').val();
        var address = $('input[name="order_address"]').val();
        
        if (!orderName || !orderPhone || !postal || !address) {
            alert('필수 정보를 모두 입력해주세요.');
            return false;
        }
        
        // 전화번호 형식 검사
        var phoneRegex = /^01[0-9]-?[0-9]{3,4}-?[0-9]{4}$/;
        if (!phoneRegex.test(orderPhone.replace(/-/g, ''))) {
            alert('올바른 전화번호 형식을 입력해주세요.');
            return false;
        }
        
        if (!confirm('주문을 진행하시겠습니까?')) {
            return false;
        }
        
        // 2. 주문 데이터 수집
        var formData = $('#orderForm').serialize();
        
        console.log('=== 주문 요청 데이터 ===');
        console.log(formData);
        
        // 3. 서버에 주문 생성 요청 (Ajax)
        $.ajax({
            url: '/order/create_ready.do',
            type: 'POST',
            data: formData,
            dataType: 'json',
            success: function(response) {
                console.log('=== 서버 응답 ===');
                console.log(response);
                
                if (response.success) {
                    // 토스 v2 결제창 호출
                    requestTossPayment(
                        response.payment_key,
                        response.order_name,
                        response.amount
                    );
                } else {
                    alert('주문 생성 실패: ' + response.message);
                }
            },
            error: function(xhr, status, error) {
                console.error('Ajax Error:', error);
                console.error('Response:', xhr.responseText);
                alert('주문 생성 중 오류가 발생했습니다.');
            }
        });
    });
    
    // 🔥 토스페이먼츠 v2 결제창 호출 함수
    async function requestTossPayment(paymentKey, orderName, amount) {
        
        console.log('=== 토스 v2 결제 요청 ===');
        console.log('paymentKey:', paymentKey);
        console.log('orderName:', orderName);
        console.log('amount:', amount);
        console.log('customerName:', '${user.mem_name}');
        
        try {
            const tossPayments = await loadTossPayments(tossClientKey);
            
            await tossPayments.requestPayment({
                method: 'CARD',
                amount: {
                    currency: 'KRW',
                    value: amount
                },
                orderId: paymentKey,
                orderName: orderName,
                successUrl: window.location.origin + '/payment/success.do',
                failUrl: window.location.origin + '/payment/fail.do',
                customerName: '${user.mem_name}'
            });
            
        } catch (error) {
            console.error('=== 토스 v2 에러 ===');
            console.error('전체 에러:', error);
            
            if (error.code === 'USER_CANCEL') {
                alert('결제를 취소하셨습니다.');
            } else {
                console.error('Error Code:', error.code);
                console.error('Error Message:', error.message);
                alert('결제 중 오류가 발생했습니다: ' + (error.message || '알 수 없는 오류'));
            }
        }
    }
</script>
</body>
</html>