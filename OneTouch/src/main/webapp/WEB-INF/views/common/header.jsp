<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/images/favicon.svg" />

<!-- ========================= CSS here ========================= -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/LineIcons.3.0.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/tiny-slider.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/glightbox.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<!-- jQuery -->


<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
/* 드롭다운 컨테이너 */
.user-dropdown {
    position: relative !important;
    display: inline-block !important;
}

/* 드롭다운 메뉴 (세로 정렬) */
.user-dropdown-menu {
    position: absolute !important;
    top: 100% !important;
    left: 0 !important;
    background: #ffffff !important;
    border: 1px solid #e0e0e0 !important;
    border-radius: 8px !important;
    box-shadow: 0 4px 20px rgba(0,0,0,0.15) !important;
    min-width: 160px !important;
    z-index: 9999 !important;
    list-style: none !important;
    padding: 8px 0 !important;
    margin: 8px 0 0 0 !important;
    display: none !important;
    
    /* 세로 정렬 강제 */
    flex-direction: column !important;
    align-items: stretch !important;
}

/* 메뉴 항목들 */
.user-dropdown-menu li {
    margin: 0 !important;
    padding: 0 !important;
    list-style: none !important;
    width: 100% !important;
    display: block !important;
}

/* 메뉴 링크 스타일 */
.user-dropdown-menu li a {
    display: block !important;
    width: 100% !important;
    padding: 12px 16px !important;
    color: #333333 !important;
    background: transparent !important;
    text-decoration: none !important;
    font-size: 14px !important;
    font-weight: 400 !important;
    line-height: 1.5 !important;
    white-space: nowrap !important;
    border: none !important;
    border-bottom: 1px solid #f0f0f0 !important;
    transition: all 0.2s ease !important;
    box-sizing: border-box !important;
}

/* 마지막 항목 경계선 제거 */
.user-dropdown-menu li:last-child a {
    border-bottom: none !important;
}

/* 호버 효과 */
.user-dropdown-menu li a:hover {
    background-color: #f8f9fa !important;
    color: #2a5298 !important;
    text-decoration: none !important;
    transform: translateX(4px) !important;
}

/* 드롭다운 표시 상태 */
.user-dropdown-menu[style*="block"] {
    display: flex !important;
    flex-direction: column !important;
    visibility: visible !important;
    opacity: 1 !important;
}

/* 화살표 회전 애니메이션 */
.user-dropdown a i {
    transition: transform 0.3s ease !important;
    margin-left: 5px !important;
}

.user-dropdown.active a i {
    transform: rotate(180deg) !important;
}

/* 추가: 드롭다운 활성화 시 부모 스타일 */
.user-dropdown.active > a {
    color: #2a5298 !important;
}
/* /* 이미지 로고 */
 .navbar-brand {
margin-left: -20px;

}  
</style>

<script type="text/javascript">
    // 프리로더 제거
    window.addEventListener('load', function() {
        const preloader = document.querySelector('.preloader');
        if (preloader) {
            preloader.style.opacity = '0';
            setTimeout(() => preloader.style.display = 'none', 500);
        }
    });

    // 햄버거식 드롭다운 토글 함수
    function toggleDropdown(dropdownId) {
        // 모든 드롭다운 닫기
        document.querySelectorAll('.user-dropdown').forEach(dropdown => {
            const menu = dropdown.querySelector('.user-dropdown-menu');
            if (menu && menu.id !== dropdownId) {
                menu.classList.remove('show');
                menu.style.display = 'none';
                dropdown.classList.remove('active');
            }
        });
        
        // 클릭한 드롭다운 토글
        const dropdown = document.getElementById(dropdownId);
        const parentDropdown = dropdown.parentElement;
        
        if (dropdown) {
            if (dropdown.classList.contains('show')) {
                // 닫기
                dropdown.classList.remove('show');
                setTimeout(() => {
                    dropdown.style.display = 'none';
                }, 300);
                parentDropdown.classList.remove('active');
            } else {
                // 열기
                dropdown.style.display = 'block';
                setTimeout(() => {
                    dropdown.classList.add('show');
                }, 10);
                parentDropdown.classList.add('active');
            }
        }
    }

    // 외부 클릭 시 모든 드롭다운 닫기
    document.addEventListener('click', function(e) {
        if (!e.target.closest('.user-dropdown')) {
            document.querySelectorAll('.user-dropdown').forEach(dropdown => {
                const menu = dropdown.querySelector('.user-dropdown-menu');
                if (menu) {
                    menu.classList.remove('show');
                    setTimeout(() => {
                        menu.style.display = 'none';
                    }, 300);
                    dropdown.classList.remove('active');
                }
            });
        }
    });
