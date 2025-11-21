<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>주문 완료 - OneTouch</title>
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
    
    <style>
        .order-complete {
            padding: 60px 0;
        }
        .complete-box {
            text-align: center;
            background: #fff;
            padding: 60px 40px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.05);
        }
        .complete-icon {
            width: 100px;
            height: 100px;
            background: #28a745;
            border-radius: 50%;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 30px;
        }
        .complete-icon i {
            font-size: 50px;
            color: white;
        }
        .complete-box h2 {
            font-size: 32px;
            margin-bottom: 15px;
            color: #333;
        }
        .complete-box p {
            font-size: 16px;
            color: #666;
            margin-bottom: 30px;
        }
        .order-info {
            background: #f8f9fa;
            padding: 30px;
            border-radius: 8px;
            margin: 30px 0;
            text-align: left;
        }
        .order-info h4 {
            font-size: 18px;
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 1px solid #dee2e6;
        }
        .order-info-item {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #e9ecef;
        }
        .order-info-item:last-child {
            border-bottom: none;
        }
        .order-info-item label {
            color: #666;
            font-weight: 500;
        }
        .order-info-item span {
            color: #333;
            font-weight: 600;
        }
        .order-products {
            margin: 30px 0;
            text-align: left;
        }
        .order-products h4 {
            font-size: 18px;
            margin-bottom: 20px;
        }
        .product-item {
            display: flex;
            align-items: center;
            padding: 15px;
            background: #fff;
            border: 1px solid #e9ecef;
            border-radius: 5px;
            margin-bottom: 10px;
        }
        .product-item img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            margin-right: 20px;
            border-radius: 5px;
        }
        .product-item-info {
            flex: 1;
        }
        .product-item-info h6 {
            margin-bottom: 5px;
        }
        .product-item-info p {
            margin: 0;
            color: #666;
            font-size: 14px;
        }
        .product-item-price {
            text-align: right;
        }
        .button-group {
            display: flex;
            gap: 10px;
            justify-content: center;
            margin-top: 30px;
        }
        .button-group .btn {
            min-width: 150px;
        }
    </style>
</head>
<body>
    <!-- 헤더 포함 -->
    <%@include file="/WEB-INF/views/common/header.jsp" %>
    
    <!-- Order Complete Section -->
    <section class="order-complete section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="complete-box">
                        <div class="complete-icon">
                            <i class="lni lni-checkmark"></i>
                        </div>
                        <h2>주문이 완료되었습니다!</h2>
                        <p>주문해 주셔서 감사합니다. 빠르고 안전하게 배송해드리겠습니다.</p>
                        
                        <!-- 주문 정보 -->
                        <div class="order-info">
                            <h4>주문 정보</h4>
                            <div class="order-info-item">
                                <label>주문번호</label>
                                <span>${order.order_no}</span>
                            </div>
                            <div class="order-info-item">
                                <label>주문일시</label>
                                <span><fmt:formatDate value="${order.order_time}" pattern="yyyy년 MM월 dd일 HH:mm"/></span>
                            </div>
                            <div class="order-info-item">
                                <label>주문자명</label>
                                <span>${order.order_mem_name}</span>
                            </div>
                            <div class="order-info-item">
                                <label>연락처</label>
                                <span>${order.order_phone}</span>
                            </div>
                            <div class="order-info-item">
                                <label>배송지</label>
                                <span>${order.order_address} ${order.order_address_more}</span>
                            </div>
                            <div class="order-info-item">
                                <label>결제금액</label>
                                <span class="text-primary">
                                    <fmt:formatNumber value="${order.total_amount}" pattern="#,###"/>원
                                </span>
                            </div>
                            <div class="order-info-item">
                                <label>결제상태</label>
                                <span class="badge badge-success">${order.order_status}</span>
                            </div>
                            <c:if test="${payment != null && payment.receipt_url != null}">
							    <div class="order-info-item">
							        <label>영수증</label>
							        <span><a href="${payment.receipt_url}" target="_blank" class="btn btn-sm btn-outline-primary">영수증 보기</a></span>
							    </div>
							</c:if>
                        </div>
                        
                        <!-- 주문 상품 목록 -->
                        <div class="order-products">
                            <h4>주문 상품</h4>
                            <c:forEach var="item" items="${order_items}">
                                <div class="product-item">
                                    <img src="${item.product_image_url}" alt="${item.product_name}">
                                    <div class="product-item-info">
                                        <h6>${item.product_name}</h6>
                                        <p>수량: ${item.product_cnt}개</p>
                                    </div>
                                    <div class="product-item-price">
                                        <strong><fmt:formatNumber value="${item.total_amount}" pattern="#,###"/>원</strong>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        
                        <!-- 버튼 그룹 -->
                        <div class="button-group">
                            <a href="/order/list.do" class="btn btn-outline-primary">주문내역 보기</a>
                            <a href="/" class="btn btn-primary">계속 쇼핑하기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- 푸터 포함 -->
    <%@include file="/WEB-INF/views/common/footer.jsp" %>
    
    <!-- JavaScript -->
    <script src="/assets/js/bootstrap.min.js"></script>
    <script src="/assets/js/tiny-slider.js"></script>
    <script src="/assets/js/glightbox.min.js"></script>
    <script src="/assets/js/main.js"></script>
</body>
</html>