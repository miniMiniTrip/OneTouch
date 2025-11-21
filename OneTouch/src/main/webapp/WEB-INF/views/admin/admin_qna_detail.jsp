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

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Malgun Gothic', 'Apple SD Gothic Neo', sans-serif;
            background: #f5f7fa;
            color: #333;
        }

        /* 메인 레이아웃 */
        .admin-layout {
            display: grid;
            grid-template-columns: 280px 1fr;
            gap: 30px;
            max-width: 1600px;
            margin: 40px auto;
            padding: 0 40px;
        }

        .content {
            background: white;
            border-radius: 8px;
            padding: 40px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
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
            margin-right: 8px;
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
            flex-wrap: wrap;
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
            flex-wrap: wrap;
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
            color: white;
        }

        .btn-edit {
            background: #5c6bc0;
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

        .answer-btn-group {
            display: flex;
            gap: 10px;
            justify-content: flex-end;
        }

        .btn-submit {
            background: #5c6bc0;
            color: white;
            padding: 10px 30px;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s;
        }

        .btn-submit:hover {
            background: #4a5aaf;
        }

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

        .preloader {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0,0,0,0.1);
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 9999;
            opacity: 1;
            transition: opacity 0.5s;
        }

        .preloader-inner {
            text-align: center;
        }
    </style>

  <script type="text/javascript">
    function confirmDeleteAnswer() {
        if(confirm('답변을 삭제하시겠습니까?')) {
            // admin 경로 추가
            location.href = '${pageContext.request.contextPath}/admin/qna/deleteAnswer?qna_idx=${qna.qna_idx}';
        }
    }

    function confirmDelete() {
        if(confirm('정말 삭제하시겠습니까?')) {
            // admin 경로 추가
            location.href = '${pageContext.request.contextPath}/admin/qna/delete?qna_idx=${qna.qna_idx}';
        }
    }
</script>

</head>

<body>
    <!-- 헤더 -->
    <%@ include file="admin_header.jsp" %>
    
    <!-- 프리로더 -->
    <div class="preloader">
        <div class="preloader-inner">
            <div class="preloader-icon">
                <span>⏳</span>
            </div>
        </div>
    </div>

    <!-- 메인 컨테이너 -->
    <div class="admin-layout">
        <!-- 사이드바 -->
        <%@ include file="admin_side.jsp"%>

        <!-- 콘텐츠 영역 -->
        <div class="content">
            <div class="content-header">
                <h2>💬 상품 Q&A 상세보기</h2>
                <button class="btn-list" onclick="location.href='${pageContext.request.contextPath}/admin/qna_list'">목록으로</button>
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
                                    <form action="${pageContext.request.contextPath}/admin/qna_answer" method="post" enctype="multipart/form-data">
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
            
            <!-- 버튼 -->
            <div class="btn-group">
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

    <!-- 스크롤 탑 -->
    <a href="#" class="scroll-top">
        <i class="lni lni-chevron-up"></i>
    </a>

    <script>
        // 프리로더 제거
        window.addEventListener('load', function() {
            const preloader = document.querySelector('.preloader');
            if (preloader) {
                preloader.style.opacity = '0';
                setTimeout(() => preloader.style.display = 'none', 500);
            }
        });
    </script>
</body>
</html>