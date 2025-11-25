<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>비밀번호 확인 - OneTouch</title>
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
        .password-section {
            padding: 0;
            background-color: #fff;
            min-height: calc(100vh - 400px);
        }
        
        .password-container {
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
            color: #5c6bc0;
            font-weight: 600;
        }
        
        .password-detail {
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            overflow: hidden;
            max-width: 600px;
            margin-left: 150px;
        }
        
        .password-header {
            background: #f8f9fa;
            padding: 30px 20px;
            border-bottom: 1px solid #e0e0e0;
            text-align: center;
        }
        
        .password-icon {
            font-size: 48px;
            margin-bottom: 15px;
        }
        
        .password-title {
            font-size: 20px;
            font-weight: 600;
            color: #333;
            margin-bottom: 10px;
        }
        
        .password-description {
            font-size: 14px;
            color: #666;
            line-height: 1.6;
        }
        
        .password-content {
            padding: 30px 20px;
            background: white;
        }
        
        .form-group {
            margin-bottom: 20px;
            margin-left: 175px;
        }
        
        .form-label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-size: 14px;
            font-weight: 600;
            margin-left: 65px;
        }
        
        .form-input {
            width: 200px;
            padding: 12px 15px;
            border: 1px solid #e0e0e0;
            border-radius: 4px;
            font-size: 14px;
            font-family: inherit;
            text-align: center;
           
        }
        
        .form-input:focus {
            outline: none;
            border-color: #5c6bc0;
            box-shadow: 0 0 0 3px rgba(92, 107, 192, 0.1);
        }
        
        .password-info {
            background: #f0f4ff;
            border-left: 3px solid #5c6bc0;
            padding: 15px;
            border-radius: 4px;
            font-size: 13px;
            color: #333;
            margin-bottom: 25px;
            line-height: 1.6;
            text-align: center;
        }
        
        .password-info i {
            color: #5c6bc0;
            margin-right: 8px;
        }
        
        .btn-group {
            display: flex;
            gap: 10px;
            justify-content: center;
            margin-top: 25px;
            margin-left: 213px;
        }
        
        .btn {
            padding: 12px 30px;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.3s;
            font-weight: 600;
        }
        
        .btn-cancel {
             background: #dc3545 !important;
    color: white;
    padding: 4px 12px;
    border: none;
    border-radius: 4px;
    font-size: 12px;
    cursor: pointer;
    margin-left: auto;
    transition: background 0.3s;
        }
        
        .btn-cancel:hover {
            background: #f5f5f5;
            border-color: #999;
        }
        
        .btn-submit {
            background: #5c6bc0 !important;
            color: white;
        }
        
        .btn-submit:hover {
            background: #4a5aaf;
        }
        
        .error-message {
            color: #dc3545;
            font-size: 13px;
            margin-top: 5px;
            display: none;
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
    <c:import url="../common/header.jsp" />
    <!-- End Header Area -->

    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">비밀번호 확인</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="${pageContext.request.contextPath}/"><i class="lni lni-home"></i> 홈</a></li>
                        <li>마이페이지</li>
                        <li>비밀번호 확인</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    <!-- Start Password Section -->
    <section class="password-section">
        <div class="container">
            <div class="password-container">
            
                <!-- 사이드바 인크루드 -->
                <%@include file="/WEB-INF/views/common/mypage_side_bar.jsp" %>
                
                <div class="content">
                    <div class="content-header">
                        <h2> 비밀번호 확인</h2>
                    </div>
                    
                    <!-- 비밀번호 확인 폼 -->
                    <div class="password-detail">
                        <div class="password-header">
                            <div class="password-icon">🔐</div>
                            <div class="password-title">보안 확인</div>
                            <div class="password-description">
                                개인정보 보호를 위해 비밀번호를 다시 한번 확인하겠습니다.
                            </div>
                        </div>
                        
                        <div class="password-content">
                            <div class="password-info">
                                <i class="lni lni-info"></i>
                                현재 계정의 비밀번호를 입력하여 본인확인을 완료하세요.
                            </div>
                            
                            <form action="/user/user_modify" method="post" id="passwordForm">
                                <div class="form-group">
                                    <label class="form-label">비밀번호</label>
                                    <input type="password" 
                                           class="form-input" 
                                           name="password" 
                                           placeholder="비밀번호를 입력하세요"
                                           autofocus
                                           required>
                                    <div class="error-message" id="errorMsg"></div>
                                </div>
                                
                                <div class="btn-group">
                                    <button type="button" class="btn btn-cancel" onclick="goBack();">취소</button>
                                    <button type="button" class="btn btn-submit" onclick="validatePassword(this.form);">확인</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Password Section -->

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
        // 비밀번호 검증
        function validatePassword(f) {
            const password = document.querySelector('input[name="password"]').value;
            const errorMsg = document.getElementById('errorMsg');
            
            if (password === '') {
                errorMsg.textContent = '비밀번호를 입력해주세요.';
                errorMsg.style.display = 'block';
                document.querySelector('input[name="password"]').focus();
                return false;
            }
            
            if (password.length < 1) {
                errorMsg.textContent = '비밀번호는 8자 이상이어야 합니다.';
                errorMsg.style.display = 'block';
                document.querySelector('input[name="password"]').focus();
                return false;
            }
            
            $.ajax({
            	url:"/user/check_password"
            	,type:"post"
            	,data:{"password":password}
            	,success:function(d){
            		alert("비번체크:"+d.checkPassword);
            		if(d.checkPassword==false){
                        errorMsg.textContent = '비밀번호가 틀렸습니다.';
                        errorMsg.style.display = 'block';
                        document.querySelector('input[name="password"]').focus();
                        return;
            		}
            		if(d.checkPassword==true){
			            alert("보내기");
			            errorMsg.style.display = 'none';
			            f.submit();
            		}
            	}
            	,error:function(e){
            		alert("비밀번호체크 실패 \n관리자에게 문의");
            	}
            });
            
        }
        
        // 뒤로가기
        function goBack() {
            if (confirm('비밀번호 확인을 취소하시겠습니까?')) {
                history.back();
            }
        }
        
        // 엔터키로 제출
        document.querySelector('input[name="password"]').addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                if (validatePassword()) {
                    document.getElementById('passwordForm').submit();
                }
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
    <%@include file="/WEB-INF/views/common/footer.jsp" %>

    <!-- End Footer Area -->
</body>
</html>