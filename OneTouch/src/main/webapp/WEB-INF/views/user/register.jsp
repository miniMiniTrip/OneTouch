<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html class="no-js" lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>회원가입 - OneTouch</title>
    <meta name="description" content="2030 남성 뷰티 쇼핑몰 OneTouch">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/images/favicon.svg">

    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/LineIcons.3.0.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/tiny-slider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/glightbox.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
    
    <!-- Daum 우편번호 API -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
    <style>
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
        
/* 파일 업로드 스타일 */
.file-upload {
	margin-bottom: 20px;
}

.file-upload-btn {
	display: inline-block;
	padding: 10px 15px;
	border-radius: 6px;
	background-color: #f5f5f5;
	border: 1px solid #ddd;
	color: #555;
	font-size: 13px;
	cursor: pointer;
	transition: all 0.2s;
}

.file-upload-btn:hover {
	background-color: #eee;
}

.file-upload input[type="file"] {
	display: none;
}

.file-name {
	display: inline-block;
	margin-left: 10px;
	font-size: 13px;
	color: #777;
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
    <!-- Start Header Area -->
    <c:import url="../common/header.jsp" />
    <!-- End Header Area -->

    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">회원가입</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="${pageContext.request.contextPath}/"><i class="lni lni-home"></i> 홈</a></li>
                        <li>회원가입</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    <!-- Start Account Register Area -->
    <div class="account-login section">
        <div class="container">
            <div class="row justify-content-center align-items-center" style="min-height: 80vh;">
                <div class="col-lg-8 offset-lg-2 col-md-10 offset-md-1 col-12">
        <form action="${pageContext.request.contextPath}/user/insert" method="post" id="registerForm" enctype="multipart/form-data" onsubmit="return validateForm()">

                            <!-- 에러 메시지 -->
                            <c:if test="${not empty errorMessage}">
                                <div class="alert alert-danger" role="alert">
                                    ${errorMessage}
                                </div>
                            </c:if>


								 <div class="register-container">
        <div class="logo-section">
            <a href="index.jsp" class="logo">One<span>Touch</span></a>
        </div>

        <h2 class="register-title">회원가입</h2>
        <p class="register-subtitle">OneTouch와 함께 시작하세요</p>

            <!-- 아이디 -->
            <div class="form-group">
                <label class="form-label">아이디 <span class="required">*</span></label>
                <div class="input-wrapper">
                    <input type="text" 
                           name="mem_id" 
                           id="mem_id" 
                           class="form-input" 
                           placeholder="영문, 숫자 조합 4-20자"
                           maxlength="20"
                           required>
                    <button type="button" class="check-btn" onclick="checkUserId();">중복확인</button>
                </div>
                <div class="error-message" id="userIdError"></div>
                <div class="success-message" id="userIdSuccess"></div>
            </div>

            <!-- 비밀번호 -->
            <div class="form-group">
                <label class="form-label">비밀번호 <span class="required">*</span></label>
                <input type="password" 
                       name="mem_pw" 
                       id="mem_pw" 
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
                       name="mem_name" 
                       id="mem_name" 
                       class="form-input" 
                       placeholder="실명을 입력하세요"
                       maxlength="20"
                       required>
                <div class="error-message" id="userNameError"></div>
            </div>

            <!-- 이메일 -->
            <div class="form-group">
                <label class="form-label">이메일 <span class="required">*</span></label>
              	<div class="input-wrapper">
                <input type="email" 
                       name="mem_email" 
                       id="mem_email" 
                       class="form-input" 
                       placeholder="example@email.com"
                       required>
                <button type="button" class="check-btn" onclick="checkUserEmail();">중복확인</button>
               	</div>
	           	<div class="error-message" id="userEmailError"></div>
                  <div class="success-message" id="userEmailSuccess"></div>
            </div>

            <!-- 휴대폰 -->
            <div class="form-group">
                <label class="form-label">휴대폰 번호 <span class="required">*</span></label>
                <input type="tel" 
                       name="mem_phone" 
                       id="mem_phone" 
                       class="form-input" 
                       placeholder="010-1234-5678"
                       maxlength="13"
                       oninput="formatPhone(this)"
                       required>
                <div class="error-message" id="phoneError"></div>
            </div>
            
			<!-- 생년월일 -->
            <div class="form-group">
                <label class="form-label">생년월일<span class="required">*</span></label>
                <input class="form-control" type="date" id="mem_birth" name="mem_birth" required>
            </div>
            
            <!-- 주소정보 -->
            <div class="form-group">
	            <label class="form-label">기본 배송지<span class="required" >*</span></label>
            </div>

             <!-- 우편번호 -->
             <div class="col-lg-4 col-12">
                 <div class="form-group">
                     <label for="zipCode">우편번호</label>
                     <div class="input-group">
                         <input class="form-control" type="text" id="mem_postal" name="mem_postal" 
                                placeholder="우편번호" readonly required>
                         <button type="button" class="btn btn-outline-primary" 
                                 id="searchAddressBtn" onclick="addrSearch();">검색</button>
                     </div>
                 </div>
             </div>

             <!-- 기본 주소 -->
             <div class="col-12">
                 <div class="form-group">
                     <label for="address">기본 주소</label>
                     <input class="form-control" type="text" id="mem_addr" name="mem_addr" 
                            placeholder="기본 주소" readonly required>
                 </div>
             </div>

             <!-- 상세 주소 -->
             <div class="col-12">
                 <div class="form-group">
                     <label for="addressDetail">상세 주소</label>
                     <input class="form-control" type="text" id="mem_addr_more" name="mem_addr_more" 
                            placeholder="상세 주소 (예: 101동 1001호)" required>
                 </div>
             </div>
             
             <div class="file-upload">
             	<label for="file-input" class="file-upload-btn" id="post_photo_insert">프로필 사진 첨부</label> 
				<input type="file" id="mem_image" name="mem_image" > 
				<span class="file-name">
				<!-- 선택된 파일 없음 -->
				</span>
			</div>
			
				<!-- 선택한 이미지 미리보기 영역 -->
			<div id="image-preview" class="row mt-3"></div>
			
			<br>
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
    </div>
								
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- End Account Register Area -->



    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top">
        <i class="lni lni-chevron-up"></i>
    </a>

    <!-- ========================= JS here ========================= -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/tiny-slider.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/glightbox.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
    
  
    
   <!--  -->

    <script>
    /* 선택한 이미지 미리보기 ------------------------ */
	document.getElementById('mem_image').addEventListener('change', function(event) {
	    const files = event.target.files;
	    const previewContainer = document.getElementById('image-preview');
	    
	    // 이전 미리보기 초기화
	    previewContainer.innerHTML = "";

	    // 파일 이름 표시
	    const fileNameDisplay = document.querySelector('.file-name');
	    if (files.length === 1) {
	        fileNameDisplay.textContent = files[0].name;
	    } else if (files.length > 1) {
	        fileNameDisplay.textContent = files.length + "개의 파일 선택됨";
	    } else {
	        fileNameDisplay.textContent = "선택된 파일 없음";
	    }

	    // 이미지 미리보기 생성
	    Array.from(files).forEach(file => {
	        if (!file.type.startsWith("image/")) return; // 이미지 파일만

	        const reader = new FileReader();
	        reader.onload = function(e) {
	            const col = document.createElement("div");
	            col.className = "col-4 mb-3 text-center"; // text-center 추가

	            // 이미지 감싸는 div (정사각형 유지)
	            const wrapper = document.createElement("div");
	            wrapper.style.width = "100%";
	            wrapper.style.paddingTop = "100%"; // 높이 비율 1:1
	            wrapper.style.position = "relative";
	            wrapper.style.borderRadius = "6px";
	            wrapper.style.overflow = "hidden";
	            wrapper.style.border = "1px solid #ddd";

	            // 이미지
	            const img = document.createElement("img");
	            img.src = e.target.result;
	            img.style.position = "absolute";
	            img.style.top = "0";
	            img.style.left = "0";
	            img.style.width = "100%";
	            img.style.height = "100%";
	            img.style.objectFit = "cover"; // 이미지 비율 유지

	            wrapper.appendChild(img);
	            col.appendChild(wrapper);
	            previewContainer.appendChild(col);
	        };
	        reader.readAsDataURL(file);
	    });
	});

    
		/* end : 선택한 이미지 미리보기 ------------------------ */
		
		     // 파일 업로드 표시
        document.getElementById('mem_image').addEventListener('change', function() {
            const fileCount = this.files.length;
            const fileNameDisplay = document.querySelector('.file-name');
            
            if (fileCount > 0) {
                if (fileCount === 1) {
                    fileNameDisplay.textContent = this.files[0].name;
                } else {
                    fileNameDisplay.textContent = `${fileCount}개의 파일이 선택됨`;
                }
            } else {
                fileNameDisplay.textContent = '선택된 파일 없음';
            }
        });
        
        document.getElementById('post_photo_insert').addEventListener('click',function(){
        	document.getElementById('mem_image').click();
        })
        
        //
		
        let userIdChecked = false;
		let userEmailChecked= false;
        // 아이디 중복 확인
        function checkUserId() {
            const userId = document.getElementById('mem_id').value;
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
            fetch('/user/idCheck',
            		{
            			method:'post'
            			,headers:{'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'}
            			,body:'mem_id='+encodeURIComponent(userId)
            		})
                .then(response => response.json())
                .then(data => {
                    if (data.idCheck) {
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
        
        // 이메일 중복 확인
        function checkUserEmail(){
        	const userEmail=document.getElementById('mem_email').value;
        	const errorMsg = document.getElementById('userEmailError');
        	const successMsg = document.getElementById('userEmailSuccess');
        	
        	if(!userEmail){
    	       errorMsg.textContent = '이메일을 입력하세요.';
               errorMsg.classList.add('show');
               successMsg.classList.remove('show');
               return;
        	}
        	// 이메일 유효성 검사
        	const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        	if (!emailPattern.test(userEmail)) {
        	    errorMsg.textContent = '유효한 이메일 주소를 입력하세요.';
        	    errorMsg.classList.add('show');
        	    successMsg.classList.remove('show');
        	    return;
        	}
       	    // AJAX로 서버에 중복 확인
            fetch('/user/emailCheck',
            		{
            			method:'post'
            			,headers:{'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'}
            			,body:'mem_email='+encodeURIComponent(userEmail)
            		})
                .then(response => response.json())
                .then(data => {
                    if (data.emailCheck) {
                        successMsg.textContent = '사용 가능한 이메일입니다.';
                        successMsg.classList.add('show');
                        errorMsg.classList.remove('show');
                        userIdChecked = true;
                    } else {
                        errorMsg.textContent = '이미 사용중인 이메일입니다.';
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
            const password = document.getElementById('mem_pw').value;
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
            const password = document.getElementById('mem_pw').value;
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
		
        // 주소 검색
        function addrSearch(){
      //  document.getElementById('searchAddressBtn').addEventListener('click', function() {
            new daum.Postcode({
                oncomplete: function(data) {
                    document.getElementById('mem_postal').value = data.zonecode;
                    document.getElementById('mem_addr').value = data.address;
                    document.getElementById('mem_addr_more').focus();
                }
            }).open();
      //  });
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
            const password = document.getElementById('mem_pw').value;
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
            
            // 이름 공백체크
            let memName= $("#mem_name").val();
            if (!memName) {
            	$("#mem_name").focus();
                return false;
            }
            // 이메일 공백체크
            let memEmail= $("#mem_email").val();
            if (!memEmail) {
            	$("#mem_email").focus();
                return false;
            }
            // 전화 공백체크
            let memPhone= $("#mem_phone").val();
            if (!memPmail) {
            	$("#mem_phone").focus();
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
    
        <!-- Start Footer Area -->
    <c:import url="/WEB-INF/views/common/footer.jsp" />
    <!-- End Footer Area -->
</body>
</html>
