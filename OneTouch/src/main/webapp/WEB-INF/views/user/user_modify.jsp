<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>회원정보 수정 - OneTouch</title>
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
        .member-section {
            padding: 0;
            background-color: #fff;
            min-height: calc(100vh - 400px);
        }
        
        .member-container {
            display: flex;
            max-width: 100%;
            margin: 0;
            background: transparent;
            border-radius: 0;
            overflow: visible;
            box-shadow: none;
        }
        
        .content {
            flex: 1;
            padding: 40px;
        }
        
        .content-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 2px solid #5c6bc0;
        }
        
        .content-header h2 {
            font-size: 18px;
            color: #1A237E;
            font-weight: 600;
        }
        
        .member-detail {
            max-width: 700px;
            margin-left: 150px;
        }
        
        .section-title {
            font-size: 16px;
            font-weight: 600;
            color: #333;
            margin-bottom: 20px;
            margin-top: 30px;
        }
        
        .section-title:first-of-type {
            margin-top: 0;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-size: 14px;
            font-weight: 600;
        }
        
        .form-input {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #e0e0e0;
            border-radius: 4px;
            font-size: 14px;
            font-family: inherit;
        }
        
        .form-input:focus {
            outline: none;
            border-color: #5c6bc0;
            box-shadow: 0 0 0 3px rgba(92, 107, 192, 0.1);
        }
        
        .form-input:disabled {
            background-color: #f5f5f5;
            cursor: not-allowed;
        }
        
        .zipcode-container {
            display: flex;
            gap: 10px;
            align-items: center;
        }
        
        .zipcode-input {
            flex: 1;
        }
        
        .section-divider {
            margin: 30px 0;
            border-top: 1px solid #e0e0e0;
            padding-top: 20px;
        }
        
        .btn-group {
            display: flex;
            gap: 10px;
            justify-content: flex-end;
            margin-top: 40px;
        }
        
        .btn {
            padding: 12px 30px;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.3s;
            font-weight: 600;
            min-width: 120px;
        }
        
        .btn-cancel {
            background: #dc3545 !important;
            color: white !important;
            padding: 4px 12px;
            border: none;
            border-radius: 4px;
            font-size: 12px;
            cursor: pointer;
            margin-left: auto;
            transition: background 0.3s;
        }
        
        .btn-cancel:hover {
            background: #c82333 !important;
        }
        
        .btn-submit {
            background: #1A237E !important;
            color: white !important;
        }
        
        .btn-submit:hover {
            background: #4a5aaf !important;
        }
        
        .withdraw-btn {
            display: inline-block;
            margin-top: 50px;
            color: #dc3545;
            text-decoration: none;
            font-size: 14px;
            cursor: pointer;
            transition: color 0.3s;
        }
        
        .withdraw-btn:hover {
            color: #c82333;
            text-decoration: underline;
        }
        
        .search-btn2 {
            background: #1A237E;
            color: white;
            padding: 12px 30px;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.3s;
            font-weight: 600;
            min-width: 120px;
        }
        
        .search-btn:hover {
            background: #4a5aaf !important;
        }
        
        .error-message {
            color: #dc3545;
            font-size: 13px;
            margin-top: 5px;
            display: none;
        }
        
        .success-message {
            background-color: #d4edda;
            color: #155724;
            padding: 12px;
            border-radius: 4px;
            margin-bottom: 20px;
            display: none;
        }
        
        /* 프로필 사진 영역 */
        .profile-photo-section {
            margin-bottom: 40px;
            padding-bottom: 30px;
            border-bottom: 1px solid #e0e0e0;
        }
        
        .profile-photo-container {
            display: flex;
            align-items: center;
            gap: 30px;
        }
        
        .profile-photo-preview {
            position: relative;
            width: 120px;
            height: 120px;
        }
        
        .profile-photo-circle {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            border: 3px solid #1A237E;
            overflow: hidden;
            background-color: #f5f5f5;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .profile-photo-circle img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        
        .profile-photo-placeholder {
            font-size: 48px;
            color: #bdbdbd;
        }
        
        .profile-photo-info {
            flex: 1;
        }
        
        .profile-photo-info h4 {
            font-size: 15px;
            font-weight: 600;
            color: #333;
            margin-bottom: 10px;
        }
        
        .profile-photo-info p {
            font-size: 13px;
            color: #757575;
            margin-bottom: 5px;
            line-height: 1.6;
        }
        
        .profile-photo-buttons {
            display: flex;
            gap: 10px;
            margin-top: 15px;
        }
        
        .btn-photo-upload,
        .btn-photo-delete {
            padding: 8px 20px;
            border-radius: 4px;
            font-size: 13px;
            cursor: pointer;
            transition: all 0.3s;
            font-weight: 600;
            border: none;
        }
        
        .btn-photo-upload {
            background: #1A237E;
            color: white;
        }
        
        .btn-photo-upload:hover {
            background: #4a5aaf;
        }
        
        .btn-photo-delete {
            background: red;
            color: white;
            border: 1px solid #e0e0e0;
        }
        
        .btn-photo-delete:hover {
            background: #eeeeee;
            border-color: #bdbdbd;
        }
        
        /* 파일 input 숨김 */
        #photoFileInput {
            display: none;
        }
        
        
        
        
        
        
        
        /* 반응형 */
        
        /* ... (기존 CSS 유지) ... */
    
    /* ========================= 마이페이지 메뉴 아코디언 및 반응형 스타일 추가 ========================= */
    /* PC 사이드바 스타일 (mypage_side_bar.jsp에 있을 것으로 추정되나, 여기에 PC용 기본 스타일을 임시로 추가합니다.) */
    .sidebar {
        width: 250px; 
        background: #fafafa;
        border-right: 1px solid #e0e0e0;
        padding: 30px 0;
        min-height: calc(100vh - 400px); /* PC 높이 유지 */
    }

    /* 모바일 토글 버튼 스타일 (PC에서는 숨김) */
    .mobile-menu-toggle {
        display: none; 
        padding: 12px 15px; 
        background: #1A237E;
        color: white;
        font-weight: 600;
        cursor: pointer;
        justify-content: space-between;
        align-items: center;
        transition: all 0.3s;
        font-size: 18px; 
        width: 100%; 
        box-sizing: border-box;
    }

    /* 메뉴 바디 (실제 사이드바 내용) 스타일 */
    .menu-body {
        overflow: hidden;
    }

    /* ========================= 반응형 (Media Queries) ========================= */
    @media (max-width: 992px) {
        .member-container {
            flex-direction: column; 
         
        }
        
        .sidebar {
            width: 100%; 
            border-right: none !important;
            border-bottom: 1px none #e0e0e0  !important;
            min-height: auto;
            
            /* ⭐ 공백 제거 및 중앙 정렬 핵심 */
            min-height: auto !important; 
            padding: 0 !important;
            display: flex !important; 
            flex-direction: column;
            align-items: center; /* 내부 요소 중앙 정렬 */
        }
        
        /* 햄버거 버튼 스타일 (중앙에서 드롭다운 메뉴처럼 보이도록) */
        .mobile-menu-toggle {
            display: flex; /* 모바일에서 표시 */
            max-width: 320px; 
            width: 90%; 
            margin: 15px auto; /* ⭐ 중앙 정렬 */
            padding: 12px 15px; 
            border-radius: 4px; 
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); 
        }

        /* 메뉴 바디 (닫힌 상태: 공백 제거) */
        .menu-body {
            max-height: 0; 
            transition: max-height 0.3s ease-in-out, padding 0.3s ease-in-out;
            padding-top: 0 !important;
            padding-bottom: 0 !important;
            
            width: 90%; 
            max-width: 320px; 
            margin: 0 auto; /* 버튼 너비에 맞춰 중앙 정렬 */
        }
        
        /* 메뉴가 펼쳐졌을 때의 스타일 */
        .menu-body.active {
            max-height: 1000px; 
            padding-top: 10px !important; 
            padding-bottom: 20px !important; 
            
            width: 90%; 
            max-width: 320px;
            margin: 0 auto 20px auto; 
            
            background: #fafafa; 
            border: 1px solid #e0e0e0; 
            border-radius: 4px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1); 
            border-top: none;
        }

        /* 콘텐츠 영역 */
        .content {
            padding: 30px 20px; 
        }
        .member-detail {
            margin: 0 auto; 
        }
    }
        
        
        
        
        
        
        
        
        
        
    </style>
    
    <script type="text/javascript">
    
 // 파일 선택 창 열기
    function triggerFileInput() {
        document.getElementById('photoFileInput').click();
    }

    // 파일 선택 시 미리보기
    document.getElementById('photoFileInput').addEventListener('change', function(e) {
        const file = e.target.files[0];
        
        if (file) {
            // 파일 크기 체크 (5MB)
            if (file.size > 5 * 1024 * 1024) {
                alert('파일 크기는 5MB 이하여야 합니다.');
                this.value = '';
                return;
            }
            
            // 파일 타입 체크
            if (!file.type.match('image/jpeg') && !file.type.match('image/png')) {
                alert('JPG 또는 PNG 파일만 업로드 가능합니다.');
                this.value = '';
                return;
            }
            
            // 미리보기
            const reader = new FileReader();
            reader.onload = function(event) {
                const photoPreview = document.getElementById('photoPreview');
                photoPreview.innerHTML = '<img src="' + event.target.result + '" alt="프로필 사진">';
            };
            reader.readAsDataURL(file);
        }
    });

    // 사진 삭제
    function deletePhoto() {
        if (confirm('프로필 사진을 삭제하시겠습니까?')) {
            document.getElementById('photoFileInput').value = '';
            const photoPreview = document.getElementById('photoPreview');
            photoPreview.innerHTML = '<i class="lni lni-user profile-photo-placeholder"></i>';
        }
    }
    
    
    </script>
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
                        <h1 class="page-title">회원정보 수정</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="${pageContext.request.contextPath}/"><i class="lni lni-home"></i> 홈</a></li>
                        <li>마이페이지</li>
                        <li>회원정보 수정</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    <!-- Start Member Section -->
    <section class="member-section">
        <div class="container">
            <div class="member-container">
            
                <!-- 사이드바 인크루드 -->
                <%@include file="../common/mypage_side_bar.jsp" %>
                
                <div class="content">
                    <div class="content-header">
                        <h2>회원정보 수정</h2>
                    </div>
                    
                    <div class="success-message" id="successMsg"></div>
                    
                    <!-- 회원정보 수정 폼 -->
                    <div class="member-detail">
                        <form id="memberForm" action="${pageContext.request.contextPath}/mypage/updateMember" method="post" enctype="multipart/form-data">
                            
                            <!-- 프로필 사진 섹션 -->
