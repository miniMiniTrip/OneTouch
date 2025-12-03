<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>피부 진단 - OneTouch</title>
    <meta name="description" content="2030 남성 뷰티 쇼핑몰 OneTouch">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/images/favicon.svg">

    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/LineIcons.3.0.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/tiny-slider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/glightbox.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
    
    <style>
/* ==================== 전체 레이아웃 ==================== */
.mypage-section {
    padding: 0;
    background-color: #fff;
    min-height: calc(100vh - 400px);
}

.mypage-container {
    display: flex;
    max-width: 100%;
    margin: 0;
    background: transparent;
    border-radius: 0;
    overflow: visible;
    box-shadow: none;
}

/* ==================== 사이드바 스타일 ==================== */
/* .sidebar {
    width: 250px;
    background: #fafafa;
    border-right: 1px solid #e0e0e0;
    padding: 30px 0;
    min-height: calc(100vh - 400px);
}

.sidebar-header {
    padding: 15px 30px;
    font-size: 18px;
    font-weight: 700;
    color: #333;
}

.sidebar-subtitle {
    padding: 5px 30px 20px;
    font-size: 13px;
    color: #999;
}

.menu-section {
    margin: 25px 0;
}

.menu-title {
    padding: 10px 30px;
    font-size: 12px;
    color: #999;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

.menu-item {
    padding: 14px 30px;
    font-size: 14px;
    color: #333;
    cursor: pointer;
    display: flex;
    align-items: center;
    transition: all 0.3s;
    border-left: 3px solid transparent;
    text-decoration: none;
}

.menu-item:hover {
    background: #f0f0f0;
    padding-left: 35px;
    color: #333;
}

.menu-item.active {
    background: #e8eaf6;
    color: #5c6bc0;
    font-weight: 600;
    border-left: 3px solid #5c6bc0;
} */

/* ==================== 컨텐츠 영역 ==================== */
.content {
    flex: 1;
    padding: 50px 60px;
    background: #fff;
}

.content-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 40px;
    padding-bottom: 20px;
    border-bottom: 2px solid #5c6bc0;
}

.content-header h2 {
    font-size: 24px;
    color: #333;
    font-weight: 700;
    margin: 0;
}

.content-subtitle {
    color: #666;
    font-size: 14px;
    margin-top: 10px;
    line-height: 1.6;
}

/* ==================== 진행 표시기 ==================== */
.progress-container {
    margin-bottom: 40px;
    padding: 20px;
    background: #f8f9fa;
    border-radius: 12px;
}

.progress-steps {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 15px;
}

.progress-step {
    display: flex;
    align-items: center;
    gap: 8px;
    font-size: 13px;
    color: #999;
    font-weight: 500;
}

.progress-step.completed {
    color: #5c6bc0;
}

.progress-step.active {
    color: #5c6bc0;
    font-weight: 600;
}

.step-number {
    width: 28px;
    height: 28px;
    border-radius: 50%;
    background: #e0e0e0;
    color: #666;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 12px;
    font-weight: 600;
}

.progress-step.completed .step-number {
    background: #5c6bc0;
    color: white;
}

.progress-step.active .step-number {
    background: #5c6bc0;
    color: white;
    box-shadow: 0 0 0 4px rgba(92, 107, 192, 0.2);
}

.progress-bar-wrapper {
    width: 100%;
    height: 8px;
    background: #e0e0e0;
    border-radius: 4px;
    overflow: hidden;
}

.progress-bar-fill {
    height: 100%;
    background: linear-gradient(90deg, #5c6bc0 0%, #7e8fd4 100%);
    border-radius: 4px;
    transition: width 0.3s ease;
}

/* ==================== 질문 카드 ==================== */
.question-card {
    background: #fff;
    border-radius: 12px;
    padding: 30px;
    margin-bottom: 20px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.05);
    border: 2px solid #e0e0e0;
    transition: all 0.3s;
    display: none;
}

.question-card.active {
    display: block;
    border-color: #5c6bc0;
}

.question-card.completed {
    border-color: #d4edda;
    background: #f8fff9;
}

