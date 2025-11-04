<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${product.product_name} 상세 정보</title>
    <style>
        .detail-container {
            width: 800px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .product-image {
            max-width: 100%;
            height: auto;
            border-radius: 4px;
            margin-bottom: 15px;
        }
        .detail-item {
            padding: 8px 0;
            border-bottom: 1px dashed #eee;
        }
        .detail-item strong {
            display: inline-block;
            width: 120px;
            font-weight: bold;
            color: #333;
        }
    </style>
</head>
<body>

<div class="detail-container">
    <h2>${product.product_name} 상세 정보</h2>
    <hr>
    
    <c:if test="${not empty product.product_image_url}">
        <img src="${product.product_image_url}" alt="${product.product_name} 이미지" class="product-image">
    </c:if>
    <c:if test="${empty product.product_image_url}">
        <p>[등록된 이미지가 없습니다]</p>
    </c:if>
    
    <div class="detail-item">
        <strong>상품 번호</strong> 
        ${product.product_idx}
    </div>
    <div class="detail-item">
        <strong>카테고리 ID</strong> 
        ${product.category_idx}
    </div> 
    <div class="detail-item">
        <strong>상품명</strong> 
        ${product.product_name}
    </div>
    <div class="detail-item">
        <strong>가격</strong> 
        ${product.product_price} 원
    </div>
    <div class="detail-item">
        <strong>브랜드</strong> 
        ${product.product_brand}
    </div>
    <div class="detail-item">
        <strong>재고 수량</strong> 
        ${product.product_cnt} 개
    </div>

    <div class="detail-item">
        <strong>상품 설명</strong> 
        <p>${product.product_comment}</p>
    </div>
    
    <c:if test="${not empty product.product_time}">
        <div class="detail-item">
            <strong>등록 시간</strong> 
            ${product.product_time}
        </div>
    </c:if>
    <c:if test="${not empty product.product_update}">
        <div class="detail-item">
            <strong>수정 시간</strong> 
            ${product.product_update}
        </div>
    </c:if>

    <br>
    <a href="/product/insert_form">목록으로 돌아가기</a>
</div>

</body>
</html>