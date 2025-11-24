<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>피부 진단 결과</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .hashtag-badge {
            display: inline-block;
            padding: 5px 15px;
            margin: 5px;
            background-color: #007bff;
            color: white;
            border-radius: 20px;
            font-size: 14px;
        }
        .product-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 15px;
            transition: box-shadow 0.3s;
        }
        .product-card:hover {
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        
        <!-- 진단 결과 -->
        <div class="card mb-4">
            <div class="card-body">
                <h4 class="card-title">🎯 피부 진단 결과</h4>
                <p class="card-text">
                    당신의 피부는 
                    <c:forEach var="vo" items="${hashtag_list}">
                        <span class="hashtag-badge">#${vo.hashtag_name}</span>
                    </c:forEach>
                    입니다.
                </p>
                
                <!-- 디버깅용 (나중에 삭제) -->
                <p class="text-muted small">
                    선택된 해시태그 idx: ${list}
                </p>
            </div>
        </div>
        
        <!-- 추천 상품 -->
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">✨ 당신을 위한 추천 상품</h4>
                
                <c:choose>
                    <c:when test="${empty product_list}">
                        <div class="alert alert-info">
                            매칭되는 상품이 없습니다. 다른 조건으로 다시 진단해보세요.
                        </div>
                    </c:when>
                    <c:otherwise>
                        <p class="text-muted mb-3">총 ${product_list.size()}개의 상품이 추천되었습니다.</p>
                        
                        <div class="row">
                            <c:forEach var="product" items="${product_list}">
                                <div class="col-md-6">
                                    <div class="product-card">
                                        <h5 class="mb-2">${product.product_name}</h5>
                                        <p class="text-muted mb-2">
                                            <small>${product.product_brand}</small>
                                        </p>
                                        <p class="mb-3">${product.product_comment}</p>
                                        <div class="d-flex justify-content-between align-items-center">
                                            <p class="fw-bold mb-0 text-primary">
                                                <fmt:formatNumber value="${product.product_price}" pattern="#,###"/>원
                                            </p>
                                            <a href="/product/detail.do?product_idx=${product.product_idx}" 
                                               class="btn btn-primary btn-sm">상세보기</a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:otherwise>
                </c:choose>
                
            </div>
        </div>
        
        <!-- 버튼 -->
        <div class="mt-4 text-center">
            <a href="/main.do" class="btn btn-secondary">메인으로</a>
            <a href="/product/list.do" class="btn btn-primary">전체 상품 보기</a>
            <a href="/skinprofile/form.do" class="btn btn-outline-primary">다시 진단하기</a>
        </div>
        
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
