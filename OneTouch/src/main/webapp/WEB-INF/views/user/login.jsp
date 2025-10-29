<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<c:include page="/WEB-INF/views/common/header.jsp" />
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

    <!-- Start Account Login Area -->
    <div class="account-login section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
                    <form class="card login-form" action="${pageContext.request.contextPath}/user/login" method="post">
                        <div class="card-body">
                            <div class="title">
                                <h3>로그인</h3>
                                <p>OneTouch 계정으로 로그인하세요.</p>
                            </div>
                            
                            <!-- 에러 메시지 표시 -->
                            <c:if test="${not empty errorMessage}">
                                <div class="alert alert-danger" role="alert">
                                    ${errorMessage}
                                </div>
                            </c:if>
                            
                            <!-- 성공 메시지 표시 (회원가입 후 등) -->
                            <c:if test="${not empty successMessage}">
                                <div class="alert alert-success" role="alert">
                                    ${successMessage}
                                </div>
                            </c:if>

                            <div class="form-group input-group">
                                <label for="email">이메일</label>
                                <input class="form-control" type="email" id="email" name="email" 
                                       placeholder="example@email.com" required 
                                       value="${param.email}">
                            </div>
                            
                            <div class="form-group input-group">
                                <label for="password">비밀번호</label>
                                <input class="form-control" type="password" id="password" name="password" 
                                       placeholder="비밀번호를 입력하세요" required>
                            </div>
                            
                            <div class="d-flex flex-wrap justify-content-between bottom-content">
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input width-auto" 
                                           id="rememberMe" name="rememberMe">
                                    <label class="form-check-label" for="rememberMe">로그인 상태 유지</label>
                                </div>
                                <a class="lost-pass" href="${pageContext.request.contextPath}/user/findPassword">
                                    비밀번호를 잊으셨나요?
                                </a>
                            </div>
                            
                            <div class="button">
                                <button class="btn" type="submit">로그인</button>
                            </div>
                            
                            <div class="alt-option">
                                <span>또는</span>
                            </div>
                            
                            <!-- 소셜 로그인 (선택사항 - 프로젝트에 따라 제거 가능) -->
                            <div class="social-login">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-12 mb-2">
                                        <a class="btn google-btn w-100" href="${pageContext.request.contextPath}/oauth2/authorization/google">
                                            <i class="lni lni-google"></i> Google 로그인
                                        </a>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-12 mb-2">
                                        <a class="btn kakao-btn w-100" href="${pageContext.request.contextPath}/oauth2/authorization/kakao" 
                                           style="background-color: #FEE500; color: #000000;">
                                            <i class="lni lni-comments"></i> 카카오 로그인
                                        </a>
                                    </div>
                                </div>
                            </div>
                            
                            <p class="outer-link">
                                아직 회원이 아니신가요? 
                                <a href="${pageContext.request.contextPath}/user/register">회원가입</a>
                            </p>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- End Account Login Area -->

    <!-- Start Footer Area -->
	<c:include page="/WEB-INF/views/common/footer.jsp" />
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
