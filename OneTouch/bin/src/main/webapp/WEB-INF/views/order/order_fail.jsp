<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>결제 실패 - OneTouch</title>
    <meta name="description" content="2030 남성 뷰티 쇼핑몰 OneTouch">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/images/favicon.svg">

    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/LineIcons.3.0.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
</head>

<body>
    <!-- Start Header Area -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
    <!-- End Header Area -->

    <!-- Start Fail Area -->
    <section class="section" style="padding: 100px 0;">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8 col-md-10 col-12">
                    <div class="card border-0 shadow-sm">
                        <div class="card-body text-center p-5">
                            <!-- Fail Icon -->
                            <div class="mb-4">
                                <i class="lni lni-close-circle" 
                                   style="font-size: 80px; color: #dc3545;"></i>
                            </div>
                            
                            <h2 class="mb-3">결제에 실패했습니다</h2>
                            <p class="text-muted mb-4">
                                결제 처리 중 문제가 발생했습니다.<br>
                                다시 시도하거나 다른 결제 수단을 이용해주세요.
                            </p>
                            
                            <!-- 에러 정보 -->
                            <c:if test="${not empty errorMessage}">
                                <div class="alert alert-danger" role="alert">
                                    <i class="lni lni-warning"></i> ${errorMessage}
                                </div>
                            </c:if>
                            
                            <!-- 실패 사유 -->
                            <c:if test="${not empty failureCode || not empty failureMessage}">
                                <div class="order-info bg-light p-4 rounded mb-4">
                                    <c:if test="${not empty failureCode}">
                                        <p class="mb-2">
                                            <strong>오류 코드:</strong> 
                                            <span class="text-muted">${failureCode}</span>
                                        </p>
                                    </c:if>
                                    <c:if test="${not empty failureMessage}">
                                        <p class="mb-0">
                                            <strong>오류 메시지:</strong> 
                                            <span class="text-muted">${failureMessage}</span>
                                        </p>
                                    </c:if>
                                </div>
                            </c:if>
                            
                            <!-- 실패 원인 안내 -->
                            <div class="text-start mb-4">
                                <h6 class="mb-3">결제 실패 원인</h6>
                                <ul class="text-muted">
                                    <li>카드 한도 초과</li>
                                    <li>카드 정보 오류</li>
                                    <li>인증 실패</li>
                                    <li>네트워크 오류</li>
                                    <li>기타 시스템 오류</li>
                                </ul>
                            </div>
                            
                            <!-- Action Buttons -->
                            <div class="d-grid gap-2 d-md-flex justify-content-md-center">
                                <a href="${pageContext.request.contextPath}/order/checkout" 
                                   class="btn btn-primary btn-lg">
                                    <i class="lni lni-reload"></i> 다시 결제하기
                                </a>
                                <a href="${pageContext.request.contextPath}/cart/list" 
                                   class="btn btn-outline-secondary btn-lg">
                                    <i class="lni lni-cart"></i> 장바구니로
                                </a>
                            </div>
                            
                            <!-- 고객센터 안내 -->
                            <div class="mt-4 pt-4 border-top">
                                <p class="text-muted mb-2">
                                    문제가 계속되면 고객센터로 문의해주세요.
                                </p>
                                <p class="mb-0">
                                    <i class="lni lni-phone"></i> 고객센터: 1588-0000<br>
                                    <i class="lni lni-envelope"></i> 이메일: support@onetouch.com
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Fail Area -->

    <!-- Start Footer Area -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <!-- End Footer Area -->

    <!-- ========================= JS here ========================= -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>
