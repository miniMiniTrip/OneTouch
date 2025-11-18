<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    /* 레이아웃 그리드 - 메인 페이지에 추가 필요 */
    .admin-layout {
        display: grid;
        grid-template-columns: 280px 1fr;
        gap: 30px;
        max-width: 1600px;
        margin: 40px auto;
        padding: 0 40px;
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
        background: #e8eaf6;
        color: #1a237e;
        font-weight: 600;
        border-left-color: #1a237e;
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
                <a href="${pageContext.request.contextPath}/adminpage/products" 
                   class="${pageContext.request.requestURI.contains('/products') ? 'active' : ''}">
                    📦 상품관리
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/adminpage/inventory"
                   class="${pageContext.request.requestURI.contains('/inventory') ? 'active' : ''}">
                    📋 재고관리
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/adminpage/orders"
                   class="${pageContext.request.requestURI.contains('/orders') ? 'active' : ''}">
                    🚚 주문관리
                </a>
            </li>
        </ul>
    </div>

    <div class="sidebar-section">
        <div class="sidebar-title">시스템</div>
        <ul class="sidebar-menu">
            <li>
                <a href="${pageContext.request.contextPath}/adminpage/board"
                   class="${pageContext.request.requestURI.contains('/board') ? 'active' : ''}">
                    💬 게시판 관리
                </a>
            </li>
        </ul>
    </div>
</aside>