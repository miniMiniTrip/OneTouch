<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>마이페이지 - OneTouch</title>
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
/* ==================== 전체 레이아웃 ==================== */
.mypage-section {
    padding: 0;
    background-color: #fff;
    min-height: calc(100vh - 400px);
}

.mypage-container {
    display: flex;
    max-width: 100%;
    margin: 0;
    background: transparent;
    border-radius: 0;
    overflow: visible;
    box-shadow: none;
}

/* ==================== 사이드바 스타일 ==================== */
.sidebar {
    width: 250px;
    background: #fafafa;
    border-right: 1px solid #e0e0e0;
    padding: 30px 0;
    min-height: calc(100vh - 400px);
}

.sidebar-header {
    padding: 15px 30px;
    font-size: 18px;
    font-weight: 700;
    color: #333;
}

.sidebar-subtitle {
    padding: 5px 30px 20px;
    font-size: 13px;
    color: #999;
}

.menu-section {
    margin: 25px 0;
}

.menu-title {
    padding: 10px 30px;
    font-size: 12px;
    color: #999;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

.menu-item {
    padding: 14px 30px;
    font-size: 14px;
    color: #333;
    cursor: pointer;
    display: flex;
    align-items: center;
    transition: all 0.3s;
    border-left: 3px solid transparent;
    text-decoration: none;
}

.menu-item:hover {
    background: #f0f0f0;
    padding-left: 35px;
    color: #333;
}

.menu-item.active {
    background: #e8eaf6;
    color: #5c6bc0;
    font-weight: 600;
    border-left: 3px solid #5c6bc0;
}

/* ==================== 컨텐츠 영역 ==================== */
.content {
    flex: 1;
    padding: 50px 60px;
    background: #fff;
}

.content-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 40px;
    padding-bottom: 20px;
    border-bottom: 2px solid #5c6bc0;
}

.content-header h2 {
    font-size: 24px;
    color: #333;
    font-weight: 700;
    margin: 0;
}

/* ==================== 빈 상태 (공통) ==================== */
.empty-state {
    text-align: center;
    padding: 100px 20px;
    background: #fff;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.05);
}

.empty-state i {
    font-size: 80px;
    color: #dee2e6;
    margin-bottom: 20px;
}

.empty-state h4 {
    font-size: 20px;
    font-weight: 600;
    color: #495057;
    margin-bottom: 10px;
}

.empty-state p {
    color: #6c757d;
    font-size: 14px;
    margin-bottom: 30px;
}

.empty-state .btn {
    background: #5c6bc0;
    color: white;
    padding: 12px 28px;
    border: none;
    border-radius: 6px;
    font-size: 14px;
    font-weight: 600;
    transition: all 0.3s;
}

.empty-state .btn:hover {
    background: #4a5aaf;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(92, 107, 192, 0.3);
}

/* ==================== 공통 버튼 스타일 ==================== */
.btn-primary-custom {
    background: #5c6bc0;
    color: white;
    padding: 12px 28px;
    border: none;
    border-radius: 6px;
    font-size: 14px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s;
}

.btn-primary-custom:hover {
    background: #4a5aaf;
    color: white;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(92, 107, 192, 0.3);
}

/* ==================== 공통 테이블 스타일 ==================== */
.common-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
    background: #fff;
}

.common-table thead {
    background: #f8f9fa;
    border-top: 2px solid #5c6bc0;
    border-bottom: 2px solid #e0e0e0;
}

.common-table th {
    padding: 18px 15px;
    font-size: 14px;
    font-weight: 600;
    color: #333;
    text-align: center;
}

.common-table tbody tr {
    border-bottom: 1px solid #e0e0e0;
    transition: all 0.2s;
}

.common-table tbody tr:hover {
    background: #f8f9fa;
}

.common-table td {
    padding: 18px 15px;
    font-size: 14px;
    color: #666;
    text-align: center;
    vertical-align: middle;
}

