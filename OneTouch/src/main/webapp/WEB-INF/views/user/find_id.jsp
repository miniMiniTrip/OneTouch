<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>아이디 찾기 - OneTouch</title>
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

      /* 아이디 찾기 섹션 전체 중앙정렬 */
      .account-findid.section {
          min-height: 100vh; /* 화면 전체 높이 */
          display: flex;
          justify-content: center;
          align-items: center;
          background: #f8f9fa;
      }
      
      /* Bootstrap container 여백 제거 */
      .account-findid .container {
          padding-left: 0 !important;
          padding-right: 0 !important;
          display: flex;
          justify-content: center;
          align-items: center;
      }
      
      /* row도 중앙정렬 보정 */
      .account-findid .row {
          margin-left: 0 !important;
          margin-right: 0 !important;
          justify-content: center;
          width: 100%;
      }
      
      /* 열 내부를 완전 중앙으로 */
      .account-findid .col-lg-6,
      .account-findid .col-md-10,
      .account-findid .col-12 {
          display: flex;
          justify-content: center;
      }
      
      /* 아이디 찾기 박스 중앙 고정 */
      .findid-container {
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

        .findid-title {
            text-align: center;
            font-size: 28px;
            color: #333;
            margin-bottom: 10px;
        }

        .findid-subtitle {
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

        .findid-btn {
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
            margin-bottom: 15px;
        }

        .findid-btn:hover {
            background: #0d47a1;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(26, 35, 126, 0.3);
        }

        .back-to-login-btn {
            width: 100%;
            padding: 16px;
            background: white;
            color: #1a237e;
            border: 2px solid #1a237e;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }

        .back-to-login-btn:hover {
            background: #1a237e;
            color: white;
            transform: translateY(-2px);
            text-decoration: none;
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

        .success-message {
            background: #e8f5e8;
            color: #2e7d32;
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-size: 14px;
            text-align: center;
        }

        @media (max-width: 768px) {
            .findid-container {
                padding: 40px 30px;
            }

            .logo {
                font-size: 40px;
            }

            .findid-title {
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
                        <h1 class="page-title">아이디 찾기</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="${pageContext.request.contextPath}/"><i class="lni lni-home"></i> 홈</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/login">로그인</a></li>
                        <li>아이디 찾기</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    <!-- 아이디 찾기 form 시작부분 -->
     <div class="account-findid section">
        <div class="container">
          <div class="row justify-content-center">
                <div class="col-lg-6 col-md-10  col-12">
                
    <div class="findid-container">
        <div class="logo-section">
            <a href="${pageContext.request.contextPath}/" class="logo">One<span>Touch</span></a>
        </div>

        <h2 class="findid-title">아이디 찾기</h2>
        <p class="findid-subtitle">가입 시 등록한 정보를 입력해주세요</p>

        <!-- 성공 메시지 -->
        <c:if test="${not empty successMessage}">
            <div class="success-message">
                ${successMessage}
            </div>
        </c:if>

        <!-- 에러 메시지 -->
        <c:if test="${not empty errorMessage}">
            <div class="error-message">
                ${errorMessage}
            </div>
        </c:if>

        <c:if test="${not empty param.error}">
            <div class="error-message">
                <c:choose>
                    <c:when test="${param.error == 'notfound'}">
                        입력한 정보로 등록된 아이디를 찾을 수 없습니다.
                    </c:when>
                    <c:otherwise>
                        아이디 찾기에 실패했습니다. 다시 시도해주세요.
                    </c:otherwise>
                </c:choose>
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/user/find_id" method="post" id="findIdForm">
            <!-- 이름 -->
            <div class="form-group">
                <label class="form-label">이름</label>
                <input type="text" 
                       name="mem_name" 
                       id="mem_name" 
                       class="form-input" 
                       placeholder="이름을 입력하세요"
                       required>
            </div>

            <!-- 이메일 -->
            <div class="form-group">
                <label class="form-label">이메일</label>
                <input type="email" 
                       name="mem_email" 
                       id="mem_email" 
                       class="form-input" 
                       placeholder="example@email.com"
                       required>
            </div>

            <!-- 아이디 찾기 버튼 -->
            <button type="submit" class="findid-btn">아이디 찾기</button>
            <button type="button" class="findid-btn" onclick="location.href='/user/find_pw_form';">비밀번호를 모르시나요?</button>
        </form>

        <!-- 로그인으로 돌아가기 버튼 -->
        <a href="${pageContext.request.contextPath}/user/login" class="back-to-login-btn">로그인으로 돌아가기</a>
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
</body>
</html>
