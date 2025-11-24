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
            border-top: 1px solid #e0e0e0 !important;
            
        }
        
        .btn {
            padding: 10px 24px;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.3s;
             color: white !important;
        }
        
        .btn-edit {
            background: #5c6bc0 !important;
            color: white;
        }
        
        .btn-edit:hover {
            background: #4a5aaf !important;
        }
        
        .btn-delete {
            background: #dc3545 !important;
            color: white;
        }
        
        .btn-delete:hover {
            background: #c82333 !important;
        }
        
        .category-badge {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 4px;
            font-size: 11px;
            font-weight: 600;
            margin-right: 8px;
        }
        
        .category-0 { background: #e3f2fd; color: #1976d2; }
        .category-1 { background: #fff3e0; color: #f57c00; }
        .category-2 { background: #fce4ec; color: #c2185b; }
        .category-3 { background: #f3e5f5; color: #7b1fa2; }
        .category-4 { background: #e8f5e9; color: #388e3c; }
        .category-5 { background: #ffebee; color: #d32f2f; }
    
    
    
   /* 관리자의 답변 부분. css */
    
    .answer-textarea {
    width: 100%;
    min-height: 200px;
    padding: 15px;
    border: 1px solid #e0e0e0;
    border-radius: 6px;
    font-size: 14px;
    line-height: 1.6;
    resize: vertical;
    margin-bottom: 15px;
    font-family: inherit;
}

.answer-textarea:focus {
    outline: none;
    border-color: #5c6bc0;
}

.file-upload-area {
    margin-bottom: 20px;
    padding: 15px;
    background: white;
    border: 1px dashed #e0e0e0;
    border-radius: 6px;
}

.file-upload-area label {
    display: block;
    margin-bottom: 8px;
    font-weight: 600;
    color: #333;
    font-size: 14px;
}

.file-upload-area input[type="file"] {
    width: 100%;
    padding: 8px;
    font-size: 13px;
}

.file-upload-area small {
    display: block;
    margin-top: 5px;
    color: #999;
    font-size: 12px;
}

.answer-btn-group {
    display: flex;
    gap: 10px;
    justify-content: flex-end;
}

.btn-submit {
    background: #5c6bc0 !important;
    color: white;
    padding: 10px 30px;
}

.btn-submit:hover {
    background: #4a5aaf;
}
 
 
/* end 관리자 답변 css */   
    
    /* 관리자 답변 삭제 .. 버튼 */
    .btn-delete-answer {
    background: #dc3545;
    color: white;
    padding: 4px 12px;
    border: none;
    border-radius: 4px;
    font-size: 12px;
    cursor: pointer;
    margin-left: auto;
    transition: background 0.3s;
}

.btn-delete-answer:hover {
    background: #c82333;
}
    </style>
    
    
    <script type="text/javascript">
   
    
    function confirmDeleteAnswer() {
        if(confirm('답변을 삭제하시겠습니까?')) {
            location.href = '${pageContext.request.contextPath}/qna/deleteAnswer?qna_idx=${qna.qna_idx}';
        }
        
        
        
    }
    
  /*   function checkEdit(isAnswered, qna_idx) {
        if(isAnswered) {
            alert('답변이 등록되면 수정할 수 없습니다.');
        } else {
            location.href = '${pageContext.request.contextPath}/qna/modify?qna_idx=' + qna_idx;
        }
    } */
    
    
    </script>
    
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
                    <div class="sidebar-subtitle">${user.mem_name}님 환영합니다</div>
                    
                    <div class="menu-section">
                        <div class="menu-item">📋 쇼핑</div>
                        <div class="menu-item">👤 장바구니</div>
                        <div class="menu-item">💝 찜</div>
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
                    
                    <!-- Q&A 상세 -->
                    <div class="qna-detail">
                        <div class="qna-header">
                            <!-- 카테고리 표시 -->
                            <c:choose>
                                <c:when test="${qna.qna_category == 0}">
                                    <span class="category-badge category-0">상품문의</span>
                                </c:when>
                                <c:when test="${qna.qna_category == 1}">
                                    <span class="category-badge category-1">배송문의</span>
                                </c:when>
                                <c:when test="${qna.qna_category == 2}">
                                    <span class="category-badge category-2">교환/환불</span>
                                </c:when>
                                <c:when test="${qna.qna_category == 3}">
                                    <span class="category-badge category-3">기타문의</span>
                                </c:when>
                                <c:when test="${qna.qna_category == 4}">
                                    <span class="category-badge category-4">FAQ</span>
                                </c:when>
                                <c:when test="${qna.qna_category == 5}">
                                    <span class="category-badge category-5">공지사항</span>
                                </c:when>
                            </c:choose>
                            
                            <!-- 답변 상태 -->
                            <c:choose>
                                <c:when test="${qna.qna_answered}">
                                    <span class="qna-status answered">답변완료</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="qna-status waiting">답변대기</span>
                                </c:otherwise>
                            </c:choose>
                            
                            <!-- 비밀글 표시 -->
                            <c:if test="${qna.qna_private}">
                                <span class="qna-status waiting">🔒 비밀글</span>
                            </c:if>
                            
                            <div class="qna-title">${qna.qna_title}</div>
                            
                            <div class="qna-meta">
                                <div class="qna-meta-item">
                                    <span>👤</span>
                                    <span>${qna.mem_name}</span>
                                </div>
                                <div class="qna-meta-item">
                                    <span>📅</span>
                                    <span><fmt:formatDate value="${qna.qna_time}" pattern="yyyy-MM-dd HH:mm" /></span>
                                </div>
                                <c:if test="${qna.qna_update != null}">
                                    <div class="qna-meta-item">
                                        <span>✏️</span>
                                        <span>수정: <fmt:formatDate value="${qna.qna_update}" pattern="yyyy-MM-dd HH:mm" /></span>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                        
                        <div class="qna-content">
                            <div class="qna-content-text">${qna.qna_content}</div>
                        </div>
                        
<!-- 답변 영역 -->
<div class="qna-answer">
    <c:choose>
        <c:when test="${qna.qna_answered && not empty qna.qna_answer_content}">
            <!-- 기존 답변 표시 -->
            <div class="answer-header">
                <span class="answer-badge">관리자 답변</span>
                <c:if test="${qna.qna_answer_time != null}">
                    <span class="answer-date">
                        <fmt:formatDate value="${qna.qna_answer_time}" pattern="yyyy-MM-dd HH:mm" />
                    </span>
                </c:if>
                <!-- 관리자인 경우 답변 삭제 버튼 -->
                <c:if test="${user.mem_roll == 'admin'}">
                    <button class="btn-delete-answer" onclick="confirmDeleteAnswer()">답변 삭제</button>
                </c:if>
            </div>
            <div class="answer-content">${qna.qna_answer_content}</div>
        </c:when>
        <c:otherwise>
            <!-- 답변 없을 때 -->
            <c:choose>
                <%-- 관리자인 경우에만 답변 작성 폼 표시 --%>
                <c:when test="${user.mem_roll == 'admin'}">
                    <div class="answer-header">
                        <span class="answer-badge">답변 작성</span>
                    </div>
                    <form action="${pageContext.request.contextPath}/qna/answer" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="qna_idx" value="${qna.qna_idx}">

                        <textarea name="qna_answer_content"
                                  class="answer-textarea"
                                  placeholder="답변 내용을 입력하세요..."
                                  required></textarea>

                        <div class="answer-btn-group">
                            <button type="submit" class="btn btn-submit">답변 등록</button>
                        </div>
                    </form>
                </c:when>
                <c:otherwise>
                    <%-- 일반 사용자는 대기 메시지만 표시 --%>
                    <div class="no-answer">
                        아직 답변이 등록되지 않았습니다.<br>
                        빠른 시일 내에 답변 드리겠습니다.
                    </div>
                </c:otherwise>
            </c:choose>
        </c:otherwise>
    </c:choose>
</div>
                    </div>
                    
                    <<div class="btn-group">
    <!-- 작성자 본인만 수정/삭제 버튼 표시, 관리자 제외 -->
    <c:if test="${user.mem_idx == qna.mem_idx && user.mem_roll != 'admin'}">
        <!-- 답변이 없는 경우에만 수정 버튼 표시 -->
        <c:if test="${not qna.qna_answered}">
            <button class="btn btn-edit" 
                    onclick="location.href='${pageContext.request.contextPath}/qna/modify?qna_idx=${qna.qna_idx}'">
                수정
            </button>
        </c:if>
        <button class="btn btn-delete" onclick="confirmDelete()">삭제</button>
    </c:if>
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
                location.href = '${pageContext.request.contextPath}/qna/delete?qna_idx=${qna.qna_idx}';
            }
        }
        
        // 프리로더 제거
        window.addEventListener('load', function() {
            const preloader = document.querySelector('.preloader');
            if (preloader) {
                preloader.style.opacity = '0';
                setTimeout(() => preloader.style.display = 'none', 500);
            }
        });
    </script>

    <!-- Start Footer Area -->
    <c:import url="../common/footer.jsp" />
    <!-- End Footer Area -->
</body>
</html>