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


/* 카테고리 드롭다운 표시용 CSS */
.sub-menu {
    display: none !important;
    position: absolute;
    top: 100%;
    left: 0;
    background: #ffffff;
    border: 1px solid #e0e0e0;
    border-radius: 8px;
    box-shadow: 0 4px 20px rgba(0,0,0,0.15);
    min-width: 160px;
    z-index: 9999;
    list-style: none;
    padding: 8px 0;
    margin: 0;
}

.sub-menu.show {
    display: block !important;
}

.sub-menu li {
    margin: 0;
    padding: 0;
    list-style: none;
    width: 100%;
}

.sub-menu li a {
    display: block;
    width: 100%;
    padding: 12px 16px;
    color: #333333;
    background: transparent;
    text-decoration: none;
    font-size: 14px;
    font-weight: 400;
    white-space: nowrap;
    border-bottom: 1px solid #f0f0f0;
    transition: all 0.2s ease;
}

.sub-menu li:last-child a {
    border-bottom: none;
}

.sub-menu li a:hover {
    background-color: #f8f9fa;
    color: #2a5298;
    text-decoration: none;
}

/* 부모 메뉴 항목에 relative 추가 */
.nav-item {
    position: relative;
}



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

#cart-dropdown {
    display: none;
    position: absolute;
    top: 100%;
    right: 0;
    background: white;
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.15);
    min-width: 320px;
    z-index: 1000;
}

#cart-dropdown-list {
    list-style: none;
    padding: 0;
    margin: 0;
    max-height: 300px;
    overflow-y: auto;
}

#cart-dropdown-list li {
    border-bottom: 1px solid #f0f0f0;
}

#cart-dropdown-list li:last-child {
    border-bottom: none;
}

#cart-dropdown-list li a {
    display: flex;
    align-items: center;
    gap: 12px;
    padding: 12px 16px;
    text-decoration: none;
    color: #333;
    transition: background 0.2s;
}

#cart-dropdown-list li a:hover {
    background: #f8f9fa;
}

#cart-dropdown-list li h4 {
    margin: 0;
    font-size: 14px;
    font-weight: 500;
    flex: 1;
}

#cart-dropdown-list li p {
    margin: 0;
    font-size: 12px;
    color: #666;
}

.one_i{
margin-top: 10px !important;
}
</style>

<script type="text/javascript">
//검색 기능 - 통합 검색 (상품 + 포스트)
function performSearch() {
    const keyword = document.getElementById('search-input')?.value.trim();
    if (keyword) {
        // MainController의 /search 엔드포인트로 이동 (통합 검색: 상품 + 포스트)
        location.href = "${pageContext.request.contextPath}/search?keyword=" + encodeURIComponent(keyword);
    }
}

// 유저 드롭다운 토글
function toggleDropdown(dropdownId) {
    const dropdown = document.getElementById(dropdownId);
    const isVisible = dropdown.style.display === 'block';
    
    // 모든 드롭다운 닫기
    document.querySelectorAll('.user-dropdown-menu').forEach(menu => {
        menu.style.display = 'none';
        menu.parentElement.classList.remove('active');
    });
    
    // 현재 드롭다운 토글
    if (!isVisible) {
        dropdown.style.display = 'block';
        dropdown.parentElement.classList.add('active');
    }
}

// 초기화
document.addEventListener('DOMContentLoaded', function() {
    console.log('스크립트 로드됨'); // 디버깅용
    
    // 검색 엔터키
    document.getElementById('search-input')?.addEventListener('keypress', function(e) {
        if (e.key === 'Enter') performSearch();
    });
    
    // 카테고리 토글
    const categoryBtn = document.querySelector('.dd-menu');
    const categoryMenu = document.getElementById('submenu-1-1');
    
    console.log('카테고리 버튼:', categoryBtn); // 디버깅용
    console.log('카테고리 메뉴:', categoryMenu); // 디버깅용
    
    if (categoryBtn && categoryMenu) {
        categoryBtn.addEventListener('click', function(e) {
            console.log('카테고리 클릭됨'); // 디버깅용
            e.preventDefault();
            e.stopPropagation();
            
            const isOpen = categoryMenu.classList.contains('show');
            console.log('현재 상태:', isOpen ? '열림' : '닫힘'); // 디버깅용
            
            if (isOpen) {
                categoryMenu.classList.remove('show');
                this.classList.add('collapsed');
                console.log('메뉴 닫음');
            } else {
                categoryMenu.classList.add('show');
                this.classList.remove('collapsed');
                console.log('메뉴 열음');
            }
        });
        
        // 카테고리 항목 클릭시 닫기
        categoryMenu.querySelectorAll('a').forEach(link => {
            link.addEventListener('click', function() {
                categoryMenu.classList.remove('show');
                categoryBtn.classList.add('collapsed');
            });
        });
    } else {
        console.error('카테고리 요소를 찾을 수 없음');
    }
    
    // 모바일 메뉴 링크 클릭시 닫기
    document.querySelectorAll('#navbarSupportedContent a').forEach(link => {
        link.addEventListener('click', function() {
            const href = this.getAttribute('href');
            if (href && href !== 'javascript:void(0)' && !this.classList.contains('dd-menu')) {
                const mobileMenu = document.getElementById('navbarSupportedContent');
                if (mobileMenu && mobileMenu.classList.contains('show')) {
                    document.querySelector('.navbar-toggler')?.click();
                }
            }
        });
    });
});

