<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OneTouch - 주문/결제</title>
    
    <!-- TossPayments SDK v2 -->
    <script src="https://js.tosspayments.com/v2/standard"></script>
    
    <style>
body {
    background: #f5f7fa !important;
}

/* 주문 페이지 컨테이너 */
.order-container {
    max-width: 1300px;
    margin: 40px auto;
    padding: 0 40px;
}

.page-title {
    font-size: 28px;
    font-weight: bold;
    color: #1a237e;
    margin-bottom: 30px;
    text-align: center;
}

/* 스텝 인디케이터 */
.steps {
    display: flex;
    justify-content: center;
    margin-bottom: 40px;
}

.step {
    display: flex;
    align-items: center;
    gap: 8px;
}

.step-number {
    width: 32px;
    height: 32px;
    border-radius: 50%;
    background: #e0e0e0;
    color: #999;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: 600;
    font-size: 14px;
}

.step.active .step-number {
    background: #1a237e;
    color: white;
}

.step-label {
    color: #999;
    font-size: 14px;
}

.step.active .step-label {
    color: #1a237e;
    font-weight: 600;
}

.step-arrow {
    margin: 0 20px;
    color: #e0e0e0;
    font-size: 18px;
}

/* 레이아웃 - 좌우 2단 구조 */
.order-layout {
    display: grid;
    grid-template-columns: minmax(0, 1fr) minmax(0, 400px); /* minmax(0, ...) 사용 */
    gap: 30px;
    align-items: start;
}

/* main-content 영역 */
.main-content {
    display: block;
    width: 100%;
}

@media (max-width: 992px) {
    .order-layout {
        grid-template-columns: 1fr;
    }
    
    .order-container {
        padding: 0 20px;
    }
}

/* 섹션 스타일 */
.section {
    display: block;
    background: white;
    border-radius: 12px;
    padding: 30px;
    margin-bottom: 20px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.05);
}

/* 섹션 타이틀 - 크기 증가 및 왼쪽 정렬 */
.section-title {
    display: block !important;
    font-size: 22px !important;
    font-weight: bold !important;
    color: #1a237e !important;
    margin-top : 0px;
    margin-bottom: 24px !important;
    padding-bottom: 20px !important;
    border-bottom: 2px solid #1a237e !important;
    text-align: left !important;
    writing-mode: horizontal-tb !important;
    text-orientation: mixed !important;
    direction: ltr !important;
    width: 100% !important;
    white-space: nowrap !important; /* 줄바꿈 방지 */
    word-break: keep-all !important; /* CJK 텍스트 단어 단위 유지 */
    overflow-wrap: normal !important;
}


.section-title2 {
	weight: 300px;
    display: block !important;
    font-size: 22px !important;
    font-weight: bold !important;
    color: #1a237e !important;
    margin-bottom: 24px !important;
    padding-bottom: 20px !important;
    border-bottom: 2px solid #1a237e !important;
    text-align: left !important;
    writing-mode: horizontal-tb !important;
    text-orientation: mixed !important;
    direction: ltr !important;
    width: 100% !important;
    white-space: nowrap !important; /* 줄바꿈 방지 */
    word-break: keep-all !important; /* CJK 텍스트 단어 단위 유지 */
    overflow-wrap: normal !important;
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
    width: 100px;
    height: 100px;
    background: #f5f5f5;
    border-radius: 8px;
    flex-shrink: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    border: 1px solid #e0e0e0;
    overflow: hidden;
}

