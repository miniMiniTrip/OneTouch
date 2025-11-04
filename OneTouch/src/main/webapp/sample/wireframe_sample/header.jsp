<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // 세션에서 로그인 정보 가져오기
    String userId = (String) session.getAttribute("userId");
    boolean isLoggedIn = (userId != null);
    
    // 현재 페이지 확인
    String currentPage = request.getRequestURI();
%>

<style>
    /* 헤더 스타일 */
    .header {
        background: white;
        border-bottom: 1px solid #e0e0e0;
        position: sticky;
        top: 0;
        z-index: 1000;
        box-shadow: 0 2px 5px rgba(0,0,0,0.05);
    }

    .header-container {
        max-width: 1400px;
        margin: 0 auto;
        padding: 0 40px;
    }

    .header-top {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 20px 0;
    }

    .logo {
        font-size: 32px;
        font-weight: bold;
        color: #1a237e;
        letter-spacing: -1px;
        cursor: pointer;
        text-decoration: none;
        display: inline-block;
    }
    
    .logo span {
        color: #3949ab;
    }

    .header-search {
        flex: 1;
        max-width: 500px;
        margin: 0 40px;
        position: relative;
    }

    .search-input {
        width: 100%;
        padding: 12px 50px 12px 20px;
        border: 2px solid #e0e0e0;
        border-radius: 25px;
        font-size: 14px;
        transition: all 0.3s;
    }

    .search-input:focus {
        outline: none;
        border-color: #1a237e;
        box-shadow: 0 0 0 3px rgba(26, 35, 126, 0.1);
    }

    .search-btn {
        position: absolute;
        right: 15px;
        top: 50%;
        transform: translateY(-50%);
        background: none;
        border: none;
        color: #1a237e;
        font-size: 18px;
        cursor: pointer;
    }

    .header-icons {
        display: flex;
        gap: 20px;
        align-items: center;
    }

    .header-icon {
        font-size: 24px;
        color: #666;
        cursor: pointer;
        transition: color 0.3s;
        text-decoration: none;
        position: relative;
    }

    .header-icon:hover {
        color: #1a237e;
    }

    .icon-badge {
        position: absolute;
        top: -8px;
        right: -8px;
        background: #d32f2f;
        color: white;
        font-size: 11px;
        font-weight: bold;
        padding: 2px 6px;
        border-radius: 10px;
    }

    .header-user {
        display: flex;
        align-items: center;
        gap: 10px;
        font-size: 14px;
        color: #666;
    }

    .header-user a {
        color: #1a237e;
        text-decoration: none;
        font-weight: 600;
    }

    .header-user a:hover {
        text-decoration: underline;
    }

    /* 네비게이션 메뉴 */
    .header-nav {
        border-top: 1px solid #f0f0f0;
    }

    .nav-menu {
        display: flex;
        justify-content: center;
        gap: 50px;
        padding: 0;
        margin: 0;
        list-style: none;
    }

    .nav-menu li {
        position: relative;
    }

    .nav-menu a {
        display: block;
        padding: 20px 0;
        color: #333;
        text-decoration: none;
        font-size: 16px;
        font-weight: 500;
        transition: color 0.3s;
    }

    .nav-menu a:hover,
    .nav-menu a.active {
        color: #1a237e;
    }

    .nav-menu a.active::after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 0;
        right: 0;
        height: 3px;
        background: #1a237e;
    }

    /* 반응형 */
    @media (max-width: 768px) {
        .header-container {
            padding: 0 20px;
        }

        .header-search {
            display: none;
        }

        .nav-menu {
            gap: 20px;
            overflow-x: auto;
            -webkit-overflow-scrolling: touch;
        }

        .nav-menu a {
            font-size: 14px;
            white-space: nowrap;
        }
    }
</style>

<header class="header">
    <div class="header-container">
        <!-- 상단 헤더 -->
        <div class="header-top">
            <a href="index.jsp" class="logo">
                One<span>Touch</span>
            </a>

            <!-- 검색 -->
            <div class="header-search">
                <form action="search.jsp" method="get">
                    <input type="text" class="search-input" name="keyword" placeholder="상품을 검색하세요">
                    <button type="submit" class="search-btn">🔍</button>
                </form>
            </div>

            <!-- 아이콘 & 사용자 정보 -->
            <div class="header-icons">
                <c:choose>
                    <c:when test="${not empty sessionScope.userId}">
                        <!-- 로그인 상태 -->
                        <div class="header-user">
                            <span><strong>${sessionScope.userId}</strong>님</span>
                            <a href="mypage.jsp">마이페이지</a>
                            <a href="logout.jsp">로그아웃</a>
                        </div>
                        <a href="cart.jsp" class="header-icon" title="장바구니">
                            🛒
                            <span class="icon-badge">3</span>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <!-- 비로그인 상태 -->
                        <div class="header-user">
                            <a href="login.jsp">로그인</a>
                            <a href="signup.jsp">회원가입</a>
                        </div>
                        <a href="login.jsp" class="header-icon" title="장바구니">🛒</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!-- 네비게이션 메뉴 -->
        <nav class="header-nav">
            <ul class="nav-menu">
                <li><a href="products.jsp?category=all" class="${param.category == 'all' ? 'active' : ''}">전체상품</a></li>
                <li><a href="products.jsp?category=skincare" class="${param.category == 'skincare' ? 'active' : ''}">스킨케어</a></li>
                <li><a href="products.jsp?category=makeup" class="${param.category == 'makeup' ? 'active' : ''}">메이크업</a></li>
                <li><a href="products.jsp?category=haircare" class="${param.category == 'haircare' ? 'active' : ''}">헤어케어</a></li>
                <li><a href="community.jsp" class="<%= currentPage.contains("community") ? "active" : "" %>">커뮤니티</a></li>
                <li><a href="customer.jsp" class="<%= currentPage.contains("customer") ? "active" : "" %>">고객센터</a></li>
            </ul>
        </nav>
    </div>
</header>