<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            background: white;
        }
        
        .qna-header {
            padding: 20px;
            background: #f8f9fa;
            border-radius: 8px;
            margin-bottom: 20px;
        }
        
        .qna-meta {
            display: flex;
            gap: 15px;
            align-items: center;
            margin-bottom: 15px;
        }
        
        .badge {
            padding: 4px 12px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: 600;
        }
        
        .badge-category {
            background: #e3f2fd;
            color: #1976d2;
        }
        
        .badge-status {
            background: #fff3e0;
            color: #f57c00;
        }
        
        .badge-private {
            background: #fce4ec;
            color: #c2185b;
        }
        
        .qna-title {
            font-size: 18px;
            font-weight: 600;
            color: #333;
            margin-bottom: 10px;
        }
        
        .qna-info {
            display: flex;
            gap: 20px;
            font-size: 13px;
            color: #666;
        }
        
        .qna-content {
            padding: 30px 20px;
            line-height: 1.8;
            font-size: 14px;
            color: #333;
            border-bottom: 1px solid #e0e0e0;
        }
        
        .answer-section {
            margin-top: 30px;
        }
        
        .answer-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 15px 20px;
            background: #e8f5e9;
            border-radius: 8px 8px 0 0;
        }
        
        .answer-header h3 {
            font-size: 16px;
            font-weight: 600;
            color: #2e7d32;
            margin: 0;
        }
        
        .answer-empty {
            padding: 40px 20px;
            text-align: center;
            background: #fafafa;
            border: 1px solid #e0e0e0;
            border-radius: 0 0 8px 8px;
        }
        
        .answer-empty-text {
            font-size: 14px;
            color: #999;
            line-height: 1.6;
        }
        
        .answer-content {
            padding: 30px 20px;
            background: #fafafa;
            border: 1px solid #e0e0e0;
            border-top: none;
            border-radius: 0 0 8px 8px;
        }
        
        .answer-text {
            font-size: 14px;
            color: #333;
            line-height: 1.8;
            margin-bottom: 15px;
        }
        
        .answer-info {
            display: flex;
            gap: 15px;
            font-size: 12px;
            color: #666;
            padding-top: 15px;
            border-top: 1px solid #e0e0e0;
        }
        
        /* 답변 작성 폼 스타일 */
        .answer-form {
            padding: 20px;
            background: #f8f9fa;
            border: 1px solid #e0e0e0;
            border-top: none;
            border-radius: 0 0 8px 8px;
        }
        
        .form-group {
            margin-bottom: 15px;
        }
        
        .form-label {
            display: block;
            font-size: 14px;
            font-weight: 600;
            color: #333;
            margin-bottom: 8px;
        }
        
        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            font-family: 'Malgun Gothic', sans-serif;
            transition: border-color 0.3s;
        }
        
        .form-control:focus {
            outline: none;
            border-color: #5c6bc0;
        }
        
        .form-control.textarea {
            min-height: 150px;
            resize: vertical;
        }
        
        .char-count {
            text-align: right;
            font-size: 12px;
            color: #999;
            margin-top: 5px;
        }
        
        .btn-group {
            display: flex;
            gap: 10px;
            justify-content: flex-end;
            margin-top: 15px;
        }
        
        .btn {
            padding: 10px 30px;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .btn-submit {
            background: #2e7d32;
            color: white;
        }
        
        .btn-submit:hover {
            background: #1b5e20;
        }
        
        .btn-cancel {
            background: #6c757d;
            color: white;
        }
        
        .btn-cancel:hover {
            background: #5a6268;
        }
        
        .btn-edit {
            background: #1976d2;
            color: white;
        }
        
        .btn-edit:hover {
            background: #1565c0;
        }
        
        .btn-delete {
            background: #d32f2f;
            color: white;
        }
        
        .btn-delete:hover {
            background: #c62828;
        }
        
        .action-buttons {
            display: flex;
            gap: 10px;
            justify-content: center;
            padding: 30px 20px 0;
            border-top: 1px solid #e0e0e0;
            margin-top: 30px;
        }
        
        .admin-notice {
            background: #fff3cd;
            border: 1px solid #ffc107;
            border-radius: 4px;
            padding: 12px 15px;
            margin-bottom: 15px;
            font-size: 13px;
            color: #856404;
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
                    <div class="sidebar-subtitle">${mem.mem_name}님 환영합니다</div>
                    
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
                    
                    <div class="qna-detail">
                        <!-- Q&A 헤더 -->
                        <div class="qna-header">
                            <div class="qna-meta">
                                <span class="badge badge-category">교환/반품</span>
                                <span class="badge badge-status">답변대기</span>
                                <span class="badge badge-private">비공개</span>
                            </div>
                            <h1 class="qna-title">파운데이션 색상이 저랑 안맞네요 교환 해주세요</h1>
                            <div class="qna-info">
                                <span>👤 구창본</span>
                                <span>📅 2025-11-14 14:34</span>
                            </div>
                        </div>
                        
                        <!-- Q&A 내용 -->
                        <div class="qna-content">
                            교환 해주라고
                        </div>
                        
                        <!-- 답변 섹션 -->
                        <div class="answer-section">
                            <div class="answer-header">
                                <h3>💬 답변</h3>
                            </div>
                            
                            <!-- 답변이 없을 때 -->
                            <c:if test="${empty qna.answer}">
                                <div class="answer-empty">
                                    <p class="answer-empty-text">
                                        아직 답변이 등록되지 않았습니다.<br>
                                        빠른 시일 내에 답변 드리겠습니다.
                                    </p>
                                </div>
                                
                                <!-- 관리자 답변 작성 폼 -->
                                <c:if test="${user.mem_roll == 'admin'}">
                                    <form class="answer-form" method="post" action="${pageContext.request.contextPath}/qna/answer">
                                        <div class="admin-notice">
                                            ℹ️ 관리자 권한으로 답변을 작성할 수 있습니다.
                                        </div>
                                        
                                        <input type="hidden" name="qna_idx" value="${qna.qna_idx}">
                                        
                                        <div class="form-group">
                                            <label class="form-label">답변 내용</label>
                                            <textarea class="form-control textarea" name="qna_answer_content"
                                                      placeholder="고객님께 답변할 내용을 작성해주세요." required maxlength="2000"
                                                      oninput="updateCharCount(this)"></textarea>
                                            <div class="char-count">
                                                <span id="charCount">0</span> / 2000
                                            </div>
                                        </div>
                                        
                                        <div class="btn-group">
                                            <button type="submit" class="btn btn-submit">답변 등록</button>
                                            <button type="button" class="btn btn-cancel" onclick="history.back()">취소</button>
                                        </div>
                                    </form>
                                </c:if>
                            </c:if>
                            
                            <!-- 답변이 있을 때 -->
                            <c:if test="${not empty qna.answer}">
                                <div class="answer-content">
                                    <div class="answer-text">
                                        ${qna.answer.answer_content}
                                    </div>
                                    <div class="answer-info">
                                        <span>👤 관리자</span>
                                        <span>📅 ${qna.answer.answer_date}</span>
                                    </div>
                                    
                                    <!-- 관리자 답변 수정/삭제 버튼 -->
                                    <c:if test="${user.mem_roll == 'admin'}">
                                        <div class="btn-group" style="margin-top: 15px; padding-top: 15px; border-top: 1px solid #e0e0e0;">
                                            <button type="button" class="btn btn-edit" onclick="editAnswer()">답변 수정</button>
                                            <button type="button" class="btn btn-delete" onclick="deleteAnswer()">답변 삭제</button>
                                        </div>
                                    </c:if>
                                </div>
                            </c:if>
                        </div>
                        
                        <!-- 하단 버튼 -->
                        <div class="action-buttons">
                            <button type="button" class="btn btn-list" onclick="location.href='${pageContext.request.contextPath}/qna/list'">목록으로</button>
                            <c:if test="${user.mem_idx == qna.mem_idx}">
                                <button type="button" class="btn btn-edit" onclick="location.href='${pageContext.request.contextPath}/qna/edit?qna_idx=${qna.qna_idx}'">수정</button>
                                <button type="button" class="btn btn-delete" onclick="deleteQna()">삭제</button>
                            </c:if>
                        </div>
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
        function updateCharCount(textarea) {
            const count = textarea.value.length;
            document.getElementById('charCount').textContent = count;
        }
        
        function deleteQna() {
            if(confirm('정말 삭제하시겠습니까?')) {
                location.href = '${pageContext.request.contextPath}/qna/delete?qna_idx=${qna.qna_idx}';
            }
        }
        
        function editAnswer() {
            if(confirm('답변을 수정하시겠습니까?')) {
                // 답변 수정 페이지로 이동 또는 수정 폼 표시
                location.href = '${pageContext.request.contextPath}/qna/answer/edit?qna_idx=${qna.qna_idx}';
            }
        }
        
        function deleteAnswer() {
            if(confirm('답변을 삭제하시겠습니까?')) {
                location.href = '${pageContext.request.contextPath}/qna/answer/delete?qna_idx=${qna.qna_idx}';
            }
        }
    </script>

    <!-- Start Footer Area -->
    <c:import url="../common/footer.jsp" />
    <!-- End Footer Area -->
</body>
</html>