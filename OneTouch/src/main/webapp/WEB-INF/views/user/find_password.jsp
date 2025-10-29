<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>비밀번호 찾기 - OneTouch</title>
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
    <c:import url="/WEB-INF/views/include/header.jsp" />
    <!-- End Header Area -->

    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">비밀번호 찾기</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="${pageContext.request.contextPath}/"><i class="lni lni-home"></i> 홈</a></li>
                        <li>비밀번호 찾기</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    <!-- Start Password Recovery Area -->
    <div class="account-login section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
                    <div class="card login-form">
                        <div class="card-body">
                            <div class="title">
                                <h3>비밀번호 찾기</h3>
                                <p>가입하신 이메일 주소를 입력하시면<br>비밀번호 재설정 링크를 보내드립니다.</p>
                            </div>

                            <!-- 에러 메시지 -->
                            <c:if test="${not empty errorMessage}">
                                <div class="alert alert-danger" role="alert">
                                    ${errorMessage}
                                </div>
                            </c:if>

                            <!-- 성공 메시지 -->
                            <c:if test="${not empty successMessage}">
                                <div class="alert alert-success" role="alert">
                                    ${successMessage}
                                </div>
                            </c:if>

                            <!-- Step 1: 이메일 입력 -->
                            <form id="emailForm" action="${pageContext.request.contextPath}/user/sendResetLink" 
                                  method="post" style="${not empty verificationSent ? 'display:none;' : ''}">
                                <div class="form-group input-group">
                                    <label for="email">이메일</label>
                                    <input class="form-control" type="email" id="email" name="email" 
                                           placeholder="가입하신 이메일을 입력하세요" required>
                                </div>

                                <div class="button">
                                    <button class="btn" type="submit">비밀번호 재설정 메일 받기</button>
                                </div>
                            </form>

                            <!-- Step 2: 메일 전송 완료 메시지 -->
                            <c:if test="${not empty verificationSent}">
                                <div class="text-center">
                                    <div class="mb-4">
                                        <i class="lni lni-envelope" style="font-size: 64px; color: #0167f3;"></i>
                                    </div>
                                    <h5 class="mb-3">메일이 전송되었습니다!</h5>
                                    <p class="mb-4">
                                        <strong>${email}</strong>로<br>
                                        비밀번호 재설정 링크를 보내드렸습니다.<br>
                                        메일을 확인하여 비밀번호를 재설정해주세요.
                                    </p>
                                    <p class="text-muted small mb-4">
                                        메일이 도착하지 않았다면 스팸 메일함을 확인해주세요.<br>
                                        링크는 24시간 동안 유효합니다.
                                    </p>
                                    <div class="d-grid gap-2">
                                        <button class="btn btn-outline-primary" 
                                                onclick="location.href='${pageContext.request.contextPath}/user/login'">
                                            로그인 페이지로
                                        </button>
                                        <button class="btn btn-link" id="resendBtn">
                                            메일을 받지 못하셨나요? 다시 보내기
                                        </button>
                                    </div>
                                </div>
                            </c:if>

                            <!-- 돌아가기 링크 -->
                            <p class="outer-link text-center mt-4">
                                <a href="${pageContext.request.contextPath}/user/login">
                                    <i class="lni lni-arrow-left"></i> 로그인으로 돌아가기
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Password Recovery Area -->

    <!-- Start Footer Area -->
    <c:import url="/WEB-INF/views/include/footer.jsp" />
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
                setTimeout(() => preloader.style.display = 'none', 500);
            }
        });

        // 재전송 버튼
        const resendBtn = document.getElementById('resendBtn');
        if (resendBtn) {
            resendBtn.addEventListener('click', function() {
                document.getElementById('emailForm').style.display = 'block';
                this.closest('.text-center').style.display = 'none';
            });
        }
    </script>
</body>
</html>
