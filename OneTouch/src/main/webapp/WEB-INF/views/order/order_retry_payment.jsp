<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OneTouch - 재결제</title>
    
    <!-- TossPayments SDK v2 -->
    <script src="https://js.tosspayments.com/v2/standard"></script>
    
    <style>
body {
    background: #f5f7fa !important;
}

.order-container {
    max-width: 900px;
    margin: 40px auto;
    padding: 0 40px;
}

.page-title {
    font-size: 28px;
    font-weight: bold;
    color: #1a237e;
    margin-bottom: 10px;
    text-align: center;
}

.page-subtitle {
    text-align: center;
    color: #666;
    font-size: 14px;
    margin-bottom: 40px;
}

.section {
    background: white;
    border-radius: 12px;
    padding: 30px;
    margin-bottom: 20px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.05);
}

.section-title {
    font-size: 20px;
    font-weight: bold;
    color: #1a237e;
    margin-bottom: 20px;
    padding-bottom: 16px;
    border-bottom: 2px solid #1a237e;
}

/* 알림 박스 */
.alert-info {
    background: #e3f2fd;
    border: 1px solid #90caf9;
    border-radius: 8px;
    padding: 16px;
    margin-bottom: 20px;
    color: #1976d2;
}

.alert-warning {
    background: #fff3e0;
    border: 1px solid #ffb74d;
    border-radius: 8px;
    padding: 16px;
    margin-bottom: 20px;
    color: #e65100;
}

/* 주문 상품 */
.product-item {
    display: flex;
    gap: 16px;
    padding: 20px 0;
    border-bottom: 1px solid #f0f0f0;
}

.product-item:last-child {
    border-bottom: none;
}

.product-image {
    width: 80px;
    height: 80px;
    background: #f5f5f5;
    border-radius: 8px;
    flex-shrink: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    border: 1px solid #e0e0e0;
}

.product-info {
    flex: 1;
}

.product-name {
    font-size: 16px;
    font-weight: 600;
    color: #333;
    margin-bottom: 8px;
}

.product-quantity {
    font-size: 14px;
    color: #666;
}

.product-price {
    text-align: right;
}

.product-price-value {
    font-size: 18px;
    font-weight: bold;
    color: #1a237e;
}

/* 배송지 정보 */
.info-row {
    display: flex;
    justify-content: space-between;
    padding: 12px 0;
    border-bottom: 1px solid #f0f0f0;
}

.info-row:last-child {
    border-bottom: none;
}

.info-label {
    font-weight: 600;
    color: #666;
}

.info-value {
    color: #333;
    text-align: right;
}

/* 결제 요약 */
.summary-row {
    display: flex;
    justify-content: space-between;
    padding: 12px 0;
    font-size: 14px;
}

.summary-total {
    display: flex;
    justify-content: space-between;
    padding: 20px 0;
    border-top: 2px solid #1a237e;
    margin-top: 12px;
    font-size: 18px;
    font-weight: bold;
}

.summary-total .amount {
    color: #1a237e;
    font-size: 24px;
}

/* 결제 버튼 */
.btn-payment {
    width: 100%;
    padding: 18px;
    background: #1a237e;
    color: white;
    border: none;
    border-radius: 8px;
    font-size: 18px;
    font-weight: 600;
    cursor: pointer;
    margin-top: 20px;
    transition: all 0.3s;
}

.btn-payment:hover:not(:disabled) {
    background: #0d1642;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(26, 35, 126, 0.3);
}

.btn-payment:disabled {
    background: #ccc;
    cursor: not-allowed;
}

.btn-cancel {
    width: 100%;
    padding: 14px;
    background: white;
    color: #666;
    border: 1px solid #ddd;
    border-radius: 8px;
    font-size: 16px;
    font-weight: 600;
    cursor: pointer;
    margin-top: 12px;
    transition: all 0.3s;
}

.btn-cancel:hover {
    background: #f5f5f5;
}
    </style>
</head>