// 외부 클릭시 닫기
document.addEventListener('click', function(e) {
    // 유저 드롭다운 닫기
    if (!e.target.closest('.user-dropdown')) {
        document.querySelectorAll('.user-dropdown-menu').forEach(menu => {
            menu.style.display = 'none';
            menu.parentElement.classList.remove('active');
        });
    }
    
    // 카테고리 닫기
    if (!e.target.closest('#submenu-1-1') && !e.target.closest('.dd-menu')) {
        const categoryMenu = document.getElementById('submenu-1-1');
        const categoryBtn = document.querySelector('.dd-menu');
        if (categoryMenu) categoryMenu.classList.remove('show');
        if (categoryBtn) categoryBtn.classList.add('collapsed');
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
				                            <li><a href="${pageContext.request.contextPath}/user/check_password">내 정보</a></li>
				                            <li><a href="${pageContext.request.contextPath}/order/list.do">주문 내역</a></li>
				                            <li><a href="${pageContext.request.contextPath}/cart/list.do">장바구니</a></li>
				                            <li><a href="${pageContext.request.contextPath}/wishlist/list.do">찜한 상품</a></li>
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
				                                <li><a href="${pageContext.request.contextPath}/admin/order/list">주문 관리</a></li>
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
				                
				                    <li><a href="${pageContext.request.contextPath}/user/login?url=" id="loginBtn">로그인</a></li>
				                    <li><a href="${pageContext.request.contextPath}/user/register">회원가입</a></li>
									<!-- 로그인 버튼 클릭전 페이지로 돌아간다. -->
									<script>
										const loginBtn = document.getElementById('loginBtn');
										const currentUrl = window.location.href;
										//alert(loginBtn);
										loginBtn.href = loginBtn.href + currentUrl;
									</script>
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
                        src="${pageContext.request.contextPath}/assets/images/logo/onetouch_logo.png" 
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
                                <a href="${pageContext.request.contextPath}/wishlist/list.do">
                                    <i class="lni lni-heart one_i"></i> 
                                    <span class="total-items">${wishlistCount}</span>
                                </a>
                            </div>
                            <div class="cart-items">
                                <a href="javascript:void(0)" class="main-btn" id="cart-toggle">
                                    <i class="lni lni-cart one_i"></i> 
                                    <span class="total-items" id="cart-count">${cartCount}</span>
                                </a>

                                <!-- Shopping Cart Dropdown -->
                                <div class="shopping-item" id="cart-dropdown">
                                    <div class="dropdown-cart-header">
                                        <span id="cart-item-count">0개 상품</span> 
                                        <a href="${pageContext.request.contextPath}/cart/list.do">장바구니 보기</a>
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
                                            <a href="${pageContext.request.contextPath}/cart/list.do" class="btn animate">결제하기</a>
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
                                    <a href="${pageContext.request.contextPath}/product/list">전체 상품</a>
                                </li>
                                <li class="nav-item">
								    <a class="dd-menu collapsed" href="javascript:void(0)">카테고리</a>
								    <ul class="sub-menu collapse" id="submenu-1-1">
								       <%--  <li class="nav-item">
								            <a href="${pageContext.request.contextPath}/product/list">전체보기</a>
								        </li> --%>
								        <li class="nav-item">
								            <a href="${pageContext.request.contextPath}/product/list?category=1&sort=popular">스킨케어</a>
								        </li>
								        <li class="nav-item">
								            <a href="${pageContext.request.contextPath}/product/list?category=2&sort=popular">메이크업/선케어</a>
								        </li>
								        <li class="nav-item">
								            <a href="${pageContext.request.contextPath}/product/list?category=3&sort=popular">클렌징케어</a>
								        </li>
								    </ul>
								</li>
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/post/list">커뮤니티</a>
                                </li>
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/skinprofile/form">피부 진단</a>
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
                            <i class="lni lni-facebook-filled one_i"></i>
                        </a></li>
                        <li><a href="javascript:void(0)">
                            <i class="lni lni-twitter-original one_i"></i>
                        </a></li>
                        <li><a href="javascript:void(0)">
                            <i class="lni lni-instagram one_i"></i>
                        </a></li>
                        <li><a href="javascript:void(0)">
                            <i class="lni lni-youtube one_i"></i>
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
<script>
// 장바구니 드롭다운 토글
let cartDropdownLoaded = false; // 한 번만 로드하기 위한 플래그

$('#cart-toggle').on('click', function(e) {
    e.preventDefault();
    
    const dropdown = $('#cart-dropdown');
    const isVisible = dropdown.is(':visible');
    
    if(!isVisible) {
        // 드롭다운 열기
        dropdown.show();
        
        // 아직 로드 안 했으면 로드
        if(!cartDropdownLoaded) {
            loadCartDropdown();
        }
    } else {
        // 드롭다운 닫기
        dropdown.hide();
    }
});

// 장바구니 목록 로드
function loadCartDropdown() {
    $.ajax({
        url: '${pageContext.request.contextPath}/cart/dropdown',
        type: 'GET',
        dataType: 'json',
        success: function(data) {
            if(data.result === 'success') {
                // 목록 렌더링
                renderCartDropdown(data.cart_list, data.total_amount, data.count);
                cartDropdownLoaded = true;
            } else if(data.result === 'not_login') {
                // 비로그인 상태
                $('#cart-dropdown-list').html(
                    '<li style="padding: 20px; text-align: center; color: #999;">' +
                    '로그인이 필요합니다.</li>'
                );
                $('#cart-dropdown-total').text('0원');
            }
        },
        error: function() {
            $('#cart-dropdown-list').html(
                '<li style="padding: 20px; text-align: center; color: #999;">' +
                '오류가 발생했습니다.</li>'
            );
        }
    });
}

// 장바구니 목록 렌더링
function renderCartDropdown(cartList, totalAmount, count) {
    const listHtml = $('#cart-dropdown-list');
    listHtml.empty();
    
    if(cartList.length === 0) {
        listHtml.html(
            '<li style="padding: 20px; text-align: center; color: #999;">' +
            '장바구니가 비어있습니다.</li>'
        );
        $('#cart-item-count').text('0개 상품');
        $('#cart-dropdown-total').text('0원');
        return;
    }
    
    // 최대 5개만 표시
    const displayList = cartList.slice(0, 4);
    
    displayList.forEach(function(item) {
        const imageUrl = item.product_image_url 
            ? '${pageContext.request.contextPath}/images/products_list/' + item.product_image_url
            : '${pageContext.request.contextPath}/images/default.png';
        
        const li = $('<li></li>');
        li.html(`
            <a href="${pageContext.request.contextPath}/product/detail?id=\${item.product_idx}">
                <img src="\${imageUrl}" alt="\${item.product_name}" 
                     style="width: 60px; height: 60px; object-fit: cover; border-radius: 4px;">
                <h4>\${item.product_name}</h4>
                <p class="quantity">\${item.cart_cnt}개 - <span class="amount">\${item.product_price.toLocaleString()}원</span></p>
            </a>
        `);
        listHtml.append(li);
    });
    
    // 개수 및 총액 업데이트
    $('#cart-item-count').text(count + '개 상품');
    $('#cart-dropdown-total').text(totalAmount.toLocaleString() + '원');
}

// 외부 클릭 시 드롭다운 닫기
$(document).on('click', function(e) {
    if(!$(e.target).closest('#cart-toggle, #cart-dropdown').length) {
        $('#cart-dropdown').hide();
    }
});

// 장바구니 추가 후 드롭다운 갱신
function refreshCartDropdown() {
    cartDropdownLoaded = false; // 플래그 리셋
    if($('#cart-dropdown').is(':visible')) {
        loadCartDropdown(); // 열려있으면 즉시 갱신
    }
}
</script>
