<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>상품Q&A - OneTouch</title>
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
        .qna-section {
            padding: 60px 0;
            background-color: #f5f5f5;
        }
        
        .qna-container {
            display: flex;
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        
        .sidebar {
            width: 200px;
            background: #fafafa;
            border-right: 1px solid #e0e0e0;
            padding: 20px 0;
        }
        
        .sidebar-header {
            padding: 15px 20px;
            font-size: 16px;
            font-weight: 600;
            color: #333;
        }
        
        .sidebar-subtitle {
            padding: 5px 20px 15px;
            font-size: 12px;
            color: #999;
        }
        
        .menu-section {
            margin: 20px 0;
        }
        
        .menu-title {
            padding: 10px 20px;
            font-size: 13px;
            color: #666;
            font-weight: 600;
        }
        
        .menu-item {
            padding: 12px 20px;
            font-size: 14px;
            color: #333;
            cursor: pointer;
            display: flex;
            align-items: center;
            transition: background 0.2s;
        }
        
        .menu-item:hover {
            background: #f0f0f0;
        }
        
        .menu-item.active {
            background: #e8eaf6;
            color: #5c6bc0;
            font-weight: 600;
            border-left: 3px solid #5c6bc0;
        }
        
        .content {
            flex: 1;
            padding: 40px;
        }
        
        .content-header {
            display: flex;
            align-items: center;
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 2px solid #5c6bc0;
        }
        
        .content-header h2 {
            font-size: 18px;
            color: #5c6bc0;
            font-weight: 600;
        }
        
        .empty-state {
            text-align: center;
            padding: 80px 20px;
        }
        
        .empty-state-message {
            color: #666;
            margin-bottom: 30px;
            font-size: 14px;
        }
        
 .btn-write {
    background: #5c6bc0;
    color: white;
    padding: 12px 30px;
    border: none;
    border-radius: 4px;
    font-size: 14px;
    cursor: pointer;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    transition: background 0.3s;
    width: 180px;          /* 버튼 너비 고정 */
    height: 48px;          /* 버튼 높이 고정 */
    box-sizing: border-box;
    white-space: nowrap;   /* ✅ 두 줄로 안 나오게 설정 */
}

.btn-write:hover {
    background: #4a5aaf;
    color: white;
}

.btn-write::before {
    content: '✎';
    font-size: 16px;
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
                        <h1 class="page-title">상품 Q&A</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="${pageContext.request.contextPath}/"><i class="lni lni-home"></i> 홈</a></li>
                        <li>마이페이지</li>
                        <li>상품 Q&A</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    <!-- Start Q&A Section -->
    <section class="qna-section">
        <div class="container">
            <div class="qna-container">
                <div class="sidebar">
                    <div class="sidebar-header">마이페이지</div>
                    <div class="sidebar-subtitle">user01님 환영합니다</div>
                    
                    <div class="menu-section">
                        <div class="menu-item">📋 쇼핑</div>
                        <div class="menu-item">👤 정보/구니</div>
                        <div class="menu-item">💝 팀</div>
                        <div class="menu-item">🎯 주문/배송 조회</div>
                    </div>
                    
                    <div class="menu-section">
                        <div class="menu-title">나의 활동</div>
                        <div class="menu-item active">💬 상품 Q&A</div>
                    </div>
                    
                    <div class="menu-section">
                        <div class="menu-title">문의 정보</div>
                        <div class="menu-item">👥 회원정보 수정</div>
                        <div class="menu-item">🔒 배송지 관리</div>
                        <div class="menu-item">📧 알림톡신청 관리</div>
                    </div>
                    
                    <div class="menu-section">
                        <div class="menu-item">📝 로그아웃</div>
                    </div>
                </div>
                
                
                
              <%--   <!-- 데이터가 없는경우 -->
		    <c:if test="${ empty qna_list }">
		      <tr>
		         <td colspan="5" align="center">
		            <font color="red">등록된  QnA가 없습니다</font>
		         </td>
		      </tr>
		    </c:if>
		              --%>   
                
                <div class="content">
                    <div class="content-header">
                        <h2>💬 상품 Q&A</h2>
                    </div>
                    
                    <div class="empty-state">
                        <div class="empty-state-message">
                            작성하신 상품 문의 내역을 확인하실 수 있습니다.
                        </div>
                        <button class="btn-write" onclick="location.href='${pageContext.request.contextPath}/qna/write'">
                             Q&A 쓰기
                        </button>
                       <%--  <button class="btn-write" onclick="location.href='${pageContext.request.contextPath}/qna/write'">
                            Q&A쓰기
                        </button> --%>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Q&A Section -->

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top">
        <i class="lni lni-chevron-up"></i>
    </a>

    <!-- ========================= JS here ========================= -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/tiny-slider.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/glightbox.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

    <!-- Start Footer Area -->
    <c:import url="../common/footer.jsp" />
    <!-- End Footer Area -->
</body>
</html>