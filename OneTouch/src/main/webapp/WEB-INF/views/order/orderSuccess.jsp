<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>결제 완료 - OneTouch</title>
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
    <c:import url="/WEB-INF/views/include/header.jsp" />
    <!-- End Header Area -->

    <!-- Start Success Area -->
    <section class="section" style="padding: 100px 0;">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8 col-md-10 col-12">
                    <div class="card border-0 shadow-sm">
                        <div class="card-body text-center p-5">
                            <!-- Success Icon -->
                            <div class="mb-4">
                                <i class="lni lni-checkmark-circle" 
                                   style="font-size: 80px; color: #0167f3;"></i>
                            </div>
                            
                            <h2 class="mb-3">결제가 완료되었습니다!</h2>
                            <p class="text-muted mb-4">
                                주문이 정상적으로 접수되었습니다.<br>
                                주문 내역은 마이페이지에서 확인하실 수 있습니다.
                            </p>
                            
                            <!-- 주문 정보 -->
                            <div class="order-info bg-light p-4 rounded mb-4">
                                <div class="row">
                                    <div class="col-6 text-start">
                                        <p class="mb-2"><strong>주문번호</strong></p>
                                        <p class="mb-0 text-muted">${orderId}</p>
                                    </div>
                                    <div class="col-6 text-end">
                                        <p class="mb-2"><strong>결제금액</strong></p>
                                        <p class="mb-0 text-primary fw-bold">
                                            <fmt:formatNumber value="${amount}" pattern="#,###"/>원
                                        </p>
                                    </div>
                                </div>
                                <hr class="my-3">
                                <div class="row">
                                    <div class="col-6 text-start">
                                        <p class="mb-2"><strong>결제수단</strong></p>
                                        <p class="mb-0 text-muted">${paymentMethod}</p>
                                    </div>
                                    <div class="col-6 text-end">
                                        <p class="mb-2"><strong>주문일시</strong></p>
                                        <p class="mb-0 text-muted">
                                            <fmt:formatDate value="${orderDate}" pattern="yyyy-MM-dd HH:mm"/>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Action Buttons -->
                            <div class="d-grid gap-2 d-md-flex justify-content-md-center">
                                <a href="${pageContext.request.contextPath}/user/mypage/orders" 
                                   class="btn btn-primary btn-lg">
                                    <i class="lni lni-list"></i> 주문 내역 보기
                                </a>
                                <a href="${pageContext.request.contextPath}/" 
                                   class="btn btn-outline-secondary btn-lg">
                                    <i class="lni lni-home"></i> 홈으로
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Success Area -->

    <!-- Start Footer Area -->
    <c:import url="/WEB-INF/views/include/footer.jsp" />
    <!-- End Footer Area -->

    <!-- ========================= JS here ========================= -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>
