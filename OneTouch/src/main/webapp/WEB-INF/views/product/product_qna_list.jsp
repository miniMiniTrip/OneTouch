<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>상품 Q&A</title>
    <meta name="description" content="상품 Q&A">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/images/favicon.svg">

    <style>
/* 상품 Q&A 전용 스타일 */
.product-qna-wrapper {
    width: 100%;
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
}

.product-qna-content {
    background: white;
    border-radius: 12px;
    padding: 30px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.05);
}

.product-qna-content-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 30px;
    padding-bottom: 15px;
    border-bottom: 2px solid #5c6bc0;
}

.product-qna-content-header h2 {
    font-size: 18px;
    color: #1A237E;
    font-weight: 600;
    margin: 0;
}

.product-qna-btn-write {
    background: #1A237E;
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

.product-qna-btn-write:hover {
    background: #4a5aaf;
    color: white;
}

.product-qna-btn-write::before {
    content: '✎';
    font-size: 16px;
}

/* 게시판 테이블 */
.product-qna-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

.product-qna-table thead {
    background: #f8f9fa;
    border-top: 2px solid #5c6bc0;
    border-bottom: 1px solid #dee2e6;
}

.product-qna-table th {
    padding: 15px 10px;
    font-size: 14px;
    font-weight: 600;
    color: #333;
    text-align: center;
}

.product-qna-table tbody tr {
    border-bottom: 1px solid #dee2e6;
    transition: background 0.2s;
}

.product-qna-table tbody tr:hover {
    background: #f8f9fa;
}

.product-qna-table td {
    padding: 15px 10px;
    font-size: 14px;
    color: #666;
    text-align: center;
}

.product-qna-table td.title {
    text-align: center;
    vertical-align: middle;
}

.product-qna-table td.title a {
    color: #5c6bc0;
    text-decoration: none;
    font-weight: 500;
}

.product-qna-table td.title a:hover {
    text-decoration: underline;
}

.product-qna-status-badge {
    display: inline-block;
    padding: 4px 12px;
    border-radius: 12px;
    font-size: 12px;
    font-weight: 600;
}

.product-qna-status-waiting {
    background: #fff3e0;
    color: #f57c00;
}

.product-qna-status-completed {
    background: #e8f5e9;
    color: #388e3c;
}

.product-qna-empty-state {
    text-align: center;
    padding: 80px 20px;
}

.product-qna-empty-state-message {
    color: #666;
    margin-bottom: 30px;
    font-size: 14px;
}

/* 페이징 스타일 */
.product-qna-pagination {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 5px;
    margin-top: 30px;
}

.product-qna-pagination a,
.product-qna-pagination span {
    min-width: 36px;
    height: 36px;
    padding: 0 12px;
    border: 1px solid #dee2e6;
    border-radius: 4px;
    font-size: 14px;
    color: #666;
    text-decoration: none;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    transition: all 0.2s;
}

.product-qna-pagination a:hover {
    background: #f8f9fa;
    border-color: #5c6bc0;
    color: #5c6bc0;
}

.product-qna-pagination .active {
    background: #5c6bc0;
    color: white;
    border-color: #5c6bc0;
    font-weight: 600;
}

.product-qna-pagination .disabled {
    color: #ccc;
    cursor: not-allowed;
    pointer-events: none;
}

/* 반응형 */
@media (max-width: 768px) {
    .product-qna-wrapper {
        padding: 0 10px;
    }
    
    .product-qna-content {
        padding: 20px 15px;
    }
    
    .product-qna-table th,
    .product-qna-table td {
        padding: 10px 5px;
        font-size: 13px;
    }
    
    .product-qna-pagination a,
    .product-qna-pagination span {
        min-width: 32px;
        height: 32px;
        padding: 0 8px;
        font-size: 13px;
    }
}
</style>
</head>

<body>

<div class="product-qna-wrapper">
    <div class="product-qna-content">
        <div class="product-qna-content-header">
            <h2>💬 상품 Q&A</h2>
            
            <!-- 로그인한 경우에만 버튼 표시 -->
            <c:if test="${user.mem_roll != 'admin' }">
            <c:if test="${ userO == 1 and not empty qna_list}">
                <button class="product-qna-btn-write" 
                        onclick="location.href='${pageContext.request.contextPath}/product/qna_write?product_idx=${product_idx}'">
                    Q&A 쓰기
                </button>
            </c:if>
            </c:if>
        </div>
        
        <!-- 글이 있는 경우 -->
        <c:if test="${not empty qna_list}">
            <table class="product-qna-table">
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
                            <td class="title">
                               <c:if test="${qna.qna_private == false }">
                                <a href="${pageContext.request.contextPath}/mypage/detail?qna_idx=${qna.qna_idx}&product_idx=${product_idx}">
                                    ${qna.qna_title}
                                </a>
                               </c:if>
                               <c:if test="${qna.qna_private == true }">
                                <a style="color: red; text-decoration: none;">
                                    비공개
                                </a>
                               </c:if>
                            </td>
                            <td>${qna.mem_name}</td>
                            <td>${qna.qna_time}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${qna.qna_answered}">
                                        <span class="product-qna-status-badge product-qna-status-completed">답변완료</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="product-qna-status-badge product-qna-status-waiting">답변대기</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            
            <!-- 페이징 처리 -->
            <%-- <div class="product-qna-pagination">
                <!-- 이전 -->
                <c:choose>
                    <c:when test="${page > 1}">
                        <a href="?product_idx=${product_idx}&page=${page-1}">이전</a>
                    </c:when>
                    <c:otherwise>
                        <span class="disabled">이전</span>
                    </c:otherwise>
                </c:choose>
                
                <!-- 페이지 번호 -->
                <c:forEach begin="1" end="${totalPages}" var="i">
                    <c:choose>
                        <c:when test="${i == page}">
                            <span class="active">${i}</span>
                        </c:when>
                        <c:otherwise>
                            <a href="?product_idx=${product_idx}&page=${i}">${i}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                
                <!-- 다음 -->
                <c:choose>
                    <c:when test="${page < totalPages}">
                        <a href="?product_idx=${product_idx}&page=${page+1}">다음</a>
                    </c:when>
                    <c:otherwise>
                        <span class="disabled">다음</span>
                    </c:otherwise>
                </c:choose>
            </div> --%>
        </c:if>
        
        <!-- 글이 없는 경우 -->
        <c:if test="${empty qna_list}">
            <div class="product-qna-empty-state">
                <div class="product-qna-empty-state-message">
                    작성된 상품 문의가 없습니다.
                </div>
                <c:if test="${user.mem_roll != 'admin' }">
                <c:if test="${userO == 1}">
                    <button class="product-qna-btn-write" 
                            onclick="location.href='${pageContext.request.contextPath}/product/qna_write?product_idx=${product_idx}'">
                        Q&A 작성하러 가기
                    </button>
                </c:if>
                </c:if>
            </div>
        </c:if>
        
    </div>
</div>

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