<div class="profile-photo-section">
    <div class="profile-photo-container">
        <div class="profile-photo-preview">
            <div class="profile-photo-circle" id="photoPreview">
                <i class="lni lni-user profile-photo-placeholder" id="photoPlaceholder"></i>
            </div>
        </div>
        <div class="profile-photo-info">
            <h4>프로필 사진</h4>
            <p>JPG, PNG 파일 (최대 5MB)</p>
            <p>권장 크기: 400x400px</p>
            <div class="profile-photo-buttons">
                <input type="file" id="photoFileInput" name="profilePhoto" accept="image/jpeg,image/png">
                <button type="button" class="btn-photo-upload" onclick="triggerFileInput();">사진 업로드</button>
                <button type="button" class="btn-photo-delete" onclick="deletePhoto();">삭제</button>
            </div>
        </div>
    </div>
</div>
                            
                            <h3 class="section-title">기본 정보</h3>
                            
                            <div class="form-group">
                                <label class="form-label">아이디</label>
                                <input type="text" class="form-input" value="${sessionScope.loginMember.username}" disabled>
                            </div>
                            
                            <div class="form-group">
                                <label class="form-label">이름</label>
                                <input type="text" class="form-input" name="name" value="${sessionScope.loginMember.name}" required>
                                <div class="error-message" id="nameError"></div>
                            </div>
                            
                            <div class="form-group">
                                <label class="form-label">이메일</label>
                                <input type="email" class="form-input" name="email" value="${sessionScope.loginMember.email}" required>
                                <div class="error-message" id="emailError"></div>
                            </div>
                            
                            <div class="form-group">
                                <label class="form-label">휴대폰번호</label>
                                <input type="tel" class="form-input" name="phone" value="${sessionScope.loginMember.phone}" required>
                                <div class="error-message" id="phoneError"></div>
                            </div>
                            
                            <div class="form-group">
                                <label class="form-label">생년월일</label>
                                <input type="date" class="form-input" name="birthDate" value="${sessionScope.loginMember.birthDate}">
                            </div>
                            
                            <div class="form-group">
                                <label class="form-label">새 비밀번호 (변경 시에만 입력)</label>
                                <input type="password" class="form-input" name="newPassword" placeholder="8자 이상">
                                <div class="error-message" id="passwordError"></div>
                            </div>
                            
                            <div class="form-group">
                                <label class="form-label">새 비밀번호 확인</label>
                                <input type="password" class="form-input" name="confirmPassword" placeholder="비밀번호 재입력">
                                <div class="error-message" id="confirmPasswordError"></div>
                            </div>
                            
                            <div class="section-divider"></div>
                            
                            <h3 class="section-title">배송지 정보</h3>
                            
                            <div class="form-group">
                                <label class="form-label">우편번호</label>
                                <div class="zipcode-container">
                                    <input type="text" class="form-input zipcode-input" name="zipcode" value="${sessionScope.loginMember.zipcode}" readonly>
                                    <button type="button" class="search-btn2" onclick="searchZipcode();">검색</button>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="form-label">기본배송지</label>
                                <input type="text" class="form-input" name="address" value="${sessionScope.loginMember.address}" readonly>
                            </div>
                            
                            <div class="form-group">
                                <label class="form-label">상세주소</label>
                                <input type="text" class="form-input" name="detailAddress" value="${sessionScope.loginMember.detailAddress}">
                            </div>
                            
                            <div class="btn-group">
                                <button type="button" class="btn btn-cancel" onclick="confirmCancel();">취소</button>
                                <button type="submit" class="btn btn-submit" onclick="return validateForm();">저장</button>
                            </div>
                        </form>
                        
                        <a href="javascript:void(0);" class="withdraw-btn" onclick="confirmWithdraw();">회원탈퇴</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Member Section -->

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top">
        <i class="lni lni-chevron-up"></i>
    </a>

    <!-- ========================= JS here ========================= -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/tiny-slider.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/glightbox.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
    
    <script>
        // 폼 검증
        function validateForm() {
            let isValid = true;
            const form = document.getElementById('memberForm');
            
            // 에러 메시지 초기화
            document.querySelectorAll('.error-message').forEach(msg => msg.style.display = 'none');
            
            // 이름 검증
            const name = form.querySelector('input[name="name"]').value.trim();
            if (name === '') {
                document.getElementById('nameError').textContent = '이름을 입력해주세요.';
                document.getElementById('nameError').style.display = 'block';
                isValid = false;
            }
            
            // 이메일 검증
            const email = form.querySelector('input[name="email"]').value.trim();
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (email === '' || !emailRegex.test(email)) {
                document.getElementById('emailError').textContent = '유효한 이메일을 입력해주세요.';
                document.getElementById('emailError').style.display = 'block';
                isValid = false;
            }
            
            // 휴대폰번호 검증
            const phone = form.querySelector('input[name="phone"]').value.trim();
            const phoneRegex = /^\d{3}-\d{3,4}-\d{4}$/;
            if (phone === '' || !phoneRegex.test(phone)) {
                document.getElementById('phoneError').textContent = '휴대폰번호를 올바른 형식으로 입력해주세요. (예: 010-1234-5678)';
                document.getElementById('phoneError').style.display = 'block';
                isValid = false;
            }
            
            // 새 비밀번호 검증
            const newPassword = form.querySelector('input[name="newPassword"]').value;
            const confirmPassword = form.querySelector('input[name="confirmPassword"]').value;
            
            if (newPassword !== '' || confirmPassword !== '') {
                if (newPassword.length < 8) {
                    document.getElementById('passwordError').textContent = '비밀번호는 8자 이상이어야 합니다.';
                    document.getElementById('passwordError').style.display = 'block';
                    isValid = false;
                }
                
                if (newPassword !== confirmPassword) {
                    document.getElementById('confirmPasswordError').textContent = '비밀번호가 일치하지 않습니다.';
                    document.getElementById('confirmPasswordError').style.display = 'block';
                    isValid = false;
                }
            }
            
            return isValid;
        }
        
        // 우편번호 검색
        function searchZipcode() {
            alert('우편번호 검색 기능이 실행됩니다.');
            // 실제 구현 시 우편번호 API 연동 (예: 카카오 우편번호 서비스)
        }
        
        // 취소 확인
        function confirmCancel() {
            if (confirm('입력한 내용이 저장되지 않습니다. 계속하시겠습니까?')) {
                history.back();
            }
        }
        
        // 회원탈퇴 확인
        function confirmWithdraw() {
            if (confirm('정말로 회원을 탈퇴하시겠습니까?\n탈퇴 후 복구할 수 없습니다.')) {
                location.href = '${pageContext.request.contextPath}/mypage/withdraw';
            }
        }
        
        // 페이지 로드 시 성공 메시지 표시
        window.addEventListener('DOMContentLoaded', function() {
            const successMsg = '${param.success}';
            if (successMsg === 'true') {
                const msgElement = document.getElementById('successMsg');
                msgElement.textContent = '회원정보가 성공적으로 수정되었습니다.';
                msgElement.style.display = 'block';
                
                setTimeout(() => {
                    msgElement.style.display = 'none';
                }, 5000);
            }
        });
        
        // 프리로더 제거
        window.addEventListener('load', function() {
            const preloader = document.querySelector('.preloader');
            if (preloader) {
                preloader.style.opacity = '0';
                setTimeout(() => preloader.style.display = 'none', 500);
            }
        });
    </script>

    <!-- 푸터 인크루드 -->
    <%@include file="../common/footer.jsp" %>

    <!-- End Footer Area -->
</body>
</html>