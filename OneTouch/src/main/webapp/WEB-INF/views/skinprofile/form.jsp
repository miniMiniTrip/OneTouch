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
.sidebar {
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
}

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
    color: #5c6bc0;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    margin-bottom: 5px;
}

.question-text {
    font-size: 18px;
    font-weight: 600;
    color: #333;
    line-height: 1.5;
    margin: 0;
}

/* ==================== 선택지 스타일 ==================== */
.options-container {
    display: grid;
    gap: 12px;
}

.option-item {
    position: relative;
}

.option-input {
    position: absolute;
    opacity: 0;
    pointer-events: none;
}

.option-label {
    display: flex;
    align-items: center;
    padding: 18px 20px;
    background: #f8f9fa;
    border: 2px solid #e0e0e0;
    border-radius: 10px;
    cursor: pointer;
    transition: all 0.3s;
    font-size: 15px;
    color: #333;
    font-weight: 500;
}

.option-label:hover {
    background: #fff;
    border-color: #5c6bc0;
    transform: translateX(5px);
}

.option-input:checked + .option-label {
    background: #e8eaf6;
    border-color: #5c6bc0;
    color: #5c6bc0;
    font-weight: 600;
}

.option-radio {
    width: 22px;
    height: 22px;
    border: 2px solid #e0e0e0;
    border-radius: 50%;
    margin-right: 15px;
    position: relative;
    flex-shrink: 0;
    transition: all 0.3s;
}

.option-input:checked + .option-label .option-radio {
    border-color: #5c6bc0;
    background: #5c6bc0;
}

.option-input:checked + .option-label .option-radio::after {
    content: '✓';
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    color: white;
    font-size: 14px;
    font-weight: 700;
}

/* ==================== 버튼 영역 ==================== */
.button-container {
    display: flex;
    gap: 15px;
    margin-top: 30px;
    justify-content: space-between;
}

.btn-secondary-custom {
    background: #fff;
    color: #666;
    padding: 12px 28px;
    border: 2px solid #e0e0e0;
    border-radius: 8px;
    font-size: 14px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s;
}

.btn-secondary-custom:hover {
    background: #f8f9fa;
    border-color: #999;
    color: #333;
}

.btn-secondary-custom:disabled {
    opacity: 0.5;
    cursor: not-allowed;
}

.btn-primary-custom {
    background: #5c6bc0;
    color: white;
    padding: 12px 28px;
    border: none;
    border-radius: 8px;
    font-size: 14px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s;
}

.btn-primary-custom:hover {
    background: #4a5aaf;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(92, 107, 192, 0.3);
}

.btn-primary-custom:disabled {
    background: #ccc;
    cursor: not-allowed;
    transform: none;
}

/* ==================== 완료 상태 ==================== */
.completion-badge {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    padding: 6px 12px;
    background: #d4edda;
    color: #155724;
    border-radius: 20px;
    font-size: 12px;
    font-weight: 600;
    margin-left: auto;
}

/* ==================== 반응형 ==================== */
@media (max-width: 1200px) {
    .content {
        padding: 40px;
    }
}

@media (max-width: 992px) {
    .mypage-container {
        flex-direction: column;
    }
    
    .sidebar {
        width: 100%;
        min-height: auto;
        border-right: none;
        border-bottom: 1px solid #e0e0e0;
    }
    
    .content {
        padding: 30px 20px;
    }
    
    .progress-steps {
        flex-wrap: wrap;
        gap: 10px;
    }
}

@media (max-width: 768px) {
    .question-card {
        padding: 20px;
    }
    
    .question-icon {
        width: 40px;
        height: 40px;
        font-size: 16px;
    }
    
    .question-text {
        font-size: 16px;
    }
    
    .option-label {
        padding: 14px 16px;
        font-size: 14px;
    }
    
    .button-container {
        flex-direction: column;
    }
    
    .btn-primary-custom,
    .btn-secondary-custom {
        width: 100%;
    }
}
    </style>
