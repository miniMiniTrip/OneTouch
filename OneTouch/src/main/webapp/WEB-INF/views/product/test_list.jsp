<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품 목록 (테스트) - OneTouch</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>상품 목록 (테스트)</h2>
        
        <!-- 카테고리 필터 -->
        <div class="mb-3">
            <a href="list.do?category_idx=0" class="btn btn-outline-primary">전체</a>
            <c:forEach var="cat" items="${category_list}">
                <a href="list.do?category_idx=${cat.category_idx}" 
                   class="btn btn-outline-primary">
                    ${cat.category_name}
                </a>
            </c:forEach>
        </div>
        
        <!-- 상품 목록 -->
        <div class="row">
            <c:forEach var="vo" items="${productList}">
                <div class="col-md-4 mb-4">
                    <div class="card">
                        <!-- 이미지: Controller에서 이미 처리됨 -->
                        <img src="${vo.product_image_url}" 
                             class="card-img-top" 
                             alt="${vo.product_name}"
                             style="height: 300px; object-fit: cover;">
                        <div class="card-body">
                            <h5 class="card-title">${vo.product_name}</h5>
                            <p class="card-text text-muted">${vo.product_brand}</p>
                            <p class="card-text">
                                <strong>
                                    <fmt:formatNumber value="${vo.product_price}" 
                                                      pattern="#,###"/>원
                                </strong>
                            </p>
                            <p class="card-text">
                                <small class="text-muted">재고: ${vo.product_cnt}개</small>
                            </p>
                            
                            <div class="d-grid gap-2">
                                <a href="test_view.do?product_idx=${vo.product_idx}" 
                                   class="btn btn-primary btn-sm">상세보기</a>
                                
                                <!-- 장바구니 추가 버튼 -->
                                <button type="button" 
                                        class="btn btn-secondary btn-sm"
                                        onclick="addToCart(${vo.product_idx})">
                                    장바구니 담기
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        
        <!-- 상품이 없을 때 -->
        <c:if test="${empty productList}">
            <div class="alert alert-info">등록된 상품이 없습니다.</div>
        </c:if>
    </div>
    
    <script>
    function addToCart(product_idx) {
        // Ajax로 장바구니 추가
        fetch('/cart/insert.do', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: 'product_idx=' + product_idx + '&cart_cnt=1'
        })
        .then(response => response.json())
        .then(data => {
            if (data.result === 'success') {
                if (confirm('장바구니에 추가되었습니다.\n장바구니로 이동하시겠습니까?')) {
                    // mem_idx는 세션에서 가져오므로 컨트롤러에서 처리 필요
                    location.href = '/cart/list.do';
                }
            } else if (data.result === 'exist') {
                alert('이미 장바구니에 있는 상품입니다.');
            } else if (data.result === 'login_required') {
                if (confirm('로그인이 필요합니다.\n로그인 페이지로 이동하시겠습니까?')) {
                    location.href = '/member/login.do';
                }
            } else {
                alert('장바구니 추가에 실패했습니다.');
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('오류가 발생했습니다.');
        });
    }
    </script>
</body>
</html>