.product-image img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.product-image.no-image {
    color: #999;
    font-size: 12px;
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

.product-option {
    font-size: 13px;
    color: #666;
    margin-bottom: 4px;
}

.product-quantity {
    font-size: 14px;
    color: #999;
}

.product-price {
    text-align: right;
}

.product-price-value {
    font-size: 18px;
    font-weight: bold;
    color: #1a237e;
}

/* 폼 스타일 */
.form-group {
    margin-bottom: 20px;
}

.form-label {
    display: block;
    font-size: 14px;
    font-weight: 600;
    color: #333;
    margin-bottom: 8px;
}

.form-label.required::after {
    content: '*';
    color: #d32f2f;
    margin-left: 4px;
}

.form-input {
    width: 100%;
    padding: 12px;
    border: 1px solid #e0e0e0;
    border-radius: 8px;
    font-size: 14px;
}

.form-input:focus {
    outline: none;
    border-color: #1a237e;
}

.form-row {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 12px;
}

@media (max-width: 768px) {
    .form-row {
        grid-template-columns: 1fr;
    }
}

/* 배송지 정보 */
.address-actions {
    display: flex;
    gap: 8px;
    margin-bottom: 16px;
}

.btn-small {
    padding: 8px 16px;
    border: 1px solid #e0e0e0;
    background: white;
    border-radius: 6px;
    font-size: 13px;
    cursor: pointer;
    transition: all 0.3s;
}

.btn-small:hover {
    border-color: #1a237e;
    color: #1a237e;
}

.btn-primary-small {
    background: #1a237e;
    color: white;
    border: none;
}

.btn-primary-small:hover {
    background: #3949ab;
}

/* 주소 검색 버튼 */
.address-search-row {
    display: grid;
    grid-template-columns: 1fr 120px;
    gap: 8px;
}

/* 결제 수단 */
.payment-methods {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 12px;
}

@media (max-width: 768px) {
    .payment-methods {
        grid-template-columns: 1fr;
    }
}

.payment-method {
    padding: 20px;
    border: 2px solid #e0e0e0;
    border-radius: 8px;
    text-align: center;
    cursor: pointer;
    transition: all 0.3s;
}

.payment-method:hover {
    border-color: #1a237e;
}

.payment-method.selected {
    border-color: #1a237e;
    background: #f5f7ff;
}

.payment-method input[type="radio"] {
    display: none;
}

.payment-icon {
    font-size: 32px;
    margin-bottom: 8px;
}

.payment-label {
    font-size: 14px;
    font-weight: 500;
}

/* 약관 동의 */
.agreement {
    margin-bottom: 12px;
}

.agreement-all {
    background: #f8f9fa;
    padding: 16px;
    border-radius: 8px;
    margin-bottom: 16px;
}

.agreement label {
    display: flex;
    align-items: center;
    gap: 8px;
    cursor: pointer;
}

.agreement input[type="checkbox"] {
    width: 18px;
    height: 18px;
    cursor: pointer;
}

/* 주문 요약 - 세로 정렬 완전 차단 */
.order-summary {
    display: block !important;
    background: white;
    border-radius: 12px;
    padding: 30px;
    height: fit-content;
    position: sticky;
    top: 20px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.05);
    width: 100%;
    white-space: normal !important; /* 일반 줄바꿈 허용 */
    word-break: keep-all !important; /* CJK 단어 단위 유지 */
}

.order-summary * {
    writing-mode: horizontal-tb !important;
    text-orientation: mixed !important;
    word-break: keep-all !important; /* 모든 자식 요소에도 적용 */
}

.summary-item {
    display: flex;
    justify-content: space-between;
    padding: 12px 0;
    font-size: 15px;
}

.summary-divider {
    border-top: 1px solid #e0e0e0;
    margin: 16px 0;
}

.summary-total {
    display: flex;
    justify-content: space-between;
    font-size: 18px;
    font-weight: bold;
    color: #1a237e;
}

.summary-total .amount {
    font-size: 24px;
}

.delivery-message {
    font-size: 13px;
    color: #666;
    margin-top: 8px;
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
    font-weight: bold;
    cursor: pointer;
    transition: all 0.3s;
    margin-top: 20px;
}

.btn-payment:hover {
    background: #3949ab;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(26, 35, 126, 0.3);
}

.btn-payment:disabled {
    background: #ccc;
    cursor: not-allowed;
    transform: none;
}
    </style>