</head>
<body>
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
    <c:import url="../common/header.jsp" />
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
                        <li><a href="${pageContext.request.contextPath}/"><i class="lni lni-home"></i> 홈</a></li>
                        <li>마이페이지</li>
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
                
                <!-- ==================== Sidebar ==================== -->
                <div class="sidebar">
                    <div class="sidebar-header">마이페이지</div>
                    <div class="sidebar-subtitle">${sessionScope.mem_name}님 환영합니다</div>
                    
                    <!-- 쇼핑 메뉴 -->
                    <div class="menu-section">
                        <a href="${pageContext.request.contextPath}/cart/list.do?mem_idx=${sessionScope.mem_idx}" 
                           class="menu-item">
                            🛒 장바구니
                        </a>
                        
                        <a href="${pageContext.request.contextPath}/wishlist/list.do?mem_idx=${sessionScope.mem_idx}" 
                           class="menu-item">
                            💝 찜
                        </a>
                        
                        <a href="${pageContext.request.contextPath}/order/list.do?mem_idx=${sessionScope.mem_idx}" 
                           class="menu-item">
                            🎯 주문/배송 조회
                        </a>
                    </div>
                    
                    <!-- 나의 활동 -->
                    <div class="menu-section">
                        <div class="menu-title">나의 활동</div>
                        
                        <a href="${pageContext.request.contextPath}/qna/list.do?mem_idx=${sessionScope.mem_idx}" 
                           class="menu-item">
                            💬 상품 Q&A
                        </a>
                        
                        <!-- 피부 진단 - 현재 페이지 -->
                        <a href="${pageContext.request.contextPath}/skin/form.do" 
                           class="menu-item active">
                            🔬 피부 진단
                        </a>
                    </div>
                    
                    <!-- 회원 정보 -->
                    <div class="menu-section">
                        <div class="menu-title">회원 정보</div>
                        
                        <a href="${pageContext.request.contextPath}/member/modify.do" 
                           class="menu-item">
                            👥 회원정보 수정
                        </a>
                        
                        <a href="${pageContext.request.contextPath}/member/address.do" 
                           class="menu-item">
                            🔒 배송지 관리
                        </a>
                        
                        <a href="${pageContext.request.contextPath}/member/notification.do" 
                           class="menu-item">
                            📧 알림톡신청 관리
                        </a>
                    </div>
                    
                    <!-- 로그아웃 -->
                    <div class="menu-section">
                        <a href="${pageContext.request.contextPath}/member/logout.do" 
                           class="menu-item"
                           onclick="return confirm('로그아웃 하시겠습니까?');">
                            📝 로그아웃
                        </a>
                    </div>
                </div>
                
                <!-- ==================== Content ==================== -->
                <div class="content">
                    <!-- Content Header -->
                    <div class="content-header">
                        <div>
                            <h2>피부 타입 진단</h2>
                            <p class="content-subtitle">
                                5가지 질문으로 나만의 피부 타입을 알아보세요.<br>
                                맞춤형 제품 추천을 받으실 수 있습니다.
                            </p>
                        </div>
                    </div>
                    
                    <!-- 진행 표시기 -->
                    <div class="progress-container">
                        <div class="progress-steps" id="progressSteps">
                            <div class="progress-step active" data-step="1">
                                <span class="step-number">1</span>
                                <span>피지 분비</span>
                            </div>
                            <div class="progress-step" data-step="2">
                                <span class="step-number">2</span>
                                <span>피부 민감도</span>
                            </div>
                            <div class="progress-step" data-step="3">
                                <span class="step-number">3</span>
                                <span>색소 침착</span>
                            </div>
                            <div class="progress-step" data-step="4">
                                <span class="step-number">4</span>
                                <span>주름</span>
                            </div>
                            <div class="progress-step" data-step="5">
                                <span class="step-number">5</span>
                                <span>피부톤</span>
                            </div>
                        </div>
                        <div class="progress-bar-wrapper">
                            <div class="progress-bar-fill" id="progressBar" style="width: 0%"></div>
                        </div>
                    </div>
                    
                    <!-- 진단 폼 -->
                    <form method="get" id="skinDiagnosisForm">
                        
                        <!-- 질문 1: 피지 분비 -->
                        <div class="question-card active" data-question="1">
                            <div class="question-header">
                                <div class="question-icon">💧</div>
                                <div class="question-title">
                                    <div class="question-number">Question 1 of 5</div>
                                    <h3 class="question-text">얼굴에 기름이 많다고 느껴지거나, 세안을 한 뒤 1시간 정도 지나면 기름이 나오시나요?</h3>
                                </div>
                            </div>
                            <div class="options-container">
                                <div class="option-item">
                                    <input type="radio" name="skin1" value="1" id="skin1_1" class="option-input">
                                    <label for="skin1_1" class="option-label">
                                        <span class="option-radio"></span>
                                        전체적으로 나온다
                                    </label>
                                </div>
                                <div class="option-item">
                                    <input type="radio" name="skin1" value="2" id="skin1_2" class="option-input">
                                    <label for="skin1_2" class="option-label">
                                        <span class="option-radio"></span>
                                        이마랑 코 쪽 위주로 나온다
                                    </label>
                                </div>
                                <div class="option-item">
                                    <input type="radio" name="skin1" value="3" id="skin1_3" class="option-input">
                                    <label for="skin1_3" class="option-label">
                                        <span class="option-radio"></span>
                                        안 나온다
                                    </label>
                                </div>
                            </div>
                        </div>
                        
                        <!-- 질문 2: 피부 민감도 -->
                        <div class="question-card" data-question="2">
                            <div class="question-header">
                                <div class="question-icon">🌡️</div>
                                <div class="question-title">
                                    <div class="question-number">Question 2 of 5</div>
                                    <h3 class="question-text">피부가 조그마한 자극에도 금방 붉어지거나, 피부 질환 치료를 받으신 적이 있나요?</h3>
                                </div>
                            </div>
                            <div class="options-container">
                                <div class="option-item">
                                    <input type="radio" name="skin2" value="1" id="skin2_1" class="option-input">
                                    <label for="skin2_1" class="option-label">
                                        <span class="option-radio"></span>
                                        그렇다
                                    </label>
                                </div>
                                <div class="option-item">
                                    <input type="radio" name="skin2" value="2" id="skin2_2" class="option-input">
                                    <label for="skin2_2" class="option-label">
                                        <span class="option-radio"></span>
                                        아니다
                                    </label>
                                </div>
                            </div>
                        </div>
                        
                        <!-- 질문 3: 색소 침착 -->
                        <div class="question-card" data-question="3">
                            <div class="question-header">
                                <div class="question-icon">☀️</div>
                                <div class="question-title">
                                    <div class="question-number">Question 3 of 5</div>
                                    <h3 class="question-text">기미나 주근깨가 많거나 피부가 검어지는 체질이신가요?</h3>
                                </div>
                            </div>
                            <div class="options-container">
                                <div class="option-item">
                                    <input type="radio" name="skin3" value="1" id="skin3_1" class="option-input">
                                    <label for="skin3_1" class="option-label">
                                        <span class="option-radio"></span>
                                        그렇다
                                    </label>
                                </div>
                                <div class="option-item">
                                    <input type="radio" name="skin3" value="2" id="skin3_2" class="option-input">
                                    <label for="skin3_2" class="option-label">
                                        <span class="option-radio"></span>
                                        아니다
                                    </label>
                                </div>
                                <div class="option-item">
                                    <input type="radio" name="skin3" value="3" id="skin3_3" class="option-input">
                                    <label for="skin3_3" class="option-label">
                                        <span class="option-radio"></span>
                                        빨개졌다가 돌아온다
                                    </label>
                                </div>
                            </div>
                        </div>
                        
                        <!-- 질문 4: 주름 -->
                        <div class="question-card" data-question="4">
                            <div class="question-header">
                                <div class="question-icon">📏</div>
                                <div class="question-title">
                                    <div class="question-number">Question 4 of 5</div>
                                    <h3 class="question-text">조금이라도 주름이 있는 편인가요?</h3>
                                </div>
                            </div>
                            <div class="options-container">
                                <div class="option-item">
                                    <input type="radio" name="skin4" value="1" id="skin4_1" class="option-input">
                                    <label for="skin4_1" class="option-label">
                                        <span class="option-radio"></span>
                                        그렇다
                                    </label>
                                </div>
                                <div class="option-item">
                                    <input type="radio" name="skin4" value="2" id="skin4_2" class="option-input">
                                    <label for="skin4_2" class="option-label">
                                        <span class="option-radio"></span>
                                        아니다
                                    </label>
                                </div>
                            </div>
                        </div>
                        
                        <!-- 질문 5: 피부톤 -->
                        <div class="question-card" data-question="5">
                            <div class="question-header">
                                <div class="question-icon">🎨</div>
                                <div class="question-title">
                                    <div class="question-number">Question 5 of 5</div>
                                    <h3 class="question-text">아래 중 당신의 피부톤을 골라주세요.</h3>
                                </div>
                            </div>
                            <div class="options-container">
                                <div class="option-item">
                                    <input type="radio" name="skin5" value="1" id="skin5_1" class="option-input">
                                    <label for="skin5_1" class="option-label">
                                        <span class="option-radio"></span>
                                        밝은 톤
                                    </label>
                                </div>
                                <div class="option-item">
                                    <input type="radio" name="skin5" value="2" id="skin5_2" class="option-input">
                                    <label for="skin5_2" class="option-label">
                                        <span class="option-radio"></span>
                                        중간 톤
                                    </label>
                                </div>
                                <div class="option-item">
                                    <input type="radio" name="skin5" value="3" id="skin5_3" class="option-input">
                                    <label for="skin5_3" class="option-label">
                                        <span class="option-radio"></span>
                                        어두운 톤
                                    </label>
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
        
        // 라디오 버튼 선택 감지
        document.querySelectorAll('input[type="radio"]').forEach(radio => {
            radio.addEventListener('change', function() {
                const questionNum = this.name.replace('skin', '');
                window.answers[questionNum] = this.value;
                
                // 현재 질문의 버튼 활성화
                if (window.currentQuestion < window.totalQuestions) {
                    document.getElementById('nextBtn').disabled = false;
                } else {
                    document.getElementById('submitBtn').disabled = false;
                }
                
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
