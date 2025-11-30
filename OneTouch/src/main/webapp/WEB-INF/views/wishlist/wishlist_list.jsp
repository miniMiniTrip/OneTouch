<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>찜 목록 - OneTouch</title>
    <meta name="description" content="2030 남성 뷰티 쇼핑몰 OneTouch">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/images/favicon.svg">

    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/LineIcons.3.0.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/tiny-slider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/glightbox.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
    
    <style>
/* ==================== 전체 레이아웃 ==================== */
.wishlist-section {
    padding: 0;
    background-color: #fff;
    min-height: calc(100vh - 400px);
}

.wishlist-container {
    display: flex;
    max-width: 100%;
    margin: 0;
    background: transparent;
    border-radius: 0;
    overflow: visible;
    box-shadow: none;
}

/* ==================== 사이드바 스타일 ==================== */
/* .sidebar {
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
    text-decoration: none;
}

.menu-item:hover {
    background: #f0f0f0;
    padding-left: 35px;
    color: #333;
}

.menu-item.active {
    background: #e8eaf6;
    color: #5c6bc0;
    font-weight: 600;
    border-left: 3px solid #5c6bc0;
} */

/* ==================== 컨텐츠 영역 ==================== */
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

.wishlist-count {
    font-size: 14px;
    color: #999;
    font-weight: 400;
}

/* ==================== 찜 상품 그리드 ==================== */
.wishlist-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 30px;
    margin-bottom: 40px;
}

.wishlist-item {
    background: #fff;
    border: 1px solid #e5e5e5;
    border-radius: 12px;
    overflow: hidden;
    transition: all 0.3s;
    position: relative;
}

.wishlist-item:hover {
    box-shadow: 0 8px 20px rgba(0,0,0,0.1);
    transform: translateY(-5px);
}

/* ==================== 상품 이미지 ==================== */
.product-image-wrapper {
    position: relative;
    width: 100%;
    height: 280px;
    overflow: hidden;
    background: #f8f8f8;
}

.product-image-wrapper img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform 0.3s;
}

.wishlist-item:hover .product-image-wrapper img {
    transform: scale(1.08);
}

.no-image {
    width: 100%;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    background: #f0f0f0;
    color: #999;
    font-size: 14px;
}

/* ==================== 상품 정보 ==================== */
.product-info {
    padding: 20px;
}

.product-name {
    font-size: 16px;
    font-weight: 600;
    color: #333;
    margin-bottom: 12px;
    line-height: 1.4;
    height: 44px;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
}

.product-name a {
    color: #333;
    text-decoration: none;
    transition: color 0.3s;
}

.product-name a:hover {
    color: #5c6bc0;
}

.price-info {
    margin-bottom: 15px;
}

.original-price {
    font-size: 13px;
    color: #999;
    text-decoration: line-through;
    margin-right: 8px;
}

.sale-price {
    font-size: 18px;
    font-weight: 700;
    color: #e74c3c;
}

.discount-rate {
    display: inline-block;
    background: #ff6b6b;
    color: white;
    padding: 2px 8px;
    border-radius: 4px;
    font-size: 12px;
    font-weight: 600;
    margin-left: 5px;
}

.added-date {
    font-size: 12px;
    color: #999;
    margin-bottom: 15px;
}

/* ==================== 버튼 그룹 ==================== */
.button-group {
    display: flex;
    gap: 8px;
}

.btn-add-cart {
    flex: 2;
    background: #5c6bc0;
    color: white;
    border: none;
    padding: 12px;
    border-radius: 6px;
    font-size: 14px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 5px;
}

.btn-add-cart:hover {
    background: #4a5ab3;
    transform: translateY(-2px);
}

.btn-remove {
    flex: 1;
    background: #e74c3c;
    color: white;
    border: none;
    padding: 12px;
    border-radius: 6px;
    font-size: 14px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s;
}

.btn-remove:hover {
    background: #c0392b;
    transform: translateY(-2px);
}

/* ==================== 빈 상태 ==================== */
.empty-state {
    text-align: center;
    padding: 80px 20px;
    background: #fafafa;
    border-radius: 12px;
}

