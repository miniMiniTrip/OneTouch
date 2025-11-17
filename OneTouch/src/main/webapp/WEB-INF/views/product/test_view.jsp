<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${vo.product_name} - OneTouch</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="row">
            <!-- 상품 이미지 -->
            <div class="col-md-6">
                <img src="${vo.product_image_url}" 
                     class="img-fluid" 
                     alt="${vo.product_name}">
            </div>
            
            <!-- 상품 정보 -->
            <div class="col-md-6">
                <h2>${vo.product_name}</h2>
                <p class="text-muted">${vo.product_brand}</p>
                
                <hr>
                
                <h3 class="text-primary">
                    <fmt:formatNumber value="${vo.product_price}" pattern="#,###"/>원
                </h3>
                
                <p class="mt-3">${vo.product_comment}</p>
                
                <p class="text-muted">재고: ${vo.product_cnt}개</p>
                
                <hr>
                
                <form id="cartForm">
                    <div class="mb-3">
                        <label class="form-label">수량</label>
                        <input type="number" 
                               id="cart_cnt" 
                               name="cart_cnt" 
                               class="form-control" 
                               value="1" 
                               min="1" 
                               max="${vo.product_cnt}">
                    </div>
                    
                    <div class="d-grid gap-2">
                        <button type="button" 
                                class="btn btn-primary btn-lg"
                                onclick="addToCart()">
                            장바구니 담기
                        </button>
                        <button type="button" 
                                class="btn btn-success btn-lg">
                            바로 구매
                        </button>
                        <a href="list.do" class="btn btn-outline-secondary">
                            목록으로
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <script>
    function addToCart() {
        let product_idx = ${vo.product_idx};
        let cart_cnt = $('#cart_cnt').val();
        
        $.ajax({
            url: '/cart/insert.do',
            type: 'POST',
            data: {
                product_idx: product_idx, 
                cart_cnt: cart_cnt
            },
            success: function(response) {
                if(response.result === 'not_login') {
                    alert('로그인이 필요합니다.');
                    location.href = '/user/login';
                } else if(response.result === 'exist') {
                    if(confirm('이미 장바구니에 있는 상품입니다.\n장바구니로 이동하시겠습니까?')) {
                        location.href = '/cart/list.do';
                    }
                } else if(response.result === 'success') {
                    if(confirm('장바구니에 추가되었습니다.\n장바구니로 이동하시겠습니까?')) {
                        location.href = '/cart/list.do';
                    } 
                } else {
                    alert('장바구니 추가에 실패했습니다.');
                }
            },
            error: function() {
                alert('서버 오류가 발생했습니다.');
            }
        });
    }
    </script>
</body>
</html>