</script>




<!-- Start Header Area -->
<header class="header navbar-area">
    <!-- Start Topbar -->
    <div class="topbar">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-4 col-md-4 col-12">
                    <div class="top-left">
                        <%-- <ul class="menu-top-link">
                            <li><a href="${pageContext.request.contextPath}/about">소개</a></li>
                            <li><a href="${pageContext.request.contextPath}/qna/list">문의</a></li>
                        </ul> --%>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-12">
                    <%-- <div class="top-middle">
                        <ul class="useful-links">
                            <li><a href="${pageContext.request.contextPath}/">홈</a></li>
                            <li><a href="${pageContext.request.contextPath}/admin/product">상품</a></li>
                            <li><a href="${pageContext.request.contextPath}/community">커뮤니티</a></li>
                        </ul>
                    </div> --%>
                </div>
                <div class="col-lg-4 col-md-4 col-12">
    <div class="top-end">
        <c:choose>
            <c:when test="${not empty sessionScope.user}">
                <div class="user">
                    <i class="lni lni-user"></i> ${sessionScope.user.mem_name}님
                </div>
                <ul class="user-login">
                    
                    
                    <!-- 마이페이지 드롭다운 - 햄버거 스타일 -->
                    <li class="user-dropdown">
                        <a href="javascript:void(0)" onclick="toggleDropdown('mypage-menu')">
                            마이페이지 <i class="lni lni-chevron-down"></i>
                        </a>
                        <ul class="user-dropdown-menu" id="mypage-menu" style="display: none;">
                            <li><a href="${pageContext.request.contextPath}/wishlist/list.do">내 정보</a></li>
                            <li><a href="${pageContext.request.contextPath}/orders">주문 내역</a></li>
                            <li><a href="${pageContext.request.contextPath}/cart">장바구니</a></li>
                            <li><a href="${pageContext.request.contextPath}/wishlist">찜한 상품</a></li>
                        </ul>
                    </li>
                    
                    <!-- 관리자 드롭다운 -->
                    <c:if test="${sessionScope.user.mem_roll == 'admin'}">
                        <li class="user-dropdown">
                            <a href="javascript:void(0)" onclick="toggleDropdown('admin-menu')">
                                관리자 <i class="lni lni-chevron-down"></i>
                            </a>
                            <ul class="user-dropdown-menu" id="admin-menu" style="display: none;">
                                <li><a href="${pageContext.request.contextPath}/adminpage/dashboard">대시보드</a></li>
                                <li><a href="${pageContext.request.contextPath}/adminpage/product">상품 관리</a></li>
                                <li><a href="${pageContext.request.contextPath}/admin/admin_members">회원 관리</a></li>
                                <li><a href="${pageContext.request.contextPath}/order/management">주문 관리</a></li>
                                <li><a href="${pageContext.request.contextPath}/admin/qna_list">Q&A 관리</a></li>
                            </ul>
                        </li>
                    </c:if>
                    
                    
                    <li><a href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
                </ul>
            </c:when>
            <c:otherwise>
                <div class="user">
                    <i class="lni lni-user"></i> 환영합니다
                </div>
                <ul class="user-login">
                    <li><a href="${pageContext.request.contextPath}/user/login">로그인</a></li>
                    <li><a href="${pageContext.request.contextPath}/user/register">회원가입</a></li>
                </ul>
            </c:otherwise>
        </c:choose>
    </div>
