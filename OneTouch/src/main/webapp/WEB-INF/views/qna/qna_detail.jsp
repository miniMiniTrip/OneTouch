<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Q&A 상세보기 - OneTouch</title>
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
        
        .btn-list {
            background: #666;
            color: white;
            padding: 8px 20px;
            border: none;
            border-radius: 4px;
            font-size: 13px;
            cursor: pointer;
            transition: background 0.3s;
        }
        
        .btn-list:hover {
            background: #555;
        }
        
        .qna-detail {
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            overflow: hidden;
        }
        
        .qna-header {
            background: #f8f9fa;
            padding: 20px;
            border-bottom: 1px solid #e0e0e0;
        }
        
        .qna-status {
            display: inline-block;
            padding: 4px 12px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: 600;
            margin-bottom: 10px;
        }
        
        .qna-status.waiting {
            background: #fff3cd;
            color: #856404;
        }
        
        .qna-status.answered {
            background: #d4edda;
            color: #155724;
        }
        
        .qna-title {
            font-size: 18px;
            font-weight: 600;
            color: #333;
            margin-bottom: 12px;
        }
        
        .qna-meta {
            display: flex;
            gap: 20px;
            font-size: 13px;
            color: #666;
        }
        
        .qna-meta-item {
            display: flex;
            align-items: center;
            gap: 5px;
        }
        
        .qna-content {
            padding: 30px 20px;
            background: white;
            border-bottom: 1px solid #e0e0e0;
        }
        
        .qna-content-text {
            line-height: 1.8;
            color: #333;
            font-size: 14px;
            white-space: pre-wrap;
        }
        
        .qna-answer {
            padding: 30px 20px;
            background: #f8f9fa;
        }
        
        .answer-header {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 15px;
        }
        
        .answer-badge {
            background: #5c6bc0;
            color: white;
            padding: 6px 12px;
            border-radius: 4px;
            font-size: 13px;
            font-weight: 600;
        }
        
        .answer-date {
            font-size: 13px;
            color: #666;
        }
        
        .answer-content {
            background: white;
            padding: 20px;
            border-radius: 6px;
            border: 1px solid #e0e0e0;
            line-height: 1.8;
            color: #333;
            font-size: 14px;
            white-space: pre-wrap;
        }
        
        .no-answer {
            text-align: center;
            padding: 40px;
            color: #999;
            font-size: 14px;
        }
        
        .btn-group {
            display: flex;
            gap: 10px;
            justify-content: flex-end;
            margin-top: 20px;
            padding-top: 20px;
            border-top: 1px solid #e0e0e0;
        }
        
        .btn {
            padding: 10px 24px;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .btn-edit {
            background: #5c6bc0;
            color: white;
        }
        
        .btn-edit:hover {
            background: #4a5aaf;
        }
        
        .btn-delete {
            background: #dc3545;
            color: white;
        }
        
        .btn-delete:hover {
            background: #c82333;
        }
        
        .product-info {
            display: flex;
            align-items: center;
            gap: 15px;
            padding: 15px;
            background: #f8f9fa;
            border-radius: 6px;
            margin-bottom: 20px;
        }
        
        .product-image {
            width: 80px;
            height: 80px;
            background: #ddd;
            border-radius: 4px;
            object-fit: cover;
        }
        
        .product-details {
            flex: 1;
        }
        
        .product-name {
            font-size: 14px;
            font-weight: 600;
            color: #333;
            margin-bottom: 5px;
        }
        
        .product-price {
            font-size: 13px;
            color: #666;
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
                        <h1 class="page-title">Q&A 상세보기</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="${pageContext.request.contextPath}/"><i class="lni lni-home"></i> 홈</a></li>
                        <li>마이페이지</li>
                        <li>Q&A 상세보기</li>
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
                
                <div class="content">
                    <div class="content-header">
                        <h2>💬 상품 Q&A 상세보기</h2>
                        <button class="btn-list" onclick="location.href='${pageContext.request.contextPath}/qna/list'">목록으로</button>
                    </div>
                    
                    <!-- 상품 정보 -->
                    <div class="product-info">
                        <img src="https://via.placeholder.com/80" alt="상품 이미지" class="product-image">
                        <div class="product-details">
                            <div class="product-name">${qna.productName}</div>
                            <div class="product-price">₩ ${qna.productPrice}</div>
                        </div>
                    </div>
                    
                    <!-- Q&A 상세 -->
                    <div class="qna-detail">
                        <div class="qna-header">
                            <c:choose>
                                <c:when test="${qna.answerStatus eq 'Y'}">
                                    <span class="qna-status answered">답변완료</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="qna-status waiting">답변대기</span>
                                </c:otherwise>
                            </c:choose>
                            
                            <div class="qna-title">${qna.title}</div>
                            
                            <div class="qna-meta">
                                <div class="qna-meta-item">
                                    <span>👤</span>
                                    <span>${qna.writer}</span>
                                </div>
                                <div class="qna-meta-item">
                                    <span>📅</span>
                                    <span><fmt:formatDate value="${qna.createDate}" pattern="yyyy-MM-dd HH:mm" /></span>
                                </div>
                                <div class="qna-meta-item">
                                    <span>👁</span>
                                    <span>${qna.viewCount}</span>
                                </div>
                            </div>
                        </div>
                        
                        <div class="qna-content">
                            <div class="qna-content-text">${qna.content}</div>
                        </div>
                        
                        <!-- 답변 영역 -->
                        <div class="qna-answer">
                            <c:choose>
                                <c:when test="${not empty qna.answer}">
                                    <div class="answer-header">
                                        <span class="answer-badge">답변</span>
                                        <span class="answer-date">
                                            <fmt:formatDate value="${qna.answerDate}" pattern="yyyy-MM-dd HH:mm" />
                                        </span>
                                    </div>
                                    <div class="answer-content">${qna.answer}</div>
                                </c:when>
                                <c:otherwise>
                                    <div class="no-answer">
                                        아직 답변이 등록되지 않았습니다.<br>
                                        빠른 시일 내에 답변 드리겠습니다.
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    
                    <!-- 버튼 그룹 -->
                    <div class="btn-group">
                        <button class="btn btn-edit" onclick="location.href='${pageContext.request.contextPath}/qna/edit/${qna.id}'">수정</button>
                        <button class="btn btn-delete" onclick="confirmDelete()">삭제</button>
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
    
    <script>
        function confirmDelete() {
            if(confirm('정말 삭제하시겠습니까?')) {
                location.href = '${pageContext.request.contextPath}/qna/delete/${qna.id}';
            }
        }
    </script>

    <!-- Start Footer Area -->
    <c:import url="../common/footer.jsp" />
    <!-- End Footer Area -->
</body>
</html>