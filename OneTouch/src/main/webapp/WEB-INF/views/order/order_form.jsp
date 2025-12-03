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
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
    
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



.custom-swal-popup {
    border-radius: 20px !important;
    box-shadow: 0 20px 60px rgba(0, 0, 0, 0.15) !important;
    border: none !important;
    padding: 0 !important;
    background: linear-gradient(135deg, #ffffff 0%, #f8f9fa 100%) !important;
}

.custom-swal-title {
    color: #2c3e50 !important;
    font-size: 24px !important;
    font-weight: 700 !important;
    margin-bottom: 10px !important;
    font-family: 'Noto Sans KR', -apple-system, BlinkMacSystemFont, sans-serif !important;
}

.custom-swal-content {
    color: #5a6c7d !important;
    font-size: 16px !important;
    line-height: 1.6 !important;
    margin-bottom: 20px !important;
    font-family: 'Noto Sans KR', -apple-system, BlinkMacSystemFont, sans-serif !important;
}

/* SweetAlert2 버튼 스타일링 */
.swal2-confirm {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%) !important;
    border: none !important;
    border-radius: 25px !important;
    padding: 12px 30px !important;
    font-size: 16px !important;
    font-weight: 600 !important;
    box-shadow: 0 8px 25px rgba(102, 126, 234, 0.4) !important;
    transition: all 0.3s ease !important;
}

.swal2-confirm:hover {
    transform: translateY(-2px) !important;
    box-shadow: 0 12px 35px rgba(102, 126, 234, 0.5) !important;
}

.swal2-cancel {
    background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%) !important;
    border: none !important;
    border-radius: 25px !important;
    padding: 12px 30px !important;
    font-size: 16px !important;
    font-weight: 600 !important;
    box-shadow: 0 8px 25px rgba(245, 87, 108, 0.3) !important;
    transition: all 0.3s ease !important;
}

.swal2-cancel:hover {
    transform: translateY(-2px) !important;
    box-shadow: 0 12px 35px rgba(245, 87, 108, 0.4) !important;
}

/* 약관 모달 스타일 대폭 개선 */
.modal {
    position: fixed;
    z-index: 1000;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.7);
    backdrop-filter: blur(5px);
    animation: fadeInBackdrop 0.3s ease;
}