<body>
    <!-- 헤더 -->
    <c:import url="../common/header.jsp" />

    <div class="order-container">
        <h1 class="page-title">재결제</h1>
        <p class="page-subtitle">이전 결제가 완료되지 않은 주문입니다. 결제를 다시 진행해주세요.</p>

        <!-- 알림 -->
        <div class="alert-info">
            <strong>📌 주문번호: ${order.order_no}</strong><br>
            배송지 정보는 기존 주문 내용과 동일하게 유지됩니다.
        </div>

        <!-- order_items가 비어있을 때 경고 -->
        <c:if test="${empty order_items}">
            <div class="alert-warning">
                <strong>⚠️ 주문 상품 정보를 불러올 수 없습니다.</strong><br>
                새로운 주문을 진행해주세요.
            </div>
        </c:if>

        <!-- 주문 상품 정보 -->
        <c:if test="${not empty order_items}">
            <div class="section">
                <h2 class="section-title">주문 상품</h2>
                <c:forEach var="item" items="${order_items}">
                    <div class="product-item">
                        <div class="product-image">
                            <span style="color: #999; font-size: 12px;">상품 이미지</span>
                        </div>
                        <div class="product-info">
                            <div class="product-name">${item.product_name}</div>
                            <div class="product-quantity">
                                수량: ${item.product_cnt}개 | 
                                단가: <fmt:formatNumber value="${item.product_amount}" pattern="#,###"/>원
                            </div>
                        </div>
                        <div class="product-price">
                            <div class="product-price-value">
                                <fmt:formatNumber value="${item.total_amount}" pattern="#,###"/>원
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <!-- 배송지 정보 -->
            <div class="section">
                <h2 class="section-title">배송지 정보</h2>
                <div class="info-row">
                    <span class="info-label">받는 분</span>
                    <span class="info-value">${order.order_mem_name}</span>
                </div>
                <div class="info-row">
                    <span class="info-label">연락처</span>
                    <span class="info-value">${order.order_phone}</span>
                </div>
                <div class="info-row">
                    <span class="info-label">배송지</span>
                    <span class="info-value">
                        (${order.order_postal}) ${order.order_address} ${order.order_address_more}
                    </span>
                </div>
            </div>

            <!-- 결제 정보 -->
            <div class="section">
                <h2 class="section-title">결제 정보</h2>
                
                <div class="summary-row">
                    <span>상품 금액</span>
                    <span><fmt:formatNumber value="${order.total_amount}" pattern="#,###"/>원</span>
                </div>
                <div class="summary-row">
                    <span>배송비</span>
                    <span>무료</span>
                </div>
                
                <div class="summary-total">
                    <span>총 결제금액</span>
                    <span class="amount" id="totalAmount">
                        <fmt:formatNumber value="${order.total_amount}" pattern="#,###"/>원
                    </span>
                </div>

                <button type="button" class="btn-payment" id="paymentBtn" onclick="requestPayment()">
                    <span id="paymentAmount">
                        <fmt:formatNumber value="${order.total_amount}" pattern="#,###"/>원
                    </span> 결제하기
                </button>
                
                <button type="button" class="btn-cancel" onclick="location.href='${pageContext.request.contextPath}/order/list.do'">
                    취소
                </button>
            </div>
        </c:if>
    </div>

    <!-- 푸터 -->
    <c:import url="../common/footer.jsp" />

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    
    <script>
        // TossPayments 초기화 (기존 order_form.jsp와 동일)
        const clientKey = "test_ck_AQ92ymxN34R7WM667J94rajRKXvd";
        const customerKey = "CUSTOMER_${user.mem_idx}";
        
        console.log("=== 재결제 페이지 ===");
        console.log("TossPayments 초기화 시작");
        const tossPayments = TossPayments(clientKey);
        const payment = tossPayments.payment({ customerKey });
        console.log("TossPayments 초기화 완료");
        
        let selectedPaymentMethod = 'CARD';  // 기본 카드 결제
        
        // 결제 요청 함수 (기존 order_form.jsp와 동일)
        async function requestPayment() {
            console.log("결제 요청 시작");
            
            // 중복 클릭 방지
            $('#paymentBtn').prop('disabled', true).text('처리 중...');
            
            // 재결제 데이터
            const orderData = {
                order_type: 'retry',  // 재결제 플래그
                order_id: '${order.order_id}',  // 기존 주문 ID
                order_mem_name: '${order.order_mem_name}',
                order_phone: '${order.order_phone}',
                order_postal: '${order.order_postal}',
                order_address: '${order.order_address}',
                order_address_more: '${order.order_address_more}',
                payment_method: selectedPaymentMethod
            };
            
            console.log("서버 전송 데이터:", orderData);
            
            // 서버에 주문 준비 요청
            try {
                const response = await $.ajax({
                    url: '${pageContext.request.contextPath}/order/create_ready.do',
                    type: 'POST',
                    data: orderData,
                    dataType: 'json'
                });
                
                console.log("서버 응답 성공:", response);
                
                if (response.success) {
                    // TossPayments 결제창 호출
                    await callTossPayments(response);
                } else {
                    console.error("서버 오류:", response.message);
                    alert('결제 준비 실패: ' + (response.message || '알 수 없는 오류'));
                    resetPaymentButton();
                }
            } catch (error) {
                console.error("서버 요청 실패:", error);
                alert('서버 요청 중 오류가 발생했습니다.');
                resetPaymentButton();
            }
        }
        
        // TossPayments 결제창 호출 (기존 order_form.jsp와 동일)
        async function callTossPayments(orderData) {
            console.log("========================================");
            console.log("TossPayments 결제창 호출");
            console.log("========================================");
            console.log("payment_key:", orderData.payment_key);
            console.log("order_name:", orderData.order_name);
            console.log("amount:", orderData.amount);
            
            const customerName = '${order.order_mem_name}';
            const customerPhone = '${order.order_phone}'.replace(/-/g, '');
            
            try {
                await payment.requestPayment({
                    method: selectedPaymentMethod,
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
                    card: {
                        useEscrow: false,
                        flowMode: "DEFAULT",
                        useCardPoint: false,
                        useAppCardOnly: false
                    }
                });
                
                console.log("결제 요청 완료");
                
            } catch (error) {
                console.error("TossPayments 에러:", error);
                
                if (error.code === 'USER_CANCEL') {
                    alert('결제를 취소하셨습니다.');
                } else {
                    alert('결제 중 오류가 발생했습니다: ' + (error.message || '알 수 없는 오류'));
                }
                
                resetPaymentButton();
            }
        }
        
        // 결제 버튼 초기화
        function resetPaymentButton() {
            $('#paymentBtn').prop('disabled', false).html('<fmt:formatNumber value="${order.total_amount}" pattern="#,###"/>원 결제하기');
        }
    </script>
</body>
</html>
