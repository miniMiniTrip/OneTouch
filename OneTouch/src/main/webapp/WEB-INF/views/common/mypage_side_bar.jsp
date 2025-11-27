<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
/* ==================== PC용 마이페이지 사이드바 스타일 ==================== */
.mypage-sidebar {
    width: 250px;
    background: #fafafa;
    border-right: 1px solid #e0e0e0;
    padding: 30px 0;
    min-height: calc(100vh - 400px);
    transition: transform 0.4s cubic-bezier(0.4, 0, 0.2, 1);
}

.mypage-menu-section {
    margin: 25px 0;
}

.mypage-menu-title {
    padding: 10px 30px;
    font-size: 12px;
    color: #999;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

.mypage-menu-item {
    padding: 14px 30px;
    font-size: 14px;
    color: #333;
    cursor: pointer;
    display: flex;
    align-items: center;
    transition: all 0.3s;
    border-left: 3px solid transparent;
    text-decoration: none;
}

.mypage-menu-item a {
    color: #333;
    text-decoration: none;
    width: 100%;
}

.mypage-menu-item:hover {
    background: #f0f0f0;
    padding-left: 35px;
}

.mypage-menu-item:hover a {
    color: #333;
}

.mypage-menu-item.active {
    background: #e8eaf6;
    color: #1A237E;
    font-weight: 600;
    border-left: 3px solid #5c6bc0;
}

.mypage-menu-item.active a {
    color: #1A237E;
}

.mypage-menu-body {
    overflow: visible;
}

/* ==================== 햄버거 메뉴 버튼 (모바일 전용) ==================== */
.mypage-mobile-toggle {
    display: none;
}

/* ========================= 모바일 반응형 ========================= */
@media (max-width: 992px) {
    /* ==================== 햄버거 메뉴 버튼 ==================== */
    .mypage-mobile-toggle {
        display: flex !important;
        align-items: center !important;
        justify-content: center !important;
        position: fixed !important;
        left: 0 !important;
        top: 13% !important;
        transform: translateY(-50%) !important;
        z-index: 10001 !important;
        width: 30px !important;
        height: 33px !important;
        background: rgba(26, 35, 126, 0.5) !important;
        backdrop-filter: blur(10px) !important;
        border: none !important;
        border-radius: 0 8px 8px 0 !important;
        cursor: pointer !important;
        box-shadow: 2px 0 10px rgba(0, 0, 0, 0.3) !important;
        transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1) !important;
        font-size: 24px !important;
        color: white !important;
    }
    
    .mypage-mobile-toggle:hover {
        background: rgba(26, 35, 126, 0.5) !important;
        left: 5px !important;
    }
    
    /* 아이콘 */
    .mypage-menu-icon::before {
        content: '☰' !important;
        size: 10px !important;
     
    }
    
    /* 버튼이 열렸을 때 (X 모양) */
    .mypage-mobile-toggle.active {
        left: 270px !important;
    }
    
    .mypage-mobile-toggle.active .mypage-menu-icon::before {
        content: '✕' !important;
    }
    
    /* ==================== 사이드바 ==================== */
    .mypage-sidebar {
        position: fixed !important;
        left: -270px !important;
        top: 0 !important;
        width: 270px !important;
        height: 100vh !important;
        z-index: 10000 !important;
        background:  rgba(26, 35, 126, 0.5) !important;
        backdrop-filter:  blur(10px) !important;
        -webkit-backdrop-filter: blur(10px) !important;
        border-right: 1px solid rgba(255, 255, 255, 0.1) !important;
        border-radius: 0 18px 18px 0 !important;
        box-shadow: 0 8px 32px rgba(0, 0, 0, 0.15) !important;
        transition: left 0.4s cubic-bezier(0.4, 0, 0.2, 1) !important;
        overflow-y: auto !important;
        padding: 20px 0 !important;
          border: 1px solid rgba(255, 255, 255, 0.25);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.15);
            backdrop-filter: blur(20px) saturate(150%);
             -webkit-backdrop-filter: blur(20px) saturate(150%);
    }
    
    .mypage-sidebar.active {
        left: 0 !important;
    }
    
    /* 사이드바 메뉴 스타일 */
    .mypage-menu-body {
        position: static !important;
        max-height: none !important;
        opacity: 1 !important;
        overflow: visible !important;
        background: transparent !important;
        padding: 20px 0 !important;
    }
    
    .mypage-menu-section {
        margin: 15px 0 !important;
    }
    
    .mypage-menu-title {
        color: rgba(255, 255, 255, 0.6) !important;
        padding: 12px 25px 8px !important;
    }
    
    .mypage-menu-item {
        padding: 14px 25px !important;
        color: white !important;
        background: transparent !important;
        border-left: 3px solid transparent !important;
    }
    
    .mypage-menu-item a {
        color: #e7f0ff !important;
    }
    
    .mypage-menu-item:hover {
        background: rgba(255, 255, 255, 0.1) !important;
        padding-left: 30px !important;
    }
    
    .mypage-menu-item.active {
        background: rgba(92, 107, 192, 0.4) !important;
        border-left: 3px solid #5c6bc0 !important;
    }
    
    .mypage-menu-item.active a {
        color: white !important;
    }
}
</style>