.modal-content {
    background: linear-gradient(135deg, #ffffff 0%, #f8fbff 100%);
    margin: 3% auto;
    padding: 0;
    border: none;
    width: 85%;
    max-width: 700px;
    border-radius: 25px;
    max-height: 85vh;
    overflow: hidden;
    box-shadow: 0 25px 80px rgba(0, 0, 0, 0.2);
    animation: slideInModal 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
    position: relative;
}

.modal-content::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 4px;
    background: linear-gradient(90deg, #667eea 0%, #764ba2 50%, #667eea 100%);
}

.modal-header {
    padding: 30px 30px 20px;
    background: linear-gradient(135deg, #f8fbff 0%, #ffffff 100%);
    border-bottom: 1px solid rgba(102, 126, 234, 0.1);
    display: flex;
    justify-content: space-between;
    align-items: center;
    position: relative;
}

.modal-header h3 {
    margin: 0;
    color: #2c3e50;
    font-size: 24px;
    font-weight: 700;
    font-family: 'Noto Sans KR', -apple-system, BlinkMacSystemFont, sans-serif;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
}

.close {
    color: #aaa;
    font-size: 32px;
    font-weight: 300;
    cursor: pointer;
    line-height: 1;
    transition: all 0.3s ease;
    border-radius: 50%;
    width: 40px;
    height: 40px;
    display: flex;
    align-items: center;
    justify-content: center;
    background: rgba(0, 0, 0, 0.05);
}

.close:hover {
    color: #f5576c;
    background: rgba(245, 87, 108, 0.1);
    transform: rotate(90deg);
}

.modal-body {
    padding: 30px;
    max-height: 55vh;
    overflow-y: auto;
    line-height: 1.8;
    font-family: 'Noto Sans KR', -apple-system, BlinkMacSystemFont, sans-serif;
    color: #4a5568;
}

.modal-body::-webkit-scrollbar {
    width: 6px;
}

.modal-body::-webkit-scrollbar-track {
    background: #f1f1f1;
    border-radius: 10px;
}

.modal-body::-webkit-scrollbar-thumb {
    background: linear-gradient(135deg, #667eea, #764ba2);
    border-radius: 10px;
}

.modal-body h4 {
    color: #2d3748;
    margin: 25px 0 15px 0;
    font-size: 18px;
    font-weight: 600;
    padding-left: 15px;
    border-left: 4px solid #667eea;
    background: linear-gradient(90deg, rgba(102, 126, 234, 0.1) 0%, transparent 100%);
    padding: 10px 15px;
    border-radius: 0 8px 8px 0;
}

.modal-body p {
    margin-bottom: 12px;
    color: #4a5568;
    font-size: 15px;
    line-height: 1.7;
    padding-left: 10px;
}

.modal-body p strong {
    color: #2d3748;
    font-weight: 600;
}

.modal-footer {
    padding: 25px 30px 30px;
    background: linear-gradient(135deg, #f8fbff 0%, #ffffff 100%);
    border-top: 1px solid rgba(102, 126, 234, 0.1);
    display: flex;
    justify-content: flex-end;
    gap: 15px;
}

.btn {
    padding: 12px 25px;
    border: none;
    border-radius: 25px;
    cursor: pointer;
    font-size: 15px;
    font-weight: 600;
    transition: all 0.3s ease;
    font-family: 'Noto Sans KR', -apple-system, BlinkMacSystemFont, sans-serif;
    position: relative;
    overflow: hidden;
}

.btn::before {
    content: '';
    position: absolute;
    top: 50%;
    left: 50%;
    width: 0;
    height: 0;
    border-radius: 50%;
    background: rgba(255, 255, 255, 0.3);
    transition: all 0.5s ease;
    transform: translate(-50%, -50%);
}

.btn:hover::before {
    width: 300px;
    height: 300px;
}

.btn-primary {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    box-shadow: 0 8px 25px rgba(102, 126, 234, 0.3);
}

.btn-primary:hover {
    transform: translateY(-3px);
    box-shadow: 0 15px 35px rgba(102, 126, 234, 0.4);
}

.btn-secondary {
    background: linear-gradient(135deg, #a8a8a8 0%, #7b7b7b 100%);
    color: white;
    box-shadow: 0 8px 25px rgba(171, 171, 171, 0.3);
}

.btn-secondary:hover {
    transform: translateY(-3px);
    box-shadow: 0 15px 35px rgba(171, 171, 171, 0.4);
}


/* 약관 동의 섹션 - 보기 버튼 오른쪽 배치 */
.section-title {
    color: #333;
    font-size: 24px;
    font-weight: 600;
    margin-bottom: 20px;
    text-align: center;
    border-bottom: 2px solid #007bff;
    padding-bottom: 10px;
}

/* 전체 동의 박스 */
.agreement-all {
    background: #e8f4fd;
    border: 1px solid;
    border-radius: 8px;
    padding: 15px;
    margin-bottom: 15px;
}

.agreement-all label {
    display: flex;
    align-items: center;
    cursor: pointer;
    margin: 0;
}

/* 개별 약관 박스 - 중요! 이게 핵심 */
.agreement {
    background: #f8f9fa;
    border: 1px solid #dee2e6;
    border-radius: 8px;
    padding: 15px;
    margin-bottom: 10px;
    display: flex;
    align-items: center;
    justify-content: space-between; /* 이게 중요! */
}

.agreement:hover {
    border-color: #007bff;
    background: #ffffff;
}

.agreement label {
    display: flex;
    align-items: center;
    cursor: pointer;
    margin: 0;
    flex: 1; /* 라벨이 남은 공간을 모두 차지 */
}

/* 체크박스 스타일 */
input[type="checkbox"] {
    width: 18px;
    height: 18px;
    margin-right: 10px;
    cursor: pointer;
    accent-color: #007bff;
    flex-shrink: 0; /* 체크박스 크기 고정 */
}

/* 텍스트 스타일 */
.agreement-text {
    font-size: 14px;
    color: #333;
    font-weight: 500;
    flex: 1; /* 텍스트가 남은 공간 차지 */
}

.agreement-all .agreement-text {
    font-weight: 600;
    color: black;
}

/* 보기 버튼 - 오른쪽에 위치 */
/* 보기 버튼을 네모 모양으로 변경 */
.btn-view-terms {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 6px; /* 25px에서 6px로 변경 */
    font-size: 13px;
    font-weight: 600;
    cursor: pointer;
    flex-shrink: 0;
    margin-left: 15px;
    transition: all 0.3s ease;
    box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
    position: relative;
    overflow: hidden;
}

.btn-view-terms::before {
    content: '';
    position: absolute;
    top: 50%;
    left: 50%;
    width: 0;
    height: 0;
    border-radius: 50%;
    background: rgba(255, 255, 255, 0.3);
    transition: all 0.5s ease;
    transform: translate(-50%, -50%);
}

.btn-view-terms:hover::before {
    width: 200px;
    height: 200px;
}

.btn-view-terms:hover {
    transform: translateY(-2px) scale(1.05);
    box-shadow: 0 8px 25px rgba(102, 126, 234, 0.4);
}

.btn-view-terms:active {
    transform: translateY(0) scale(1);
}

/* 모바일 반응형 */
@media (max-width: 768px) {
    .agreement {
        flex-direction: column;
        align-items: stretch;
        gap: 10px;
    }
    
    .agreement label {
        width: 100%;
    }
    
    .btn-view-terms {
        align-self: flex-end;
        margin-left: 0;
        margin-top: 8px;
    }
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

       <!-- 약관 동의 HTML 구조 수정 -->
				<div class="section">
				    <h2 class="section-title">약관 동의</h2>
				
				    <div class="agreement-all">
				        <label>
				            <input type="checkbox" id="agreeAll" onchange="toggleAllAgreements()">
				            <span class="agreement-text"><strong>전체 동의</strong></span>
				        </label>
				    </div>
				
				    <div class="agreement">
				        <label>
				            <input type="checkbox" class="agreement-checkbox" id="agreeTerms" required>
				            <span class="agreement-text">[필수] 구매조건 확인 및 결제진행 동의</span>
				        </label>
				        <button type="button" class="btn-view-terms" onclick="openTermsModal('terms')">보기</button>
				    </div>
				    
				    <div class="agreement">
				        <label>
				            <input type="checkbox" class="agreement-checkbox" id="agreePrivacy" required>
				            <span class="agreement-text">[필수] 개인정보 제3자 제공 동의</span>
				        </label>
				        <button type="button" class="btn-view-terms" onclick="openTermsModal('privacy')">보기</button>
				    </div>
				    
				    <div class="agreement">
				        <label>
				            <input type="checkbox" class="agreement-checkbox" id="agreeMarketing">
				            <span class="agreement-text">[선택] 마케팅 정보 수신 동의</span>
				        </label>
				        <button type="button" class="btn-view-terms" onclick="openTermsModal('marketing')">보기</button>
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
				
				<!-- 약관 모달 -->
				<div id="termsModal" class="modal" style="display: none;">
				    <div class="modal-content">
				        <div class="modal-header">
				            <h3 id="modalTitle">약관 내용</h3>
				            <span class="close" onclick="closeTermsModal()">&times;</span>
				        </div>
				        <div class="modal-body">
				            <div id="modalContent">
				                <!-- 약관 내용이 여기에 표시됩니다 -->
				            </div>
				        </div>
				        <div class="modal-footer">
				            <button type="button" class="btn btn-secondary" onclick="closeTermsModal()">취소</button>
				            <button type="button" class="btn btn-primary" id="agreeBtn" onclick="agreeToTerms()">동의</button>
				        </div>
				    </div>
				</div>
				           
            
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
            // 이름, 전화번호 복사
            $('#recipientName').val($('#ordererName').val());
            $('#recipientPhone').val($('#ordererPhone').val());
            
            // 회원 주소 정보를 배송지에 설정
            $('#zipCode').val('${user.mem_postal}');
            $('#address').val('${user.mem_addr}');
            $('#addressDetail').val('${user.mem_addr_more}');
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
	        
	        // 수정: 배열을 쉼표로 join해서 문자열로 전달
	        if (cartIds.length === 0) {
	            alert('선택된 상품이 없습니다.');
	            resetPaymentButton();
	            return;
	        }
	        
	        orderData.cart_ids = cartIds.join(',');  // cart_ids (복수), 문자열로 변환
	        console.log("장바구니 결제 - cart_ids:", orderData.cart_ids);
	        
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
            
            const paymentMethod = selectedPaymentMethod;  // ⭐ 수정: 전역변수 사용
            const customerName = $('input[name="order_mem_name"]').val();
            const customerPhone = $('input[name="order_phone"]').val().replace(/-/g, '');
            
            console.log("method:", paymentMethod);
            console.log("customer:", customerName, customerPhone);
            
            try {
                // payment.requestPayment()
                await payment.requestPayment({	
                    method: paymentMethod,
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
                
                resetPaymentButton();
            }
        }
        
        // 결제 버튼 초기화
        function resetPaymentButton() {
            $('#paymentBtn').prop('disabled', false).html('<fmt:formatNumber value="${total_amount}" pattern="#,###"/>원 결제하기');
        }
        
        let currentTermsType = '';

        
        
     // 약관 내용
     const termsContent = {
         terms: {
             title: '구매조건 확인 및 결제진행 동의',
             content: `
                 <h4>제1조 (목적)</h4>
                 <p>본 약관은 OneTouch(이하 "회사")가 제공하는 전자상거래 서비스 이용에 관한 기본적인 사항을 규정함을 목적으로 합니다.</p>
                 
                 <h4>제2조 (구매조건)</h4>
                 <p>1. 구매자는 상품 주문 전 상품정보, 가격, 배송비, 배송기간 등을 확인해야 합니다.</p>
                 <p>2. 주문 완료 후 구매취소는 결제완료 후 30분 이내에만 가능합니다.</p>
                 <p>3. 배송 시작 후에는 단순 변심에 의한 취소가 불가능합니다.</p>
                 
                 <h4>제3조 (결제)</h4>
                 <p>1. 결제는 신용카드, 무통장입금, 간편결제 등을 통해 가능합니다.</p>
                 <p>2. 결제 완료 후 주문이 확정됩니다.</p>
             `
         },
         privacy: {
             title: '개인정보 제3자 제공 동의',
             content: `
                 <h4>개인정보 제3자 제공 동의</h4>
                 <p>회사는 다음과 같이 개인정보를 제3자에게 제공합니다.</p>
                 
                 <h4>1. 제공받는 자</h4>
                 <p>- 배송업체 (CJ대한통운, 로젠택배 등)</p>
                 <p>- PG사 (토스페이먼츠, KG이니시스 등)</p>
                 
                 <h4>2. 제공되는 개인정보 항목</h4>
                 <p>- 성명, 전화번호, 주소 (배송을 위해)</p>
                 <p>- 결제정보 (결제처리를 위해)</p>
                 
                 <h4>3. 제공받는 자의 이용목적</h4>
                 <p>- 상품배송, 결제처리, 고객상담</p>
                 
                 <h4>4. 보유 및 이용기간</h4>
                 <p>- 배송완료 후 1개월, 결제처리 후 5년</p>
             `
         },
         marketing: {
             title: '마케팅 정보 수신 동의',
             content: `
                 <h4>마케팅 정보 수신 동의</h4>
                 <p>회사에서 제공하는 혜택 정보 및 마케팅 정보를 받아보시겠습니까?</p>
                 
                 <h4>1. 수신 정보</h4>
                 <p>- 신상품 정보</p>
                 <p>- 할인 이벤트 정보</p>
                 <p>- 쿠폰 및 적립금 정보</p>
                 
                 <h4>2. 발송 방법</h4>
                 <p>- 이메일, SMS, 앱 푸시알림</p>
                 
                 <h4>3. 동의 철회</h4>
                 <p>언제든지 마이페이지에서 수신 거부할 수 있습니다.</p>
                 
                 <p><strong>※ 마케팅 정보 수신에 동의하지 않아도 서비스 이용이 가능합니다.</strong></p>
             `
         }
     };

     // 모달 열기
     function openTermsModal(type) {
         currentTermsType = type;
         const modal = document.getElementById('termsModal');
         const title = document.getElementById('modalTitle');
         const content = document.getElementById('modalContent');
         
         title.textContent = termsContent[type].title;
         content.innerHTML = termsContent[type].content;
         
         modal.style.display = 'block';
         document.body.style.overflow = 'hidden'; // 스크롤 방지
     }

     // 모달 닫기
     function closeTermsModal() {
         document.getElementById('termsModal').style.display = 'none';
         document.body.style.overflow = 'auto'; // 스크롤 복원
         currentTermsType = '';
     }

     // 약관 동의
     function agreeToTerms() {
         if (currentTermsType === 'terms') {
             document.getElementById('agreeTerms').checked = true;
         } else if (currentTermsType === 'privacy') {
             document.getElementById('agreePrivacy').checked = true;
         } else if (currentTermsType === 'marketing') {
             document.getElementById('agreeMarketing').checked = true;
         }
         
         updateAllAgreementStatus();
         closeTermsModal();
     }

     // 전체 동의 토글
     function toggleAllAgreements() {
         const agreeAll = document.getElementById('agreeAll');
         const checkboxes = document.querySelectorAll('.agreement-checkbox');
         
         checkboxes.forEach(checkbox => {
             checkbox.checked = agreeAll.checked;
         });
     }

     // 전체 동의 상태 업데이트
     function updateAllAgreementStatus() {
         const agreeAll = document.getElementById('agreeAll');
         const checkboxes = document.querySelectorAll('.agreement-checkbox');
         const allChecked = Array.from(checkboxes).every(checkbox => checkbox.checked);
         
         agreeAll.checked = allChecked;
     }

  

     // 페이지 로드 시 이벤트 리스너 추가
     document.addEventListener('DOMContentLoaded', function() {
         const checkboxes = document.querySelectorAll('.agreement-checkbox');
         checkboxes.forEach(checkbox => {
             checkbox.addEventListener('change', updateAllAgreementStatus);
         });
         
         // 모달 외부 클릭 시 닫기
         window.onclick = function(event) {
             const modal = document.getElementById('termsModal');
             if (event.target === modal) {
                 closeTermsModal();
             }
         }
     });
        
        
        
        
    </script>
</body>
</html>
