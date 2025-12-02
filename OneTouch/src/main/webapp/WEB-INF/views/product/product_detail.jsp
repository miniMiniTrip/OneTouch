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

/* 해시태그 */
.product-hashtags {
	display: flex;
	flex-wrap: wrap;
	gap: 3px;
	margin: 10px 0;
}

.hashtag-badge {
	display: inline-block;
	padding: 1px 4px;
	background-color: #f0f0f0;
	color: #555;
	border-radius: 8px;
	font-size: 11px;
	text-decoration: none;
	transition: all 0.2s ease;
	border: 1px solid #e0e0e0;
	line-height: 1.2;
}

.hashtag-badge:hover {
	background-color: #5c6bc0;
	color: white;
	border-color: #5c6bc0;
	transform: translateY(-1px);
	box-shadow: 0 1px 3px rgba(92, 107, 192, 0.3);
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
	/* box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); */
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
		url('${pageContext.request.contextPath}/images/products_list/${product.product_image_url}');
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
	border-bottom: 1px solid #eee;
	*
	요소간
	간격
	*/
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

.button-group .btn-buy {
    background: linear-gradient(135deg, #1e3c72, #2a5298);
    color: white !important;
    transition: all 0.2s;
}

.button-group .btn-buy:hover {
    background: #2a5298;
    color: white !important;
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

/* 리뷰 컨테이너 전체 레이아웃 */
.review-container {
	position: relative;
	display: flex;
	gap: 40px;
	max-width: 1200px;
	margin: 0 auto; /* 가운데 정렬 */
	padding: 0 20px; /* 좌우 여백 */
}

/* 좌측 통계 영역 */
.review-stats {
	flex: 0 0 350px;
	background: #f8f9fa;
	padding: 30px;
	border-radius: 8px;
	height: fit-content;
}

.review-summary h3 {
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 20px;
	color: #333;
}

.rating-summary {
	margin-bottom: 30px;
}

.total-rating {
	display: flex;
	align-items: center;
	gap: 10px;
	margin-bottom: 10px;
}

.stars {
	color: #ffc107;
	font-size: 24px;
}

.rating-score {
	font-size: 32px;
	font-weight: bold;
	color: #333;
}

.rating-count {
	display: flex;
	align-items: center;
	gap: 5px;
	color: #666;
	font-size: 14px;
}

.info-icon {
	background: #007bff;
	color: white;
	border-radius: 50%;
	width: 16px;
	height: 16px;
	display: inline-flex;
	align-items: center;
	justify-content: center;
	font-size: 12px;
}

/* 별점 분포 바 */
.rating-breakdown {
	margin-bottom: 30px;
}

.rating-row {
	display: flex;
	align-items: center;
	gap: 10px;
	margin-bottom: 8px;
}

.rating-row span:first-child {
	width: 30px;
	font-size: 14px;
	color: #666;
}

.rating-row span:last-child {
	width: 40px;
	font-size: 14px;
	color: #666;
	text-align: right;
}

.rating-bar {
	flex: 1;
	height: 8px;
	background: #e9ecef;
	border-radius: 4px;
	overflow: hidden;
}

.bar-fill {
	height: 100%;
	background: #ffc107;
	border-radius: 4px;
}

.bar-fill.orange {
	background: #fd7e14;
}

.bar-fill.gray {
	background: #6c757d;
}

.bar-fill.light-gray {
	background: #adb5bd;
}

/* 맛 만족도 */
.taste-stats {
	border-top: 1px solid #e9ecef;
	padding-top: 20px;
}

.taste-row {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 10px;
	font-size: 14px;
}

.taste-row span:first-child {
	color: #666;
}

.taste-row span:nth-child(2) {
	color: #333;
	font-weight: 500;
}

.taste-row span:last-child {
	color: #007bff;
	font-weight: bold;
}

.show-more {
	text-align: center;
	color: #007bff;
	cursor: pointer;
	font-size: 14px;
	margin-top: 15px;
}

/* 우측 리뷰 목록 */
.review-list {
	flex: 1;
}

.review-header-section {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
	padding-bottom: 15px;
	border-bottom: 1px solid #e9ecef;
}

.review-tabs {
	display: flex;
	gap: 20px;
}

.tab-btn {
	background: none;
	border: none;
	padding: 10px 15px;
	font-size: 16px;
	color: #666;
	cursor: pointer;
	border-bottom: 2px solid transparent;
}

.tab-btn.active {
	color: #007bff;
	border-bottom-color: #007bff;
	font-weight: bold;
}

.review-search {
	display: flex;
	gap: 10px;
}



.sort-select {
	padding: 8px 12px;
	border: 1px solid #ddd;
	border-radius: 4px;
	font-size: 14px;
	background: white;
}

/* 개별 리뷰 아이템 */
.review-items {
	display: flex;
	flex-direction: column;
	gap: 30px;
}

.review-item {
	border-bottom: 1px solid #eee;
	padding-bottom: 30px;
}

.review-item:last-child {
	border-bottom: none;
}

.reviewer-info {
	display: flex;
	gap: 15px;
	margin-bottom: 15px;
}

.reviewer-avatar {
	width: 50px;
	height: 50px;
	border-radius: 50%;
	background: #007bff;
	color: white;
	display: flex;
	align-items: center;
	justify-content: center;
	font-weight: bold;
	font-size: 18px;
}

.reviewer-details {
	flex: 1;
}

.reviewer-name {
	font-weight: bold;
	font-size: 16px;
	margin-bottom: 5px;
	color: #333;
}

.review-rating {
	color: #ffc107;
	font-size: 16px;
	margin-bottom: 5px;
}

.review-date {
	color: #666;
	font-size: 14px;
	margin-bottom: 5px;
}

.reviewer-type {
	color: #666;
	font-size: 12px;
}

.review-content {
	margin-left: 65px;
}

.product-info {
	color: #666;
	font-size: 14px;
	margin-bottom: 15px;
}

.review-images {
	display: flex;
	gap: 10px;
	margin-bottom: 15px;
	flex-wrap: wrap;
}

.review-images img {
	width: 80px;
	height: 80px;
	object-fit: cover;
	border-radius: 8px;
	border: 1px solid #e9ecef;
}

.review-text {
	color: #333;
	line-height: 1.6;
}

.review-text p {
	margin-bottom: 10px;
}

.review-text p:last-child {
	margin-bottom: 0;
}

/* 반응형 */
@media ( max-width : 1024px) {
	.review-container {
		flex-direction: column;
	}
	.review-stats {
		flex: none;
	}
	.review-header-section {
		flex-direction: column;
		gap: 15px;
		align-items: stretch;
	}
	.review-search {
		justify-content: space-between;
	}
}

@media ( max-width : 768px) {
	.review-content {
		margin-left: 0;
	}
	.reviewer-info {
		flex-direction: column;
		align-items: center;
		text-align: center;
	}
	.search-input {
		width: 100%;
	}
}

/* Q&A 스타일 */

#qna-content {
	width: 100%;          /* 화면 가득 */
    max-width: 1200px;    /* 최대 1200px */
    margin: 0 auto;       /* 중앙 정렬 */
    padding: 0 20px;      /* 좌우 여백 */
    box-sizing: border-box; /* 패딩 포함 */
	
	}
.content{

	flex: 1;
	padding: 40px;
}


.content-header {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 30px;
	padding-bottom: 15px;
/* 	border-bottom: 2px solid #5c6bc0; */ /* 파랑 선 안예뻐서 가림 */
}

.content-header h2 {
	font-size: 18px;
	color: #1A237E;
	font-weight: 600;
	margin: 0;
}

.qna-title {
    display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 30px;
	padding-bottom: 15px;
	border-bottom: 2px solid #5c6bc0;
}

.back-arrow {
    font-size: 18px;
    color: #666;
    cursor: pointer;
}


.qna-btn-write {
	
    background: #1A237E; 
    color: white;
    padding: 5px 24px;
    border: none;
    border-radius: 4px;
    font-size: 14px;
    cursor: pointer; 
    display: block; /* inline-flex에서 block으로 변경 */
    width: fit-content;
    margin-left: auto; /* 오른쪽 정렬 */
    gap: 6px;
    transition: background 0.3s;
    height: 40px;
}

.qna-btn-write:hover {
	background: #4a5aaf;
	color: white;
}

.qna-btn-write::before {
	content: '✎';
	font-size: 16px;
}



/* Q&A 테이블 */
.qna-table-container {
    margin-top: 20px;
    overflow-x: auto;
}

.qna-table {
    width: 100%;
    border-collapse: collapse;
    background: white;
}

.qna-table thead {
    background: #f8f9fa;
}

.qna-table th {
    padding: 15px 10px;
    text-align: center;
    font-weight: 600;
    color: #333;
    border-bottom: 1px solid #ddd;
}

 .qna-table td {
    padding: 15px 10px;
    text-align: center;
    border-bottom: 1px solid #eee; 
    vertical-align: middle;
} 
 

.qna-table th:nth-child(2),
.qna-table td:nth-child(2) {
   /*  text-align: left; */
    text-align: center;
    width: 30%;
    padding-left: 10px
}

.qna-table th:nth-child(1),
.qna-table td:nth-child(1) {
    width: 10%;
}

.qna-table th:nth-child(3),
.qna-table td:nth-child(3) {
    width: 12%;
}

.qna-table th:nth-child(4),
.qna-table td:nth-child(4) {
    width: 20%;
}

.qna-table th:nth-child(5),
.qna-table td:nth-child(5) {
    width: 12%;
}

.qna-title-link {
    color: #5c6bc0;
    text-decoration: none;
    font-weight: 500;
}

.qna-title-link:hover {
    text-decoration: underline;
}

.date-time {
    font-size: 14px;
}

.time {
    color: #666;
    font-size: 12px;
    margin-top: 2px;
}

.status-badge {
    padding: 4px 8px;
    border-radius: 12px;
    font-size: 12px;
    font-weight: bold;
}

.status-badge.answered {
    background: #fff3cd;
    color: #856404;
}

.status-badge.completed {
    background: #d4edda;
    color: #155724;
}

/* 반응형 */
@media (max-width: 768px) {
    .qna-table th,
    .qna-table td {
        padding: 10px 5px;
        font-size: 14px;
    }
    
    .qna-header {
        flex-direction: column;
        gap: 15px;
        align-items: stretch;
    }
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

/* 품절임박 박스 */
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
@
keyframes blink { 0%, 50% {
	opacity: 1;
	background: #ff4757;
}

51
%
,
100
%
{
opacity
:
0.7;
background
:
#ff6b7a;
}
}
.feature-row {
	display: flex;
	align-items: center;
	gap: 15px;
}

.feature-gif {
	width: 150px;
	border-radius: 8px;
	margin: 0 auto;
}

/* 내용 이미지 추가할때 미리보기 보기 영역  */
#previewContainer {
    text-align: center;
}
#previewContainer img {
    margin: 10px;
    max-width: 300px;
    border: 1px solid #ccc;
    border-radius: 8px;
    display: inline-block; /* inline-block으로 여러 이미지도 가운데 정렬 */
}
.reviews {
    text-align: center;
    margin: 15px 0;
}

.reviews button {
    background-color: #3d5a98;
    color: white;
    border: none;
    padding: 8px 16px;
    border-radius: 4px;
    font-size: 14px;
    font-weight: normal;
    cursor: pointer;
    min-width: 80px;
}

.reviews button:hover {
    background-color: #2d4373;
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
					<div class="image-item">
						<div class="main-image" id="mainImage"
							style="background-image: url('/images/products_list/${product.product_image_url}');">
													<c:if test="${sessionScope.user.mem_roll == 'admin'}">
							
							<div class="image-actions">
								<button
									onclick="updateProductImageByIdx('${product.product_image_url}')">수정</button>

								<%-- <button
									onclick="deleteProductImageByIdx(`${lowerdetailImages}`)">삭제</button> --%>
							</div>
						</c:if>
						</div>
							
					</div>
						<div class="thumbnail-images">
							<!-- 첫 번째 썸네일은 메인 이미지와 동일하게 -->
							<div class="thumbnail active"
								style="background-image: url('/images/products_list/${product.product_image_url}'); background-size: cover;"
								data-image="/images/${product.product_image_url}"></div>

							<!-- 나머지 상세 이미지들 -->
							<c:forEach var="detailSubImage" items="${subImages}">
								<div class="thumbnail" style="background-image: url('/images/products_detail/${detailSubImage}'); background-size: cover;"
									data-image="/images/products_detail/${detailSubImage}"></div>
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
					<!-- 해시태그 -->
					<c:if test="${not empty product.hashtag_list}">
						<div class="product-hashtags">
							<c:forEach var="hashtag" items="${product.hashtag_list}">
								<a href="${pageContext.request.contextPath}/hashtag/search.do?hashtag_idx=${hashtag.hashtag_idx}" 
								class="hashtag-badge">#${hashtag.hashtag_name}</a>
								</a>
							</c:forEach>
						</div>
					</c:if>


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
								<button type="button" class="quantity-btn"
									onclick="changeQuantity(-1)">-</button>
								<input type="number" class="quantity-input" id="quantity"
									value="1" min="1" readonly>
								<button type="button" class="quantity-btn"
									onclick="changeQuantity(1)">+</button>
							</div>
						</div>

						<!-- 오른쪽: 총 가격 -->
						<div class="total-price">
							<span class="total-label">${product.product_name}</span> <span
								class="total-amount" id="totalPrice"> 총 <fmt:formatNumber
									value="${product.product_price}" type="number"
									maxFractionDigits="0" /> 원
							</span>
						</div>
					</div>

					<div class="button-group">
						<button type="button" id="btnCart" class="btn btn-cart">장바구니담기</button>
						<button type="button" id="btnBuy" class="btn btn-buy">바로구매 > </button> <!-- 로그인 해주세요 연결 -->
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
							id="imageInput" name="productImages" accept="image/*" multiple
							style="display: none;">
						<button type="button" class="btn-upload"
							onclick="document.getElementById('imageInput').click()">
							이미지 추가</button>
							<button type="button" id="saveImages" class="btn-save"
							style="display: none;">저장</button>
						<div id="previewContainer">
						</div>
						<button type="button" id="saveImages" class="btn-save"
							style="display: none;">저장</button>
					</form>
				</div>
			</c:if>
		<script type="text/javascript">
		const imageInput = document.getElementById('imageInput');
		const previewContainer = document.getElementById('previewContainer');
		const saveButton = document.getElementById('saveImages');

		imageInput.addEventListener('change', function() {
		    previewContainer.innerHTML = ""; // 이전 미리보기 초기화
		    const files = imageInput.files;

		    if (files.length > 0) {
		        saveButton.style.display = 'inline-block'; // 저장 버튼 보이기
		    } else {
		        saveButton.style.display = 'none';
		    }

		    for (let i = 0; i < files.length; i++) {
		        const file = files[i];

		        if (!file.type.startsWith('image/')) continue; // 이미지 파일만 처리

		        const reader = new FileReader();
		        reader.onload = function(e) {
		            const img = document.createElement('img');
		            img.src = e.target.result;
		            img.style.maxWidth = "100%";
		            img.style.margin = "5px auto";
		            img.style.border = "1px solid #ccc";
		            img.style.borderRadius = "8px";
		            previewContainer.appendChild(img);
		        }
		        reader.readAsDataURL(file); // 선택 파일을 base64로 읽기
		    }
		});
		</script>





			<!-- 상세 이미지들 -->
			<c:forEach var="detailImage" items="${lowerdetailImages}"
				varStatus="status">
		 <div class="image-item"> 
					<img src="${pageContext.request.contextPath}/images/${detailImage}"
						alt="상품 상세 이미지" />
					<c:if test="${sessionScope.user.mem_roll == 'admin'}">
						<div class="image-actions">
							<%-- <button onclick="updateProductImageByIdx('${detailImage}')">수정</button> --%>
							<button onclick="deleteProductImageByIdx()">삭제</button>
						</div>
					</c:if>
				 </div> 
			</c:forEach>
		</div>
	</div>

	
	<!-- 커뮤니티 들어와햐 할 곳 리뷰 내용 --> 	<!-- 커뮤니티 들어와햐 할 곳 리뷰 내용 --> 	<!-- 커뮤니티 들어와햐 할 곳 리뷰 내용 -->
	<div id="reviews-content" class="tab-panel">
		<%@include file="product_detail_review.jsp" %>
	</div>
<!-- 커뮤니티 들어와햐 할 곳 리뷰 내용 --> 	<!-- 커뮤니티 들어와햐 할 곳 리뷰 내용 --> 	<!-- 커뮤니티 들어와햐 할 곳 리뷰 내용 --><!-- 커뮤니티 들어와햐 할 곳 리뷰 내용 -->



	<!-- 상품 Q&A  --> <!-- 상품 Q&A  --> <!-- 상품 Q&A  --> <!-- 상품 Q&A  -->
	<div id="qna-content" class="tab-panel">
    <div class="content">
        <div class="content-header">
            <h2>💬상품 Q&A</h2>
        </div>
        <%-- <c:if test="${not empty qna_list}"> --%>
        <button class="qna-btn-write"
       <%--  onclick="location.href='${pageContext.request.contextPath}/mypage/qna_write'" --%>>Q&A 쓰기</button>
    	<%-- </c:if> --%>
    </div>
    
    <div class="qna-table-container">
        <table class="qna-table">
            <thead>
                <tr>
                  
				    <th style="width: 80px;">번호</th>
					<th>제목</th>
					<th style="width: 100px;">작성자</th>
					<th style="width: 120px;">작성일</th>
					<th style="width: 100px;">답변상태</th>
					</tr>
               
            </thead>
            
            <tbody>
            	<%-- <c:forEach var="qna" items="${qna_list}" varStatus="status"> --%>
                <tr>
                    <td>1</td>
                    <td>
                        <a href="#" class="qna-title-link">배송언제되나요?</a>
                    </td>
                    <td>관리자</td>
                    <td>
                        <div class="date-time">
                            <div>2025-11-29</div>
                            <div class="time">16:37:55.0</div>
                        </div>
                    </td>
                    <td>
                        <span class="status-badge answered">답변대기</span>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>
                        <a href="#" class="qna-title-link">민감성 피부도 사용 가능한가요?</a>
                    </td>
                    <td>김**님</td>
                    <td>
                        <div class="date-time">
                            <div>2025-11-28</div>
                            <div class="time">14:22:30.0</div>
                        </div>
                    </td>
                    <td>
                        <span class="status-badge completed">답변완료</span>
                    </td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>
                        <a href="#" class="qna-title-link">사용법이 궁금해요</a>
                    </td>
                    <td>박**님</td>
                    <td>
                        <div class="date-time">
                            <div>2025-11-27</div>
                            <div class="time">09:15:42.0</div>
                        </div>
                    </td>
                    <td>
                        <span class="status-badge completed">답변완료</span>
                    </td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>
                        <a href="#" class="qna-title-link">환불 가능한가요?</a>
                    </td>
                    <td>이**님</td>
                    <td>
                        <div class="date-time">
                            <div>2025-11-26</div>
                            <div class="time">11:40:15.0</div>
                        </div>
                    </td>
                    <td>
                        <span class="status-badge answered">답변대기</span>
                    </td>
                </tr>
                <tr>
                    <td>5</td>
                    <td>
                        <a href="#" class="qna-title-link">제품 성분이 궁금합니다</a>
                    </td>
                    <td>최**님</td>
                    <td>
                        <div class="date-time">
                            <div>2025-11-25</div>
                            <div class="time">15:25:08.0</div>
                        </div>
                    </td>
                    <td>
                        <span class="status-badge completed">답변완료</span>
                    </td>
                </tr>
               <%--  </c:forEach> --%>
            </tbody>
        </table>
    </div>
</div>


<!-- ================= 	모달수정	=================== -->
<script type="text/javascript">
function updateProductImageByIdx(imageFilename) {
    let subImages = [
        <c:forEach var="img" items="${subImages}">
            "${img}",
        </c:forEach>
    ];
    let subImageHtml = "";
    for (let subImage of subImages) {
        subImageHtml += `
        <img src="${pageContext.request.contextPath}/images/products_detail/\${subImage}"
            style="max-width: 100%; max-height: 300px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.15);"
            alt="서브 이미지">
        <p style="margin-top: 12px; font-size:14px; color:#666;">
            <strong>서브 이미지:</strong>\${subImage}<br>
        </p>`;
    }

    Swal.fire({
        title: '상세 이미지 수정',
        html: `
            <div style="text-align: center; padding: 20px;">
                <div style="margin-bottom: 20px; padding: 15px; background: #f8f9fa; border-radius: 12px;">
                    <img src="${pageContext.request.contextPath}/images/products_list/\${imageFilename}"
                         style="max-width: 100%; max-height: 300px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.15);"
                         alt="메인 이미지">
                    <p style="margin-top: 12px; font-size:14px; color:#666;">
                        <strong>메인 이미지:</strong>\${imageFilename}<br>
                    </p>
                </div>
                <input type="file" id="mainNewImage" accept="image/*"
                       style="display: block; margin: 15px auto; padding: 10px; border: 2px dashed #1e3c72; border-radius: 8px; width: 100%; max-width: 400px;">
                <p style="color: #e74c3c; font-size: 13px; margin-top: 8px;">
                    ※ 메인 이미지를 선택하면 기존 이미지가 교체됩니다.
                </p>
            </div>
            <div style="text-align: center; padding: 20px;">
                <div style="margin-bottom: 20px; padding: 15px; background: #f8f9fa; border-radius: 12px;">
                    \${subImageHtml}
                </div>
                <input type="file" id="subNewImage" accept="image/*"
                       style="display: block; margin: 15px auto; padding: 10px; border: 2px dashed #1e3c72; border-radius: 8px; width: 100%; max-width: 400px;" multiple>
                <p style="color: #e74c3c; font-size: 13px; margin-top: 8px;">
                    ※ 서브 이미지를 선택하면 기존 이미지가 교체됩니다.
                </p>
            </div>
        `,
        showCancelButton: true,
        confirmButtonText: '이미지 교체하기',
        cancelButtonText: '취소',
        confirmButtonColor: '#1e3c72',
        cancelButtonColor: '#95a5a6',
        width: '600px',
        padding: '20px',
        backdrop: 'rgba(0,0,0,0.7)',
        preConfirm: () => {
            const fileMainInput = document.getElementById('mainNewImage');
            const fileSubInput = document.getElementById('subNewImage');

            if ((!fileMainInput.files || fileMainInput.files.length === 0) &&
                (!fileSubInput.files || fileSubInput.files.length === 0)) {
                Swal.showValidationMessage('적어도 하나의 이미지를 선택해야 합니다!');
                return false;
            }

            const formData = new FormData();

            // 메인 이미지가 선택되었으면 append
            if (fileMainInput.files && fileMainInput.files.length > 0) {
                formData.append('newMainImage', fileMainInput.files[0]);
            }

            // 서브 이미지가 선택되었으면 append (여러개 가능)
            if (fileSubInput.files && fileSubInput.files.length > 0) {
                for (let i = 0; i < fileSubInput.files.length; i++) {
                    formData.append('newSubImages', fileSubInput.files[i]);
                }
            }

            return formData;
        }
    }).then((result) => {
        if (result.isConfirmed) {
            const formData = result.value;
            formData.append('product_idx', '${product.product_idx}');
            formData.append('old_image_filename', imageFilename);

            Swal.fire({
                title: '업로드 중...',
                text: '이미지를 교체하고 있습니다',
                allowOutsideClick: false,
                didOpen: () => Swal.showLoading()
            });

            $.ajax({
                url: '/product/updateDetailImage',
                type: 'POST',
                data: formData,
                processData: false,
                contentType: false,
                success: function(data) {
                    if (data.success) {
                        Swal.fire({
                            icon: 'success',
                            title: '교체되었습니다!',
                            timer: 1800,
                            showConfirmButton: false
                        }).then(() => location.reload());
                    } else {
                        Swal.fire('실패', data.message || '이미지 교체에 실패했습니다.', 'error');
                    }
                },
                error: function() {
                    Swal.fire('오류', '서버와 연결이 불안정합니다.', 'error');
                }
            });
        }
    });
}
</script>
<!-- ================= 	//모달수정	=================== -->

<!-- ================= 상품 내용 이미지 삭제 ================-->

<script type="text/javascript">
function deleteProductImageByIdx(){
    let contentImagesName = [
        <c:forEach var="img" items="${lowerdetailImages}">
            "${img}",
        </c:forEach>
    ];
    const formData = new FormData();
    formData.append("contentImagesName",contentImagesName);
		$.ajax({
            url: '/product/deleteDetailContentImage',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function(data) {
                if (data.success) {
                    Swal.fire({
                        icon: 'success',
                        title: '내용 이미지가 삭제되었습니다',
                        timer: 1800,
                        showConfirmButton: false
                    }).then(() => location.reload());
                } else {
                    Swal.fire('실패', data.message || '내용 이미지 삭제에 실패했습니다.', 'error');
                }
            },
            error: function() {
                Swal.fire('오류', '서버와 연결이 불안정합니다.', 'error');
            }
        });
}
</script>
<!-- ================= /상품 내용 이미지 삭제 ===============-->


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
			                Swal.fire({
			                    title: '완료!',
			                    text: '장바구니에 추가되었습니다. 장바구니로 이동하시겠습니까?',
			                    icon: 'success',
			                    showCancelButton: true,
			                    confirmButtonText: '이동',
			                    cancelButtonText: '계속 쇼핑',
			                    confirmButtonColor: '#2a5298',
			                    cancelButtonColor: '#6c757d'
			                }).then((result2) => {
			                    if (result2.isConfirmed) {
			                        location.href = '${pageContext.request.contextPath}/cart/list.do';
			                    }
			                });
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
			                Swal.fire({
			                    title: '완료!',
			                    text: '주문이 접수되었습니다. 지금 주문하시겠습니까?',
			                    icon: 'success',
			                    showCancelButton: true,
			                    confirmButtonText: '주문하기',
			                    cancelButtonText: '나중에',
			                    confirmButtonColor: '#1e3c72',
			                    cancelButtonColor: '#6c757d'
			                }).then((result2) => {
			                    if (result2.isConfirmed) {
			                        location.href = '${pageContext.request.contextPath}/cart/list.do';
			                    }
			                });
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