.question-header {
    display: flex;
    align-items: center;
    gap: 15px;
    margin-bottom: 25px;
}

.question-icon {
    width: 50px;
    height: 50px;
    background: linear-gradient(135deg, #5c6bc0 0%, #7e8fd4 100%);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-size: 20px;
    font-weight: 700;
    flex-shrink: 0;
}

.question-title {
    flex: 1;
}

.question-number {
    font-size: 12px;
    color: #666;
    font-weight: 600;
    margin-bottom: 5px;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

.question-text {
    font-size: 18px;
    color: #333;
    font-weight: 600;
    margin: 0;
    line-height: 1.5;
}

/* ==================== 선택지 카드 스타일 (1-4번 질문용) ==================== */
.options-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 20px;
    margin-top: 10px;
}

.option-card {
    position: relative;
    cursor: pointer;
    border: 3px solid #e0e0e0;
    border-radius: 12px;
    padding: 30px 20px;
    transition: all 0.3s;
    background: #f8f9fa;
    text-align: center;
    min-height: 120px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}

.option-card:hover {
    border-color: #5c6bc0;
    transform: translateY(-5px);
    box-shadow: 0 8px 16px rgba(92, 107, 192, 0.2);
}

.option-card.selected {
    border-color: #5c6bc0;
    background: linear-gradient(135deg, #e8eaf6 0%, #f0f2ff 100%);
    box-shadow: 0 8px 16px rgba(92, 107, 192, 0.3);
}

.option-card-icon {
    font-size: 36px;
    margin-bottom: 15px;
}

.option-card-text {
    font-size: 16px;
    font-weight: 600;
    color: #333;
    transition: all 0.3s;
}

.option-card.selected .option-card-text {
    color: #5c6bc0;
}

.option-card-check {
    position: absolute;
    top: 10px;
    right: 10px;
    width: 30px;
    height: 30px;
    background: #5c6bc0;
    border-radius: 50%;
    display: none;
    align-items: center;
    justify-content: center;
    color: white;
    font-size: 16px;
    font-weight: bold;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
}

.option-card.selected .option-card-check {
    display: flex;
}

/* ==================== 피부톤 이미지 카드 스타일 ==================== */
.skin-tone-options {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 20px;
    margin-top: 10px;
}

.skin-tone-card {
    position: relative;
    cursor: pointer;
    border: 3px solid #e0e0e0;
    border-radius: 12px;
    overflow: hidden;
    transition: all 0.3s;
    background: #f8f9fa;
}

.skin-tone-card:hover {
    border-color: #5c6bc0;
    transform: translateY(-5px);
    box-shadow: 0 8px 16px rgba(92, 107, 192, 0.2);
}

.skin-tone-card.selected {
    border-color: #5c6bc0;
    background: linear-gradient(135deg, #e8eaf6 0%, #f0f2ff 100%);
    box-shadow: 0 8px 16px rgba(92, 107, 192, 0.3);
}

.skin-tone-image {
    width: 100%;
    height: 180px;
    object-fit: cover;
    display: block;
}

.skin-tone-label {
    padding: 15px;
    text-align: center;
    font-size: 15px;
    font-weight: 600;
    color: #333;
    background: white;
    transition: all 0.3s;
}

.skin-tone-card.selected .skin-tone-label {
    color: #5c6bc0;
    background: linear-gradient(135deg, #e8eaf6 0%, #f0f2ff 100%);
}

.skin-tone-check {
    position: absolute;
    top: 10px;
    right: 10px;
    width: 30px;
    height: 30px;
    background: #5c6bc0;
    border-radius: 50%;
    display: none;
    align-items: center;
    justify-content: center;
    color: white;
    font-size: 16px;
    font-weight: bold;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
}

.skin-tone-card.selected .skin-tone-check {
    display: flex;
}

/* 숨겨진 라디오 버튼 */
.option-input {
    position: absolute;
    opacity: 0;
    width: 0;
    height: 0;
}

/* ==================== 버튼 스타일 ==================== */
.button-container {
    display: flex;
    gap: 15px;
    margin-top: 30px;
    justify-content: center;
}

.btn-primary-custom {
    padding: 14px 35px;
    background: linear-gradient(135deg, #5c6bc0 0%, #7e8fd4 100%);
    color: white;
    border: none;
    border-radius: 8px;
    font-size: 15px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s;
    box-shadow: 0 4px 12px rgba(92, 107, 192, 0.3);
}

.btn-primary-custom:hover:not(:disabled) {
    transform: translateY(-2px);
    box-shadow: 0 6px 16px rgba(92, 107, 192, 0.4);
}

.btn-primary-custom:disabled {
    background: #ccc;
    cursor: not-allowed;
    box-shadow: none;
}

.btn-secondary-custom {
    padding: 14px 35px;
    background: white;
    color: #5c6bc0;
    border: 2px solid #5c6bc0;
    border-radius: 8px;
    font-size: 15px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s;
}

.btn-secondary-custom:hover:not(:disabled) {
    background: #f0f2ff;
    transform: translateY(-2px);
}

.btn-secondary-custom:disabled {
    border-color: #ccc;
    color: #ccc;
    cursor: not-allowed;
}

/* ==================== 반응형 ==================== */
@media (max-width: 991px) {
    /* 모바일에서 사이드바 숨김 */
    .sidebar {
        display: none;
    }
    
    .content {
        padding: 30px 20px;
    }
    
    .content-header h2 {
        font-size: 20px;
    }
    
    .progress-steps {
        flex-wrap: wrap;
        gap: 10px;
    }
    
    .progress-step {
        font-size: 11px;
    }
}

@media (max-width: 768px) {
    /* 모든 카드를 1열로 */
    .options-grid {
        grid-template-columns: 1fr;
    }
    
    .skin-tone-options {
        grid-template-columns: 1fr;
        gap: 15px;
    }
    
    .skin-tone-image {
        height: 200px;
    }
    
    .question-header {
        flex-direction: column;
        text-align: center;
    }
    
    .question-text {
        font-size: 16px;
    }
    
    .button-container {
        flex-direction: column;
    }
    
    .btn-primary-custom,
    .btn-secondary-custom {
        width: 100%;
    }
}

@media (max-width: 576px) {
    .content {
        padding: 20px 15px;
    }
    
    .question-card {
        padding: 20px;
    }
    
    .progress-container {
        padding: 15px;
    }
}

    </style>
</head>

<body>
    <!--[if lte IE 9]>
      <p class="browserupgrade">
        You are using an <strong>outdated</strong> browser. Please
        <a href="https://browsehappy.com/">upgrade your browser</a> to improve
        your experience and security.
      </p>
    <![endif]-->

    <!-- Preloader -->
    <div class="preloader">
        <div class="preloader-inner">
            <div class="preloader-icon">
                <span></span>
                <span></span>
            </div>
        </div>
    </div>
    <!-- /End Preloader -->
    
    <!-- Start Header Area -->
    <%@include file="../common/header.jsp" %>
    <!-- End Header Area -->
    
    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">피부 진단</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="${pageContext.request.contextPath}/main.do"><i class="lni lni-home"></i> Home</a></li>
                        <li><a href="${pageContext.request.contextPath}/mypage/main.do">마이페이지</a></li>
                        <li>피부 진단</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    <!-- Start Mypage Section -->
    <section class="mypage-section">
        <div class="container">
            <div class="mypage-container">

                <!-- 사이드바 -->
                <%@include file="../common/mypage_side_bar.jsp" %>
				
                <!-- 컨텐츠 영역 -->
                <div class="content">
                    <div class="content-header">
                        <div>
                            <h2>🔍 피부 진단</h2>
                            <p class="content-subtitle">
                                간단한 5개 질문으로 당신의 피부 타입을 분석하고 맞춤 상품을 추천받아보세요.
                            </p>
                        </div>
                    </div>
                    
                    <!-- 진행 표시 -->
                    <div class="progress-container">
                        <div class="progress-steps">
                            <div class="progress-step active">
                                <div class="step-number">1</div>
                                <span>피부 유형</span>
                            </div>
                            <div class="progress-step">
                                <div class="step-number">2</div>
                                <span>트러블</span>
                            </div>
                            <div class="progress-step">
                                <div class="step-number">3</div>
                                <span>색소 변화</span>
                            </div>
                            <div class="progress-step">
                                <div class="step-number">4</div>
                                <span>주름</span>
                            </div>
                            <div class="progress-step">
                                <div class="step-number">5</div>
                                <span>피부톤</span>
                            </div>
                        </div>
                        <div class="progress-bar-wrapper">
                            <div class="progress-bar-fill" id="progressBar" style="width: 20%;"></div>
                        </div>
                    </div>
                    
                    <div class="form-container">
                        
                        <form method="get" id="skinDiagnosisForm">
                            
                            <!-- 질문 1: 피부 타입 -->
                            <div class="question-card active" data-question="1">
                                <div class="question-header">
                                    <div class="question-icon">💧</div>
                                    <div class="question-title">
                                        <div class="question-number">Question 1 of 5</div>
                                        <h3 class="question-text">얼굴에 기름이 많다고 느껴지거나, 세안을 한 뒤 1시간 정도 지나면 기름이 나오시나요?</h3>
                                    </div>
                                </div>
                                
                                <div class="options-grid">
                                    <div class="option-card" data-name="skin1" data-value="1">
                                        <input type="radio" name="skin1" value="1" id="skin1_1" class="option-input">
                                        <div class="option-card-check">✓</div>
                                        <div class="option-card-icon">🌊</div>
                                        <div class="option-card-text">전체적으로<br>나온다</div>
                                    </div>
                                    
                                    <div class="option-card" data-name="skin1" data-value="2">
                                        <input type="radio" name="skin1" value="2" id="skin1_2" class="option-input">
                                        <div class="option-card-check">✓</div>
                                        <div class="option-card-icon">💦</div>
                                        <div class="option-card-text">이마랑 코 쪽<br>위주로 나온다</div>
                                    </div>
                                    
                                    <div class="option-card" data-name="skin1" data-value="3">
                                        <input type="radio" name="skin1" value="3" id="skin1_3" class="option-input">
                                        <div class="option-card-check">✓</div>
                                        <div class="option-card-icon">✨</div>
                                        <div class="option-card-text">안 나온다</div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- 질문 2: 트러블 -->
                            <div class="question-card" data-question="2">
                                <div class="question-header">
                                    <div class="question-icon">🩹</div>
                                    <div class="question-title">
                                        <div class="question-number">Question 2 of 5</div>
                                        <h3 class="question-text">피부가 조그마한 자극에도 금방 붉어지거나, 피부 질환 치료를 받으신 적이 있나요?</h3>
                                    </div>
                                </div>
                                
                                <div class="options-grid">
                                    <div class="option-card" data-name="skin2" data-value="1">
                                        <input type="radio" name="skin2" value="1" id="skin2_1" class="option-input">
                                        <div class="option-card-check">✓</div>
                                        <div class="option-card-icon">🔴</div>
                                        <div class="option-card-text">그렇다</div>
                                    </div>
                                    
                                    <div class="option-card" data-name="skin2" data-value="2">
                                        <input type="radio" name="skin2" value="2" id="skin2_2" class="option-input">
                                        <div class="option-card-check">✓</div>
                                        <div class="option-card-icon">✅</div>
                                        <div class="option-card-text">아니다</div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- 질문 3: 색소 변화 -->
                            <div class="question-card" data-question="3">
                                <div class="question-header">
                                    <div class="question-icon">☀️</div>
                                    <div class="question-title">
                                        <div class="question-number">Question 3 of 5</div>
                                        <h3 class="question-text">기미나 주근깨가 많거나 피부가 검어지는 체질이신가요?</h3>
                                    </div>
                                </div>
                                
                                <div class="options-grid">
                                    <div class="option-card" data-name="skin3" data-value="1">
                                        <input type="radio" name="skin3" value="1" id="skin3_1" class="option-input">
                                        <div class="option-card-check">✓</div>
                                        <div class="option-card-icon">🟤</div>
                                        <div class="option-card-text">그렇다</div>
                                    </div>
                                    
                                    <div class="option-card" data-name="skin3" data-value="2">
                                        <input type="radio" name="skin3" value="2" id="skin3_2" class="option-input">
                                        <div class="option-card-check">✓</div>
                                        <div class="option-card-icon">⚪</div>
                                        <div class="option-card-text">아니다</div>
                                    </div>
                                    
                                    <div class="option-card" data-name="skin3" data-value="3">
                                        <input type="radio" name="skin3" value="3" id="skin3_3" class="option-input">
                                        <div class="option-card-check">✓</div>
                                        <div class="option-card-icon">🔄</div>
                                        <div class="option-card-text">빨개졌다가<br>돌아온다</div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- 질문 4: 주름 -->
                            <div class="question-card" data-question="4">
                                <div class="question-header">
                                    <div class="question-icon">👴</div>
                                    <div class="question-title">
                                        <div class="question-number">Question 4 of 5</div>
                                        <h3 class="question-text">조금이라도 주름이 있는 편인가요?</h3>
                                    </div>
                                </div>
                                
                                <div class="options-grid">
                                    <div class="option-card" data-name="skin4" data-value="1">
                                        <input type="radio" name="skin4" value="1" id="skin4_1" class="option-input">
                                        <div class="option-card-check">✓</div>
                                        <div class="option-card-icon">📉</div>
                                        <div class="option-card-text">그렇다</div>
                                    </div>
                                    
                                    <div class="option-card" data-name="skin4" data-value="2">
                                        <input type="radio" name="skin4" value="2" id="skin4_2" class="option-input">
                                        <div class="option-card-check">✓</div>
                                        <div class="option-card-icon">🌟</div>
                                        <div class="option-card-text">아니다</div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- 질문 5: 피부톤 (이미지 카드) -->
                            <div class="question-card" data-question="5">
                                <div class="question-header">
                                    <div class="question-icon">🎨</div>
                                    <div class="question-title">
                                        <div class="question-number">Question 5 of 5</div>
                                        <h3 class="question-text">아래 중 당신의 피부톤을 골라주세요.</h3>
                                    </div>
                                </div>
                                
                                <!-- 이미지 카드 그리드 -->
                                <div class="skin-tone-options">
                                    <!-- 밝은 톤 -->
                                    <div class="skin-tone-card" data-name="skin5" data-value="1">
                                        <input type="radio" name="skin5" value="1" id="skin5_1" class="option-input">
                                        <div class="skin-tone-check">✓</div>
                                        <img src="${pageContext.request.contextPath}/images/sp_color/skincolor1.png" 
                                             alt="밝은 톤" class="skin-tone-image">
                                        <div class="skin-tone-label">밝은 톤</div>
                                    </div>
                                    
                                    <!-- 중간 톤 -->
                                    <div class="skin-tone-card" data-name="skin5" data-value="2">
                                        <input type="radio" name="skin5" value="2" id="skin5_2" class="option-input">
                                        <div class="skin-tone-check">✓</div>
                                        <img src="${pageContext.request.contextPath}/images/sp_color/skincolor2.png" 
                                             alt="중간 톤" class="skin-tone-image">
                                        <div class="skin-tone-label">중간 톤</div>
                                    </div>
                                    
                                    <!-- 어두운 톤 -->
                                    <div class="skin-tone-card" data-name="skin5" data-value="3">
                                        <input type="radio" name="skin5" value="3" id="skin5_3" class="option-input">
                                        <div class="skin-tone-check">✓</div>
                                        <img src="${pageContext.request.contextPath}/images/sp_color/skincolor3.png" 
                                             alt="어두운 톤" class="skin-tone-image">
                                        <div class="skin-tone-label">어두운 톤</div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- 버튼 영역 -->
                            <div class="button-container">
                                <button type="button" class="btn-secondary-custom" id="prevBtn" onclick="previousQuestion()" disabled>
                                    ← 이전
                                </button>
                                <button type="button" class="btn-primary-custom" id="nextBtn" onclick="nextQuestion()" disabled>
                                    다음 →
                                </button>
                                <button type="button" class="btn-primary-custom" id="submitBtn" onclick="submitForm()" style="display: none;" disabled>
                                    진단 결과 확인하기 ✓
                                </button>
                            </div>
                            
                        </form>
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Mypage Section -->

    <!-- Start Footer Area -->
    <c:import url="../common/footer.jsp" />
    <!-- End Footer Area -->

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top">
        <i class="lni lni-chevron-up"></i>
    </a>

    <!-- ========================= JS here ========================= -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/tiny-slider.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/glightbox.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
    
    <script type="text/javascript">
    // 프리로더 제거
    window.addEventListener('load', function() {
        const preloader = document.querySelector('.preloader');
        if (preloader) {
            preloader.style.opacity = '0';
            setTimeout(() => preloader.style.display = 'none', 500);
        }
    });
    
    // DOM이 완전히 로드된 후 실행
    document.addEventListener('DOMContentLoaded', function() {
        // 전역 변수
        window.currentQuestion = 1;
        window.totalQuestions = 5;
        window.answers = {};
        
        document.querySelectorAll('input[type="radio"]').forEach(radio => {
            radio.addEventListener('change', function() {
                const questionNum = this.name.replace('skin', '');
                const name = this.name;
                const value = this.value;
                
                window.answers[questionNum] = value;
                
                // 같은 그룹의 모든 카드에서 selected 제거
                document.querySelectorAll(`.option-card[data-name="${name}"]`).forEach(c => {
                    c.classList.remove('selected');
                });
                document.querySelectorAll(`.skin-tone-card[data-name="${name}"]`).forEach(c => {
                    c.classList.remove('selected');
                });
                
                // 선택된 카드에 selected 추가
                const selectedCard = document.querySelector(
                    `.option-card[data-name="${name}"][data-value="${value}"], 
                     .skin-tone-card[data-name="${name}"][data-value="${value}"]`
                );
                if (selectedCard) {
                    selectedCard.classList.add('selected');
                }
                
                // 버튼 활성화
                if (window.currentQuestion < window.totalQuestions) {
                    document.getElementById('nextBtn').disabled = false;
                } else {
                    document.getElementById('submitBtn').disabled = false;
                }
                
                updateProgress();
            });
        });        
        // 일반 카드 클릭 이벤트 (1-4번 질문)
        document.querySelectorAll('.option-card').forEach(card => {
            card.addEventListener('click', function() {
                const name = this.getAttribute('data-name');
                const value = this.getAttribute('data-value');
                const radio = document.getElementById(name + '_' + value);
                
                // 라디오 버튼 선택
                radio.checked = true;
                
                // 같은 그룹의 모든 카드에서 selected 클래스 제거
                document.querySelectorAll(`.option-card[data-name="${name}"]`).forEach(c => {
                    c.classList.remove('selected');
                });
                
                // 클릭된 카드에 selected 클래스 추가
                this.classList.add('selected');
                
                // 답변 저장 및 버튼 활성화
                const questionNum = name.replace('skin', '');
                window.answers[questionNum] = value;
                
                if (window.currentQuestion < window.totalQuestions) {
                    document.getElementById('nextBtn').disabled = false;
                } else {
                    document.getElementById('submitBtn').disabled = false;
                }
                
                updateProgress();
            });
        });
        
        // 피부톤 카드 클릭 이벤트 (5번 질문)
        document.querySelectorAll('.skin-tone-card').forEach(card => {
            card.addEventListener('click', function() {
                const name = this.getAttribute('data-name');
                const value = this.getAttribute('data-value');
                const radio = document.getElementById(name + '_' + value);
                
                // 라디오 버튼 선택
                radio.checked = true;
                
                // 모든 카드에서 selected 클래스 제거
                document.querySelectorAll('.skin-tone-card').forEach(c => {
                    c.classList.remove('selected');
                });
                
                // 클릭된 카드에 selected 클래스 추가
                this.classList.add('selected');
                
                // 답변 저장 및 버튼 활성화
                window.answers['5'] = value;
                document.getElementById('submitBtn').disabled = false;
                
                updateProgress();
            });
        });
        
        // 초기 진행 상태 설정
        updateProgress();
    });
    
    // 다음 질문으로
    function nextQuestion() {
        if (!window.answers[window.currentQuestion]) {
            alert(window.currentQuestion + "번 문항의 답을 골라주세요.");
            return;
        }
        
        // 현재 카드를 completed로 표시
        const currentCard = document.querySelector('.question-card[data-question="' + window.currentQuestion + '"]');
        if (!currentCard) {
            console.error('현재 카드를 찾을 수 없습니다:', window.currentQuestion);
            return;
        }
        currentCard.classList.remove('active');
        currentCard.classList.add('completed');
        
        window.currentQuestion++;
        
        // 다음 카드 표시
        const nextCard = document.querySelector('.question-card[data-question="' + window.currentQuestion + '"]');
        if (!nextCard) {
            console.error('다음 카드를 찾을 수 없습니다:', window.currentQuestion);
            return;
        }
        nextCard.classList.add('active');
        
        // 버튼 상태 업데이트
        document.getElementById('prevBtn').disabled = false;
        
        if (window.currentQuestion === window.totalQuestions) {
            document.getElementById('nextBtn').style.display = 'none';
            document.getElementById('submitBtn').style.display = 'block';
            document.getElementById('submitBtn').disabled = !window.answers[window.currentQuestion];
        } else {
            document.getElementById('nextBtn').disabled = !window.answers[window.currentQuestion];
        }
        
        updateProgress();
        
        // 스크롤 애니메이션
        window.scrollTo({
            top: nextCard.offsetTop - 100,
            behavior: 'smooth'
        });
    }
    
    // 이전 질문으로
    function previousQuestion() {
        const currentCard = document.querySelector('.question-card[data-question="' + window.currentQuestion + '"]');
        if (!currentCard) {
            console.error('현재 카드를 찾을 수 없습니다:', window.currentQuestion);
            return;
        }
        currentCard.classList.remove('active');
        
        window.currentQuestion--;
        
        const prevCard = document.querySelector('.question-card[data-question="' + window.currentQuestion + '"]');
        if (!prevCard) {
            console.error('이전 카드를 찾을 수 없습니다:', window.currentQuestion);
            return;
        }
        prevCard.classList.remove('completed');
        prevCard.classList.add('active');
        
        // 버튼 상태 업데이트
        document.getElementById('prevBtn').disabled = (window.currentQuestion === 1);
        document.getElementById('nextBtn').style.display = 'block';
        document.getElementById('submitBtn').style.display = 'none';
        document.getElementById('nextBtn').disabled = !window.answers[window.currentQuestion];
        
        updateProgress();
        
        // 스크롤 애니메이션
        window.scrollTo({
            top: prevCard.offsetTop - 100,
            behavior: 'smooth'
        });
    }
    
    // 진행 상태 업데이트
    function updateProgress() {
        const progress = (window.currentQuestion / window.totalQuestions) * 100;
        document.getElementById('progressBar').style.width = progress + '%';
        
        // 진행 단계 표시 업데이트
        document.querySelectorAll('.progress-step').forEach((step, index) => {
            const stepNum = index + 1;
            
            if (stepNum < window.currentQuestion) {
                step.classList.add('completed');
                step.classList.remove('active');
            } else if (stepNum === window.currentQuestion) {
                step.classList.add('active');
                step.classList.remove('completed');
            } else {
                step.classList.remove('active', 'completed');
            }
        });
    }
    
    // 폼 제출
    function submitForm() {
        const form = document.getElementById('skinDiagnosisForm');
        
        // 모든 답변 확인
        for (let i = 1; i <= window.totalQuestions; i++) {
            if (!window.answers[i]) {
                alert(i + "번 문항의 답을 골라주세요.");
                return;
            }
        }
        
        form.action = "insert.do";
        form.submit();
    }
    
    </script>
    
</body>
</html>