</head>
<body>

    <c:import url="../common/header.jsp" />

    <div class="order-container">
        <h1 class="page-title">주문/결제</h1>

        <!-- 스텝 인디케이터 -->
        <div class="steps">
            <div class="step">
                <div class="step-number">1</div>
                <span class="step-label">장바구니</span>
            </div>
            <div class="step-arrow">→</div>
            <div class="step active">
                <div class="step-number">2</div>
                <span class="step-label">주문/결제</span>
            </div>
            <div class="step-arrow">→</div>
            <div class="step">
                <div class="step-number">3</div>
                <span class="step-label">주문완료</span>
            </div>
        </div>

        <div class="order-layout">
            <!-- 메인 컨텐츠 -->
            <div class="main-content">
                <!-- 주문 상품 -->
                <div class="section">
                    <h2 class="section-title">주문 상품</h2>
                    <div id="orderProducts">
                         <c:choose>
                            <%-- 재결제 --%>
				            <c:when test="${order_type == 'repay'}">
				                <c:forEach var="item" items="${item_list}">
				                    <div class="product-item">
				                        <c:choose>
				                            <c:when test="${not empty item.product_image_url}">
				                                <div class="product-image">
				                                    <img src="${pageContext.request.contextPath}/images/products_list/${item.product_image_url}" 
				                                         alt="${item.product_name}"
				                                         onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/images/default.png'; this.style.opacity='0.5';">
				                                </div>
				                            </c:when>
				                            <c:otherwise>
				                                <div class="product-image">상품</div>
				                            </c:otherwise>
				                        </c:choose>
				                        <div class="product-info">
				                            <div class="product-name">${item.product_name}</div>
				                            <div class="product-quantity">수량: ${item.product_cnt}개</div>
				                        </div>
				                        <div class="product-price">
				                            <div class="product-price-value">
				                                <fmt:formatNumber value="${item.total_amount}" pattern="#,###"/>원
				                            </div>
				                        </div>
				                    </div>
				                </c:forEach>
				                <input type="hidden" name="order_id" value="${order_id}">
				            </c:when>
			                <%-- 장바구니 결제 --%>
			                <c:when test="${order_type == 'cart'}">
			                    <c:forEach var="cart" items="${cart_list}">
			                        <div class="product-item">
			                            <c:choose>
			                                <c:when test="${not empty cart.product_image_url}">
			                                    <div class="product-image">
			                                        <img src="${pageContext.request.contextPath}/images/products_list/${cart.product_image_url}" 
			                                             alt="${cart.product_name}"
			                                             onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/images/default.png'; this.style.opacity='0.5';">
			                                    </div>
			                                </c:when>
			                                <c:otherwise>
			                                    <div class="product-image no-image">상품</div>
			                                </c:otherwise>
			                            </c:choose>
			                            <div class="product-info">
			                                <div class="product-name">${cart.product_name}</div>
			                                <div class="product-quantity">수량: ${cart.cart_cnt}개</div>
			                            </div>
			                            <div class="product-price">
			                                <div class="product-price-value">
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
			                        <c:choose>
			                            <c:when test="${not empty product.product_image_url}">
			                                <div class="product-image">
			                                    <img src="${pageContext.request.contextPath}/images/${product.product_image_url}" 
			                                         alt="${product.product_name}"
			                                         onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/images/default.png'; this.style.opacity='0.5';">
			                                </div>
			                            </c:when>
			                            <c:otherwise>
			                                <div class="product-image no-image">상품</div>
			                            </c:otherwise>
			                        </c:choose>
			                        <div class="product-info">
			                            <div class="product-name">${product.product_name}</div>
			                            <div class="product-quantity">수량: ${param.product_cnt}개</div>
			                        </div>
			                        <div class="product-price">
			                            <div class="product-price-value">
			                                <fmt:formatNumber value="${total_amount}" pattern="#,###"/>원
			                            </div>
			                        </div>
			                    </div>
			                    <input type="hidden" name="product_idx" value="${product.product_idx}">
			                    <input type="hidden" name="product_cnt" value="${param.product_cnt}">
			                </c:otherwise>
			            </c:choose>
                    </div>
                </div>

				<div class="section">
				    <h2 class="section-title">주문자 정보</h2>
				    <div class="form-group">
				        <label class="form-label required">이름</label>
				        <input type="text" class="form-input" name="order_mem_name" id="ordererName"
				               value="${order_type == 'repay' ? order.order_mem_name : user.mem_name}" required>
				    </div>
				    <div class="form-row">
				        <div class="form-group">
				            <label class="form-label required">이메일</label>
				            <input type="email" class="form-input" name="order_email" id="ordererEmail"
				                   value="${user.mem_email}" required>
				        </div>
				        <div class="form-group">
				            <label class="form-label required">휴대폰</label>
				            <input type="tel" class="form-input" name="order_phone" id="ordererPhone"
				                   value="${order_type == 'repay' ? order.order_phone : user.mem_phone}" 
				                   placeholder="010-1234-5678" required>
				        </div>
				    </div>
				</div>
				
				<!-- 배송지 정보 -->
				<div class="section">
				    <h2 class="section-title">배송지 정보</h2>
				    
				    <div class="address-actions">
				        <button type="button" class="btn-small btn-primary-small" onclick="sameAsOrderer()">
				            주문자 정보와 동일
				        </button>
				    </div>
				
				    <div class="form-group">
				        <label class="form-label required">수령인</label>
				        <input type="text" class="form-input" name="recipient_name" id="recipientName" 
				               value="${order_type == 'repay' ? order.order_mem_name : ''}" required>
				    </div>
				
				    <div class="form-group">
				        <label class="form-label required">휴대폰</label>
				        <input type="tel" class="form-input" name="recipient_phone" id="recipientPhone" 
				               value="${order_type == 'repay' ? order.order_phone : ''}"
				               placeholder="010-1234-5678" required>
				    </div>
				
				    <div class="form-group">
				        <label class="form-label required">주소</label>
				        <div class="address-search-row">
				            <input type="text" class="form-input" name="order_postal" id="zipCode" 
				                   value="${order_type == 'repay' ? order.order_postal : ''}"
				                   placeholder="우편번호" readonly required>
				            <button type="button" class="btn-small btn-primary-small" onclick="searchAddress()">
				                주소검색
				            </button>
				        </div>
				    </div>
				
				    <div class="form-group">
				        <input type="text" class="form-input" name="order_address" id="address" 
				               value="${order_type == 'repay' ? order.order_address : ''}"
				               placeholder="기본주소" readonly required>
				    </div>
				
				    <div class="form-group">
				        <input type="text" class="form-input" name="order_address_more" id="addressDetail" 
				               value="${order_type == 'repay' ? order.order_address_more : ''}"
				               placeholder="상세주소">
				    </div>
				
				    <div class="form-group">
				        <label class="form-label">배송 요청사항</label>
				        <input type="text" class="form-input" name="delivery_request" id="deliveryRequest" 
				               placeholder="예: 부재 시 문 앞에 놓아주세요">
				    </div>
				</div>


                <!-- 결제 수단 -->
                <div class="section">
                    <h2 class="section-title">결제 수단</h2>
                    <div class="payment-methods">
                        <div class="payment-method selected" onclick="selectPayment('CARD')">
                            <input type="radio" name="payment_method" value="CARD" checked>
                            <div class="payment-icon">💳</div>
                            <div class="payment-label">신용카드</div>
                        </div>
                        <div class="payment-method" onclick="selectPayment('TRANSFER')">
                            <input type="radio" name="payment_method" value="TRANSFER">
                            <div class="payment-icon">🏦</div>
                            <div class="payment-label">계좌이체</div>
                        </div>
                        <div class="payment-method" onclick="selectPayment('VIRTUAL_ACCOUNT')">
                            <input type="radio" name="payment_method" value="VIRTUAL_ACCOUNT">
                            <div class="payment-icon">🧾</div>
                            <div class="payment-label">가상계좌</div>
                        </div>
                    </div>
                </div>

                <!-- 약관 동의 -->
                <div class="section">
                    <h2 class="section-title">약관 동의</h2>
                    
                    <div class="agreement-all">
                        <label>
                            <input type="checkbox" id="agreeAll" onchange="toggleAllAgreements()">
                            <strong>전체 동의</strong>
                        </label>
                    </div>

                    <div class="agreement">
                        <label>
                            <input type="checkbox" class="agreement-checkbox" id="agreeTerms" required>
                            [필수] 구매조건 확인 및 결제진행 동의
                        </label>
                    </div>
                    <div class="agreement">
                        <label>
                            <input type="checkbox" class="agreement-checkbox" id="agreePrivacy" required>
                            [필수] 개인정보 제3자 제공 동의
                        </label>
                    </div>
                    <div class="agreement">
                        <label>
                            <input type="checkbox" class="agreement-checkbox" id="agreeMarketing">
                            [선택] 마케팅 정보 수신 동의
                        </label>
                    </div>
                </div>
            </div>

            <aside class="order-summary">
                <h3 class="section-title2">주문 요약</h3>
                
                <div class="summary-total">
                    <span>총 결제금액</span>
                    <span class="amount" id="totalAmount">
                         <fmt:formatNumber value="${total_amount}" pattern="#,###"/>원
                    </span>
                </div>

                <button type="button" class="btn-payment" id="paymentBtn" onclick="requestPayment()">
                    <span id="paymentAmount">
                         <fmt:formatNumber value="${total_amount}" pattern="#,###"/>원
                    </span> 결제하기
                </button>
            </aside>
        </div>
    </div>

    <!-- 푸터 (템플릿) -->
    <c:import url="../common/footer.jsp" />

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    
    <!-- Daum 우편번호 API -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
    <script>
        // TossPayments 초기화
        const clientKey = "test_ck_AQ92ymxN34R7WM667J94rajRKXvd";
        const customerKey = "CUSTOMER_${user.mem_idx}";
        
        console.log("TossPayments 초기화 시작");
        const tossPayments = TossPayments(clientKey);
        const payment = tossPayments.payment({ customerKey });
        console.log("TossPayments 초기화 완료");
        
        let selectedPaymentMethod = 'CARD';
        
        // 주문자 정보와 동일
        function sameAsOrderer() {
            $('#recipientName').val($('#ordererName').val());
            $('#recipientPhone').val($('#ordererPhone').val());
        }
        
        // 주소 검색
        function searchAddress() {
            new daum.Postcode({
                oncomplete: function(data) {
                    $('input[name="order_postal"]').val(data.zonecode);
                    $('input[name="order_address"]').val(data.address);
                    $('input[name="order_address_more"]').focus();
                }
            }).open();
        }
        
        // 결제 수단 선택
        function selectPayment(method) {
            selectedPaymentMethod = method;
            
            $('.payment-method').removeClass('selected');
            event.currentTarget.classList.add('selected');
            
            const radio = event.currentTarget.querySelector('input[type="radio"]');
            radio.checked = true;
        }
        
        // 전체 동의 토글
        function toggleAllAgreements() {
            const agreeAll = $('#agreeAll').is(':checked');
            $('.agreement-checkbox').prop('checked', agreeAll);
        }
        
        // 개별 체크박스 변경 시
        $('.agreement-checkbox').on('change', function() {
            const allChecked = $('.agreement-checkbox').length === 
                             $('.agreement-checkbox:checked').length;
            $('#agreeAll').prop('checked', allChecked);
        });
        
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
	    console.log("결제 요청 시작");
	    
	    // 폼 유효성 검사
	    if (!validateForm()) {
	        return;
	    }
	    
	    // 필수 약관 동의 확인
	    if (!$('#agreeTerms').is(':checked') || !$('#agreePrivacy').is(':checked')) {
	        alert('필수 약관에 동의해주세요.');
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
	        payment_method: selectedPaymentMethod
	    };
	    
	    // 주문 타입에 따른 데이터 추가
	    if ('${order_type}' === 'repay') {
	        // ⭐ 재결제: 기존 order_id 전달
	        orderData.order_id = $('input[name="order_id"]').val();
	        console.log("재결제 - order_id:", orderData.order_id);
	        
	    } else if ('${order_type}' === 'cart') {
	        // 장바구니 결제
	        const cartIds = [];
	        $('input[name="cart_id"]').each(function() {
	            cartIds.push($(this).val());
	        });
	        orderData.cart_id = cartIds;
	        console.log("장바구니 결제 - cart_ids:", cartIds);
	        
	    } else {
	        // 단건 결제
	        orderData.product_idx = $('input[name="product_idx"]').val();
	        orderData.product_cnt = $('input[name="product_cnt"]').val();
	        console.log("단건 결제 - product_idx:", orderData.product_idx);
	    }
	    
	    console.log("서버 전송 데이터:", orderData);
	    
	    // 서버에 주문 생성/업데이트 요청
	    try {
	        const response = await $.ajax({
	            url: '${pageContext.request.contextPath}/order/create_ready.do',
	            type: 'POST',
	            data: orderData,
	            traditional: true,
	            dataType: 'json'
	        });
	        
	        console.log("서버 응답 성공:", response);
	        
	        if (response.success) {
	            // TossPayments 결제창 호출
	            await callTossPayments(response);
	        } else {
	            console.error("서버 오류:", response.message);
	            alert('주문 생성 실패: ' + (response.message || '알 수 없는 오류'));
	            resetPaymentButton();
	        }
	    } catch (error) {
	        console.error("서버 요청 실패:", error);
	        alert('서버 요청 중 오류가 발생했습니다.');
	        resetPaymentButton();
	    }
	}        
        // ========================================
        // TossPayments 결제창 호출
        // ========================================
        async function callTossPayments(orderData) {
            console.log("========================================");
            console.log("TossPayments 결제창 호출");
            console.log("========================================");
            console.log("payment_key:", orderData.payment_key);
            console.log("order_name:", orderData.order_name);
            console.log("amount:", orderData.amount);
            
            const customerName = '${order.order_mem_name}';
            const customerPhone = '${order.order_phone}'.replace(/-/g, '');
            
            // ✅ order_name이 없으면 기본값 사용
            const orderName = orderData.order_name || '${order.order_name}' || '재결제 주문';
            
            if (!orderName || orderName === '' || orderName === 'null') {
                console.error("❌ orderName이 비어있습니다!");
                alert('주문명을 불러올 수 없습니다. 페이지를 새로고침해주세요.');
                resetPaymentButton();
                return;
            }
            
            console.log("최종 orderName:", orderName);
            
            try {
                await payment.requestPayment({
                    method: selectedPaymentMethod,
                    amount: {
                        currency: "KRW",
                        value: orderData.amount
                    },
                    orderId: orderData.payment_key,
                    orderName: orderName,  // ✅ 검증된 orderName 사용
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
                
                console.log("✅ 결제 요청 완료");
                
            } catch (error) {
                console.error("❌ TossPayments 에러:", error);
                
                // ✅ 에러 발생 시 직접 failUrl로 리다이렉트
                const failUrl = window.location.origin + '${pageContext.request.contextPath}/payment/fail.do';
                const params = new URLSearchParams({
                    code: error.code || 'UNKNOWN_ERROR',
                    message: error.message || '알 수 없는 오류',
                    orderId: orderData.payment_key
                });
                
                if (error.code === 'USER_CANCEL') {
                    console.log('사용자가 결제를 취소했습니다.');
                } else {
                    alert('결제 중 오류가 발생했습니다: ' + (error.message || '알 수 없는 오류'));
                }
                
                // ✅ failUrl로 리다이렉트
                window.location.href = failUrl + '?' + params.toString();
            }
        }

    </script>
</body>
</html>