<!-- ========================= 햄버거 메뉴 버튼 (모바일 전용) ========================= -->
<button class="mypage-mobile-toggle" onclick="toggleMypageMenu()">
    <span class="mypage-menu-icon" style="size: 10px;"></span>
</button> 

<!-- ========================= 마이페이지 사이드바 ========================= -->
<div class="mypage-sidebar">
    <!-- 메뉴 바디 -->
    <div class="mypage-menu-body">
        <!-- 쇼핑 메뉴 -->
        <div class="mypage-menu-section">
            <div class="mypage-menu-item">
                <a href="${pageContext.request.contextPath}/cart/list.do">🛒 장바구니</a>
            </div>
            
            <div class="mypage-menu-item">
                <a href="${pageContext.request.contextPath}/wishlist/list.do">💝 찜</a>
            </div>
           
            <div class="mypage-menu-item">
                <a href="${pageContext.request.contextPath}/order/list.do">🎯 주문/배송 조회</a>
            </div>
            
            <div class="mypage-menu-item">
                <a href="${pageContext.request.contextPath}/mypage/skinprofile.do">🔬 피부 프로필</a>
            </div>
            
            <div class="mypage-menu-item">
                <a href="${pageContext.request.contextPath}/skin/form.do">🔬 피부 진단</a>
            </div>
        </div>
        
        <!-- 나의 활동 -->
        <div class="mypage-menu-section">
            <div class="mypage-menu-title">나의 활동</div>
            
            <div class="mypage-menu-item">
                <a href="${pageContext.request.contextPath}/mypage/qna_list">💬 상품 Q&A</a>
            </div>
        </div>
        
        <!-- 회원 정보 -->
        <div class="mypage-menu-section">
            <div class="mypage-menu-title">회원 정보</div>
            <div class="mypage-menu-item">
                <a href="${pageContext.request.contextPath}/user/check_password">👥 회원정보 수정</a>
            </div>
        </div>
        
        <!-- 로그아웃 -->
        <div class="mypage-menu-section">
            <div class="mypage-menu-item">
                <a href="${pageContext.request.contextPath}/user/logout">📝 로그아웃</a>
            </div>
        </div>
    </div>
</div>

<script>
// ========================= 현재 페이지 활성화 표시 =========================
document.addEventListener("DOMContentLoaded", function () {
    const items = document.querySelectorAll(".mypage-menu-item");
    const current = window.location.pathname + window.location.search;

    items.forEach(item => {
        const linkTag = item.querySelector("a");
        
        if (linkTag) {
            const targetUrl = linkTag.getAttribute("href");
            
            if (targetUrl && (current === targetUrl || current.includes(targetUrl))) {
                item.classList.add("active");
            }
        }
    });
});

// ========================= 모바일 사이드 메뉴 토글 함수 =========================
function toggleMypageMenu() {
    const sidebar = document.querySelector('.mypage-sidebar');
    const toggleBtn = document.querySelector('.mypage-mobile-toggle');
    
    if (sidebar && toggleBtn) {
        sidebar.classList.toggle('active');
        toggleBtn.classList.toggle('active');
    }
}

// ========================= 모바일 메뉴 닫기 함수 =========================
function closeMypageMenu() {
    const sidebar = document.querySelector('.mypage-sidebar');
    const toggleBtn = document.querySelector('.mypage-mobile-toggle');
    
    if (sidebar && toggleBtn) {
        sidebar.classList.remove('active');
        toggleBtn.classList.remove('active');
    }
}

// ========================= 페이지 로드 시 실행 =========================
document.addEventListener("DOMContentLoaded", function() {
    // 메뉴 아이템 클릭 시 모바일에서 자동 닫기
    document.querySelectorAll('.mypage-menu-item a').forEach(link => {
        link.addEventListener('click', function() {
            if (window.innerWidth <= 992) {
                setTimeout(() => {
                    closeMypageMenu();
                }, 200);
            }
        });
    });
});

// ========================= ESC 키로 메뉴 닫기 =========================
document.addEventListener('keydown', function(e) {
    if (e.key === 'Escape' && window.innerWidth <= 992) {
        closeMypageMenu();
    }
});
</script>