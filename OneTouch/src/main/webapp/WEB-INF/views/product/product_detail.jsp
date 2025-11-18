<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${product.product_name}-상세페이지</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="/assets/images/favicon.svg" />
    
    <!-- Web Font -->
    <link href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/LineIcons.3.0.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/tiny-slider.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/glightbox.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
           <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            color: #333;
        }
        
        /* 헤더 */
        .header {
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            padding: 15px 0;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        
        .header-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
        }
        
        .logo {
            font-size: 28px;
            font-weight: bold;
            color: white;
            text-decoration: none;
        }
        
        .nav-links {
            display: flex;
            gap: 30px;
        }
        
        .nav-links a {
            color: white;
            text-decoration: none;
            font-weight: 500;
            transition: opacity 0.3s;
        }
        
        .nav-links a:hover {
            opacity: 0.8;
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
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
            overflow: hidden;
        }
        
        .product-info {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 40px;
            padding: 40px;
        }
        
        /* 이미지 영역 */
        .product-image {
            position: relative;
        }
        
        .main-image {
            width: 100%;
            height: 400px;
            background: #f0f0f0;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #999;
            font-size: 16px;
            background-image: url('${product.product_image_url}');
            background-size: cover;
            background-position: center;
        }
        
        .thumbnail-images {
            display: flex;
            gap: 10px;
            margin-top: 15px;
        }
        
        .thumbnail {
            width: 80px;
            height: 80px;
            background: #f0f0f0;
            border-radius: 8px;
            border: 2px solid #ddd;
            cursor: pointer;
            transition: border-color 0.3s;
        }
        
        .thumbnail:hover,
        .thumbnail.active {
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
        }
        
        .rating {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 20px;
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
            margin-bottom: 20px;
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
            width: 35px;
            height: 35px;
            border: 1px solid #ddd;
            background: white;
            cursor: pointer;
            border-radius: 5px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            transition: background-color 0.3s;
        }
        
        .quantity-btn:hover {
            background-color: #f0f0f0;
        }
        
        .quantity-input {
            width: 60px;
            height: 35px;
            text-align: center;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }
        
        /* 총 가격 */
        .total-price {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
            background: #f8f9fa;
            border-radius: 10px;
            margin-bottom: 30px;
        }
        
        .total-label {
            font-size: 16px;
            color: #666;
        }
        
        .total-amount {
            font-size: 24px;
            font-weight: bold;
            color: #2a5298;
        }
        
        /* 버튼 영역 */
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
        }
        
        .btn-wishlist {
            background: white;
            border: 2px solid #ddd;
            color: #666;
            max-width: 60px;
        }
        
        .btn-wishlist:hover {
            border-color: #2a5298;
            color: #2a5298;
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
        }
        
        .btn-buy:hover {
            background: linear-gradient(135deg, #1a3360, #245285);
        }
        
        /* 상품 설명 탭 */
        .product-tabs {
            margin-top: 40px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
            overflow: hidden;
        }
        
        .tab-header {
            display: flex;
            justify-content: flex-start;
            gap: 0;
            border-bottom: 1px solid #eee;
            padding-left: 20px;
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
        
        /* 모달 스타일 */
        .modal-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 1000;
            animation: fadeIn 0.3s ease;
        }
        
        .modal-content {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: white;
            width: 90%;
            max-width: 800px;
            max-height: 80vh;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            overflow: hidden;
            animation: slideUp 0.3s ease;
        }
        
        .modal-header {
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            color: white;
            padding: 20px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .modal-title {
            font-size: 20px;
            font-weight: bold;
            margin: 0;
        }
        
        .modal-close {
            background: none;
            border: none;
            color: white;
            font-size: 24px;
            cursor: pointer;
            padding: 0;
            width: 30px;
            height: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            transition: background-color 0.3s;
        }
        
        .modal-close:hover {
            background: rgba(255, 255, 255, 0.2);
        }
        
        .modal-body {
            padding: 30px;
            max-height: 60vh;
            overflow-y: auto;
        }
        
        .modal-body h3 {
            color: #2a5298;
            margin-bottom: 20px;
            font-size: 18px;
        }
        
        .modal-body p, .modal-body li {
            line-height: 1.6;
            margin-bottom: 15px;
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
        
        /* 애니메이션 */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        
        @keyframes slideUp {
            from { 
                opacity: 0;
                transform: translate(-50%, -40%);
            }
            to { 
                opacity: 1;
                transform: translate(-50%, -50%);
            }
        }
        
        .tab-content {
            padding: 40px;
            min-height: 300px;
        }
        
        .tab-pane {
            display: none;
        }
        
        .tab-pane.active {
            display: block;
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
        
        /* 반응형 */
        @media (max-width: 768px) {
            .product-info {
                grid-template-columns: 1fr;
                gap: 20px;
                padding: 20px;
            }
            
            .nav-links {
                display: none;
            }
            
            .button-group {
                flex-direction: column;
            }
            
            .btn-wishlist {
                max-width: none;
            }
            
            .tab-header {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <!-- 헤더 포함 -->
    <%@include file="/WEB-INF/views/common/header.jsp" %>

    <div class="main-container">
        <!-- 브레드크럼 -->
        <div class="breadcrumb">
            <a href="/">홈</a> > <a href="/product/list">제품</a> > <span>${product.category_name}</span>
        </div>

        <!-- 상품 상세 정보 -->
        <div class="product-detail">
            <div class="product-info">
                <!-- 이미지 영역 -->
                <div class="product-image">
                    <div class="main-image">
                        <c:if test="${empty product.product_image_url}">
                            상품 이미지
                        </c:if>
                    </div>
                    <div class="thumbnail-images">
                        <div class="thumbnail active"></div>
                        <div class="thumbnail"></div>
                        <div class="thumbnail"></div>
                        <div class="thumbnail"></div>
                    </div>
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
                        <div class="original-price">45,000원</div>
                        <div class="discount-info">
                            <span class="discount-rate">30%</span>
                            <span class="sale-price">${product.product_price}</span>
                            <span class="currency">원</span>
                        </div>
                    </div>
                    
                    <div class="quantity-section">
                        <label class="quantity-label">수량</label>
                        <div class="quantity-control">
                            <button type="button" class="quantity-btn" onclick="changeQuantity(-1)">-</button>
                            <input type="number" class="quantity-input" id="quantity" value="1" min="1" readonly>
                            <button type="button" class="quantity-btn" onclick="changeQuantity(1)">+</button>
                        </div>
                    </div>
                    
                    <div class="total-price">
                        <span class="total-label">총 상품금액</span>
                        <span class="total-amount" id="totalPrice">${product.product_price}원</span>
                    </div>
                    
                    <div class="button-group">
                        <button class="btn btn-wishlist" title="찜하기">♡</button>
                        <button class="btn btn-cart">장바구니</button>
                        <button class="btn btn-buy">구매하기</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- 상품 설명 탭 -->
        <div class="product-tabs">
            <div class="tab-header">
                <button class="tab-btn active" onclick="openModal('description')">상품설명</button>
                <button class="tab-btn" onclick="openModal('reviews')">리뷰</button>
                <button class="tab-btn" onclick="openModal('qna')">상품Q&A</button>
            </div>
        </div>
    </div>

    <!-- 모달창들 -->
    <!-- 상품설명 모달 -->
    <div id="descriptionModal" class="modal-overlay">
        <div class="modal-content">
            <div class="modal-header">
                <h2 class="modal-title">상품설명</h2>
                <button class="modal-close" onclick="closeModal('descriptionModal')">&times;</button>
            </div>
            <div class="modal-body">
                <h3>💫 ${product.product_name}</h3>
                <p>${product.product_comment}</p>
                <br>
                <p>순수 치아색깔로 그려온 모든 부위 구성이 모두 완성 상태에 있어 리치한 포르가 마침 이들 모든의 세세한 약하이 때문에 인도된 사람들을 위해서.</p>
                
                <h3>🌟 제품 특징</h3>
                <ul class="feature-list">
                    <li>순수 치아색깔로 보완한 치아 추출 성분 함유</li>
                    <li>아침에 바르고 하루 종일 무너짐 없는 지속력</li>
                    <li>무향, 무알콜 성분으로 민감한 피부도 편안하게</li>
                    <li>국내 자체생산 원료로 안전성 검증</li>
                    <li>자연 시멘트 성분, 무독한 밤문 성분으로 구성</li>
                </ul>
                
                <h3>💧 사용 방법</h3>
                <ol>
                    <li>세안 후 토너로 피부 결을 정돈해주세요.</li>
                    <li>적당량을 손들명에 덜어 양 볼부에 발라주세요.</li>
                    <li>손끝으로도 가볍게 두드려 흡수시켜주세요.</li>
                    <li>아침과 저녁 기초화장품 마지막 단계에서 사용해주세요.</li>
                </ol>
                
                <h3>⚠️ 주의사항</h3>
                <p>• 사용 중 붉은 기미, 부어오름, 가려움증, 자극등의 이상이 있을 때는 사용을 중단해 주세요.</p>
                <p>• 상처가 있는 부위는 피해서 사용해주세요.</p>
                <p>• 보관 및 취급시의 주의사항:</p>
                <p>  - 사용한 후에는 반드시 마개를 닫아두세요</p>
                <p>  - 유아의 손에 닿지 않는 곳에 보관하세요</p>
                <p>  - 고온 또는 저온의 장소 및 직사광선이 닿는 곳에는 보관하지 마세요</p>
            </div>
        </div>
    </div>

    <!-- 리뷰 모달 -->
    <div id="reviewsModal" class="modal-overlay">
        <div class="modal-content">
            <div class="modal-header">
                <h2 class="modal-title">상품 리뷰</h2>
                <button class="modal-close" onclick="closeModal('reviewsModal')">&times;</button>
            </div>
            <div class="modal-body">
                <div class="review-item">
                    <div class="review-header">
                        <div>
                            <span class="review-author">김**</span>
                            <span class="review-rating">★★★★★</span>
                        </div>
                        <span class="review-date">2024.11.15</span>
                    </div>
                    <p class="review-text">정말 좋은 제품이에요! 바르자마자 피부가 촉촉해지는 느낌입니다. 향도 은은하고 자극적이지 않아서 민감한 피부인 저에게 딱 맞네요. 재구매 의사 100%입니다!</p>
                </div>
                
                <div class="review-item">
                    <div class="review-header">
                        <div>
                            <span class="review-author">박**</span>
                            <span class="review-rating">★★★★☆</span>
                        </div>
                        <span class="review-date">2024.11.12</span>
                    </div>
                    <p class="review-text">효과는 좋은데 가격이 조금 비싼 편인 것 같아요. 그래도 품질이 좋아서 계속 사용할 예정입니다. 포장도 깔끔하게 잘 왔어요.</p>
                </div>
                
                <div class="review-item">
                    <div class="review-header">
                        <div>
                            <span class="review-author">이**</span>
                            <span class="review-rating">★★★★★</span>
                        </div>
                        <span class="review-date">2024.11.10</span>
                    </div>
                    <p class="review-text">남자친구가 추천해줘서 구매했는데 정말 만족스럽네요. 발림성도 좋고 흡수도 빨라서 끈적임 없이 사용하기 좋습니다. 친구들에게도 추천할게요!</p>
                </div>
                
                <div class="review-item">
                    <div class="review-header">
                        <div>
                            <span class="review-author">최**</span>
                            <span class="review-rating">★★★★☆</span>
                        </div>
                        <span class="review-date">2024.11.08</span>
                    </div>
                    <p class="review-text">처음 사용해보는 브랜드였는데 괜찮네요. 특별히 자극적이지도 않고 촉촉함이 오래 지속되는 편입니다. 다음에 다른 제품도 써보고 싶어요.</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Q&A 모달 -->
    <div id="qnaModal" class="modal-overlay">
        <div class="modal-content">
            <div class="modal-header">
                <h2 class="modal-title">상품 Q&A</h2>
                <button class="modal-close" onclick="closeModal('qnaModal')">&times;</button>
            </div>
            <div class="modal-body">
                <div class="qna-item">
                    <div class="qna-question">
                        <h4>Q. 민감성 피부도 사용 가능한가요?</h4>
                        <p>피부가 예민한 편인데, 이 제품을 사용해도 될까요?</p>
                    </div>
                    <div class="qna-answer">
                        <h4>A. 네, 가능합니다.</h4>
                        <p>본 제품은 무향, 무알콜 성분으로 민감한 피부도 편안하게 사용하실 수 있습니다. 단, 개인차가 있을 수 있으니 처음 사용 시 소량으로 테스트해보시기 바랍니다.</p>
                    </div>
                </div>
                
                <div class="qna-item">
                    <div class="qna-question">
                        <h4>Q. 하루에 몇 번 사용하면 되나요?</h4>
                        <p>사용 횟수와 적정 사용량이 궁금합니다.</p>
                    </div>
                    <div class="qna-answer">
                        <h4>A. 하루 2회 사용을 권장합니다.</h4>
                        <p>아침과 저녁, 기초화장품의 마지막 단계에서 사용하시면 됩니다. 1회 사용량은 동전 크기 정도가 적당합니다.</p>
                    </div>
                </div>
                
                <div class="qna-item">
                    <div class="qna-question">
                        <h4>Q. 다른 화장품과 함께 사용해도 되나요?</h4>
                        <p>현재 사용 중인 스킨케어 제품들과 함께 써도 괜찮을까요?</p>
                    </div>
                    <div class="qna-answer">
                        <h4>A. 네, 문제없습니다.</h4>
                        <p>대부분의 화장품과 함께 사용 가능합니다. 다만, 레티놀이나 강한 산성 성분의 제품과는 시간 간격을 두고 사용하시기를 권장합니다.</p>
                    </div>
                </div>
                
                <div class="qna-item">
                    <div class="qna-question">
                        <h4>Q. 배송은 얼마나 걸리나요?</h4>
                        <p>주문 후 언제 받을 수 있는지 궁금합니다.</p>
                    </div>
                    <div class="qna-answer">
                        <h4>A. 평균 2-3일 소요됩니다.</h4>
                        <p>주문 확인 후 1-2일 내 발송되며, 배송까지 총 2-3일 정도 소요됩니다. 주말 및 공휴일은 배송이 지연될 수 있습니다.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

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
        
        // 모달 열기
        function openModal(type) {
            let modalId;
            switch(type) {
                case 'description':
                    modalId = 'descriptionModal';
                    break;
                case 'reviews':
                    modalId = 'reviewsModal';
                    break;
                case 'qna':
                    modalId = 'qnaModal';
                    break;
                default:
                    return;
            }
            
            const modal = document.getElementById(modalId);
            if (modal) {
                modal.style.display = 'block';
                document.body.style.overflow = 'hidden'; // 배경 스크롤 방지
            }
        }
        
        // 모달 닫기
        function closeModal(modalId) {
            const modal = document.getElementById(modalId);
            if (modal) {
                modal.style.display = 'none';
                document.body.style.overflow = 'auto'; // 배경 스크롤 복원
            }
        }
        
        // 모달 외부 클릭 시 닫기
        document.addEventListener('click', function(e) {
            if (e.target.classList.contains('modal-overlay')) {
                closeModal(e.target.id);
            }
        });
        
        // ESC 키로 모달 닫기
        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape') {
                const modals = document.querySelectorAll('.modal-overlay');
                modals.forEach(modal => {
                    if (modal.style.display === 'block') {
                        closeModal(modal.id);
                    }
                });
            }
        });
        
        // 썸네일 이미지 클릭
        document.querySelectorAll('.thumbnail').forEach(thumb => {
            thumb.addEventListener('click', function() {
                document.querySelectorAll('.thumbnail').forEach(t => t.classList.remove('active'));
                this.classList.add('active');
            });
        });
    </script>
  <!-- 푸터 포함 -->
    <%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>

       
   
 