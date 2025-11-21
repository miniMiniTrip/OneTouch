<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- 테스트용으로 템플릿 빼고 재작업했습니다. -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문/결제 - OneTouch</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- ⭐ TossPayments SDK v2 -->
    <script src="https://js.tosspayments.com/v2/standard"></script>
    
    <style>
        .order-section {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
        }
        .product-item {
            border-bottom: 1px solid #dee2e6;
            padding: 15px 0;
        }
        .product-item:last-child {
            border-bottom: none;
        }
        .total-amount {
            font-size: 1.5rem;
            font-weight: bold;
            color: #dc3545;
        }
        .btn-payment {
            font-size: 1.2rem;
            padding: 15px 50px;
        }
    </style>
</head>
<body>
    <div class="container mt-5 mb-5">
        <h2 class="mb-4">주문/결제</h2>
        
        <!-- 주문 상품 정보 -->
        <div class="order-section">
            <h4>주문 상품</h4>
            
            <c:choose>
                <%-- 장바구니 결제 --%>
                <c:when test="${order_type == 'cart'}">
                    <c:forEach var="cart" items="${cart_list}">
                        <div class="product-item">
                            <div class="row align-items-center">
                                <div class="col-md-6">
                                    <strong>${cart.product_name}</strong>
                                </div>
                                <div class="col-md-3 text-center">
                                    수량: ${cart.cart_cnt}개
                                </div>
                                <div class="col-md-3 text-end">
                                    <fmt:formatNumber value="${cart.total_amount}" pattern="#,###"/>원
                                </div>
                            </div>
                        </div>
                        <input type="hidden" name="cart_id" value="${cart.cart_id}">
                    </c:forEach>
                </c:when>
                
                <%-- 단건 결제 --%>
                <c:otherwise>
                    <div class="product-item">
                        <div class="row align-items-center">
                            <div class="col-md-6">
                                <strong>${product.product_name}</strong>
                            </div>
                            <div class="col-md-3 text-center">
                                수량: ${param.product_cnt}개
                            </div>
                            <div class="col-md-3 text-end">
                                <fmt:formatNumber value="${total_amount}" pattern="#,###"/>원
                            </div>
                        </div>
                    </div>
                    <input type="hidden" name="product_idx" value="${product.product_idx}">
                    <input type="hidden" name="product_cnt" value="${param.product_cnt}">
                </c:otherwise>
            </c:choose>
            
            <hr>
            <div class="text-end">
                <span class="total-amount">
                    총 결제금액: <fmt:formatNumber value="${total_amount}" pattern="#,###"/>원
                </span>
            </div>
        </div>
        
        <!-- 주문자 정보 -->
        <div class="order-section">
            <h4>주문자 정보</h4>
            <div class="row g-3">
                <div class="col-md-6">
                    <label class="form-label">주문자명 <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" name="order_mem_name" 
                           value="${user.mem_name}" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label">연락처 <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" name="order_phone" 
                           value="${user.mem_phone}" placeholder="010-1234-5678" required>
                </div>
            </div>
        </div>
        
        <!-- 배송지 정보 -->
        <div class="order-section">
            <h4>배송지 정보</h4>
            <div class="row g-3">
                <div class="col-md-8">
                    <label class="form-label">우편번호 <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" name="order_postal" 
                           placeholder="우편번호" readonly required>
                </div>
                <div class="col-md-4">
                    <label class="form-label">&nbsp;</label>
                    <button type="button" class="btn btn-secondary w-100" 
                            onclick="searchAddress()">우편번호 검색</button>
                </div>
                <div class="col-12">
                    <label class="form-label">주소 <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" name="order_address" 
                           placeholder="주소" readonly required>
                </div>
                <div class="col-12">
                    <label class="form-label">상세주소</label>
                    <input type="text" class="form-control" name="order_address_more" 
                           placeholder="상세주소를 입력하세요">
                </div>
            </div>
        </div>
        
        <!-- 결제 수단 -->
        <div class="order-section">
            <h4>결제 수단</h4>
            <select class="form-select" name="payment_method">
                <option value="CARD">신용카드</option>
                <option value="TRANSFER">계좌이체</option>
                <option value="VIRTUAL_ACCOUNT">가상계좌</option>
                <option value="MOBILE_PHONE">휴대폰 결제</option>
            </select>
        </div>
        
        <!-- 결제 버튼 -->
        <div class="text-center mt-4">
            <button type="button" id="paymentBtn" class="btn btn-primary btn-payment" 
                    onclick="requestPayment()">
                <fmt:formatNumber value="${total_amount}" pattern="#,###"/>원 결제하기
            </button>
        </div>
    </div>
    
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Daum 우편번호 API -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
    <script>

        // 클라이언트 키로 TossPayments 초기화
        const clientKey = "test_ck_AQ92ymxN34R7WM667J94rajRKXvd";
        
        // mem_idx를 사용하여 고유한 customerKey 생성
        const customerKey = "CUSTOMER_${user.mem_idx}";
        
        console.log("========================================");
        console.log("TossPayments 초기화 시작");
        console.log("clientKey:", clientKey);
        console.log("customerKey:", customerKey);
        console.log("========================================");
        
        // TossPayments 객체 생성
        const tossPayments = TossPayments(clientKey);
        
        // 회원 결제
        const payment = tossPayments.payment({ customerKey });
        
        console.log("TossPayments 초기화 완료");
        console.log("tossPayments:", tossPayments);
        console.log("payment:", payment);
        console.log("========================================");
        
        // 우편번호 검색
        function searchAddress() {
            new daum.Postcode({
                oncomplete: function(data) {
                    $('input[name="order_postal"]').val(data.zonecode);
                    $('input[name="order_address"]').val(data.address);
                    $('input[name="order_address_more"]').focus();
                }
            }).open();
        }
        
        // 폼 유효성 검사
        function validateForm() {
            const requiredFields = [
                { name: 'order_mem_name', label: '주문자명' },
                { name: 'order_phone', label: '연락처' },
                { name: 'order_postal', label: '우편번호' },
                { name: 'order_address', label: '주소' }
            ];
            
            for (let field of requiredFields) {
                const value = $('input[name="' + field.name + '"]').val();
                if (!value || value.trim() === '') {
                    alert(field.label + '을(를) 입력해주세요.');
                    $('input[name="' + field.name + '"]').focus();
                    return false;
                }
            }
            
            // 연락처 형식 검사
            const phone = $('input[name="order_phone"]').val();
            const phonePattern = /^\d{2,3}-\d{3,4}-\d{4}$/;
            if (!phonePattern.test(phone)) {
                alert('연락처를 올바른 형식으로 입력해주세요. (예: 010-1234-5678)');
                $('input[name="order_phone"]').focus();
                return false;
            }
            
            return true;
        }
        
        // 결제 요청 메인 함수
        async function requestPayment() {
            console.log("========================================");
            console.log("결제 요청 시작");
            console.log("========================================");
            
            // 폼 유효성 검사
            if (!validateForm()) {
                return;
            }

            // 중복 클릭 방지
            $('#paymentBtn').prop('disabled', true).text('처리 중...');
            
            // 주문 데이터 수집
            const orderData = {
                order_type: '${order_type}',
                order_mem_name: $('input[name="order_mem_name"]').val().trim(),
                order_phone: $('input[name="order_phone"]').val().trim(),
                order_postal: $('input[name="order_postal"]').val().trim(),
                order_address: $('input[name="order_address"]').val().trim(),
                order_address_more: $('input[name="order_address_more"]').val().trim(),
                payment_method: $('select[name="payment_method"]').val()
            };
            
            // 주문 타입에 따른 데이터 추가
            if ('${order_type}' === 'cart') {
                const cartIds = [];
                $('input[name="cart_id"]').each(function() {
                    cartIds.push($(this).val());
                });
                orderData.cart_id = cartIds;
                console.log("장바구니 결제 - cart_ids:", cartIds);
            } else {
                orderData.product_idx = $('input[name="product_idx"]').val();
                orderData.product_cnt = $('input[name="product_cnt"]').val();
                console.log("단건 결제 - product_idx:", orderData.product_idx);
            }
            
            console.log("서버 전송 데이터:", orderData);
            
            // 서버에 주문 생성 요청
            try {
                const response = await $.ajax({
                    url: '${pageContext.request.contextPath}/order/create_ready.do',
                    type: 'POST',
                    data: orderData,
                    traditional: true,
                    dataType: 'json'
                });
                
                console.log("========================================");
                console.log("서버 응답 성공");
                console.log("========================================");
                console.log("응답 데이터:", response);
                
                if (response.success) {
                    // TossPayments 결제창 호출
                    await callTossPayments(response);
                } else {
                    console.error("서버 오류:", response.message);
                    alert('주문 생성 실패: ' + (response.message || '알 수 없는 오류'));
                    $('#paymentBtn').prop('disabled', false).text('${total_amount}원 결제하기');
                }
            } catch (error) {
                console.error("========================================");
                console.error("서버 요청 실패");
                console.error("========================================");
                console.error("Error:", error);
                alert('서버 요청 중 오류가 발생했습니다.');
                $('#paymentBtn').prop('disabled', false).text('${total_amount}원 결제하기');
            }
        }
        
        // ========================================
        // TossPayments 결제창 호출 - 공식 문서 방식
        // ========================================
        async function callTossPayments(orderData) {
            console.log("========================================");
            console.log("TossPayments 결제창 호출");
            console.log("========================================");
            console.log("payment_key:", orderData.payment_key);
            console.log("order_name:", orderData.order_name);
            console.log("amount:", orderData.amount);
            
            const paymentMethod = $('select[name="payment_method"]').val();
            const customerName = $('input[name="order_mem_name"]').val();
            const customerPhone = $('input[name="order_phone"]').val().replace(/-/g, '');
            
            console.log("method:", paymentMethod);
            console.log("customer:", customerName, customerPhone);
            
            try {
                // payment.requestPayment()
                await payment.requestPayment({
                    method: paymentMethod, // "CARD", "TRANSFER", "VIRTUAL_ACCOUNT" 등
                    amount: {
                        currency: "KRW",
                        value: orderData.amount
                    },
                    orderId: orderData.payment_key,
                    orderName: orderData.order_name, 
                    successUrl: window.location.origin + '${pageContext.request.contextPath}/payment/success.do',
                    failUrl: window.location.origin + '${pageContext.request.contextPath}/payment/fail.do',
                    customerEmail: "${user.mem_email}",
                    customerName: customerName,
                    customerMobilePhone: customerPhone,
                    // 카드 결제 옵션 (필요시)
                    card: {
                        useEscrow: false,
                        flowMode: "DEFAULT",
                        useCardPoint: false,
                        useAppCardOnly: false
                    }
                });
                
                console.log("결제 요청 완료");
                
            } catch (error) {
                console.error("TossPayments 에러");
                console.error("Error:", error);
                console.error("Error code:", error.code);
                console.error("Error message:", error.message);
                
                if (error.code === 'USER_CANCEL') {
                    alert('결제를 취소하셨습니다.');
                } else if (error.code === 'INVALID_CARD_COMPANY') {
                    alert('유효하지 않은 카드사입니다.');
                } else {
                    alert('결제 중 오류가 발생했습니다: ' + (error.message || '알 수 없는 오류'));
                }
                
                $('#paymentBtn').prop('disabled', false).text('${total_amount}원 결제하기');
            }
        }
    </script>
</body>
</html>
