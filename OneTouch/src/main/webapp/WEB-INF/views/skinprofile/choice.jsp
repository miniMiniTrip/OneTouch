<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>피부 진단 - OneTouch</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/images/favicon.svg" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/LineIcons.3.0.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/tiny-slider.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/glightbox.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
    <style>
        .choice-card {
            border: 2px solid #e9ecef;
            border-radius: 10px;
            padding: 30px 20px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s;
            background: #fff;
            height: 100%;
        }
        .choice-card:hover {
            border-color: #081828;
            box-shadow: 0 10px 30px rgba(8, 24, 40, 0.1);
            transform: translateY(-5px);
        }
        .choice-icon {
            font-size: 48px;
            margin-bottom: 15px;
        }
        .choice-card h4 {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 10px;
            color: #081828;
        }
        .choice-card p {
            color: #6c757d;
            margin-bottom: 0;
            font-size: 14px;
        }
        .last-profile {
            margin-top: 12px;
            padding-top: 12px;
            border-top: 1px solid #e9ecef;
            color: #999;
            font-size: 13px;
        }
        .choice-section-title {
            margin-bottom: 30px;
            text-align: center;
        }
        .choice-section-title h4 {
            font-size: 22px;
            font-weight: 600;
            margin-bottom: 10px;
            color: #081828;
        }
        .choice-section-title p {
            color: #6c757d;
            margin-bottom: 0;
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

    <!-- Header -->
    <%@include file="../common/header.jsp" %>
    
    <!-- Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">피부 진단</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="${pageContext.request.contextPath}/"><i class="lni lni-home"></i> Home</a></li>
                        <li><a href="${pageContext.request.contextPath}/mypage/main">마이페이지</a></li>
                        <li>피부 진단</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- Dashboard Section with Sidebar -->
    <section class="dashboard section">
        <div class="container">
            <div class="row">
                <!-- Sidebar -->
                <%@include file="../common/mypage_side_bar.jsp" %>
                
                <!-- Main Content -->
                <div class="col-lg-9 col-md-8 col-12">
                    <div class="main-content">
                        <div class="choice-section-title">
                            <h4>피부 진단 선택</h4>
                            <p>이전에 진행하신 피부 진단이 있습니다.</p>
                        </div>
                        
                        <div class="row justify-content-center">
                            <!-- 기존 진단 보기 -->
                            <div class="col-lg-5 col-md-6 col-12 mb-4">
                                <div class="choice-card" onclick="location.href='${pageContext.request.contextPath}/mypage/skinprofile'">
                                    <div class="choice-icon">📋</div>
                                    <h4>기존 진단 결과 보기</h4>
                                    <p>저장된 피부 진단 결과를 확인합니다</p>
                                    <div class="last-profile">
                                        마지막 진단: <fmt:formatDate value="${skinProfile.sp_update}" pattern="yyyy-MM-dd HH:mm"/>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- 새로운 진단 시작 -->
                            <div class="col-lg-5 col-md-6 col-12 mb-4">
                                <div class="choice-card" onclick="startNewProfile()">
                                    <div class="choice-icon">✨</div>
                                    <h4>새로운 진단 시작</h4>
                                    <p>피부 상태가 변경되었다면<br>다시 진단해보세요</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <%@include file="../common/footer.jsp" %>

    <a href="#" class="scroll-top">
        <i class="lni lni-chevron-up"></i>
    </a>

    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/tiny-slider.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/glightbox.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
    
    <script type="text/javascript">
    // 프리로더 제거
    window.addEventListener('load', function() {
        const preloader = document.querySelector('.preloader');
        if (preloader) {
            preloader.style.opacity = '0';
            setTimeout(() => preloader.style.display = 'none', 500);
        }
    });
    
    function startNewProfile() {
        if(confirm('새로운 진단을 시작하시겠습니까?\n기존 진단 결과는 덮어쓰여집니다.')) {
            location.href = '${pageContext.request.contextPath}/skinprofile/form?renew=true';
        }
    }
    </script>
</body>
</html>
