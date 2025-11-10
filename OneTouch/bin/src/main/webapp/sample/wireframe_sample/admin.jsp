<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OneTouch - 관리자페이지</title>
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

        /* 헤더 */
        .header {
            background: white;
            border-bottom: 1px solid #e0e0e0;
            padding: 20px 40px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 28px;
            font-weight: bold;
            color: #1a237e;
            letter-spacing: -1px;
            cursor: pointer;
        }
        
        .logo span {
            color: #3949ab;
        }

        .admin-badge {
            background: #d32f2f;
            color: white;
            padding: 6px 12px;
            border-radius: 6px;
            font-size: 13px;
            font-weight: 600;
            margin-left: 12px;
        }

        .header-right {
            display: flex;
            gap: 16px;
            align-items: center;
        }

        .header-user {
            font-size: 14px;
            color: #666;
        }

        .btn-logout {
            padding: 8px 16px;
            background: white;
            border: 1px solid #e0e0e0;
            border-radius: 6px;
            cursor: pointer;
            font-size: 13px;
            transition: all 0.3s;
        }

        .btn-logout:hover {
            border-color: #1a237e;
            color: #1a237e;
        }

        /* 컨테이너 */
        .container {
            max-width: 1600px;
            margin: 40px auto;
            padding: 0 40px;
        }

        /* 레이아웃 */
        .admin-layout {
            display: grid;
            grid-template-columns: 250px 1fr;
            gap: 30px;
        }

        /* 사이드바 */
        .sidebar {
            background: white;
            border-radius: 12px;
            padding: 30px 0;
            height: fit-content;
            position: sticky;
            top: 20px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }

        .sidebar-section {
            margin-bottom: 30px;
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
            background: #e8eaf6;
            color: #1a237e;
            font-weight: 600;
            border-left-color: #1a237e;
        }

        /* 메인 컨텐츠 */
        .main-content {
            min-height: 600px;
        }

        .content-section {
            display: none;
        }

        .content-section.active {
            display: block;
        }

        .section-card {
            background: white;
            border-radius: 12px;
            padding: 30px;
            margin-bottom: 20px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 24px;
            padding-bottom: 16px;
            border-bottom: 2px solid #1a237e;
        }

        .section-title {
            font-size: 24px;
            font-weight: bold;
            color: #1a237e;
        }

        /* 대시보드 통계 */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-bottom: 30px;
        }

        .stat-card {
            background: white;
            border-radius: 12px;
            padding: 24px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
            border-left: 4px solid #1a237e;
        }

        .stat-label {
            font-size: 14px;
            color: #666;
            margin-bottom: 8px;
        }

        .stat-value {
            font-size: 32px;
            font-weight: bold;
            color: #1a237e;
            margin-bottom: 8px;
        }

        .stat-change {
            font-size: 13px;
            color: #4caf50;
        }

        .stat-change.negative {
            color: #d32f2f;
        }

        /* 테이블 */
        .data-table {
            width: 100%;
            border-collapse: collapse;
        }

        .data-table thead {
            background: #f5f7fa;
        }

        .data-table th {
            padding: 16px;
            text-align: left;
            font-size: 14px;
            font-weight: 600;
            color: #666;
            border-bottom: 2px solid #e0e0e0;
        }

        .data-table td {
            padding: 16px;
            border-bottom: 1px solid #f0f0f0;
            font-size: 14px;
        }

        .data-table tbody tr:hover {
            background: #f5f7fa;
        }

        .status-badge {
            display: inline-block;
            padding: 4px 12px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: 600;
        }

        .status-active {
            background: #e8f5e9;
            color: #4caf50;
        }

        .status-inactive {
            background: #ffebee;
            color: #d32f2f;
        }

        .status-pending {
            background: #fff3e0;
            color: #f57c00;
        }

        /* 버튼 */
        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
        }

        .btn-primary {
            background: #1a237e;
            color: white;
        }

        .btn-primary:hover {
            background: #0d47a1;
            transform: translateY(-2px);
        }

        .btn-secondary {
            background: white;
            color: #1a237e;
            border: 2px solid #1a237e;
        }

        .btn-secondary:hover {
            background: #f5f7fa;
        }

        .btn-small {
            padding: 6px 12px;
            font-size: 12px;
        }

        .btn-danger {
            background: white;
            color: #d32f2f;
            border: 1px solid #d32f2f;
        }

        .btn-danger:hover {
            background: #d32f2f;
            color: white;
        }

        /* 검색 */
        .search-bar {
            display: flex;
            gap: 12px;
            margin-bottom: 24px;
        }

        .search-input {
            flex: 1;
            padding: 12px;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            font-size: 14px;
        }

        .search-input:focus {
            outline: none;
            border-color: #1a237e;
        }

        .search-select {
            padding: 12px;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            font-size: 14px;
            cursor: pointer;
        }

        /* 폼 */
        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
            font-size: 14px;
            font-weight: 600;
            color: #333;
            margin-bottom: 8px;
        }

        .form-input,
        .form-textarea,
        .form-select {
            width: 100%;
            padding: 12px;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            font-size: 14px;
            font-family: inherit;
        }

        .form-input:focus,
        .form-textarea:focus,
        .form-select:focus {
            outline: none;
            border-color: #1a237e;
        }

        .form-textarea {
            resize: vertical;
            min-height: 120px;
        }

        /* 차트 영역 */
        .chart-container {
            background: white;
            border-radius: 12px;
            padding: 30px;
            margin-bottom: 20px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }

        .chart-title {
            font-size: 18px;
            font-weight: 600;
            color: #333;
            margin-bottom: 20px;
        }

        /* 매출 차트 테이블 */
        .sales-chart-table {
            width: 100%;
            border-collapse: collapse;
        }

        .sales-chart-table thead {
            background: #f5f7fa;
        }

        .sales-chart-table th {
            padding: 12px 16px;
            text-align: left;
            font-size: 13px;
            font-weight: 600;
            color: #666;
            border-bottom: 2px solid #e0e0e0;
        }

        .sales-chart-table td {
            padding: 16px;
            border-bottom: 1px solid #f0f0f0;
            font-size: 14px;
        }

        .sales-chart-table tbody tr:hover {
            background: #f5f7fa;
        }

        .highlight-row {
            background: #e8eaf6 !important;
        }

        .highlight-row:hover {
            background: #e8eaf6 !important;
        }

        .graph-bar-container {
            background: #f5f7fa;
            height: 30px;
            border-radius: 6px;
            overflow: hidden;
            position: relative;
        }

        .graph-bar {
            height: 100%;
            border-radius: 6px;
            transition: width 0.8s ease-in-out;
            display: flex;
            align-items: center;
            justify-content: flex-end;
            padding-right: 10px;
            color: white;
            font-size: 12px;
            font-weight: 600;
            box-shadow: 0 2px 6px rgba(26, 35, 126, 0.2);
        }

        .change-rate {
            font-size: 13px;
            color: #666;
        }

        .change-rate.positive {
            color: #4caf50;
            font-weight: 600;
        }

        .change-rate.negative {
            color: #d32f2f;
            font-weight: 600;
        }

        /* 모달 */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 2000;
            overflow-y: auto;
        }

        .modal.active {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .modal-content {
            background: white;
            border-radius: 12px;
            width: 100%;
            max-width: 800px;
            max-height: 90vh;
            overflow-y: auto;
        }

        .modal-header {
            padding: 24px;
            border-bottom: 1px solid #e0e0e0;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .modal-title {
            font-size: 20px;
            font-weight: bold;
            color: #1a237e;
        }

        .modal-close {
            background: none;
            border: none;
            font-size: 28px;
            color: #999;
            cursor: pointer;
        }

        .modal-body {
            padding: 24px;
        }

        .modal-footer {
            padding: 24px;
            border-top: 1px solid #e0e0e0;
            display: flex;
            gap: 12px;
            justify-content: flex-end;
        }

        /* 상품 미리보기 */
        .product-preview {
            display: flex;
            gap: 20px;
            padding: 20px;
            background: #f5f7fa;
            border-radius: 8px;
        }

        .preview-image {
            width: 150px;
            height: 150px;
            background: white;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 1px solid #e0e0e0;
        }

        .preview-info {
            flex: 1;
        }

        .preview-name {
            font-size: 18px;
            font-weight: 600;
            color: #333;
            margin-bottom: 12px;
        }

        .preview-price {
            font-size: 24px;
            font-weight: bold;
            color: #1a237e;
            margin-bottom: 8px;
        }

        .preview-stock {
            font-size: 14px;
            color: #666;
        }

        /* 드롭다운 */
        .dropdown-select {
            padding: 8px 12px;
            border: 1px solid #e0e0e0;
            border-radius: 6px;
            font-size: 13px;
            cursor: pointer;
            background: white;
            transition: all 0.3s;
        }

        .dropdown-select:focus {
            outline: none;
            border-color: #1a237e;
        }

        /* 반응형 */
        @media (max-width: 1200px) {
            .stats-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 768px) {
            .container {
                padding: 0 20px;
            }

            .admin-layout {
                grid-template-columns: 1fr;
            }

            .sidebar {
                position: static;
            }

            .stats-grid {
                grid-template-columns: 1fr;
            }

            .form-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <%
        // 세션에서 관리자 정보 가져오기
        String adminName = (String) session.getAttribute("adminName");
        if (adminName == null) {
            adminName = "관리자";
        }
    %>
    
    <!-- 헤더 -->
    <header class="header">
        <div>
            <span class="logo" onclick="location.href='index.jsp'">One<span>Touch</span></span>
            <span class="admin-badge">관리자</span>
        </div>
        <div class="header-right">
            <span class="header-user"><%= adminName %>님</span>
            <button class="btn-logout" onclick="handleLogout()">로그아웃</button>
        </div>
    </header>

    <!-- 메인 컨테이너 -->
    <div class="container">
        <div class="admin-layout">
            <!-- 사이드바 -->
            <aside class="sidebar">
                <div class="sidebar-section">
                    <div class="sidebar-title">대시보드</div>
                    <ul class="sidebar-menu">
                        <li><a href="admin.jsp?section=dashboard" class="${param.section == 'dashboard' || param.section == null ? 'active' : ''}">📊 통계 대시보드</a></li>
                    </ul>
                </div>

                <div class="sidebar-section">
                    <div class="sidebar-title">관리</div>
                    <ul class="sidebar-menu">
                        <li><a href="admin.jsp?section=members" class="${param.section == 'members' ? 'active' : ''}">👥 회원관리</a></li>
                        <li><a href="admin.jsp?section=products" class="${param.section == 'products' ? 'active' : ''}">📦 상품관리</a></li>
                        <li><a href="admin.jsp?section=inventory" class="${param.section == 'inventory' ? 'active' : ''}">📋 재고관리</a></li>
                        <li><a href="admin.jsp?section=orders" class="${param.section == 'orders' ? 'active' : ''}">🚚 주문관리</a></li>
                    </ul>
                </div>

                <div class="sidebar-section">
                    <div class="sidebar-title">시스템</div>
                    <ul class="sidebar-menu">
                        <li><a href="admin.jsp?section=board" class="${param.section == 'board' ? 'active' : ''}">💬 게시판 관리</a></li>
                    </ul>
                </div>
            </aside>

            <!-- 메인 컨텐츠 -->
            <main class="main-content">
                <c:choose>
                    <%-- 대시보드 --%>
                    <c:when test="${param.section == null || param.section == 'dashboard'}">
                        <jsp:include page="admin_dashboard.jsp" />
                    </c:when>
                    
                    <%-- 회원관리 --%>
                    <c:when test="${param.section == 'members'}">
                        <jsp:include page="admin_members.jsp" />
                    </c:when>
                    
                    <%-- 상품관리 --%>
                    <c:when test="${param.section == 'products'}">
                        <jsp:include page="admin_products.jsp" />
                    </c:when>
                    
                    <%-- 재고관리 --%>
                    <c:when test="${param.section == 'inventory'}">
                        <jsp:include page="admin_inventory.jsp" />
                    </c:when>
                    
                    <%-- 주문관리 --%>
                    <c:when test="${param.section == 'orders'}">
                        <jsp:include page="admin_orders.jsp" />
                    </c:when>
                    
                    <%-- 게시판 관리 --%>
                    <c:when test="${param.section == 'board'}">
                        <jsp:include page="admin_board.jsp" />
                    </c:when>
                </c:choose>
            </main>
        </div>
    </div>

    <script>
        function handleLogout() {
            if (confirm('로그아웃 하시겠습니까?')) {
                location.href = 'logout.jsp';
            }
        }

        // 모달 관련 함수들
        function openModal(modalId) {
            document.getElementById(modalId).classList.add('active');
        }

        function closeModal(modalId) {
            document.getElementById(modalId).classList.remove('active');
        }

        // 모달 외부 클릭 시 닫기
        document.addEventListener('DOMContentLoaded', function() {
            document.querySelectorAll('.modal').forEach(modal => {
                modal.addEventListener('click', function(e) {
                    if (e.target === this) {
                        closeModal(this.id);
                    }
                });
            });
        });
    </script>
</body>
</html>