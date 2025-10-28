<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>주문/결제 - OneTouch</title>
    <meta name="description" content="2030 남성 뷰티 쇼핑몰 OneTouch">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/images/favicon.svg">

    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/LineIcons.3.0.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/tiny-slider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/glightbox.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
    
    <!-- Daum 우편번호 API -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
    <!-- 토스페이먼츠 SDK -->
    <script src="https://js.tosspayments.com/v1/payment-widget"></script>
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
    <c:import url="/WEB-INF/views/include/header.jsp" />
    <!-- End Header Area -->

    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">주문/결제</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="${pageContext.request.contextPath}/"><i class="lni lni-home"></i> 홈</a></li>
                        <li><a href="${pageContext.request.contextPath}/cart/list">장바구니</a></li>
                        <li>주문/결제</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    <!-- Start Checkout Form -->
    <section class="checkout-wrapper section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="checkout-steps-form-style-1">
                        <ul id="accordionExample">
                            <!-- Step 1: 주문자 정보 -->
                            <li>
                                <h6 class="title" data-bs-toggle="collapse" data-bs-target="#collapseOne" 
                                    aria-expanded="true" aria-controls="collapseOne">
                                    주문자 정보
                                </h6>
                                <section class="checkout-steps-form-content collapse show" id="collapseOne" 
                                         aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="single-form form-default">
                                                <label>이름 <span class="text-danger">*</span></label>
                                                <div class="form-input form">
                                                    <input type="text" id="ordererName" name="ordererName" 
                                                           value="${user.name}" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="single-form form-default">
                                                <label>전화번호 <span class="text-danger">*</span></label>
                                                <div class="form-input form">
                                                    <input type="tel" id="ordererPhone" name="ordererPhone" 
                                                           value="${user.phone}" placeholder="01012345678" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="single-form form-default">
                                                <label>이메일 <span class="text-danger">*</span></label>
                                                <div class="form-input form">
                                                    <input type="email" id="ordererEmail" name="ordererEmail" 
                                                           value="${user.email}" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="single-form button">
                                                <button class="btn" type="button" data-bs-toggle="collapse" 
                                                        data-bs-target="#collapseTwo" aria-expanded="false" 
                                                        aria-controls="collapseTwo">
                                                    다음 단계
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                            </li>
                            
                            <!-- Step 2: 배송지 정보 -->
                            <li>
                                <h6 class="title collapsed" data-bs-toggle="collapse" data-bs-target="#collapseTwo" 
                                    aria-expanded="false" aria-controls="collapseTwo">
                                    배송지 정보
                                </h6>
                                <section class="checkout-steps-form-content collapse" id="collapseTwo" 
                                         aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="single-checkbox checkbox-style-3">
                                                <input type="checkbox" id="sameAsOrderer" checked>
                                                <label for="sameAsOrderer">
                                                    <span></span>
                                                </label>
                                                <p>주문자 정보와 동일</p>
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-6">
                                            <div class="single-form form-default">
                                                <label>받는 사람 <span class="text-danger">*</span></label>
                                                <div class="form-input form">
                                                    <input type="text" id="receiverName" name="receiverName" 
                                                           value="${user.name}" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="single-form form-default">
                                                <label>연락처 <span class="text-danger">*</span></label>
                                                <div class="form-input form">
                                                    <input type="tel" id="receiverPhone" name="receiverPhone" 
                                                           value="${user.phone}" placeholder="01012345678" required>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-8">
                                            <div class="single-form form-default">
                                                <label>우편번호 <span class="text-danger">*</span></label>
                                                <div class="form-input form">
                                                    <input type="text" id="zipCode" name="zipCode" 
                                                           value="${user.zipCode}" readonly required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="single-form button">
                                                <button type="button" class="btn btn-outline-primary w-100 mt-4" 
                                                        id="searchAddressBtn">
                                                    <i class="lni lni-search-alt"></i> 주소 검색
                                                </button>
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-12">
                                            <div class="single-form form-default">
                                                <label>기본 주소 <span class="text-danger">*</span></label>
                                                <div class="form-input form">
                                                    <input type="text" id="address" name="address" 
                                                           value="${user.address}" readonly required>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-12">
                                            <div class="single-form form-default">
                                                <label>상세 주소 <span class="text-danger">*</span></label>
                                                <div class="form-input form">
                                                    <input type="text" id="addressDetail" name="addressDetail" 
                                                           value="${user.addressDetail}" 
                                                           placeholder="상세 주소를 입력하세요" required>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-12">
                                            <div class="single-form form-default">
                                                <label>배송 메모</label>
                                                <div class="form-input form">
                                                    <input type="text" id="deliveryMemo" name="deliveryMemo" 
                                                           placeholder="배송 시 요청사항을 입력하세요 (선택)">
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-12">
                                            <div class="single-form button">
                                                <button class="btn" type="button" data-bs-toggle="collapse" 
                                                        data-bs-target="#collapseThree" aria-expanded="false" 
                                                        aria-controls="collapseThree">
                                                    결제하기
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                            </li>
                            
                            <!-- Step 3: 결제 (토스 페이먼츠) -->
                            <li>
                                <h6 class="title collapsed" data-bs-toggle="collapse" data-bs-target="#collapseThree" 
                                    aria-expanded="false" aria-controls="collapseThree">
                                    결제 수단
                                </h6>
                                <section class="checkout-steps-form-content collapse" id="collapseThree" 
                                         aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                                    <div class="row">
                                        <!-- 토스페이먼츠 결제 위젯 -->
                                        <div class="col-md-12">
                                            <div id="payment-widget"></div>
                                            <div id="agreement"></div>
                                        </div>
                                        
                                        <div class="col-md-12">
                                            <div class="single-form button">
                                                <button class="btn w-100" type="button" id="payment-button">
                                                    <fmt:formatNumber value="${totalAmount}" pattern="#,###"/>원 결제하기
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                            </li>
                        </ul>
                    </div>
                </div>
                
                <!-- 주문 요약 (오른쪽 사이드바) -->
                <div class="col-lg-4">
                    <div class="checkout-sidebar">
                        <!-- 주문 상품 목록 -->
                        <div class="checkout-sidebar-price-table">
                            <h5 class="title">주문 상품</h5>
                            
                            <div class="order-items">
                                <c:forEach var="item" items="${orderItems}">
                                    <div class="order-item d-flex align-items-center mb-3">
                                        <img src="${pageContext.request.contextPath}${item.productImage}" 
                                             alt="${item.productName}" 
                                             style="width: 60px; height: 60px; object-fit: cover; border-radius: 4px;">
                                        <div class="ms-3 flex-grow-1">
                                            <p class="mb-1 fw-bold">${item.productName}</p>
                                            <small class="text-muted">수량: ${item.quantity}개</small>
                                        </div>
                                        <div class="text-end">
                                            <p class="mb-0 fw-bold">
                                                <fmt:formatNumber value="${item.price * item.quantity}" pattern="#,###"/>원
                                            </p>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            
                            <!-- 가격 요약 -->
                            <div class="sub-total-price mt-4">
                                <div class="total-price">
                                    <p class="value">상품금액:</p>
                                    <p class="price">
                                        <fmt:formatNumber value="${totalProductPrice}" pattern="#,###"/>원
                                    </p>
                                </div>
                                <div class="total-price shipping">
                                    <p class="value">배송비:</p>
                                    <p class="price">
                                        <c:choose>
                                            <c:when test="${shippingFee == 0}">
                                                무료
                                            </c:when>
                                            <c:otherwise>
                                                <fmt:formatNumber value="${shippingFee}" pattern="#,###"/>원
                                            </c:otherwise>
                                        </c:choose>
                                    </p>
                                </div>
                                <c:if test="${discountAmount > 0}">
                                    <div class="total-price discount">
                                        <p class="value">할인금액:</p>
                                        <p class="price text-danger">
                                            -<fmt:formatNumber value="${discountAmount}" pattern="#,###"/>원
                                        </p>
                                    </div>
                                </c:if>
                            </div>
                            
                            <!-- 최종 결제 금액 -->
                            <div class="total-payable">
                                <div class="payable-price">
                                    <p class="value">총 결제금액:</p>
                                    <p class="price">
                                        <fmt:formatNumber value="${totalAmount}" pattern="#,###"/>원
                                    </p>
                                </div>
                            </div>
                        </div>
                        
                        <!-- 배송비 안내 -->
                        <div class="checkout-sidebar-price-table mt-30">
                            <h6 class="mb-3">배송비 안내</h6>
                            <p class="text-muted small mb-2">
                                <i class="lni lni-checkmark-circle"></i> 50,000원 이상 구매 시 무료배송
                            </p>
                            <p class="text-muted small mb-2">
                                <i class="lni lni-checkmark-circle"></i> 제주/도서산간 지역 추가 배송비 3,000원
                            </p>
                            <p class="text-muted small">
                                <i class="lni lni-checkmark-circle"></i> 주문 후 2-3일 내 배송
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Checkout Form -->

    <!-- Start Footer Area -->
    <c:import url="/WEB-INF/views/include/footer.jsp" />
    <!-- End Footer Area -->

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top">
        <i class="lni lni-chevron-up"></i>
    </a>

    <!-- ========================= JS here ========================= -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/tiny-slider.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/glightbox.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
    
    <script>
        // 프리로더 제거
        window.addEventListener('load', function() {
            const preloader = document.querySelector('.preloader');
            if (preloader) {
                preloader.style.opacity = '0';
                setTimeout(() => preloader.style.display = 'none', 500);
            }
        });

        // 주소 검색
        document.getElementById('searchAddressBtn').addEventListener('click', function() {
            new daum.Postcode({
                oncomplete: function(data) {
                    document.getElementById('zipCode').value = data.zonecode;
                    document.getElementById('address').value = data.address;
                    document.getElementById('addressDetail').focus();
                }
            }).open();
        });

        // 주문자 정보와 동일 체크박스
        document.getElementById('sameAsOrderer').addEventListener('change', function() {
            if (this.checked) {
                document.getElementById('receiverName').value = document.getElementById('ordererName').value;
                document.getElementById('receiverPhone').value = document.getElementById('ordererPhone').value;
            }
        });

        // ========================= 토스페이먼츠 결제 ========================= //
        
        // 토스페이먼츠 클라이언트 키 (실제 키로 변경 필요)
        const clientKey = '${tossClientKey}'; // 서버에서 전달받은 클라이언트 키
        const customerKey = 'customer_${user.userId}'; // 고객 고유 키
        
        // 결제 위젯 초기화
        const paymentWidget = PaymentWidget(clientKey, customerKey);
        
        // 결제 금액
        const totalAmount = ${totalAmount};
        
        // 주문 ID 생성 (서버에서 생성하여 전달하는 것이 더 안전)
        const orderId = '${orderId}'; // 예: ORD20250129123456
        
        // 결제 UI 렌더링
        paymentWidget.renderPaymentMethods('#payment-widget', totalAmount, {
            currency: 'KRW'
        });
        
        // 이용약관 UI 렌더링
        paymentWidget.renderAgreement('#agreement');
        
        // 결제 버튼 클릭 이벤트
        document.getElementById('payment-button').addEventListener('click', async function() {
            // 필수 정보 확인
            if (!validateForm()) {
                return;
            }
            
            try {
                // 결제 요청
                await paymentWidget.requestPayment({
                    orderId: orderId,
                    orderName: '${orderName}', // 예: "상품명 외 2건"
                    customerName: document.getElementById('receiverName').value,
                    customerEmail: document.getElementById('ordererEmail').value,
                    customerMobilePhone: document.getElementById('receiverPhone').value,
                    successUrl: '${pageContext.request.contextPath}/order/success',
                    failUrl: '${pageContext.request.contextPath}/order/fail',
                });
            } catch (error) {
                console.error('결제 오류:', error);
                alert('결제 중 오류가 발생했습니다. 다시 시도해주세요.');
            }
        });
        
        // 폼 유효성 검사
        function validateForm() {
            // 주문자 정보
            const ordererName = document.getElementById('ordererName').value;
            const ordererPhone = document.getElementById('ordererPhone').value;
            const ordererEmail = document.getElementById('ordererEmail').value;
            
            if (!ordererName || !ordererPhone || !ordererEmail) {
                alert('주문자 정보를 모두 입력해주세요.');
                return false;
            }
            
            // 배송지 정보
            const receiverName = document.getElementById('receiverName').value;
            const receiverPhone = document.getElementById('receiverPhone').value;
            const zipCode = document.getElementById('zipCode').value;
            const address = document.getElementById('address').value;
            const addressDetail = document.getElementById('addressDetail').value;
            
            if (!receiverName || !receiverPhone || !zipCode || !address || !addressDetail) {
                alert('배송지 정보를 모두 입력해주세요.');
                return false;
            }
            
            // 전화번호 형식 검사
            const phoneRegex = /^01[0-9]{8,9}$/;
            if (!phoneRegex.test(ordererPhone.replace(/-/g, ''))) {
                alert('올바른 전화번호 형식이 아닙니다.');
                return false;
            }
            
            return true;
        }
        
        // 페이지 이탈 방지 (결제 중)
        let isPaymentInProgress = false;
        
        document.getElementById('payment-button').addEventListener('click', function() {
            isPaymentInProgress = true;
        });
        
        window.addEventListener('beforeunload', function(e) {
            if (isPaymentInProgress) {
                e.preventDefault();
                e.returnValue = '';
                return '';
            }
        });
    </script>
</body>
</html>
