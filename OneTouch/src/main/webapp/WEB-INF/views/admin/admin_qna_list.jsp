<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>관리자 - 상품Q&A 관리</title>
    <meta name="description" content="관리자 페이지">
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

        /* 컨테이너 */
        .container {
            max-width: 1600px;
            margin: 40px auto;
            padding: 0 48px;
        }

        /* 레이아웃 */
        .admin-layout {
            display: grid;
            grid-template-columns: 250px 1fr;
            gap: 30px;
        }

        .admin-qna-section {
            padding: 0;
            background-color: transparent;
        }
        
        /* 메인 컨텐츠 */
        .admin-qna-content {
            background: white;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
            min-height: 600px;
            
           
        }
        
        .admin-qna-content-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 2px solid #5c6bc0;
        }
        
        .admin-qna-content-header h2 {
            font-size: 18px;
            color: #5c6bc0;
            font-weight: 600;
            margin: 0;
        }
        
        .admin-qna-empty-state {
            text-align: center;
            padding: 80px 20px;
        }
        
        .admin-qna-empty-state-message {
            color: #666;
            margin-bottom: 30px;
            font-size: 14px;
        }
        
        .admin-qna-btn-write {
            background: #5c6bc0;
            color: white;
            padding: 10px 24px;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
            transition: background 0.3s;
            white-space: nowrap;
            height: 40px;
        }

        .admin-qna-btn-write:hover {
            background: #4a5aaf;
            color: white;
        }

        .admin-qna-btn-write::before {
            content: '✎';
            font-size: 16px;
        }
        
        /* 게시판 테이블 스타일 */
        .admin-qna-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        
        .admin-qna-table thead {
            background: #f8f9fa;
            border-top: 2px solid #5c6bc0;
            border-bottom: 1px solid #dee2e6;
        }
        
        .admin-qna-table th {
            padding: 15px 10px;
            font-size: 14px;
            font-weight: 600;
            color: #333;
            text-align: center;
        }
        
        .admin-qna-table tbody tr {
            border-bottom: 1px solid #dee2e6;
            transition: background 0.2s;
        }
        
        .admin-qna-table tbody tr:hover {
            background: #f8f9fa;
        }
        
        .admin-qna-table td {
            padding: 15px 10px;
            font-size: 14px;
            color: #666;
            text-align: center;
        }
        
        .admin-qna-table td.title {
            text-align: center;
            vertical-align: middle;
            cursor: pointer;
        }
        
        .admin-qna-table td.title:hover {
            color: #5c6bc0;
            text-decoration: underline;
        }
        
        .admin-qna-status-badge {
            display: inline-block;
            padding: 4px 12px;
            border-radius: 12px;
            font-size: 12px;
            font-weight: 600;
        }
        
        .admin-qna-status-waiting {
            background: #fff3e0;
            color: #f57c00;
        }
        
        .admin-qna-status-completed {
            background: #e8f5e9;
            color: #388e3c;
        }

        /* 반응형 */
        @media (max-width: 768px) {
            .container {
                padding: 0 20px;
            }

            .admin-layout {
                grid-template-columns: 1fr;
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
    
    <!-- 헤더 -->
    <%@ include file="admin_header.jsp" %>
    <!-- End Header Area -->

    <!-- Start Q&A Section -->
    <section class="admin-qna-section">
        <!-- 메인 컨테이너 -->
        <div class="container">
            <div class="admin-layout">
                <!-- 사이드바 -->
                <%@ include file="admin_side.jsp"%>
                
                 
                <!-- 메인 컨텐츠 -->
                <div class="admin-qna-content">
                    <div class="admin-qna-content-header">
                        <h2>💬 상품 Q&A ${ qna }</h2>
                       
                        <!-- 글이 있을 때만 버튼 표시 -->
                        <c:if test="${not empty qna_list}">
                            <button class="admin-qna-btn-write" onclick="location.href='${pageContext.request.contextPath}/admin/qna/write'">
                                Q&A 쓰기
                            </button>
                        </c:if>
                    </div>
                    
                   
                    
                    <!-- 글이 있는 경우 -->
                    <c:if test="${not empty qna_list}">
                        <table class="admin-qna-table">
                            <thead>
                                <tr>
                                    <th style="width: 80px;">번호</th>
                                    <th>제목</th>
                                    <th style="width: 100px;">작성자</th>
                                    <th style="width: 120px;">작성일</th>
                                    <th style="width: 100px;">답변상태</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="qna" items="${qna_list}" varStatus="status">
                                    <tr>
                                        <td>${qna.qna_idx}</td>
                                        
                                        <!-- 상세보기로 가는 버튼 -->
                                        <td class="title">
                                            <a href="${pageContext.request.contextPath}/admin/qna/detail?qna_idx=${qna.qna_idx}">
                                                ${qna.qna_title}
                                            </a>
                                        </td>
                                        
                                        <!-- 멤버id -->
                                        <td>${qna.mem_name}</td>
                                        
                                        <!-- 답변시간 -->
                                        <td>${qna.qna_time}</td>
                                       
                                        <!-- 답변완료 / 대기상태 -->
                                        <td>
                                            <c:choose>
                                                <c:when test="${qna.qna_answered}">
                                                    <span class="admin-qna-status-badge admin-qna-status-completed">답변완료</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="admin-qna-status-badge admin-qna-status-waiting">답변대기</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                    
                    <!-- 글이 없는 경우 -->
                    <c:if test="${empty qna_list}">
                        <div class="admin-qna-empty-state">
                            <div class="admin-qna-empty-state-message">
                                작성하신 상품 문의 내역을 확인하실 수 있습니다.
                            </div>
                            <button class="admin-qna-btn-write" onclick="location.href='${pageContext.request.contextPath}/admin/qna/write'">
                                Q&A 쓰기
                            </button>
                        </div>
                    </c:if>
                    
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

    <script type="text/javascript">
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