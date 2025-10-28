<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>비밀번호 재설정 - OneTouch</title>
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
                        <h1 class="page-title">비밀번호 재설정</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="${pageContext.request.contextPath}/"><i class="lni lni-home"></i> 홈</a></li>
                        <li>비밀번호 재설정</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    <!-- Start Password Reset Area -->
    <div class="account-login section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
                    <form class="card login-form" id="resetPasswordForm" 
                          action="${pageContext.request.contextPath}/user/resetPassword" method="post">
                        <div class="card-body">
                            <div class="title">
                                <h3>새 비밀번호 설정</h3>
                                <p>새로운 비밀번호를 입력해주세요.</p>
                            </div>

                            <!-- 에러 메시지 -->
                            <c:if test="${not empty errorMessage}">
                                <div class="alert alert-danger" role="alert">
                                    ${errorMessage}
                                </div>
                            </c:if>

                            <!-- 토큰이 유효하지 않거나 만료된 경우 -->
                            <c:if test="${not empty tokenError}">
                                <div class="alert alert-danger" role="alert">
                                    <h5 class="alert-heading">링크가 유효하지 않습니다</h5>
                                    <p>${tokenError}</p>
                                    <hr>
                                    <a href="${pageContext.request.contextPath}/user/findPassword" 
                                       class="btn btn-sm btn-danger">비밀번호 찾기로 이동</a>
                                </div>
                            </c:if>

                            <c:if test="${empty tokenError}">
                                <!-- Hidden field: token -->
                                <input type="hidden" name="token" value="${param.token}">

                                <!-- 새 비밀번호 -->
                                <div class="form-group input-group">
                                    <label for="password">새 비밀번호 <span class="text-danger">*</span></label>
                                    <input class="form-control" type="password" id="password" name="password" 
                                           placeholder="8자 이상, 영문/숫자/특수문자 포함" required>
                                    <small class="form-text text-muted">8자 이상, 영문/숫자/특수문자 포함</small>
                                </div>

                                <!-- 비밀번호 확인 -->
                                <div class="form-group input-group">
                                    <label for="passwordConfirm">새 비밀번호 확인 <span class="text-danger">*</span></label>
                                    <input class="form-control" type="password" id="passwordConfirm" 
                                           placeholder="비밀번호를 다시 입력하세요" required>
                                    <small id="passwordFeedback" class="form-text"></small>
                                </div>

                                <!-- 비밀번호 강도 표시 -->
                                <div class="form-group">
                                    <label class="form-label">비밀번호 강도</label>
                                    <div class="progress" style="height: 8px;">
                                        <div id="passwordStrength" class="progress-bar" role="progressbar" 
                                             style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                                        </div>
                                    </div>
                                    <small id="strengthText" class="form-text"></small>
                                </div>

                                <!-- 비밀번호 보기 토글 -->
                                <div class="form-check mb-3">
                                    <input type="checkbox" class="form-check-input" id="showPassword">
                                    <label class="form-check-label" for="showPassword">
                                        비밀번호 표시
                                    </label>
                                </div>

                                <div class="button">
                                    <button class="btn" type="submit" id="submitBtn">비밀번호 변경</button>
                                </div>
                            </c:if>

                            <!-- 로그인 링크 -->
                            <p class="outer-link text-center mt-4">
                                <a href="${pageContext.request.contextPath}/user/login">
                                    <i class="lni lni-arrow-left"></i> 로그인으로 돌아가기
                                </a>
                            </p>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- End Password Reset Area -->

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

        // 비밀번호 강도 계산
        function calculatePasswordStrength(password) {
            let strength = 0;
            if (password.length >= 8) strength += 25;
            if (password.length >= 12) strength += 25;
            if (/[a-z]/.test(password) && /[A-Z]/.test(password)) strength += 25;
            if (/\d/.test(password)) strength += 15;
            if (/[@$!%*#?&]/.test(password)) strength += 10;
            return Math.min(strength, 100);
        }

        // 비밀번호 입력 시 강도 표시
        document.getElementById('password').addEventListener('input', function() {
            const password = this.value;
            const strength = calculatePasswordStrength(password);
            const strengthBar = document.getElementById('passwordStrength');
            const strengthText = document.getElementById('strengthText');

            strengthBar.style.width = strength + '%';
            strengthBar.setAttribute('aria-valuenow', strength);

            if (strength < 40) {
                strengthBar.className = 'progress-bar bg-danger';
                strengthText.textContent = '약함';
                strengthText.className = 'form-text text-danger';
            } else if (strength < 70) {
                strengthBar.className = 'progress-bar bg-warning';
                strengthText.textContent = '보통';
                strengthText.className = 'form-text text-warning';
            } else {
                strengthBar.className = 'progress-bar bg-success';
                strengthText.textContent = '강함';
                strengthText.className = 'form-text text-success';
            }
        });

        // 비밀번호 확인
        document.getElementById('passwordConfirm').addEventListener('input', function() {
            const password = document.getElementById('password').value;
            const passwordConfirm = this.value;
            const feedback = document.getElementById('passwordFeedback');

            if (passwordConfirm === '') {
                feedback.textContent = '';
                return;
            }

            if (password === passwordConfirm) {
                feedback.className = 'form-text text-success';
                feedback.textContent = '비밀번호가 일치합니다.';
            } else {
                feedback.className = 'form-text text-danger';
                feedback.textContent = '비밀번호가 일치하지 않습니다.';
            }
        });

        // 비밀번호 보기/숨기기
        document.getElementById('showPassword').addEventListener('change', function() {
            const passwordField = document.getElementById('password');
            const passwordConfirmField = document.getElementById('passwordConfirm');
            const type = this.checked ? 'text' : 'password';
            passwordField.type = type;
            passwordConfirmField.type = type;
        });

        // 폼 제출 검증
        document.getElementById('resetPasswordForm').addEventListener('submit', function(e) {
            const password = document.getElementById('password').value;
            const passwordConfirm = document.getElementById('passwordConfirm').value;

            // 비밀번호 일치 확인
            if (password !== passwordConfirm) {
                e.preventDefault();
                alert('비밀번호가 일치하지 않습니다.');
                return false;
            }

            // 비밀번호 강도 검증
            const passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
            if (!passwordRegex.test(password)) {
                e.preventDefault();
                alert('비밀번호는 8자 이상이며, 영문/숫자/특수문자를 포함해야 합니다.');
                return false;
            }

            // 최소 강도 확인
            const strength = calculatePasswordStrength(password);
            if (strength < 40) {
                e.preventDefault();
                if (!confirm('비밀번호 강도가 약합니다. 계속하시겠습니까?')) {
                    return false;
                }
            }

            return true;
        });
    </script>
</body>
</html>