/* ==================== 공통 카드 스타일 ==================== */
.content-card {
    background: #fff;
    border-radius: 8px;
    padding: 30px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.05);
    margin-bottom: 20px;
}

.content-card h3 {
    font-size: 18px;
    font-weight: 600;
    color: #333;
    margin-bottom: 20px;
    padding-bottom: 15px;
    border-bottom: 2px solid #f0f0f0;
}

/* ==================== 반응형 ==================== */
@media (max-width: 1200px) {
    .content {
        padding: 40px 40px;
    }
}

@media (max-width: 992px) {
    .mypage-container {
        flex-direction: column;
    }
    
    .sidebar {
        width: 100%;
        border-right: none;
        border-bottom: 1px solid #e0e0e0;
        min-height: auto;
    }
    
    .content {
        padding: 30px 20px;
    }
}

@media (max-width: 768px) {
    .content-header {
        flex-direction: column;
        align-items: flex-start;
        gap: 15px;
    }
    
    .content-header h2 {
        font-size: 20px;
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
    <c:import url="../common/header.jsp" />
    <!-- End Header Area -->

    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">마이페이지</h1>
                        <!-- 페이지별로 제목 변경: 장바구니, 찜, 주문/배송 조회, 상품Q&A, 회원정보 수정 등 -->
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="${pageContext.request.contextPath}/"><i class="lni lni-home"></i> 홈</a></li>
                        <li>마이페이지</li>
                        <li>페이지명</li>
                        <!-- 페이지별로 마지막 breadcrumb 변경 -->
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    <!-- Start Mypage Section -->
    <section class="mypage-section">
        <div class="container">
            <div class="mypage-container">
                
                <!-- ==================== Sidebar ==================== -->
                <div class="sidebar">
                    <div class="sidebar-header">마이페이지</div>
                    <div class="sidebar-subtitle">${sessionScope.mem_name}님 환영합니다</div>
                    
                    <!-- 
                    ============================================================
                    📌 사이드바 메뉴 링크 설정 가이드
                    ============================================================
                    각 메뉴 항목의 active 클래스를 현재 페이지에 맞게 설정하세요.
                    예: 장바구니 페이지라면 장바구니 메뉴에 "menu-item active" 클래스 사용
                    
                    ⚠️ 주의: mem_idx는 세션에서 자동으로 가져옵니다.
                    ${sessionScope.mem_idx} 또는 ${sessionScope.mem_name} 사용
                    ============================================================
                    -->
                    
                    <!-- 쇼핑 메뉴 -->
                    <div class="menu-section">
                        <!-- 장바구니: /cart/list.do -->
                        <a href="${pageContext.request.contextPath}/cart/list.do?mem_idx=${sessionScope.mem_idx}" 
                           class="menu-item">
                            🛒 장바구니
                        </a>
                        
                        <!-- 찜 목록: /wishlist/list.do -->
                        <a href="${pageContext.request.contextPath}/wishlist/list.do?mem_idx=${sessionScope.mem_idx}" 
                           class="menu-item">
                            💝 찜
                        </a>
                        
                        <!-- 주문/배송 조회: /order/list.do -->
                        <a href="${pageContext.request.contextPath}/order/list.do?mem_idx=${sessionScope.mem_idx}" 
                           class="menu-item">
                            🎯 주문/배송 조회
                        </a>
                    </div>
                    
                    <!-- 나의 활동 -->
                    <div class="menu-section">
                        <div class="menu-title">나의 활동</div>
                        
                        <!-- 상품 Q&A: /qna/list.do -->
                        <a href="${pageContext.request.contextPath}/qna/list.do?mem_idx=${sessionScope.mem_idx}" 
                           class="menu-item">
                            💬 상품 Q&A
                        </a>
                        
                        <!-- 상품 리뷰: /review/list.do (선택사항) -->
                        <!-- 
                        <a href="${pageContext.request.contextPath}/review/list.do?mem_idx=${sessionScope.mem_idx}" 
                           class="menu-item">
                            ⭐ 상품 리뷰
                        </a>
                        -->
                    </div>
                    
                    <!-- 회원 정보 -->
                    <div class="menu-section">
                        <div class="menu-title">회원 정보</div>
                        
                        <!-- 회원정보 수정: /member/modify.do -->
                        <a href="${pageContext.request.contextPath}/member/modify.do" 
                           class="menu-item">
                            👥 회원정보 수정
                        </a>
                        
                        <!-- 배송지 관리: /member/address.do -->
                        <a href="${pageContext.request.contextPath}/member/address.do" 
                           class="menu-item">
                            🔒 배송지 관리
                        </a>
                        
                        <!-- 알림톡신청 관리: /member/notification.do -->
                        <a href="${pageContext.request.contextPath}/member/notification.do" 
                           class="menu-item">
                            📧 알림톡신청 관리
                        </a>
                    </div>
                    
                    <!-- 로그아웃 -->
                    <div class="menu-section">
                        <!-- 로그아웃: /member/logout.do -->
                        <a href="${pageContext.request.contextPath}/member/logout.do" 
                           class="menu-item"
                           onclick="return confirm('로그아웃 하시겠습니까?');">
                            📝 로그아웃
                        </a>
                    </div>
                </div>
                
                <!-- ==================== Content ==================== -->
                <div class="content">
                    <!-- Content Header -->
                    <div class="content-header">
                        <h2>페이지 제목</h2>
                        <!-- 필요한 경우 버튼 추가 -->
                        <!-- 
                        <button class="btn-primary-custom" onclick="location.href='링크'">
                            버튼명
                        </button>
                        -->
                    </div>
                    
                    <!-- ==================== 여기부터 페이지별 컨텐츠 작성 ==================== -->
                    
                    <!-- 예시 1: 빈 상태 표시 -->
                    <!--
                    <div class="empty-state">
                        <i class="lni lni-cart"></i>
                        <h4>표시할 내용이 없습니다</h4>
                        <p>설명 문구를 여기에 작성하세요.</p>
                        <button class="btn" onclick="location.href='/product/list.do'">
                            버튼명
                        </button>
                    </div>
                    -->
                    
                    <!-- 예시 2: 테이블 형태 -->
                    <!--
                    <table class="common-table">
                        <thead>
                            <tr>
                                <th>컬럼1</th>
                                <th>컬럼2</th>
                                <th>컬럼3</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${list}">
                                <tr>
                                    <td>${item.field1}</td>
                                    <td>${item.field2}</td>
                                    <td>${item.field3}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    -->
                    
                    <!-- 예시 3: 카드 형태 -->
                    <!--
                    <div class="content-card">
                        <h3>카드 제목</h3>
                        <p>카드 내용을 여기에 작성합니다.</p>
                    </div>
                    -->
                    
                    <!-- 여기에 실제 페이지 내용을 작성하세요 -->
                    <div class="empty-state">
                        <i class="lni lni-files"></i>
                        <h4>컨텐츠를 추가하세요</h4>
                        <p>이 영역에 페이지별 내용을 작성하면 됩니다.</p>
                    </div>
                    
                    <!-- ==================== 컨텐츠 작성 끝 ==================== -->
                    
                </div>
            </div>
        </div>
    </section>
    <!-- End Mypage Section -->

    <!-- Start Footer Area -->
    <c:import url="../common/footer.jsp" />
    <!-- End Footer Area -->

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top">
        <i class="lni lni-chevron-up"></i>
    </a>

    <!-- ========================= JS here ========================= -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
    
    // ==================== 여기에 페이지별 JavaScript 작성 ====================
    
    // 현재 페이지 메뉴 활성화 (URL 기반)
    $(document).ready(function() {
        var currentPath = window.location.pathname;
        $('.menu-item').each(function() {
            var href = $(this).attr('href');
            if (href && currentPath.indexOf(href) !== -1) {
                $(this).addClass('active');
            }
        });
    });
    
    // 페이지별 추가 JavaScript 여기에 작성
    
    </script>
    
</body>
</html>
