<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>내 피부 프로필 - OneTouch</title>
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
        .profile-info-box {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
        }
        .profile-row {
            margin-bottom: 10px;
            padding: 10px;
            background-color: white;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        
        <c:choose>
            <%-- 피부 프로필이 없는 경우 --%>
            <c:when test="${!hasProfile}">
                <div class="card">
                    <div class="card-body text-center py-5">
                        <h4 class="card-title mb-4">🔍 아직 피부 진단을 하지 않으셨네요!</h4>
                        <p class="text-muted mb-4">
                            간단한 5개 질문으로 당신의 피부 타입을 분석하고<br>
                            맞춤형 화장품을 추천받아보세요.
                        </p>
                        <a href="/skinprofile/form.do" class="btn btn-primary btn-lg">
                            피부 진단 시작하기
                        </a>
                    </div>
                </div>
            </c:when>
            
            <%-- 피부 프로필이 있는 경우 --%>
            <c:otherwise>
                <!-- 진단 정보 -->
                <div class="card mb-4">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h4 class="card-title mb-0">🎯 내 피부 프로필</h4>
                            <a href="/skinprofile/form.do" class="btn btn-outline-primary btn-sm">
                                다시 진단하기
                            </a>
                        </div>
                        
                        <div class="profile-info-box">
                            <div class="profile-row">
                                <strong>🔹 피부 타입:</strong> 
                                <span class="text-primary">${skinProfile.sp_skin_type}</span>
                            </div>
                            <div class="profile-row">
                                <strong>🔹 피부 트러블:</strong> 
                                <span class="text-primary">${skinProfile.sp_trouble}</span>
                            </div>
                            <div class="profile-row">
                                <strong>🔹 피부 변색:</strong> 
                                <span class="text-primary">${skinProfile.sp_color_change}</span>
                            </div>
                            <div class="profile-row">
                                <strong>🔹 피부 주름:</strong> 
                                <span class="text-primary">${skinProfile.sp_wrinkle}</span>
                            </div>
                            <div class="profile-row">
                                <strong>🔹 피부 톤:</strong> 
                                <span class="text-primary">${skinProfile.sp_skin_tone}</span>
                            </div>
                        </div>
                        
                        <div class="mt-3">
                            <strong>📌 맞춤 해시태그:</strong>
                            <c:forEach var="vo" items="${hashtag_list}">
                                <span class="hashtag-badge">#${vo.hashtag_name}</span>
                            </c:forEach>
                        </div>
                        
                        <p class="text-muted small mt-3 mb-0">
                            <strong>최초 진단:</strong> 
                            <fmt:formatDate value="${skinProfile.sp_time}" pattern="yyyy-MM-dd HH:mm"/>
                            <c:if test="${skinProfile.sp_update != null}">
                                <br>
                                <strong>마지막 업데이트:</strong> 
                                <fmt:formatDate value="${skinProfile.sp_update}" pattern="yyyy-MM-dd HH:mm"/>
                            </c:if>
                        </p>
                    </div>
                </div>
                
                <!-- 추천 상품 -->
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title mb-4">✨ 당신을 위한 추천 상품</h4>
                        
                        <c:choose>
                            <c:when test="${empty product_list}">
                                <div class="alert alert-info">
                                    현재 매칭되는 상품이 없습니다. 곧 새로운 상품이 추가될 예정입니다.
                                </div>
                            </c:when>
                            <c:otherwise>
                                <p class="text-muted mb-3">
                                    총 <strong>${product_list.size()}개</strong>의 상품이 당신의 피부에 추천되었습니다.
                                </p>
                                
                                <div class="row">
                                    <c:forEach var="product" items="${product_list}">
                                        <div class="col-md-6 col-lg-4">
                                            <div class="product-card">
                                                <h5 class="mb-2">${product.product_name}</h5>
                                                <p class="text-muted mb-2">
                                                    <small>${product.product_brand}</small>
                                                </p>
                                                <p class="mb-3 small">${product.product_comment}</p>
                                                
                                                <!-- 상품 해시태그 표시 -->
                                                <c:if test="${not empty product.hashtag_list}">
                                                    <div class="mb-3">
                                                        <c:forEach var="tag" items="${product.hashtag_list}">
                                                            <span class="badge bg-secondary">#${tag.hashtag_name}</span>
                                                        </c:forEach>
                                                    </div>
                                                </c:if>
                                                
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
                    <a href="/mypage/main.do" class="btn btn-secondary">마이페이지로</a>
                    <a href="/product/list.do" class="btn btn-primary">전체 상품 보기</a>
                </div>
            </c:otherwise>
        </c:choose>
        
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
