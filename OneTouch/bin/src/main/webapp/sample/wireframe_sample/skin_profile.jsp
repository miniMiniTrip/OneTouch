<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>피부 진단 - OneTouch</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Malgun Gothic', 'Apple SD Gothic Neo', sans-serif;
            background: #f5f7fa;
            color: #333;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px 20px;
        }

        .diagnosis-header {
            text-align: center;
            margin-bottom: 50px;
        }

        .diagnosis-header h1 {
            font-size: 36px;
            color: #1a237e;
            margin-bottom: 15px;
        }

        .diagnosis-header p {
            font-size: 18px;
            color: #666;
        }

        .diagnosis-content {
            background: white;
            border-radius: 16px;
            padding: 50px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
        }

        .step-indicator {
            display: flex;
            justify-content: space-between;
            margin-bottom: 50px;
            position: relative;
        }

        .step-indicator::before {
            content: '';
            position: absolute;
            top: 20px;
            left: 0;
            right: 0;
            height: 2px;
            background: #e0e0e0;
            z-index: 0;
        }

        .step {
            display: flex;
            flex-direction: column;
            align-items: center;
            position: relative;
            z-index: 1;
        }

        .step-number {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: #e0e0e0;
            color: #999;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .step.active .step-number {
            background: #1a237e;
            color: white;
        }

        .step.completed .step-number {
            background: #4caf50;
            color: white;
        }

        .step-label {
            font-size: 14px;
            color: #666;
        }

        .question-section {
            display: none;
        }

        .question-section.active {
            display: block;
        }

        .question {
            margin-bottom: 40px;
        }

        .question h3 {
            font-size: 24px;
            color: #1a237e;
            margin-bottom: 25px;
        }

        .options {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
        }

        .option {
            padding: 20px;
            border: 2px solid #e0e0e0;
            border-radius: 12px;
            cursor: pointer;
            transition: all 0.3s;
            text-align: center;
        }

        .option:hover {
            border-color: #1a237e;
            background: #f5f7fa;
        }

        .option.selected {
            border-color: #1a237e;
            background: #e8eaf6;
        }

        .option-icon {
            font-size: 48px;
            margin-bottom: 10px;
        }

        .option-label {
            font-size: 16px;
            font-weight: 600;
            color: #333;
        }

        .buttons {
            display: flex;
            gap: 15px;
            justify-content: center;
            margin-top: 40px;
        }

        .btn {
            padding: 14px 35px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
        }

        .btn-primary {
            background: #1a237e;
            color: white;
        }

        .btn-primary:hover {
            background: #0d47a1;
            transform: translateY(-2px);
        }

        .btn-secondary {
            background: white;
            color: #1a237e;
            border: 2px solid #1a237e;
        }

        .btn-secondary:hover {
            background: #f5f7fa;
        }

        .result-section {
            display: none;
            text-align: center;
        }

        .result-section.active {
            display: block;
        }

        .result-icon {
            font-size: 80px;
            margin-bottom: 20px;
        }

        .result-type {
            font-size: 32px;
            font-weight: bold;
            color: #1a237e;
            margin-bottom: 15px;
        }

        .result-description {
            font-size: 18px;
            color: #666;
            line-height: 1.8;
            margin-bottom: 30px;
        }

        .recommended-products {
            margin-top: 50px;
        }

        .recommended-products h3 {
            font-size: 24px;
            color: #1a237e;
            margin-bottom: 30px;
            text-align: left;
        }

        .product-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 25px;
        }

        .product-card {
            border: 1px solid #e0e0e0;
            border-radius: 12px;
            overflow: hidden;
            transition: all 0.3s;
            cursor: pointer;
        }

        .product-card:hover {
            box-shadow: 0 8px 24px rgba(26, 35, 126, 0.15);
            transform: translateY(-5px);
        }

        .product-image {
            width: 100%;
            height: 200px;
            background: #f5f5f5;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .product-info {
            padding: 15px;
        }

        .product-name {
            font-size: 16px;
            font-weight: 600;
            margin-bottom: 8px;
        }

        .product-price {
            font-size: 18px;
            font-weight: bold;
            color: #1a237e;
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp" %>

    <div class="container">
        <div class="diagnosis-header">
            <h1>🎯 AI 피부 진단</h1>
            <p>간단한 질문으로 나에게 맞는 스킨케어 루틴을 찾아보세요</p>
        </div>

        <div class="diagnosis-content">
            <!-- 단계 표시 -->
            <div class="step-indicator">
                <div class="step active" id="step1">
                    <div class="step-number">1</div>
                    <div class="step-label">피부 타입</div>
                </div>
                <div class="step" id="step2">
                    <div class="step-number">2</div>
                    <div class="step-label">피부 고민</div>
                </div>
                <div class="step" id="step3">
                    <div class="step-number">3</div>
                    <div class="step-label">선호도</div>
                </div>
                <div class="step" id="step4">
                    <div class="step-number">4</div>
                    <div class="step-label">완료</div>
                </div>
            </div>

            <!-- 질문 1: 피부 타입 -->
            <div class="question-section active" id="question1">
                <div class="question">
                    <h3>당신의 피부 타입은?</h3>
                    <div class="options">
                        <div class="option" data-value="dry" onclick="selectOption(this, 'skinType')">
                            <div class="option-icon">🏜️</div>
                            <div class="option-label">건성</div>
                        </div>
                        <div class="option" data-value="oily" onclick="selectOption(this, 'skinType')">
                            <div class="option-icon">💧</div>
                            <div class="option-label">지성</div>
                        </div>
                        <div class="option" data-value="combination" onclick="selectOption(this, 'skinType')">
                            <div class="option-icon">⚖️</div>
                            <div class="option-label">복합성</div>
                        </div>
                        <div class="option" data-value="sensitive" onclick="selectOption(this, 'skinType')">
                            <div class="option-icon">🌸</div>
                            <div class="option-label">민감성</div>
                        </div>
                    </div>
                </div>
                <div class="buttons">
                    <button class="btn btn-primary" onclick="nextQuestion(1)">다음</button>
                </div>
            </div>

            <!-- 질문 2: 피부 고민 -->
            <div class="question-section" id="question2">
                <div class="question">
                    <h3>가장 큰 피부 고민은?</h3>
                    <div class="options">
                        <div class="option" data-value="acne" onclick="selectOption(this, 'concern')">
                            <div class="option-icon">🔴</div>
                            <div class="option-label">여드름/트러블</div>
                        </div>
                        <div class="option" data-value="wrinkle" onclick="selectOption(this, 'concern')">
                            <div class="option-icon">📏</div>
                            <div class="option-label">주름/탄력</div>
                        </div>
                        <div class="option" data-value="pigmentation" onclick="selectOption(this, 'concern')">
                            <div class="option-icon">⚫</div>
                            <div class="option-label">색소침착/미백</div>
                        </div>
                        <div class="option" data-value="pore" onclick="selectOption(this, 'concern')">
                            <div class="option-icon">🔵</div>
                            <div class="option-label">모공</div>
                        </div>
                    </div>
                </div>
                <div class="buttons">
                    <button class="btn btn-secondary" onclick="prevQuestion(2)">이전</button>
                    <button class="btn btn-primary" onclick="nextQuestion(2)">다음</button>
                </div>
            </div>

            <!-- 질문 3: 제품 선호도 -->
            <div class="question-section" id="question3">
                <div class="question">
                    <h3>선호하는 제품 타입은?</h3>
                    <div class="options">
                        <div class="option" data-value="natural" onclick="selectOption(this, 'preference')">
                            <div class="option-icon">🌿</div>
                            <div class="option-label">천연/유기농</div>
                        </div>
                        <div class="option" data-value="functional" onclick="selectOption(this, 'preference')">
                            <div class="option-icon">🧪</div>
                            <div class="option-label">기능성</div>
                        </div>
                        <div class="option" data-value="mild" onclick="selectOption(this, 'preference')">
                            <div class="option-icon">☁️</div>
                            <div class="option-label">저자극</div>
                        </div>
                        <div class="option" data-value="premium" onclick="selectOption(this, 'preference')">
                            <div class="option-icon">💎</div>
                            <div class="option-label">프리미엄</div>
                        </div>
                    </div>
                </div>
                <div class="buttons">
                    <button class="btn btn-secondary" onclick="prevQuestion(3)">이전</button>
                    <button class="btn btn-primary" onclick="showResult()">결과 보기</button>
                </div>
            </div>

            <!-- 결과 -->
            <div class="result-section" id="result">
                <div class="result-icon">✨</div>
                <h2 class="result-type" id="resultType">당신의 피부 타입 분석 완료!</h2>
                <p class="result-description" id="resultDescription">
                    진단 결과를 바탕으로 맞춤 제품을 추천해드립니다.
                </p>

                <div class="recommended-products">
                    <h3>💝 추천 제품</h3>
                    <div class="product-grid">
                        <div class="product-card" onclick="location.href='product-detail.jsp?id=1'">
                            <div class="product-image">상품 이미지</div>
                            <div class="product-info">
                                <div class="product-name">히아루론산 수분 세럼</div>
                                <div class="product-price">31,500원</div>
                            </div>
                        </div>
                        <div class="product-card" onclick="location.href='product-detail.jsp?id=2'">
                            <div class="product-image">상품 이미지</div>
                            <div class="product-info">
                                <div class="product-name">약산성 폼 클렌저</div>
                                <div class="product-price">18,000원</div>
                            </div>
                        </div>
                        <div class="product-card" onclick="location.href='product-detail.jsp?id=3'">
                            <div class="product-image">상품 이미지</div>
                            <div class="product-info">
                                <div class="product-name">수분 크림</div>
                                <div class="product-price">26,000원</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="buttons" style="margin-top: 40px;">
                    <button class="btn btn-secondary" onclick="location.href='index.jsp'">홈으로</button>
                    <button class="btn btn-primary" onclick="location.href='products.jsp'">쇼핑하기</button>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp" %>

    <script>
        const answers = {
            skinType: '',
            concern: '',
            preference: ''
        };

        function selectOption(element, category) {
            // 같은 카테고리의 다른 옵션 선택 해제
            const siblings = element.parentElement.querySelectorAll('.option');
            siblings.forEach(opt => opt.classList.remove('selected'));
            
            // 현재 옵션 선택
            element.classList.add('selected');
            answers[category] = element.dataset.value;
        }

        function nextQuestion(current) {
            const categoryMap = {
                1: 'skinType',
                2: 'concern',
                3: 'preference'
            };

            if (!answers[categoryMap[current]]) {
                alert('옵션을 선택해주세요.');
                return;
            }

            // 현재 질문 숨기기
            document.getElementById('question' + current).classList.remove('active');
            
            // 다음 질문 표시
            document.getElementById('question' + (current + 1)).classList.add('active');
            
            // 단계 표시 업데이트
            document.getElementById('step' + current).classList.add('completed');
            document.getElementById('step' + current).classList.remove('active');
            document.getElementById('step' + (current + 1)).classList.add('active');
        }

        function prevQuestion(current) {
            // 현재 질문 숨기기
            document.getElementById('question' + current).classList.remove('active');
            
            // 이전 질문 표시
            document.getElementById('question' + (current - 1)).classList.add('active');
            
            // 단계 표시 업데이트
            document.getElementById('step' + current).classList.remove('active');
            document.getElementById('step' + (current - 1)).classList.remove('completed');
            document.getElementById('step' + (current - 1)).classList.add('active');
        }

        function showResult() {
            if (!answers.preference) {
                alert('옵션을 선택해주세요.');
                return;
            }

            // 질문 숨기기
            document.getElementById('question3').classList.remove('active');
            
            // 결과 표시
            document.getElementById('result').classList.add('active');
            
            // 단계 표시 업데이트
            document.getElementById('step3').classList.add('completed');
            document.getElementById('step3').classList.remove('active');
            document.getElementById('step4').classList.add('active');
            document.getElementById('step4').classList.add('completed');

            // 결과 텍스트 설정
            const skinTypeText = {
                'dry': '건성 피부',
                'oily': '지성 피부',
                'combination': '복합성 피부',
                'sensitive': '민감성 피부'
            };

            document.getElementById('resultType').textContent = 
                skinTypeText[answers.skinType] + ' 타입으로 진단되었습니다!';
            
            document.getElementById('resultDescription').textContent = 
                '당신의 피부는 ' + skinTypeText[answers.skinType] + '이며, ' +
                '특히 ' + getConcernText(answers.concern) + '에 집중된 케어가 필요합니다. ' +
                '아래 추천 제품으로 관리해보세요!';

            // 서버에 진단 결과 저장 (선택사항)
            saveDiagnosisResult();
        }

        function getConcernText(concern) {
            const concernMap = {
                'acne': '여드름/트러블 개선',
                'wrinkle': '주름/탄력 케어',
                'pigmentation': '미백/색소침착 관리',
                'pore': '모공 케어'
            };
            return concernMap[concern];
        }

        function saveDiagnosisResult() {
            // AJAX로 서버에 진단 결과 저장
            fetch('saveDiagnosis.do', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(answers)
            })
            .then(response => response.json())
            .then(data => {
                console.log('진단 결과 저장 완료:', data);
            })
            .catch(error => {
                console.error('저장 실패:', error);
            });
        }
    </script>
</body>
</html>