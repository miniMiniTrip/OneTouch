<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
        text-decoration: none;
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
</style>

<!-- 헤더 -->
<header class="header">
    <div>
        <a href="/" class="logo">One<span>Touch</span></a>
        <span class="admin-badge">관리자</span>
    </div>
    <div class="header-right">
        <span class="header-user">관리자님</span>
        <button class="btn-logout" onclick="adminLogout()">로그아웃</button>
    </div>
</header>

<script>
    // 로그아웃
    function adminLogout() {
        if (confirm('로그아웃 하시겠습니까?')) {
            alert('로그아웃되었습니다.');
            location.href = "${pageContext.request.contextPath}/logout";
        }
    }
</script>