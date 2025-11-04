<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
            <div class="row">
                <div class="col-lg-8 offset-lg-2 col-md-10 offset-md-1 col-12">
                    <form class="card login-form" action="${pageContext.request.contextPath}/user/register" 
                          method="post" id="registerForm">
                        <div class="card-body">
                            <div class="title">
                                <h3>회원가입</h3>
                                <p>OneTouch의 회원이 되어 맞춤형 뷰티 추천을 받아보세요.</p>
                            </div>

                            <!-- 에러 메시지 -->
                            <c:if test="${not empty errorMessage}">
                                <div class="alert alert-danger" role="alert">
                                    ${errorMessage}
                                </div>
                            </c:if>

                            <div class="row">
                                <div class="col-12">
                                    <h6 class="mt-3 mb-3">기본 정보</h6>
                                </div>
                                
                                <!-- 이메일 -->
                                <div class="col-lg-6 col-12">
                                    <div class="form-group">
                                        <label for="email">이메일 <span class="text-danger">*</span></label>
                                        <input class="form-control" type="email" id="email" name="email" 
                                               placeholder="example@email.com" required>
                                        <button type="button" class="btn btn-sm btn-outline-primary mt-2" 
                                                id="checkEmailBtn">중복 확인</button>
                                        <small id="emailFeedback" class="form-text"></small>
                                    </div>
                                </div>

                                <!-- 비밀번호 -->
                                <div class="col-lg-6 col-12">
                                    <div class="form-group">
                                        <label for="password">비밀번호 <span class="text-danger">*</span></label>
                                        <input class="form-control" type="password" id="password" name="password" 
                                               placeholder="8자 이상, 영문/숫자/특수문자 포함" required>
                                        <small class="form-text text-muted">8자 이상, 영문/숫자/특수문자 포함</small>
                                    </div>
                                </div>

                                <!-- 비밀번호 확인 -->
                                <div class="col-lg-6 col-12">
                                    <div class="form-group">
                                        <label for="passwordConfirm">비밀번호 확인 <span class="text-danger">*</span></label>
                                        <input class="form-control" type="password" id="passwordConfirm" 
                                               placeholder="비밀번호를 다시 입력하세요" required>
                                        <small id="passwordFeedback" class="form-text"></small>
                                    </div>
                                </div>

                                <!-- 이름 -->
                                <div class="col-lg-6 col-12">
                                    <div class="form-group">
                                        <label for="name">이름 <span class="text-danger">*</span></label>
                                        <input class="form-control" type="text" id="name" name="name" 
                                               placeholder="홍길동" required>
                                    </div>
                                </div>

                                <!-- 전화번호 -->
                                <div class="col-lg-6 col-12">
                                    <div class="form-group">
                                        <label for="phone">전화번호 <span class="text-danger">*</span></label>
                                        <input class="form-control" type="tel" id="phone" name="phone" 
                                               placeholder="01012345678" pattern="[0-9]{10,11}" required>
                                        <small class="form-text text-muted">숫자만 입력 (010-1234-5678 → 01012345678)</small>
                                    </div>
                                </div>

                                <!-- 생년월일 -->
                                <div class="col-lg-6 col-12">
                                    <div class="form-group">
                                        <label for="birthDate">생년월일</label>
                                        <input class="form-control" type="date" id="birthDate" name="birthDate">
                                    </div>
                                </div>

                                <div class="col-12">
                                    <h6 class="mt-4 mb-3">기본 배송지</h6>
                                </div>

                                <!-- 우편번호 -->
                                <div class="col-lg-4 col-12">
                                    <div class="form-group">
                                        <label for="zipCode">우편번호</label>
                                        <div class="input-group">
                                            <input class="form-control" type="text" id="zipCode" name="zipCode" 
                                                   placeholder="우편번호" readonly>
                                            <button type="button" class="btn btn-outline-primary" 
                                                    id="searchAddressBtn">검색</button>
                                        </div>
                                    </div>
                                </div>

                                <!-- 기본 주소 -->
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="address">기본 주소</label>
                                        <input class="form-control" type="text" id="address" name="address" 
                                               placeholder="기본 주소" readonly>
                                    </div>
                                </div>

                                <!-- 상세 주소 -->
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="addressDetail">상세 주소</label>
                                        <input class="form-control" type="text" id="addressDetail" name="addressDetail" 
                                               placeholder="상세 주소 (예: 101동 1001호)">
                                    </div>
                                </div>

                                <div class="col-12">
                                    <h6 class="mt-4 mb-3">약관 동의</h6>
                                </div>

                                <!-- 전체 동의 -->
                                <div class="col-12">
                                    <div class="form-check mb-3">
                                        <input type="checkbox" class="form-check-input" id="agreeAll">
                                        <label class="form-check-label fw-bold" for="agreeAll">
                                            전체 동의
                                        </label>
                                    </div>
                                </div>

                                <!-- 필수 약관 -->
                                <div class="col-12">
                                    <div class="form-check mb-2">
                                        <input type="checkbox" class="form-check-input required-check" 
                                               id="agreeTerms" name="agreeTerms" required>
                                        <label class="form-check-label" for="agreeTerms">
                                            [필수] 이용약관 동의
                                            <a href="${pageContext.request.contextPath}/terms" target="_blank" 
                                               class="text-primary">(보기)</a>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <div class="form-check mb-2">
                                        <input type="checkbox" class="form-check-input required-check" 
                                               id="agreePrivacy" name="agreePrivacy" required>
                                        <label class="form-check-label" for="agreePrivacy">
                                            [필수] 개인정보 처리방침 동의
                                            <a href="${pageContext.request.contextPath}/privacy" target="_blank" 
                                               class="text-primary">(보기)</a>
                                        </label>
                                    </div>
                                </div>

                                <!-- 선택 약관 -->
                                <div class="col-12">
                                    <div class="form-check mb-2">
                                        <input type="checkbox" class="form-check-input" 
                                               id="agreeMarketing" name="agreeMarketing">
                                        <label class="form-check-label" for="agreeMarketing">
                                            [선택] 마케팅 정보 수신 동의 (이메일, SMS)
                                        </label>
                                    </div>
                                </div>

                                <!-- 제출 버튼 -->
                                <div class="col-12 mt-4">
                                    <div class="button">
                                        <button class="btn w-100" type="submit" id="submitBtn">회원가입</button>
                                    </div>
                                </div>

                                <!-- 로그인 링크 -->
                                <div class="col-12">
                                    <p class="outer-link text-center mt-3">
                                        이미 계정이 있으신가요? 
                                        <a href="${pageContext.request.contextPath}/user/login">로그인</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- End Account Register Area -->

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

        // 이메일 중복 확인
        let emailChecked = false;
        document.getElementById('checkEmailBtn').addEventListener('click', function() {
            const email = document.getElementById('email').value;
            const feedback = document.getElementById('emailFeedback');
            
            if (!email) {
                feedback.className = 'form-text text-danger';
                feedback.textContent = '이메일을 입력해주세요.';
                return;
            }

            // AJAX 요청
            fetch('${pageContext.request.contextPath}/user/checkEmail?email=' + encodeURIComponent(email))
                .then(response => response.json())
                .then(data => {
                    if (data.available) {
                        feedback.className = 'form-text text-success';
                        feedback.textContent = '사용 가능한 이메일입니다.';
                        emailChecked = true;
                    } else {
                        feedback.className = 'form-text text-danger';
                        feedback.textContent = '이미 사용 중인 이메일입니다.';
                        emailChecked = false;
                    }
                })
                .catch(error => {
                    feedback.className = 'form-text text-danger';
                    feedback.textContent = '이메일 확인 중 오류가 발생했습니다.';
                    emailChecked = false;
                });
        });

        // 이메일 변경 시 중복확인 초기화
        document.getElementById('email').addEventListener('input', function() {
            emailChecked = false;
            document.getElementById('emailFeedback').textContent = '';
        });

        // 비밀번호 일치 확인
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

        // 주소 검색
        document.getElementById('searchAddressBtn').addEventListener('click', function() {
            new daum.Postcode({
                oncomplete: function(data) {
                    document.getElementById('zipCode').value = data.zonecode;
                    document.getElementById('address').value = data.address;
                    document.getElementById('addressDetail').focus();
                }
            }).open();
        });

        // 전체 동의
        document.getElementById('agreeAll').addEventListener('change', function() {
            const checkboxes = document.querySelectorAll('.form-check-input:not(#agreeAll)');
            checkboxes.forEach(checkbox => {
                checkbox.checked = this.checked;
            });
        });

        // 개별 체크박스 변경 시 전체 동의 체크 해제
        document.querySelectorAll('.form-check-input:not(#agreeAll)').forEach(checkbox => {
            checkbox.addEventListener('change', function() {
                const allChecked = Array.from(document.querySelectorAll('.required-check'))
                    .every(cb => cb.checked);
                document.getElementById('agreeAll').checked = allChecked;
            });
        });

        // 폼 제출
        document.getElementById('registerForm').addEventListener('submit', function(e) {
            // 이메일 중복 확인 검증
            if (!emailChecked) {
                e.preventDefault();
                alert('이메일 중복 확인을 해주세요.');
                return false;
            }

            // 비밀번호 일치 검증
            const password = document.getElementById('password').value;
            const passwordConfirm = document.getElementById('passwordConfirm').value;
            
            if (password !== passwordConfirm) {
                e.preventDefault();
                alert('비밀번호가 일치하지 않습니다.');
                return false;
            }

            // 비밀번호 강도 검증
            const passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
            if (!passwordRegex.test(password)) {
                e.preventDefault();
                alert('비밀번호는 8자 이상, 영문/숫자/특수문자를 포함해야 합니다.');
                return false;
            }

            // 필수 약관 동의 확인
            const agreeTerms = document.getElementById('agreeTerms').checked;
            const agreePrivacy = document.getElementById('agreePrivacy').checked;
            
            if (!agreeTerms || !agreePrivacy) {
                e.preventDefault();
                alert('필수 약관에 동의해주세요.');
                return false;
            }

            return true;
        });
    </script>
</body>
</html>
