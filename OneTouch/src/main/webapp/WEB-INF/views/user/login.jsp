<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>로그인 - OneTouch</title>
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
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

		/* 로그인 섹션 전체 중앙정렬 */
		.account-login.section {
		    min-height: 100vh; /* 화면 전체 높이 */
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    background: #f8f9fa;
		}
		
		/* Bootstrap container 여백 제거 */
		.account-login .container {
		    padding-left: 0 !important;
		    padding-right: 0 !important;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		}
		
		/* row도 중앙정렬 보정 */
		.account-login .row {
		    margin-left: 0 !important;
		    margin-right: 0 !important;
		    justify-content: center;
		    width: 100%;
		}
		
		
		/* 열 내부를 완전 중앙으로 */
		.account-login .col-lg-6,
		.account-login .col-md-10,
		.account-login .col-12 {
		    display: flex;
		    justify-content: center;
		}
		
		
		/* 로그인 박스 중앙 고정 */
		.login-container {
		    background: white;
		    border-radius: 20px;
		    box-shadow: 0 20px 60px rgba(0,0,0,0.3);
		    width: 100%;
		    max-width: 450px;
		    padding: 50px 40px;
		    margin: 0 auto; /* 가운데 정렬 핵심 */
		}

        .logo-section {
            text-align: center;
            margin-bottom: 40px;
        }

        .logo {
            font-size: 48px;
            font-weight: bold;
            color: #1a237e;
            letter-spacing: -2px;
            text-decoration: none;
            display: inline-block;
        }

        .logo span {
            color: #3949ab;
        }

        .login-title {
            text-align: center;
            font-size: 28px;
            color: #333;
            margin-bottom: 10px;
        }

        .login-subtitle {
            text-align: center;
            font-size: 15px;
            color: #666;
            margin-bottom: 40px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
            font-size: 14px;
            font-weight: 600;
            color: #333;
            margin-bottom: 8px;
        }

        .form-input {
            width: 100%;
            padding: 15px;
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

        .form-options {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }

        .remember-me {
            display: flex;
            align-items: center;
        }

        .remember-me input[type="checkbox"] {
            width: 18px;
            height: 18px;
            margin-right: 8px;
            cursor: pointer;
        }

        .remember-me label {
            font-size: 14px;
            color: #666;
            cursor: pointer;
        }

        .find-links {
            display: flex;
            gap: 10px;
            font-size: 14px;
        }

        .find-links a {
            color: #1a237e;
            text-decoration: none;
        }

        .find-links a:hover {
            text-decoration: underline;
        }

        .find-links span {
            color: #ccc;
        }

        .login-btn {
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

        .login-btn:hover {
            background: #0d47a1;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(26, 35, 126, 0.3);
        }

        .divider {
            display: flex;
            align-items: center;
            margin: 30px 0;
        }

        .divider::before,
        .divider::after {
            content: '';
            flex: 1;
            border-bottom: 1px solid #e0e0e0;
        }

        .divider span {
            padding: 0 15px;
            color: #999;
            font-size: 14px;
        }

        .social-login {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .social-btn {
            width: 100%;
            padding: 14px;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            transition: all 0.3s;
            background: white;
        }

        .social-btn:hover {
            background: #f5f5f5;
            border-color: #ccc;
        }

        .social-btn.kakao {
            background: #FEE500;
            border-color: #FEE500;
            color: #000;
        }

        .social-btn.kakao:hover {
            background: #F5DC00;
        }

        .social-btn.naver {
            background: #03C75A;
            border-color: #03C75A;
            color: white;
        }

        .social-btn.naver:hover {
            background: #02B350;
        }

        .social-btn.google {
            border: 2px solid #e0e0e0;
        }

        .register-link {
            text-align: center;
            margin-top: 25px;
            font-size: 14px;
            color: #666;
        }

        .register-link a {
            color: #1a237e;
            text-decoration: none;
            font-weight: 600;
        }

        .register-link a:hover {
            text-decoration: underline;
        }

        .error-message {
            background: #ffebee;
            color: #d32f2f;
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-size: 14px;
            text-align: center;
        }

        @media (max-width: 768px) {
            .login-container {
                padding: 40px 30px;
            }

            .logo {
                font-size: 40px;
            }

            .login-title {
                font-size: 24px;
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
	<%@include file="../common/header.jsp" %>
    <!-- End Header Area -->

    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">로그인</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="${pageContext.request.contextPath}/"><i class="lni lni-home"></i> 홈</a></li>
                        <li>로그인</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    
    
    <!-- 로그인 form 시작부분 -->
     <div class="account-login section">
        <div class="container">
          <div class="row justify-content-center">
                <div class="col-lg-6 col-md-10  col-12">
                
    <div class="login-container">
        <div class="logo-section">
            <a href="index.jsp" class="logo">One<span>Touch</span></a>
        </div>

        <h2 class="login-title">로그인</h2>
        <p class="login-subtitle">OneTouch에 오신 것을 환영합니다</p>

        <!-- 에러 메시지 -->
        <c:if test="${not empty param.error}">
            <div class="error-message">
                <c:choose>
                    <c:when test="${param.error == 'invalid'}">
                        아이디 또는 비밀번호가 올바르지 않습니다.
                    </c:when>
                    <c:when test="${param.error == 'session'}">
                        세션이 만료되었습니다. 다시 로그인해주세요.
                    </c:when>
                    <c:otherwise>
                        로그인에 실패했습니다.
                    </c:otherwise>
                </c:choose>
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/user/login" method="post" id="loginForm">
            <!-- 아이디 -->
            <div class="form-group">
                <label class="form-label">아이디</label>
                <input type="text" 
                       name="mem_id" 
                       id="mem_id" 
                       class="form-input" 
                       placeholder="아이디를 입력하세요"
                       value="${cookie.savedUserId.value}"
                       required>
            </div>

            <!-- 비밀번호 -->
            <div class="form-group">
                <label class="form-label">비밀번호</label>
                <input type="password" 
                       name="mem_pwd_check" 
                       id="mem_pwd_check" 
                       class="form-input" 
                       placeholder="비밀번호를 입력하세요"
                       required>
            </div>

            <!-- 옵션 -->
            <div class="form-options">
                <div class="remember-me">
                    <input type="checkbox" name="rememberMe" id="rememberMe" 
                           ${not empty cookie.savedUserId ? 'checked' : ''}>
                    <label for="rememberMe">아이디 저장</label>
                </div>
                <div class="find-links">
                    <a href="find_id_form">아이디 찾기</a>
                    <span>|</span>
                    <a href="/user/find_pw_form">비밀번호 찾기</a>
                </div>
            </div>

            <!-- 로그인 버튼 -->
            <button type="submit" class="login-btn">로그인</button>
            <input type="hidden" name="url" value="${url }">
        </form>

        <!-- 소셜 로그인 -->
<!--         <div class="divider">
            <span>또는</span>
        </div>

        <div class="social-login">
            <button class="social-btn kakao" onclick="loginKakao()">
                💬 카카오 로그인
            </button>
            <button class="social-btn naver" onclick="loginNaver()">
                <strong>N</strong> 네이버 로그인
            </button>
            <button class="social-btn google" onclick="loginGoogle()">
                🔍 구글 로그인
            </button>
        </div> -->

        <!-- 회원가입 링크 -->
        <div class="register-link">
            아직 회원이 아니신가요? <a href="${pageContext.request.contextPath}/user/register">회원가입</a>
        </div>
    </div>
    
    </div>
    </div>
    </div>
    </div>
    

    <!-- Start Footer Area -->
	<%@include file="../common/footer.jsp"%>
    <!-- End Footer Area -->

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
        // 프리로더 제거
        window.addEventListener('load', function() {
            const preloader = document.querySelector('.preloader');
            if (preloader) {
                preloader.style.opacity = '0';
                setTimeout(() => {
                    preloader.style.display = 'none';
                }, 500);
            }
        });
    </script>
    
    

    <script>
        // 카카오 로그인
        function loginKakao() {
            alert('카카오 로그인은 준비중입니다.');
            // 실제 구현 시:
            // location.href = 'oauth/kakao';
        }

        // 네이버 로그인
        function loginNaver() {
            alert('네이버 로그인은 준비중입니다.');
            // 실제 구현 시:
            // location.href = 'oauth/naver';
        }

        // 구글 로그인
        function loginGoogle() {
            alert('구글 로그인은 준비중입니다.');
            // 실제 구현 시:
            // location.href = 'oauth/google';
        }
    </script>
    <script type="text/javascript">
window.onload = function(){
	 setTimeout(function(){
		if("${mem_id_check}"=="false"){
			
		alert("아이디가 틀렸습니다.");
		}
		if("${mem_pw_check}"=="false"){
			
		alert("비밀번호가 틀렸습니다.");
		}
		if("${usersession}"=="logout"){
		alert("세션만료 다시 로그인 해주세요");
			
		}
		
	},100);
};
</script>
</body>
</html>
