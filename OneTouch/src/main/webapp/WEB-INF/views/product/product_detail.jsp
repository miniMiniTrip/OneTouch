<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${product.product_name}-상세페이지</title>
<meta name="description" content="" />
<link rel="shortcut icon" type="image/x-icon"
	href="/assets/images/favicon.svg" />

<!-- Web Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap"
	rel="stylesheet">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/LineIcons.3.0.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/tiny-slider.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/glightbox.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

/* 관리자 이미지 관리 */
.admin-image-controls {
	background: linear-gradient(135deg, #1e3c72, #3366cc);
	color: white;
	padding: 20px;
	border-radius: 15px;
	margin-bottom: 30px;
}

.btn-upload, .btn-save {
	background: linear-gradient(135deg, #ff6b35, #f7931e);
	color: white;
	border: none;
	padding: 10px 20px;
	border-radius: 20px;
	cursor: pointer;
	margin: 10px 5px;
}

/* 기존 .image-item 스타일을 이걸로 교체 */
.image-item {
	position: relative; /* 중요! 버튼 위치를 위해 필수 */
	margin: 20px 0;
	text-align: center; /* 이미지 가운데 정렬 */
	background: white;
	padding: 15px;
	border-radius: 10px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

/* 이미지 스타일은 별도로 */
.image-item img {
	width: 100%;
	max-width: 600px;
	height: auto;
	object-fit: contain;
	border-radius: 10px;
	display: block;
	margin: 0 auto;
}

/* 버튼 표시 수정 */
.image-actions {
	position: absolute;
	top: 20px;
	right: 20px;
	display: flex;
	gap: 8px;
	opacity: 0; /* 평상시 숨김 */
	transition: opacity 0.3s ease;
	z-index: 10; /* 위에 표시 */
}

.image-item:hover .image-actions {
	opacity: 1;
	!
	important; /* 호버시 표시 */
}

.image-actions button {
	background: #1e3c72 !important;
	color: white !important;
	border: none !important;
	padding: 10px 15px !important;
	margin: 3px !important;
	border-radius: 5px !important;
	cursor: pointer !important;
	font-size: 13px !important;
}

.image-actions button:hover {
	background: #2a5298 !important;
}

/* 모바일에서는 항상 버튼 표시 */
@media ( max-width : 768px) {
	.image-actions {
		position: static;
		opacity: 1;
		justify-content: center;
		margin-top: 15px;
	}
	.image-actions button {
		font-size: 14px;
		padding: 10px 15px;
	}
}

body {
	font-family: 'Arial', sans-serif;
	background-color: #f8f9fa;
	color: #333;
	line-height: 1.6;
}

/* 메인 컨테이너 */
.main-container {
	max-width: 1200px;
	margin: 30px auto;
	padding: 0 20px;
}

/* 브레드크럼 */
.breadcrumb {
	margin-bottom: 20px;
	font-size: 14px;
	color: #666;
}

.breadcrumb a {
	color: #2a5298;
	text-decoration: none;
}

/* 상품 상세 영역 */
.product-detail {
	background: white;
	border-radius: 15px;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
	overflow: hidden;
}

.product-info {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 40px;
	padding: 40px;
}

/* 이미지 영역 - 반응형 개선 */
.product-image {
	position: relative;
	width: 100%;
}

.main-image {
	width: 100%;
	height: 400px;
	background-image:
		url('${pageContext.request.contextPath}/images/${product.product_image_url}');
	background-size: contain; /* cover에서 contain으로 변경 - 이미지 짤림 방지 */
	background-repeat: no-repeat;
	background-position: center;
	transition: opacity 0.3s ease;
}

.thumbnail-images {
	display: flex;
	gap: 10px;
	margin-top: 15px;
	flex-wrap: wrap;
}

.thumbnail {
	width: 80px;
	height: 80px;
	background: none; /* 기본 네모박스 색 */
	border-radius: 8px;
	/*  border: 2px solid #ddd;  */
	cursor: pointer;
	transition: border-color 0.3s;
}

.thumbnail:hover, .thumbnail.active {
	border-color: #2a5298;
}

.thumbnail.placeholder {
	opacity: 0; /* 기본 숨김 */
}

.product-image:hover .thumbnail.placeholder {
	opacity: 1; /* 마우스 올리면 나타남 */
}

/* 커서 올리면 보이게 */
.product-image:hover .thumbnail.placeholder {
	opacity: 1;
}

.thumbnail:hover, .thumbnail.active {
	border-color: #2a5298;
}

/* 상품 정보 영역 */
.product-details {
	padding: 20px 0;
}

.category-brand {
	font-size: 14px;
	color: #666;
	margin-bottom: 10px;
}

.product-title {
	font-size: 28px;
	font-weight: bold;
	margin-bottom: 15px;
	line-height: 1.3;
	word-break: keep-all; /* 단어 단위로 줄바꿈 */
}

.rating {
	display: flex;
	align-items: center;
	gap: 10px;
	margin-bottom: 20px;
	flex-wrap: wrap;
}

.stars {
	color: #ffc107;
	font-size: 18px;
}

.rating-text {
	color: #666;
	font-size: 14px;
}

.price-section {
	margin-bottom: 30px;
}

.original-price {
	font-size: 16px;
	color: #999;
	text-decoration: line-through;
	margin-bottom: 5px;
}

.discount-info {
	display: flex;
	align-items: baseline;
	gap: 15px;
	margin-bottom: 10px;
	flex-wrap: wrap;
}

.discount-rate {
	font-size: 24px;
	font-weight: bold;
	color: #e74c3c;
}

.sale-price {
	font-size: 28px;
	font-weight: bold;
	color: #333;
}

.currency {
	font-size: 18px;
	color: #666;
}

/* 수량 선택 */
.quantity-section {
    display: flex;
    justify-content: space-between; /* 양 끝 정렬 */
    align-items: center;
    margin: 20px 0;
    padding: 15px 0;
    border-top: 1px solid #eee;
    border-bottom: 1px solid #eee;* 요소간 간격 */
}

.quantity-label {
	display: block;
	margin-bottom: 10px;
	font-weight: 500;
}

.quantity-control {
	display: flex;
	align-items: center;
	gap: 10px;
}

.quantity-btn {
	width: 30px;
	height: 30px;
	border: 1px solid #ddd;
	background: white;
	cursor: pointer;
	border-radius: 5px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 18px;
	transition: background-color 0.3s;
	touch-action: manipulation; /* 터치 반응성 개선 */
}

/* 왼쪽 수량 컨트롤 영역 */
.quantity-control-wrapper {
    display: flex;
    align-items: center;
    gap: 15px;
}

.quantity-label {
    font-size: 14px;
    font-weight: 600;
    color: #333;
    margin: 0;
}

.quantity-control {
    display: flex;
    align-items: center;
    border: 1px solid #ddd;
    border-radius: 4px;
    overflow: hidden;
}

.quantity-btn {
    width: 35px;
    height: 35px;
    border: none;
    background: #f8f8f8;
    cursor: pointer;
    font-size: 18px;
    display: flex;
    align-items: center;
    justify-content: center;
}

.quantity-btn:hover {
    background: #e8e8e8;
}

.quantity-input {
    width: 60px;
    height: 35px;
    border: none;
    text-align: center;
    font-size: 14px;
    background: white;
}

/* 오른쪽 총 가격 영역 */
.total-price {
    text-align: right;
}

.total-label {
    display: block;
    font-size: 12px;
    color: #666;
    margin-bottom: 2px;
}

.total-amount {
    font-size: 18px;
    font-weight: bold;
    color: #5c6bc0;
}

/* 버튼 영역 - 반응형 개선 */
.button-group {
	display: flex;
	gap: 15px;
}

.btn {
	flex: 1;
	padding: 15px;
	border: none;
	border-radius: 8px;
	font-size: 16px;
	font-weight: 600;
	cursor: pointer;
	transition: all 0.3s;
	text-decoration: none;
	text-align: center;
	display: flex;
	align-items: center;
	justify-content: center;
	min-height: 50px; /* 최소 높이 보장 */
	touch-action: manipulation;
}

.btn-cart {
	background: white;
	border: 2px solid #2a5298;
	color: #2a5298;
}

.btn-cart:hover {
	background: #2a5298;
	color: white;
}

.btn-buy {
	background: linear-gradient(135deg, #1e3c72, #2a5298);
	color: white;
	transition: all 0.2s;
}

.btn-buy:hover {
	background: #2a5298;
	color: white;
}

/* 상품 설명 탭 */
.product-tabs {
	margin-top: 40px;
	background: white;
	border-radius: 15px;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
	overflow: hidden;
}

.tab-header {
	display: flex;
	border-bottom: 1px solid #eee;
	flex-wrap: wrap;
}

.tab-btn {
	padding: 20px 30px;
	border: none;
	background: white;
	font-size: 16px;
	font-weight: 500;
	cursor: pointer;
	transition: all 0.3s;
	border-radius: 0;
	position: relative;
	flex: 1;
	min-width: 120px;
}

.tab-btn:hover {
	background: #f8f9fa;
	color: #2a5298;
}

.tab-btn.active {
	background: white;
	color: #2a5298;
	border-bottom: 3px solid #2a5298;
}

/* 탭 내용 영역 */
.tab-content {
	max-width: 1200px;
	margin: 30px auto;
	padding: 0 20px;
}

.tab-panel {
	display: none;
}

.tab-panel.active {
	display: block;
}

.tab-panel h3 {
	color: #2a5298;
	margin-bottom: 20px;
	font-size: 18px;
}

.tab-panel p, .tab-panel li {
	line-height: 1.6;
	margin-bottom: 15px;
}

/* 애니메이션 */
@
keyframes fadeIn {from { opacity:0;
	
}

to {
	opacity: 1;
}

}
@
keyframes slideUp {from { opacity:0;
	transform: translate(-50%, -40%);
}

to {
	opacity: 1;
	transform: translate(-50%, -50%);
}

}
.feature-list {
	list-style: none;
	padding: 0;
}

.feature-list li {
	padding: 10px 0;
	border-bottom: 1px solid #f0f0f0;
	position: relative;
	padding-left: 25px;
}

.feature-list li:before {
	content: "✓";
	position: absolute;
	left: 0;
	color: #2a5298;
	font-weight: bold;
}

/* 리뷰 스타일 */
.review-item {
	border-bottom: 1px solid #eee;
	padding: 20px 0;
}

.review-item:last-child {
	border-bottom: none;
}

.review-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 10px;
	flex-wrap: wrap;
	gap: 10px;
}

.review-rating {
	color: #ffc107;
	font-size: 16px;
}

.review-author {
	font-weight: 500;
	color: #333;
}

.review-date {
	color: #666;
	font-size: 14px;
}

.review-text {
	color: #555;
	line-height: 1.6;
}

/* Q&A 스타일 */
.qna-item {
	border-bottom: 1px solid #eee;
	padding: 20px 0;
}

.qna-item:last-child {
	border-bottom: none;
}

.qna-question {
	background: #f8f9fa;
	padding: 15px;
	border-radius: 8px;
	margin-bottom: 10px;
	border-left: 4px solid #2a5298;
}

.qna-question h4 {
	color: #2a5298;
	font-size: 16px;
	margin-bottom: 5px;
}

.qna-answer {
	padding: 15px;
	background: #fff;
	border-left: 4px solid #28a745;
	margin-left: 20px;
}

.qna-answer h4 {
	color: #28a745;
	font-size: 16px;
	margin-bottom: 5px;
}

/* ============== 반응형 미디어 쿼리 ============== */

/* 태블릿 (768px 이하) */
@media ( max-width : 768px) {
	.main-container {
		margin: 20px auto;
		padding: 0 15px;
	}
	.product-info {
		grid-template-columns: 1fr;
		gap: 30px;
		padding: 30px 20px;
	}
	.main-image {
		height: 300px; /* 모바일에서 높이 조정 */
	}
	.product-title {
		font-size: 24px;
	}
	.discount-rate, .sale-price {
		font-size: 24px;
	}
	.button-group {
		flex-direction: column;
		gap: 12px;
	}
	.btn {
		width: 100%;
		padding: 18px;
	}
	.tab-header {
		padding: 0;
	}
	.tab-btn {
		padding: 15px 20px;
		font-size: 14px;
	}
	.modal-overlay {
		padding: 10px;
	}
	.modal-header {
		padding: 15px 20px;
	}
	.modal-title {
		font-size: 18px;
	}
	.modal-body {
		padding: 20px;
	}
	.thumbnail-images {
		justify-content: center;
	}
	.total-price {
		flex-direction: column;
		text-align: center;
		gap: 10px;
	}
}

/* 모바일 (480px 이하) */
@media ( max-width : 480px) {
	.main-container {
		padding: 0 10px;
	}
	.product-info {
		padding: 20px 15px;
		gap: 20px;
	}
	.main-image {
		height: 250px;
		margin-bottom: 10px;
	}
	.thumbnail {
		width: 60px;
		height: 60px;
	}
	.product-title {
		font-size: 20px;
	}
	.breadcrumb {
		font-size: 12px;
		overflow-x: auto;
		white-space: nowrap;
	}
	.discount-info {
		flex-direction: column;
		gap: 5px;
		align-items: flex-start;
	}
	.discount-rate {
		font-size: 20px;
	}
	.sale-price {
		font-size: 22px;
	}
	.quantity-btn, .quantity-input {
		height: 45px;
	}
	.quantity-btn {
		width: 45px;
		font-size: 20px;
	}
	.quantity-input {
		width: 80px;
	}
	.btn {
		font-size: 15px;
		padding: 16px;
	}
	.tab-btn {
		padding: 12px 15px;
		font-size: 13px;
	}
	.review-header {
		flex-direction: column;
		align-items: flex-start;
		gap: 5px;
	}
	.modal-content {
		max-height: 90vh;
		margin: 5px;
	}
	.modal-header {
		padding: 12px 15px;
	}
	.modal-body {
		padding: 15px;
	}
	.product-tabs {
		margin-top: 30px;
	}
}

/* 큰 모바일 가로 모드 (480px - 768px) */
@media ( min-width : 481px) and (max-width: 767px) {
	.thumbnail-images {
		gap: 8px;
	}
	.thumbnail {
		width: 70px;
		height: 70px;
	}
}

/* 아주 작은 화면 (360px 이하) */
@media ( max-width : 360px) {
	.main-container {
		padding: 0 8px;
	}
	.product-info {
		padding: 15px 10px;
	}
	.main-image {
		height: 200px;
	}
	.product-title {
		font-size: 18px;
	}
	.discount-rate, .sale-price {
		font-size: 18px;
	}
	.total-amount {
		font-size: 20px;
	}
}

	/* 품절임박 작고 귀여운 네모 박스 */
	.low-stock-alert {
	background: #ff4757;
    color: white;
    font-size: 13px;
    font-weight: bold;
    padding: 2px 3px; /* 좌우 패딩 줄임 */
    border-radius: 2px;
    display: inline-block;
    margin: 2px 0;
    animation: blink 1.5s infinite;
    letter-spacing: -0.5px; /* 글자 간격 줄여서 딱 맞게 */
    white-space: nowrap; /* 줄바꿈 방지 */
    line-height: 1;
    width: fit-content;
    vertical-align: middle; /* 가격과 수직 정렬 */
	}
	
	/* 반짝이는 애니메이션 */
	@keyframes blink {
	    0%, 50% { 
	        opacity: 1; 
	        background: #ff4757;
	    }
	    51%, 100% { 
	        opacity: 0.7; 
	        background: #ff6b7a;
	    }
	}
	


</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>

	<div class="main-container">
		<!-- 브레드크럼 -->
		<div class="breadcrumb">
			<a href="/">홈</a> > <a href="/product/list">제품</a> > <span>${product.category_name}</span>
		</div>

		<!-- 상품 상세 정보 -->
		<div class="product-detail">
			<div class="product-info">

				<!-- 이미지 영역 수정 -->
				<div class="product-image">
					<c:if test="${not empty product.product_image_url}">
						<div class="main-image" id="mainImage"
							style="background-image: url('/images/${product.product_image_url}');">
						</div>
						<div class="thumbnail-images">
							<!-- 첫 번째 썸네일은 메인 이미지와 동일하게 -->
							<div class="thumbnail active"
								style="background-image: url('/images/${product.product_image_url}'); background-size: cover;"
								data-image="/images/${product.product_image_url}"></div>

							<!-- 나머지 상세 이미지들 -->
							<c:forEach var="detailImage" items="${upperdetailImages}">
								<div class="thumbnail"
									style="background-image: url('/images/${detailImage}'); background-size: cover;"
									data-image="/images/${detailImage}"></div>
							</c:forEach>
						</div>
					</c:if>
				</div>



				<!-- 상품 정보 -->
				<div class="product-details">
					<div class="category-brand">
						<span>${product.category_name}</span> · <span>${product.product_brand}</span>
					</div>

					<h1 class="product-title">${product.product_name}</h1>

					<div class="rating">
						<div class="stars">★★★★☆</div>
						<span class="rating-text">4.8 (234개 후기)</span>
					</div>


					<div class="price-section">
						<!-- 원가에서 계산하여 할인률 조절함 할인률 안만들었음-->
						<div class="original-price">
							<fmt:formatNumber value="${product.product_price * 1.3}"
								type="number" maxFractionDigits="0" />
						</div>
						<!-- 할인가 : 원가에서 조정 -->
						<div class="discount-info">
							<span class="discount-rate">30%</span> <span class="sale-price">
								<fmt:formatNumber value="${product.product_price}" type="number"
									maxFractionDigits="0" />
							</span> <span class="currency">원</span>
							<c:if test="${product.product_cnt <= 30}">
								<span class="low-stock-alert"> 품절임박 </span>
							</c:if>

						</div>
					</div>

					<div class="quantity-section">
					    <!-- 왼쪽: 수량 컨트롤 -->
					    <div class="quantity-control-wrapper">
					        <label class="quantity-label">수량</label>
					        <div class="quantity-control">
					            <button type="button" class="quantity-btn" onclick="changeQuantity(-1)">-</button>
					            <input type="number" class="quantity-input" id="quantity" value="1" min="1" readonly>
					            <button type="button" class="quantity-btn" onclick="changeQuantity(1)">+</button>
					        </div>
					    </div>
					    
					    <!-- 오른쪽: 총 가격 -->
					    <div class="total-price">
					        <span class="total-label">${product.product_name}</span>
					        <span class="total-amount" id="totalPrice">
					            총 <fmt:formatNumber value="${product.product_price}" type="number" maxFractionDigits="0" /> 원
					        </span>
					    </div>
					</div>

					<div class="button-group">
						<button type="button" id="btnCart" class="btn btn-cart">장바구니</button>
						<button type="button" id="btnBuy" class="btn btn-buy">구매하기</button>
					</div>
				</div>
			</div>
		</div>

		<!-- 상품 설명 탭 -->
		<div class="product-tabs">
			<div class="tab-header">
				<button class="tab-btn active" onclick="showTab('description')">상품상세</button>
				<button class="tab-btn" onclick="showTab('reviews')">리뷰</button>
				<button class="tab-btn" onclick="showTab('qna')">상품Q&A</button>
			</div>
		</div>
	</div>

	<!-- 탭 내용 -->
	<div class="tab-content">
		<!-- 상품설명 내용 -->

		<div id="description-content" class="tab-panel active">
			<h3>제품 특징</h3>

			<!-- 관리자 전용 이미지 관리 영역 -->
			<c:if test="${user.mem_roll == 'admin'}">
				<div class="admin-image-controls">
					<h4>📷 이미지 관리</h4>
					<form id="imageUploadForm" enctype="multipart/form-data">
						<input type="hidden" name="product_idx"
							value="${product.product_idx}" /> <input type="file"
							id="imageInput" name="productImages" accept="image/*"
							multiple style="display: none;">
						<button type="button" class="btn-upload"
							onclick="document.getElementById('imageInput').click()">
							이미지 추가</button>
						<div id="previewContainer"></div>
						<button type="button" id="saveImages" class="btn-save"
							style="display: none;">저장</button>
					</form>
				</div>
			</c:if>

			<!-- 상품 상세 이미지 출력 -->
			<div class="product-detail-images">
				<!-- 메인 이미지 -->
				<c:if test="${not empty product.product_image_url}">
					<div class="image-item">
						<img src="/images/${product.product_image_url}" alt="메인 상품 이미지" />
						<c:if test="${sessionScope.user.mem_roll == 'admin'}">
							<div class="image-actions">
								<button onclick="updateProductImageByIdx(` ${lowerdetailImages} `)">수정</button>

								<button onclick="deleteProductImageByIdx(`${lowerdetailImages}`)">삭제</button>
							</div>
						</c:if>
					</div>
				</c:if>
			</div>


			<!-- 디버그용 - 임시로 추가해서 확인 -->
			<p style="background: red; color: white; padding: 10px;">
				디버그: user_role = "${user.mem_roll == 'admin'}" <br> 세션 확인:
				<c:if test="${sessionScope.user.mem_roll == 'admin'}">관리자임</c:if>
				<c:if test="${sessionScope.user.mem_roll != 'admin'}">관리자아님</c:if>
			</p>


			<!-- 상세 이미지들 -->
			<c:forEach var="detailImage" items="${lowerdetailImages}"
				varStatus="status">
				<div class="image-item">
					<img src="${pageContext.request.contextPath}/images/${detailImage}"
						alt="상품 상세 이미지" />
					<c:if test="${sessionScope.user.mem_roll == 'admin'}">
						<div class="image-actions">
							<button onclick="updateProductImageByIdx('${detailImage}')">수정</button>
							<button onclick="deleteProductImageByIdx('${detailImage}')">삭제</button>
						</div>
					</c:if>
				</div>
			</c:forEach>
		</div>

		<!-- 제품 특징 (기존 내용) -->
		<ul class="feature-list">
			<li>천연 성분으로 제작된 남성 전용 스킨케어 제품</li>
			<li>빠른 흡수력과 끈적하지 않는 사용감</li>
			<li>민감성 피부도 안심하고 사용 가능</li>
		</ul>
	</div>

	<!-- 리뷰 내용 -->
	<div id="reviews-content" class="tab-panel">
		<div class="review-item">
			<div class="review-header">
				<div class="review-rating">★★★★★</div>
				<div class="review-author">김**님</div>
				<div class="review-date">2024.11.15</div>
			</div>
			<div class="review-text">사용감이 정말 좋네요. 끈적하지 않고 빠르게 흡수되어서 만족합니다.
				향도 은은하고 좋아요.</div>
		</div>

		<div class="review-item">
			<div class="review-header">
				<div class="review-rating">★★★★☆</div>
				<div class="review-author">박**님</div>
				<div class="review-date">2024.11.10</div>
			</div>
			<div class="review-text">피부가 민감한 편인데 자극 없이 잘 맞네요. 보습력도 충분합니다.</div>
		</div>

		<div class="review-item">
			<div class="review-header">
				<div class="review-rating">★★★★★</div>
				<div class="review-author">이**님</div>
				<div class="review-date">2024.11.05</div>
			</div>
			<div class="review-text">배송도 빠르고 제품 퀄리티도 만족스럽습니다. 재주문 예정이에요.</div>
		</div>
	</div>

	<!-- Q&A 내용 -->
	<div id="qna-content" class="tab-panel">
		<div class="qna-item">
			<div class="qna-question">
				<h4>Q. 민감성 피부도 사용 가능한가요?</h4>
				<p>저자극 제품을 찾고 있는데, 민감성 피부에도 괜찮을까요?</p>
			</div>
			<div class="qna-answer">
				<h4>A. 네, 사용 가능합니다.</h4>
				<p>저자극 포뮬러로 제작되어 민감성 피부에도 안전하게 사용하실 수 있습니다. 다만 개인차가 있을 수 있으니 처음
					사용 시 소량으로 테스트해보시기 바랍니다.</p>
			</div>
		</div>

		<div class="qna-item">
			<div class="qna-question">
				<h4>Q. 하루에 몇 번 사용해야 하나요?</h4>
				<p>효과적인 사용법이 궁금합니다.</p>
			</div>
			<div class="qna-answer">
				<h4>A. 하루 2회 사용을 권장합니다.</h4>
				<p>아침, 저녁 세안 후 사용하시면 최적의 효과를 얻으실 수 있습니다.</p>
			</div>
		</div>
	</div>


	<!-- JavaScript -->
	<script>
        // 수량 변경
        function changeQuantity(change) {
            const quantityInput = document.getElementById('quantity');
            const currentQuantity = parseInt(quantityInput.value);
            const newQuantity = Math.max(1, currentQuantity + change);
            quantityInput.value = newQuantity;
            updateTotalPrice();
        }

        // 총 가격 업데이트
        function updateTotalPrice() {
            const quantity = parseInt(document.getElementById('quantity').value);
            const unitPrice = ${product.product_price};
            const totalPrice = quantity * unitPrice;
            document.getElementById('totalPrice').textContent = totalPrice.toLocaleString() + '원';
        }

        // 탭 전환 함수
        function showTab(tabName) {
            // 모든 탭 버튼 비활성화
            document.querySelectorAll('.tab-btn').forEach(btn => {
                btn.classList.remove('active');
            });
            
            // 모든 탭 패널 숨김
            document.querySelectorAll('.tab-panel').forEach(panel => {
                panel.classList.remove('active');
            });
            
            // 클릭한 탭 버튼 활성화
            event.target.classList.add('active');
            
            // 해당 탭 패널 표시
            document.getElementById(tabName + '-content').classList.add('active');
        }

        // 썸네일 클릭
   

// 썸네일 클릭 시 메인 이미지 변경
document.querySelectorAll('.thumbnail').forEach((thumb, index) => {
    thumb.addEventListener('click', function() {
        // 모든 썸네일에서 active 클래스 제거
        document.querySelectorAll('.thumbnail').forEach(t => t.classList.remove('active'));
        
        // 클릭한 썸네일에 active 클래스 추가
        this.classList.add('active');
        
        // 메인 이미지 변경
        const mainImage = document.querySelector('.main-image');
        const thumbBackground = window.getComputedStyle(this).backgroundImage;
        
        if (thumbBackground && thumbBackground !== 'none') {
            mainImage.style.backgroundImage = thumbBackground;
            
            // 부드러운 페이드 효과
            mainImage.style.opacity = '0';
            setTimeout(() => {
                mainImage.style.opacity = '1';
            }, 150);
        }
    });
});
			
			// 첫 번째 썸네일을 기본 active로 설정
			document.addEventListener('DOMContentLoaded', function() {
			    const firstThumbnail = document.querySelector('.thumbnail');
			    if (firstThumbnail) {
			        firstThumbnail.classList.add('active');
			    }
			});
         

        
        
        // SweetAlert 기능
        document.addEventListener('DOMContentLoaded', function() {
            // 장바구니 버튼
            document.getElementById('btnCart').addEventListener('click', function() {
                Swal.fire({
                    title: '장바구니에 담으시겠습니까?',
                    icon: 'question',
                    showCancelButton: true,
                    confirmButtonText: '예',
                    cancelButtonText: '아니오',
                    confirmButtonColor: '#2a5298',
                    cancelButtonColor: '#d33'
                }).then((result) => {
                    if (result.isConfirmed) {
                        Swal.fire('완료!', '장바구니에 추가되었습니다.', 'success');
                    }
                });
            });
            
            // 구매하기 버튼
            document.getElementById('btnBuy').addEventListener('click', function() {
                Swal.fire({
                    title: '구매하시겠습니까?',
                    icon: 'question',
                    showCancelButton: true,
                    confirmButtonText: '예',
                    cancelButtonText: '아니오',
                    confirmButtonColor: '#1e3c72',
                    cancelButtonColor: '#d33'
                }).then((result) => {
                    if (result.isConfirmed) {
                        Swal.fire('완료!', '주문이 접수되었습니다.', 'success');
                    }
                });
            });
        });
        
     // 이미지 업로드 관련
        document.addEventListener('DOMContentLoaded', function() {
            const imageInput = document.getElementById('imageInput');
            const saveButton = document.getElementById('saveImages');
            
            if (imageInput) {
                imageInput.addEventListener('change', function() {
                    if (this.files.length > 0) {
                        saveButton.style.display = 'block';
                    }
                });
            }
            
            if (saveButton) {
                saveButton.addEventListener('click', function() {
                    const formData = new FormData();
                    const files = imageInput.files;
                    formData.append('product_idx', '${product.product_idx}');
                    
                    for (let file of files) {
                        formData.append('productImages', file);
                    }
                    
                    fetch('/adminpage/uploadImages', {  // 경로 수정
                        method: 'POST',
                        body: formData
                    })
                    .then(response => response.json())
                    .then(data => {
                        if (data.success) {
                            Swal.fire('성공!', '이미지가 업로드되었습니다.', 'success')
                            .then(() => location.reload());
                        } else {
                            Swal.fire('오류', data.message, 'error');
                        }
                    });
                });
            }
        });

     // 이미지 업로드
       /*  document.addEventListener('DOMContentLoaded', function() {
            const imageInput = document.getElementById('imageInput');
            const saveButton = document.getElementById('saveImages');
            const uploadUrl = '${pageContext.request.contextPath}/adminpage/uploadImages'; // context path 포함

            if (imageInput) {
                imageInput.addEventListener('change', function() {
                    if (this.files.length > 0) saveButton.style.display = 'block';
                });
            }

            if (saveButton) {
                saveButton.addEventListener('click', function() {
                    const formData = new FormData();
                    formData.append('product_idx', '${product.product_idx}');
                    const files = imageInput.files;
                    for (let file of files) formData.append('productImages', file);

                    fetch(uploadUrl, { method: 'POST', body: formData })
                        .then(res => res.json())
                        .then(data => {
                            if (data.success) Swal.fire('성공!', '이미지가 업로드되었습니다.', 'success')
                                .then(() => location.reload());
                            else Swal.fire('오류', data.message, 'error');
                        });
                });
            }
        }); */

        // 메인 이미지 수정
        function editMainImage() {
            Swal.fire({
                title: '메인 이미지 수정',
                html: '<input type="file" id="newMainImage" accept="image/*">',
                showCancelButton: true,
                confirmButtonText: '수정',
                preConfirm: () => {
                    const file = document.getElementById('newMainImage').files[0];
                    if (!file) Swal.showValidationMessage('새 이미지를 선택하세요.');
                    return file;
                }
            }).then(result => {
                if (result.isConfirmed) {
                    const formData = new FormData();
                    formData.append('product_idx', '${product.product_idx}');
                    formData.append('newImage', result.value);

                    fetch('${pageContext.request.contextPath}/adminpage/updateMainImage', { method: 'POST', body: formData })
                        .then(res => res.json())
                        .then(data => {
                            if (data.success) Swal.fire('완료!', '메인 이미지가 수정되었습니다.', 'success')
                                .then(() => location.reload());
                        });
                }
            });
        }

        // 상세 이미지 수정
        function editDetailImageByIdx(product_image_idx) {
            Swal.fire({
                title: '상세 이미지 수정',
                html: '<input type="file" id="newDetailImage" accept="image/*">',
                showCancelButton: true,
                confirmButtonText: '수정',
                preConfirm: () => {
                    const file = document.getElementById('newDetailImage').files[0];
                    if (!file) Swal.showValidationMessage('새 이미지를 선택하세요.');
                    return file;
                }
            }).then(result => {
                if (result.isConfirmed) {
                    const formData = new FormData();
                    formData.append('product_image_idx', product_image_idx);
                    formData.append('newImage', result.value);

                    fetch('${pageContext.request.contextPath}/adminpage/updateDetailImage', { method: 'POST', body: formData })
                        .then(res => res.json())
                        .then(data => {
                            if (data.success) Swal.fire('완료!', '상세 이미지가 수정되었습니다.', 'success')
                                .then(() => location.reload());
                        });
                }
            });
        }

        // 상세 이미지 삭제
        function deleteDetailImageByIdx(product_image_idx) {
            Swal.fire({
                title: '이미지를 삭제하시겠습니까?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: '삭제',
                confirmButtonColor: '#dc3545'
            }).then(result => {
                if (result.isConfirmed) {
                    fetch('${pageContext.request.contextPath}/adminpage/deleteImage', {
                        method: 'POST',
                        headers: {'Content-Type': 'application/json'},
                        body: JSON.stringify({ product_image_idx })
                    })
                    .then(res => res.json())
                    .then(data => {
                        if (data.success) Swal.fire('완료!', '이미지가 삭제되었습니다.', 'success')
                            .then(() => location.reload());
                    });
                }
            });
        }
        
        
    </script>

	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>