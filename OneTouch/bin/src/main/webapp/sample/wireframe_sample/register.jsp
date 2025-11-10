<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 - OneTouch</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Malgun Gothic', 'Apple SD Gothic Neo', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px 20px;
        }

        .register-container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            width: 100%;
            max-width: 600px;
            padding: 50px 40px;
        }

        .logo-section {
            text-align: center;
            margin-bottom: 40px;
        }

        .logo {
            font-size: 36px;
            font-weight: bold;
            color: #1a237e;
            letter-spacing: -1px;
            text-decoration: none;
            display: inline-block;
        }

        .logo span {
            color: #3949ab;
        }

        .register-title {
            text-align: center;
            font-size: 28px;
            color: #333;
            margin-bottom: 10px;
        }

        .register-subtitle {
            text-align: center;
            font-size: 15px;
            color: #666;
            margin-bottom: 40px;
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-label {
            display: block;
            font-size: 14px;
            font-weight: 600;
            color: #333;
            margin-bottom: 8px;
        }

        .form-label .required {
            color: #d32f2f;
        }

        .form-input {
            width: 100%;
            padding: 14px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 15px;
            transition: all 0.3s;
        }

        .form-input:focus {
            outline: none;
            border-color: #1a237e;
            box-shadow: 0 0 0 3px rgba(26, 35, 126, 0.1);
        }

        .form-input.error {
            border-color: #d32f2f;
        }

        .input-wrapper {
            position: relative;
        }

        .check-btn {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            padding: 8px 16px;
            background: #1a237e;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 13px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .check-btn:hover {
            background: #0d47a1;
        }

        .error-message {
            color: #d32f2f;
            font-size: 13px;
            margin-top: 6px;
            display: none;
        }

        .error-message.show {
            display: block;
        }

        .success-message {
            color: #4caf50;
            font-size: 13px;
            margin-top: 6px;
            display: none;
        }

        .success-message.show {
            display: block;
        }

        .password-strength {
            margin-top: 8px;
            display: none;
        }

        .password-strength.show {
            display: block;
        }

        .strength-bar {
            height: 4px;
            background: #e0e0e0;
            border-radius: 2px;
            overflow: hidden;
            margin-bottom: 5px;
        }

        .strength-fill {
            height: 100%;
            transition: all 0.3s;
        }

        .strength-fill.weak {
            width: 33%;
            background: #d32f2f;
        }

        .strength-fill.medium {
            width: 66%;
            background: #ff9800;
        }

        .strength-fill.strong {
            width: 100%;
            background: #4caf50;
        }

        .strength-text {
            font-size: 12px;
            color: #666;
        }

        .checkbox-group {
            margin-bottom: 25px;
        }

        .checkbox-item {
            display: flex;
            align-items: center;
            margin-bottom: 12px;
        }

        .checkbox-item input[type="checkbox"] {
            width: 18px;
            height: 18px;
            margin-right: 10px;
            cursor: pointer;
        }

        .checkbox-item label {
            font-size: 14px;
            color: #333;
            cursor: pointer;
        }

        .checkbox-item label .required {
            color: #d32f2f;
        }

        .checkbox-item a {
            color: #1a237e;
            text-decoration: none;
            margin-left: 5px;
        }

        .checkbox-item a:hover {
            text-decoration: underline;
        }

        .register-btn {
            width: 100%;
            padding: 16px;
            background: #1a237e;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
        }

        .register-btn:hover {
            background: #0d47a1;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(26, 35, 126, 0.3);
        }

        .register-btn:disabled {
            background: #ccc;
            cursor: not-allowed;
            transform: none;
        }

        .login-link {
            text-align: center;
            margin-top: 25px;
            font-size: 14px;
            color: #666;
        }

        .login-link a {
            color: #1a237e;
            text-decoration: none;
            font-weight: 600;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            .register-container {
                padding: 40px 30px;
            }

            .register-title {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
    <div class="register-container">
        <div class="logo-section">
            <a href="index.jsp" class="logo">One<span>Touch</span></a>
        </div>

        <h2 class="register-title">회원가입</h2>
        <p class="register-subtitle">OneTouch와 함께 시작하세요</p>

        <form action="registerProcess.do" method="post" id="registerForm" onsubmit="return validateForm()">
            <!-- 아이디 -->
            <div class="form-group">
                <label class="form-label">아이디 <span class="required">*</span></label>
                <div class="input-wrapper">
                    <input type="text" 
                           name="userId" 
                           id="userId" 
                           class="form-input" 
                           placeholder="영문, 숫자 조합 4-20자"
                           maxlength="20"
                           required>
                    <button type="button" class="check-btn" onclick="checkUserId()">중복확인</button>
                </div>
                <div class="error-message" id="userIdError"></div>
                <div class="success-message" id="userIdSuccess"></div>
            </div>

            <!-- 비밀번호 -->
            <div class="form-group">
                <label class="form-label">비밀번호 <span class="required">*</span></label>
                <input type="password" 
                       name="password" 
                       id="password" 
                       class="form-input" 
                       placeholder="영문, 숫자, 특수문자 조합 8-20자"
                       maxlength="20"
                       oninput="checkPasswordStrength()"
                       required>
                <div class="password-strength" id="passwordStrength">
                    <div class="strength-bar">
                        <div class="strength-fill" id="strengthFill"></div>
                    </div>
                    <div class="strength-text" id="strengthText"></div>
                </div>
                <div class="error-message" id="passwordError"></div>
            </div>

            <!-- 비밀번호 확인 -->
            <div class="form-group">
                <label class="form-label">비밀번호 확인 <span class="required">*</span></label>
                <input type="password" 
                       name="passwordConfirm" 
                       id="passwordConfirm" 
                       class="form-input" 
                       placeholder="비밀번호를 다시 입력하세요"
                       maxlength="20"
                       oninput="checkPasswordMatch()"
                       required>
                <div class="error-message" id="passwordConfirmError"></div>
                <div class="success-message" id="passwordConfirmSuccess"></div>
            </div>

            <!-- 이름 -->
            <div class="form-group">
                <label class="form-label">이름 <span class="required">*</span></label>
                <input type="text" 
                       name="userName" 
                       id="userName" 
                       class="form-input" 
                       placeholder="실명을 입력하세요"
                       maxlength="20"
                       required>
                <div class="error-message" id="userNameError"></div>
            </div>

            <!-- 이메일 -->
            <div class="form-group">
                <label class="form-label">이메일 <span class="required">*</span></label>
                <input type="email" 
                       name="email" 
                       id="email" 
                       class="form-input" 
                       placeholder="example@email.com"
                       required>
                <div class="error-message" id="emailError"></div>
            </div>

            <!-- 휴대폰 -->
            <div class="form-group">
                <label class="form-label">휴대폰 번호 <span class="required">*</span></label>
                <input type="tel" 
                       name="phone" 
                       id="phone" 
                       class="form-input" 
                       placeholder="010-1234-5678"
                       maxlength="13"
                       oninput="formatPhone(this)"
                       required>
                <div class="error-message" id="phoneError"></div>
            </div>

            <!-- 약관 동의 -->
            <div class="checkbox-group">
                <div class="checkbox-item">
                    <input type="checkbox" id="agreeAll" onchange="toggleAllAgreements()">
                    <label for="agreeAll"><strong>전체 동의</strong></label>
                </div>
                <hr style="margin: 15px 0; border: none; border-top: 1px solid #e0e0e0;">
                <div class="checkbox-item">
                    <input type="checkbox" name="agreeTerms" id="agreeTerms" required>
                    <label for="agreeTerms">
                        <span class="required">*</span> 이용약관 동의
                        <a href="terms.jsp" target="_blank">(보기)</a>
                    </label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" name="agreePrivacy" id="agreePrivacy" required>
                    <label for="agreePrivacy">
                        <span class="required">*</span> 개인정보 수집 및 이용 동의
                        <a href="privacy.jsp" target="_blank">(보기)</a>
                    </label>
                </div>
                <div class="checkbox-item">
                    <input type="checkbox" name="agreeMarketing" id="agreeMarketing">
                    <label for="agreeMarketing">
                        마케팅 정보 수신 동의 (선택)
                    </label>
                </div>
            </div>

            <!-- 회원가입 버튼 -->
            <button type="submit" class="register-btn">회원가입</button>

            <!-- 로그인 링크 -->
            <div class="login-link">
                이미 계정이 있으신가요? <a href="login.jsp">로그인</a>
            </div>
        </form>
    </div>

    <script>
        let userIdChecked = false;

        // 아이디 중복 확인
        function checkUserId() {
            const userId = document.getElementById('userId').value;
            const errorMsg = document.getElementById('userIdError');
            const successMsg = document.getElementById('userIdSuccess');

            if (!userId) {
                errorMsg.textContent = '아이디를 입력하세요.';
                errorMsg.classList.add('show');
                successMsg.classList.remove('show');
                return;
            }

            // 아이디 유효성 검사
            const idPattern = /^[a-zA-Z0-9]{4,20}$/;
            if (!idPattern.test(userId)) {
                errorMsg.textContent = '영문, 숫자 조합 4-20자로 입력하세요.';
                errorMsg.classList.add('show');
                successMsg.classList.remove('show');
                return;
            }

            // AJAX로 서버에 중복 확인
            fetch('checkUserId.do?userId=' + userId)
                .then(response => response.json())
                .then(data => {
                    if (data.available) {
                        successMsg.textContent = '사용 가능한 아이디입니다.';
                        successMsg.classList.add('show');
                        errorMsg.classList.remove('show');
                        userIdChecked = true;
                    } else {
                        errorMsg.textContent = '이미 사용중인 아이디입니다.';
                        errorMsg.classList.add('show');
                        successMsg.classList.remove('show');
                        userIdChecked = false;
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    errorMsg.textContent = '중복 확인 중 오류가 발생했습니다.';
                    errorMsg.classList.add('show');
                });
        }

        // 비밀번호 강도 체크
        function checkPasswordStrength() {
            const password = document.getElementById('password').value;
            const strengthDiv = document.getElementById('passwordStrength');
            const fill = document.getElementById('strengthFill');
            const text = document.getElementById('strengthText');

            if (!password) {
                strengthDiv.classList.remove('show');
                return;
            }

            strengthDiv.classList.add('show');

            let strength = 0;
            if (password.length >= 8) strength++;
            if (/[a-z]/.test(password)) strength++;
            if (/[A-Z]/.test(password)) strength++;
            if (/[0-9]/.test(password)) strength++;
            if (/[^a-zA-Z0-9]/.test(password)) strength++;

            fill.className = 'strength-fill';
            if (strength <= 2) {
                fill.classList.add('weak');
                text.textContent = '약함';
            } else if (strength <= 4) {
                fill.classList.add('medium');
                text.textContent = '보통';
            } else {
                fill.classList.add('strong');
                text.textContent = '강함';
            }
        }

        // 비밀번호 확인 체크
        function checkPasswordMatch() {
            const password = document.getElementById('password').value;
            const passwordConfirm = document.getElementById('passwordConfirm').value;
            const errorMsg = document.getElementById('passwordConfirmError');
            const successMsg = document.getElementById('passwordConfirmSuccess');

            if (!passwordConfirm) {
                errorMsg.classList.remove('show');
                successMsg.classList.remove('show');
                return;
            }

            if (password === passwordConfirm) {
                successMsg.textContent = '비밀번호가 일치합니다.';
                successMsg.classList.add('show');
                errorMsg.classList.remove('show');
            } else {
                errorMsg.textContent = '비밀번호가 일치하지 않습니다.';
                errorMsg.classList.add('show');
                successMsg.classList.remove('show');
            }
        }

        // 전화번호 포맷팅
        function formatPhone(input) {
            let value = input.value.replace(/\D/g, '');
            if (value.length > 3 && value.length <= 7) {
                value = value.slice(0, 3) + '-' + value.slice(3);
            } else if (value.length > 7) {
                value = value.slice(0, 3) + '-' + value.slice(3, 7) + '-' + value.slice(7, 11);
            }
            input.value = value;
        }

        // 전체 동의 토글
        function toggleAllAgreements() {
            const agreeAll = document.getElementById('agreeAll').checked;
            document.getElementById('agreeTerms').checked = agreeAll;
            document.getElementById('agreePrivacy').checked = agreeAll;
            document.getElementById('agreeMarketing').checked = agreeAll;
        }

        // 폼 유효성 검사
        function validateForm() {
            // 아이디 중복 확인 체크
            if (!userIdChecked) {
                alert('아이디 중복 확인을 해주세요.');
                return false;
            }

            // 비밀번호 유효성 검사
            const password = document.getElementById('password').value;
            const passwordPattern = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,20}$/;
            if (!passwordPattern.test(password)) {
                alert('비밀번호는 영문, 숫자, 특수문자를 포함한 8-20자로 입력하세요.');
                return false;
            }

            // 비밀번호 확인
            const passwordConfirm = document.getElementById('passwordConfirm').value;
            if (password !== passwordConfirm) {
                alert('비밀번호가 일치하지 않습니다.');
                return false;
            }

            // 필수 약관 동의 체크
            if (!document.getElementById('agreeTerms').checked || 
                !document.getElementById('agreePrivacy').checked) {
                alert('필수 약관에 동의해주세요.');
                return false;
            }

            return true;
        }
    </script>
</body>
</html>