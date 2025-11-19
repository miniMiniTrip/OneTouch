<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    /* 레이아웃 그리드 - 메인 페이지에 추가 필요 */
/*     .admin-layout {
        display: grid;
        grid-template-columns: 280px 1fr;
        gap: 30px;
        max-width: 1600px;
        margin: 40px auto;
        padding: 0 40px;
        
    } */

    /* 사이드바 */
    .sidebar {
        background: white;
        border-radius: 12px;
        padding: 30px 0;
        height: fit-content;
        position: sticky;
        top: 20px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        margin-left: px;
    }

    .sidebar-section {
        margin-bottom: 30px;
    }

    .sidebar-section:last-child {
        margin-bottom: 0;
    }

    .sidebar-title {
        padding: 0 24px 12px;
        font-size: 14px;
        font-weight: 600;
        color: #999;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }

    .sidebar-menu {
        list-style: none;
        margin: 0;
        padding: 0;
    }

    .sidebar-menu li {
        margin: 0;
    }

    .sidebar-menu a {
        display: block;
        padding: 14px 24px;
        color: #666;
        text-decoration: none;
        font-size: 15px;
        transition: all 0.3s;
        border-left: 3px solid transparent;
    }

    .sidebar-menu a:hover {
        background: #f5f7fa;
        color: #1a237e;
    }

    .sidebar-menu a.active {
        background: #e8eaf6 !important;
        color: #1a237e !important;
        font-weight: 600 !important;
        border-left-color: #1a237e !important;
    }
/* 전체화면 레이아웃 */
.qna-section {
    padding: 0;
    background-color: #fff;
    min-height: calc(100vh - 400px);
}

.qna-container {
    display: flex;
    max-width: 100%;
    margin: 0;
    background: transparent;
    border-radius: 0;
    overflow: visible;
    box-shadow: none;
}

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
}

.menu-item:hover {
    background: #f0f0f0;
    padding-left: 35px;
}

.menu-item.active {
    background: #e8eaf6;
    color: #5c6bc0;
    font-weight: 600;
    border-left: 3px solid #5c6bc0;
}

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

.empty-state {
    text-align: center;
    padding: 100px 20px;
}

.empty-state-message {
    color: #666;
    margin-bottom: 30px;
    font-size: 15px;
    line-height: 1.6;
}

.btn-write {
    background: #5c6bc0;
    color: white;
    padding: 12px 28px;
    border: none;
    border-radius: 6px;
    font-size: 14px;
    font-weight: 600;
    cursor: pointer;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    transition: all 0.3s;
    white-space: nowrap;
    height: 44px;
}

.btn-write:hover {
    background: #4a5aaf;
    color: white;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(92, 107, 192, 0.3);
}

.btn-write::before {
    content: '✎';
    font-size: 16px;
}

/* 게시판 테이블 스타일 */
.qna-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
    background: #fff;
}

.qna-table thead {
    background: #f8f9fa;
    border-top: 2px solid #5c6bc0;
    border-bottom: 2px solid #e0e0e0;
}

.qna-table th {
    padding: 18px 15px;
    font-size: 14px;
    font-weight: 600;
    color: #333;
    text-align: center;
}

.qna-table tbody tr {
    border-bottom: 1px solid #e0e0e0;
    transition: all 0.2s;
}

.qna-table tbody tr:hover {
    background: #f8f9fa;
    transform: translateX(5px);
}

.qna-table td {
    padding: 18px 15px;
    font-size: 14px;
    color: #666;
    text-align: center;
    vertical-align: middle;
}

.qna-table td.title {
    text-align: center;
    cursor: pointer;
}

.qna-table td.title a {
    color: #333;
    text-decoration: none;
    transition: color 0.3s;
}

.qna-table td.title a:hover {
    color: #5c6bc0;
    text-decoration: underline;
}

.status-badge {
    display: inline-block;
    padding: 6px 14px;
    border-radius: 14px;
    font-size: 12px;
    font-weight: 600;
}

.status-waiting {
    background: #fff3e0;
    color: #f57c00;
}

.status-completed {
    background: #e8f5e9;
    color: #388e3c;
}

/* 반응형 */
@media (max-width: 1200px) {
    .content {
        padding: 40px 40px;
    }
}

@media (max-width: 992px) {
    .qna-container {
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
    
    .btn-write {
        width: 100%;
    }
    
    .qna-table th,
    .qna-table td {
        padding: 12px 8px;
        font-size: 13px;
    }
}
</style>

<aside class="sidebar">
    <div class="sidebar-section">
        <div class="sidebar-title">대시보드</div>
        <ul class="sidebar-menu">
            <li>
                <a href="${pageContext.request.contextPath}/adminpage/dashboard" 
                   class="${pageContext.request.requestURI.contains('/dashboard') ? 'active' : ''}">
                    📊 통계 대시보드
                </a>
            </li>
        </ul>
    </div>

    <div class="sidebar-section">
        <div class="sidebar-title">관리</div>
        <ul class="sidebar-menu">
            <li>
                <a href="${pageContext.request.contextPath}/adminpage/members"
                   class="${pageContext.request.requestURI.contains('/members') ? 'active' : ''}">
                    👥 회원관리
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/adminpage/product" 
                   class="${pageContext.request.requestURI.contains('/products') ? 'active' : ''}">
                    📦 상품관리
                </a>
            </li>
            
            <li>
         <script type="text/javascript">
                  alert('${ pageContext.request.requestURI }');
                </script> 
                <a href="${pageContext.request.contextPath}/order/management"
                   class="${pageContext.request.requestURI.contains('/order_management') ? 'active' : ''}">
                    🚚 주문관리
                </a>
            </li>
            <li>
                <!-- <script type="text/javascript">
                  alert('${ pageContext.request.requestURI }');
                </script> -->
                <a href="${pageContext.request.contextPath}/admin/qna_list"
                   class="${pageContext.request.requestURI.contains('/admin_qna_list') ? 'active' : ''}">
                    📋 Q&A관리
                </a>
            </li>
            
        </ul>
    </div>

    <div class="sidebar-section">
        
        <ul class="sidebar-menu">
            <li>
                
            </li>
        </ul>
    </div>
</aside>