</div>
            </div>
        </div>
    </div>
    <!-- End Topbar -->

    <!-- Start Header Middle -->
    <div class="header-middle">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-3 col-md-3 col-7">
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/">
                        <img 
                        src="${pageContext.request.contextPath}/assets/images/logo/onetouch3.png" 
                        alt="OneTouch" style="width: 90px; height: auto;">
                    </a>
                </div>
                <div class="col-lg-5 col-md-7 d-xs-none">
                    <div class="main-menu-search">
                        <div class="navbar-search search-style-5">
                            <div class="search-input">
                                <input type="text" id="search-input" placeholder="상품을 검색하세요...">
                            </div>
                            <div class="search-btn">
                                <button onclick="performSearch()">
                                    <i class="lni lni-search-alt"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-2 col-5">
                    <div class="middle-right-area">
                        <div class="nav-hotline">
                            <i class="lni lni-phone"></i>
                            <h3>
                                고객센터 <span>1588-0000</span>
                            </h3>
                        </div>
                        <div class="navbar-cart">
                            <div class="wishlist">
                                <a href="${pageContext.request.contextPath}/wishlist">
                                    <i class="lni lni-heart"></i> 
                                    <span class="total-items">0</span>
                                </a>
                            </div>
                            <div class="cart-items">
                                <a href="javascript:void(0)" class="main-btn" id="cart-toggle">
                                    <i class="lni lni-cart"></i> 
                                    <span class="total-items" id="cart-count">0</span>
                                </a>

                                <!-- Shopping Cart Dropdown -->
                                <div class="shopping-item" id="cart-dropdown">
                                    <div class="dropdown-cart-header">
                                        <span id="cart-item-count">0개 상품</span> 
                                        <a href="${pageContext.request.contextPath}/cart">장바구니 보기</a>
                                    </div>
                                    
                                    <!-- dropdown list -->
                                    <ul id="cart-dropdown-list">
                                    </ul>

                                    <div class="bottom">
                                        <div class="total">
                                            <span>총 금액</span> 
                                            <span class="total-amount" id="cart-dropdown-total">0원</span>
                                        </div>
                                        <div class="button">
                                            <a href="${pageContext.request.contextPath}/checkout" class="btn animate">결제하기</a>
                                        </div>
                                    </div>
                                </div>
                                <!--/ End Shopping Cart Dropdown -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Header Middle -->

    <!-- Start Header Bottom -->
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-8 col-md-6 col-12">
                <div class="nav-inner">
                    <nav class="navbar navbar-expand-lg">
                        <button class="navbar-toggler mobile-menu-btn" type="button"
                            data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false"
                            aria-label="Toggle navigation">
                            <span class="toggler-icon"></span> 
                            <span class="toggler-icon"></span>
                            <span class="toggler-icon"></span>
                        </button>
                        
                        
                        <div class="collapse navbar-collapse sub-menu-bar" id="navbarSupportedContent">
                            <ul id="nav" class="navbar-nav ms-auto">
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/">홈</a>
                                </li>
                                <li class="nav-item">
                                    <a class="dd-menu collapsed" href="javascript:void(0)" 
                                       data-bs-toggle="collapse" data-bs-target="#submenu-1-1"
                                       aria-controls="navbarSupportedContent" aria-expanded="false">카테고리</a>
                                    <ul class="sub-menu collapse" id="submenu-1-1">
                                        <li class="nav-item">
                                            <a href="${pageContext.request.contextPath}/products?category=skincare">스킨케어</a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="${pageContext.request.contextPath}/products?category=cleansing">클렌징</a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="${pageContext.request.contextPath}/products?category=haircare">헤어케어</a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="${pageContext.request.contextPath}/products?category=bodycare">바디케어</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/product/list">전체 상품</a>
                                </li>
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/post/list">커뮤니티</a>
                                </li>
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/skintest">피부 진단</a>
                                </li>
                                
                                   
                                
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-12">
                <div class="nav-social">
                    <h5 class="title">Follow Us:</h5>
                    <ul>
                        <li><a href="javascript:void(0)">
                            <i class="lni lni-facebook-filled"></i>
                        </a></li>
                        <li><a href="javascript:void(0)">
                            <i class="lni lni-twitter-original"></i>
                        </a></li>
                        <li><a href="javascript:void(0)">
                            <i class="lni lni-instagram"></i>
                        </a></li>
                        <li><a href="javascript:void(0)">
                            <i class="lni lni-youtube"></i>
                        </a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Header Bottom -->
</header>
<!-- End Header Area -->


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
        
        document.getElementById('search-input')?.addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                performSearch();
            }
        });    
        
        
    });
</script>
<script>
function performSearch() {
    const keyword = document.getElementById('search-input').value.trim();
    const contextPath = "${pageContext.request.contextPath}";
    if (keyword) {
        location.href = contextPath+"/products?search=" + encodeURIComponent(keyword);
    }
}

/* function updateHeaderCartCount() {
    const contextPath = '${pageContext.request.contextPath}';
    fetch(contextPath+"/cart/count")
        .then(response => response.json())
        .then(data => {
            document.getElementById('cart-count').textContent = data.count;
        })
        .catch(error => console.error('Error:', error));
} */

/* document.addEventListener('DOMContentLoaded', function() {
    updateHeaderCartCount(); 
});*/


</script>