.empty-state i {
    font-size: 80px;
    color: #ddd;
    margin-bottom: 20px;
}

.empty-state h4 {
    font-size: 20px;
    color: #666;
    margin-bottom: 10px;
}

.empty-state p {
    font-size: 14px;
    color: #999;
    margin-bottom: 30px;
}

.empty-state .btn {
    background: #5c6bc0;
    color: white;
    padding: 12px 30px;
    border-radius: 6px;
    text-decoration: none;
    display: inline-block;
    transition: all 0.3s;
}

.empty-state .btn:hover {
    background: #4a5ab3;
    transform: translateY(-2px);
}

/* ==================== 반응형 ==================== */
@media (max-width: 1200px) {
    .wishlist-grid {
        grid-template-columns: repeat(2, 1fr);
    }
}

@media (max-width: 768px) {
    .wishlist-container {
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
    
    .wishlist-grid {
        grid-template-columns: 1fr;
        gap: 20px;
    }
    
    .product-image-wrapper {
        height: 240px;
    }
}
    </style>
    
</head>
<body>

    <%@include file="/WEB-INF/views/common/header.jsp" %>
    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">찜 목록</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="${pageContext.request.contextPath}/main"><i class="lni lni-home"></i> 홈</a></li>
                        <li>마이페이지</li>
                        <li>찜 목록</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
	<!-- End Breadcrumbs -->
	
    <!-- Start Wishlist Section -->
    <section class="wishlist-section">
        <div class="container">
          	<div class="wishlist-container">
				<!-- Sidebar -->
				<%-- <div class="sidebar">
				    
				    <div class="menu-section">
				        <div class="menu-item">
				        	<a href="${pageContext.request.contextPath}/cart/list.do">🛒 장바구니</a>
				        </div>
				        <div class="menu-item active">💝 찜</div>
				        <div class="menu-item">🎯 주문/배송 조회</div>
				    </div>
				    
				    <div class="menu-section">
				        <div class="menu-title">나의 활동</div>
				        <div class="menu-item">💬 상품 Q&A</div> 
				        <div class="menu-item">📝 내가 쓴 글</div>
				    </div>
				    
				    <div class="menu-section">
				        <div class="menu-title">회원 정보</div>
				        <div class="menu-item">👥 회원정보 수정</div>
					</div>
	                    
					<div class="menu-section">
						<div class="menu-item">📝 로그아웃</div>
	            	</div>
	            </div>
                 --%>
                <!-- 사이드바 인크루드 -->
                  <%@include file="/WEB-INF/views/common/mypage_side_bar.jsp" %>
            <!-- Content -->
            <div class="content">
                <div class="content-header">
                    <div>
                        <p class="wishlist-count"><h2>총 ${fn:length(wishlist_list)}개의 상품</h2></p>
                    </div>
                </div>
                
                <!-- 찜 목록이 있는 경우 -->
                <c:if test="${not empty wishlist_list}">
                    <div class="wishlist-grid">
                        <c:forEach var="wishlist" items="${wishlist_list}" varStatus="status">
                            <c:if test="${status.index < 9}">
                                <div class="wishlist-item">
                                    <div class="product-image-wrapper">
                                        <c:choose>
                                            <c:when test="${not empty wishlist.product_image_url}">
                                                <img src="${pageContext.request.contextPath}/images/products_list/${wishlist.product_image_url}" 
                                                     alt="${wishlist.product_name}">
                                            </c:when>
                                            <c:otherwise>
                                                <div class="no-image">이미지 준비중</div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    
                                    <div class="product-info">
                                        <h5 class="product-name">
                                            <a href="${pageContext.request.contextPath}/product/detail.do?product_idx=${wishlist.product_idx}">
                                                ${wishlist.product_name}
                                            </a>
                                        </h5>
                                        
                                        <div class="price-info">
                                            <c:choose>
                                                <c:when test="${wishlist.product_sale_price > 0 and wishlist.product_sale_price < wishlist.product_price}">
                                                    <span class="original-price">
                                                        <fmt:formatNumber value="${wishlist.product_price}" pattern="#,###"/>원
                                                    </span>
                                                    <span class="sale-price">
                                                        <fmt:formatNumber value="${wishlist.product_sale_price}" pattern="#,###"/>원
                                                    </span>
                                                    <c:set var="discount" value="${((wishlist.product_price - wishlist.product_sale_price) * 100) / wishlist.product_price}" />
                                                    <span class="discount-rate">
                                                        <fmt:formatNumber value="${discount}" pattern="#"/>%
                                                    </span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="sale-price">
                                                        <fmt:formatNumber value="${wishlist.product_price}" pattern="#,###"/>원
                                                    </span>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        
                                        <div class="added-date">
                                            <fmt:formatDate value="${wishlist.wishlist_time}" pattern="yyyy.MM.dd 추가" />
                                        </div>
                                        
                                        <div class="button-group">
                                            <button type="button" class="btn-add-cart" 
                                                    onclick="addToCart(${wishlist.product_idx})">
                                                <i class="lni lni-cart"></i> 장바구니
                                            </button>
                                            <button type="button" class="btn-remove" 
                                                    onclick="removeWishlist(${wishlist.wishlist_idx})">
                                                <i class="lni lni-trash-can"></i> 삭제
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </c:if>
                
                <!-- 찜 목록이 비어있는 경우 -->
                <c:if test="${empty wishlist_list}">
                    <div class="empty-state">
                        <i class="lni lni-heart"></i>
                        <h4>찜한 상품이 없습니다</h4>
                        <p>마음에 드는 상품을 찜해보세요!</p>
                        <a href="${pageContext.request.contextPath}/product/list.do" class="btn">
                            상품 둘러보기
                        </a>
                    </div>
                </c:if>
                </div>
            </div>
        </div>
    </section>
    <!-- End Wishlist Section -->

    <%@include file="/WEB-INF/views/common/footer.jsp" %>

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top">
        <i class="lni lni-chevron-up"></i>
    </a>

    <!-- ========================= JS here ========================= -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/tiny-slider.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/glightbox.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
    
<script type="text/javascript">
const mem_idx = ${sessionScope.user != null ? sessionScope.user.mem_idx : 'null'};

// ⭐ 뒤로가기/앞으로가기 시 페이지 새로고침
window.addEventListener('pageshow', function(event) {
    // BFCache에서 복원된 경우 (뒤로가기/앞으로가기)
    if (event.persisted) {
        console.log('페이지가 캐시에서 복원됨 - 새로고침 실행');
        location.reload();
    }
});

// 장바구니 추가
function addToCart(product_idx) {
    if (!mem_idx || mem_idx === null) {
        alert('로그인이 필요한 서비스입니다.');
        location.href = '${pageContext.request.contextPath}/user/login';
        return;
    }
    
    $.ajax({
        url: '${pageContext.request.contextPath}/cart/insert.do',
        type: 'POST',
        data: {
            mem_idx: mem_idx,
            product_idx: product_idx,
            cart_cnt: 1
        },
        success: function(data) {
            if (data.result === 'success') {
                if (confirm('장바구니에 추가되었습니다.\n장바구니로 이동하시겠습니까?')) {
                    location.href = '${pageContext.request.contextPath}/cart/list.do?mem_idx=' + mem_idx;
                }
            } else if (data.result === 'exist') {
                alert('이미 장바구니에 담긴 상품입니다.');
            } else if (data.result === 'not_login') {
                alert('로그인이 필요한 서비스입니다.');
                location.href = '${pageContext.request.contextPath}/user/login';
            } else {
                alert('장바구니 추가 중 오류가 발생했습니다.');
            }
        },
        error: function() {
            alert('장바구니 추가 중 오류가 발생했습니다.');
        }
    });
}

// 찜 삭제
function removeWishlist(wishlist_idx) {
    if (!confirm('찜 목록에서 삭제하시겠습니까?')) {
        return;
    }
    
    $.ajax({
        url: '${pageContext.request.contextPath}/wishlist/delete.do',
        type: 'POST',
        data: {
            wishlist_idx: wishlist_idx
        },
        success: function() {
            alert('찜 목록에서 삭제되었습니다.');
            location.reload();
        },
        error: function() {
            alert('삭제 중 오류가 발생했습니다.');
        }
    });
}
</script>
</body>
</html>
