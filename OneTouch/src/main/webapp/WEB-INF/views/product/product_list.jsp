<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OneTouch - 상품리스트</title>
    
     <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/LineIcons.3.0.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/tiny-slider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/glightbox.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
   
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Malgun Gothic', 'Apple SD Gothic Neo', sans-serif;
            background: #f8f9fa;
            color: #333;
        }

        /* 헤더 영역 */
        .header {
            background: white;
            padding: 40px 0;
            text-align: center;
            border-bottom: 1px solid #e9ecef;
        }

        .logo {
            font-size: 32px;
            font-weight: 700;
            color: #495fd1;
            margin-bottom: 30px;
        }

        .search-container {
            max-width: 600px;
            margin: 0 auto;
            position: relative;
        }

        .search-form {
            display: flex;
            position: relative;
        }

        .search-input {
            width: 100%;
            padding: 15px 60px 15px 20px;
            font-size: 16px;
            border: 2px solid #e9ecef;
            border-radius: 50px;
            outline: none;
            background: #f8f9fa;
            transition: all 0.3s ease;
        }

        .search-input:focus {
            border-color: #495fd1;
            background: white;
            box-shadow: 0 0 0 3px rgba(73, 95, 209, 0.1);
        }

        .search-btn {
            position: absolute;
            right: 5px;
            top: 50%;
            transform: translateY(-50%);
            width: 45px;
            height: 45px;
            border: none;
            border-radius: 50%;
            background: #495fd1;
            color: white;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        .search-btn:hover {
            background: #3848b7;
            transform: translateY(-50%) scale(1.05);
        }

        /* 메인 컨텐츠 */
        .main-content {
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px 20px;
        }

        /* 컨텐츠 헤더 */
        .content-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
            margin-bottom: 30px;
            flex-wrap: wrap;
            gap: 20px;
        }

        .content-info h1 {
            font-size: 24px;
            font-weight: 600;
            color: #333;
            margin-bottom: 5px;
        }

        .product-count {
            font-size: 14px;
            color: #6c757d;
        }

        .count-number {
            color: #495fd1;
            font-weight: 600;
        }

        /* 필터 버튼들 */
        .filter-buttons {
            display: flex;
            gap: 8px;
            flex-wrap: wrap;
        }

        .filter-btn {
            padding: 8px 16px;
            border: 1px solid #dee2e6;
            border-radius: 20px;
            background: white;
            color: #6c757d;
            font-size: 13px;
            text-decoration: none;
            transition: all 0.3s ease;
            white-space: nowrap;
        }

        .filter-btn:hover {
            border-color: #495fd1;
            color: #495fd1;
        }

        .filter-btn.active {
            background: #495fd1;
            border-color: #495fd1;
            color: white;
        }

        /* 상품 그리드 */
        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 25px;
            margin-bottom: 50px;
        }

        .product-card {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 2px 15px rgba(0,0,0,0.08);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            cursor: pointer;
            position: relative;
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(0,0,0,0.15);
        }

        /* 상품 이미지 */
        .product-image {
            width: 100%;
            height: 220px;
            background: #f8f9fa;
            position: relative;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .product-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: block;
            /* 깜박임 방지 */
            transition: none;
            backface-visibility: hidden;
            -webkit-backface-visibility: hidden;
            will-change: auto;
        }

        .no-image-placeholder {
            color: #adb5bd;
            font-size: 14px;
            text-align: center;
        }

        /* 배지 */
        .product-badge {
            position: absolute;
            top: 12px;
            left: 12px;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 11px;
            font-weight: 600;
            color: white;
            z-index: 2;
        }

        .badge-hot {
            background: #fd7e14;
        }

        .badge-new {
            background: #20c997;
        }

        /* 위시리스트 버튼 */
        .wishlist-btn {
            position: absolute;
            top: 12px;
            right: 12px;
            width: 32px;
            height: 32px;
            border: none;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.9);
            color: #6c757d;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 16px;
            transition: all 0.3s ease;
            z-index: 2;
        }

        .wishlist-btn:hover {
            background: #495fd1;
            color: white;
            transform: scale(1.1);
        }

        .wishlist-btn.active {
            background: #dc3545;
            color: white;
        }

        /* 상품 정보 */
        .product-info {
            padding: 20px;
        }

        .product-name {
            font-size: 16px;
            font-weight: 600;
            color: #333;
            margin-bottom: 8px;
            line-height: 1.4;
            height: 44px;
            overflow: hidden;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
        }

        .product-price {
            font-size: 18px;
            font-weight: 700;
            color: #333;
            margin-bottom: 12px;
        }

        /* 별점 및 리뷰 */
        .product-rating {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 13px;
            color: #6c757d;
        }

        .stars {
            color: #ffc107;
            font-size: 14px;
        }

        .rating-score {
            font-weight: 600;
            color: #333;
        }

        .review-info {
            color: #adb5bd;
        }

        /* 페이징 */
        .pagination-container {
            display: flex;
            justify-content: center;
            margin-top: 40px;
        }

        .pagination {
            display: flex;
		    flex-direction: row;        /* 명시적으로 가로 방향 지정 */
		    align-items: center;
		    gap: 8px;
		    flex-wrap: nowrap; 
        }

        .pagination a,
        .pagination span {
            display: inline-flex;
            white-space: nowrap;       /* 텍스트 줄바꿈 방지 */
   			flex-shrink: 0;
            align-items: center;
            justify-content: center;
            min-width: 40px;
            height: 40px;
            padding: 0 12px;
            border: 1px solid #dee2e6;
            border-radius: 8px;
            background: white;
            color: #6c757d;
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .pagination a:hover {
            border-color: #495fd1;
            color: #495fd1;
            background: rgba(73, 95, 209, 0.05);
        }

        .pagination .current {
            background: #495fd1;
            color: white;
            border-color: #495fd1;
        }

        .pagination .disabled {
            opacity: 0.5;
            cursor: not-allowed;
            pointer-events: none;
        }

        /* 빈 상태 */
        .empty-state {
            text-align: center;
            padding: 80px 20px;
            color: #6c757d;
        }

        .empty-state h3 {
            font-size: 20px;
            margin-bottom: 10px;
            color: #333;
        }

        /* 반응형 디자인 */
        @media (max-width: 768px) {
            .header {
                padding: 30px 20px;
            }

            .logo {
                font-size: 28px;
                margin-bottom: 25px;
            }

            .main-content {
                padding: 30px 15px;
            }

            .content-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }

            .filter-buttons {
                width: 100%;
                justify-content: center;
            }

            .product-grid {
                grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
                gap: 20px;
            }

            .search-input {
                font-size: 16px;
                padding: 12px 50px 12px 15px;
            }

            .search-btn {
                width: 40px;
                height: 40px;
            }
        }

        @media (max-width: 480px) {
            .product-grid {
                grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
                gap: 15px;
            }

            .filter-buttons {
                gap: 6px;
            }

            .filter-btn {
                font-size: 12px;
                padding: 6px 12px;
            }
        }
        
        
        
        
        
    </style>
</head>
<body>
    <!-- 헤더 -->
    
     <c:import url="../common/header.jsp" />
      
      <%--검색창인데 헤더 검색창이랑 중복됨 기능은 되므로 살려놓음 --%>
      <%--   <div class="search-container">
            <form class="search-form" action="${pageContext.request.contextPath}/products" method="get">
                <input type="text" class="search-input" 
                       placeholder="검색하실 상품명을 입력하세요" 
                       name="keyword" 
                       value="${param.keyword}">
                <!-- 기존 파라미터 유지 -->
                <c:if test="${not empty param.category}">
                    <input type="hidden" name="category" value="${param.category}">
                </c:if>
                <c:if test="${not empty param.sort}">
                    <input type="hidden" name="sort" value="${param.sort}">
                </c:if>
                <button type="submit" class="search-btn">🔍</button>
            </form>
        </div> --%>
    

    <!-- 메인 컨텐츠 -->
    <main class="main-content">
        <!-- 컨텐츠 헤더 -->
        <div class="content-header">
            <div class="content-info">
                <h1>상품리스트</h1>
                <div class="product-count">총 <span class="count-number">${totalCount > 0 ? totalCount : 0}</span>개의상품</div>
            </div>
            
            <!-- 필터 버튼 -->
            <div class="filter-buttons">
                <a href="?keyword=${param.keyword}&category=${param.category}&sort=newest&page=1" 
                   class="filter-btn ${param.sort == 'newest' ? 'active' : ''}">최신순</a>
                <a href="?keyword=${param.keyword}&category=${param.category}&sort=popular&page=1" 
                   class="filter-btn ${empty param.sort || param.sort == 'popular' ? 'active' : ''}">인기순</a>
                <a href="?keyword=${param.keyword}&category=${param.category}&sort=price-low&page=1" 
                   class="filter-btn ${param.sort == 'price-low' ? 'active' : ''}">낮은가격순</a>
                <a href="?keyword=${param.keyword}&category=${param.category}&sort=price-high&page=1" 
                   class="filter-btn ${param.sort == 'price-high' ? 'active' : ''}">높은가격순</a>
                <a href="?keyword=${param.keyword}&category=${param.category}&sort=rating&page=1" 
                   class="filter-btn ${param.sort == 'rating' ? 'active' : ''}">평점순</a>
            </div>
        </div>

        <!-- 상품 그리드 -->
        <div class="product-grid">
            <c:choose>
                <c:when test="${not empty list}">
                    <c:forEach var="product" items="${list}" varStatus="status">
                        <div class="product-card" onclick="goToProductDetail(${product.product_idx})">
                            <div class="product-image">
                                <c:choose>
                                    <c:when test="${not empty product.product_image_url && product.product_image_url != 'no_file'}">
                                        <img src="${pageContext.request.contextPath}/images/${product.product_image_url}" 
                                             alt="${product.product_name}"
                                             loading="lazy"
                                             onload="this.style.opacity=1"
                                             style="opacity: 0; transition: opacity 0.3s ease;">
                                    </c:when>
                                    <c:otherwise>
                                        <div class="no-image-placeholder">이미지 없음</div>
                                    </c:otherwise>
                                </c:choose>
                                
                                <!-- 배지 -->
                                <c:if test="${status.index % 3 == 0}">
                                    <div class="product-badge badge-new">신제품</div>
                                </c:if>
                                <c:if test="${status.index % 4 == 0}">
                                    <div class="product-badge badge-hot">인기</div>
                                </c:if>
                                
                                <!-- 위시리스트 버튼 -->
                                <button class="wishlist-btn" 
                                        data-product-id="${product.product_idx}" 
                                        onclick="event.stopPropagation(); toggleWishlist(this)">♡</button>
                            </div>
                            
                            <div class="product-info">
                                <div class="product-name">${product.product_name}</div>
                                <div class="product-price">
                                    <fmt:formatNumber value="${product.product_price}" pattern="#,###"/>원
                                </div>
                                <div class="product-rating">
                                    <span class="stars">★★★★☆</span>
                                    <span class="rating-score">4.${(status.index % 5) + 3}</span>
                                    <span class="review-info">리뷰 ${(status.index * 7) + 15}</span>
                                    <span class="review-info">♡ ${(status.index * 12) + 45}</span>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="empty-state">
                        <h3>등록된 상품이 없습니다</h3>
                        <p>새로운 상품이 곧 업데이트될 예정입니다.</p>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>


        <!-- 페이징 -->
        <div class="pagination-container">
            <div class="pagination">
                <!-- 데이터가 있고 페이징 정보가 있을 때 실제 페이징 -->
                <c:choose>
                    <c:when test="${not empty list && totalPage > 0}">
                        <!-- 처음으로 -->
                        <c:choose>
                            <c:when test="${currentPage > 1}">
                                <a href="?keyword=${param.keyword}&category=${param.category}&sort=${param.sort}&page=1">≪</a>
                            </c:when>
                            <c:otherwise>
                                <span class="disabled">≪</span>
                            </c:otherwise>
                        </c:choose>
                        
                        <!-- 이전 페이지 -->
                        <c:choose>
                            <c:when test="${currentPage > 1}">
                                <a href="?keyword=${param.keyword}&category=${param.category}&sort=${param.sort}&page=${currentPage-1}">‹</a>
                            </c:when>
                            <c:otherwise>
                                <span class="disabled">‹</span>
                            </c:otherwise>
                        </c:choose>
                        
                        <!-- 페이지 번호들 -->
                        <c:choose>
                            <c:when test="${not empty startPage && not empty endPage}">
                                <c:forEach var="pageNum" begin="${startPage}" end="${endPage}">
                                    <c:choose>
                                        <c:when test="${pageNum == currentPage}">
                                            <span class="current">${pageNum}</span>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="?keyword=${param.keyword}&category=${param.category}&sort=${param.sort}&page=${pageNum}">${pageNum}</a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <!-- 페이지 정보가 없을 때 기본 페이지만 표시 -->
                                <span class="current">1</span>
                            </c:otherwise>
                        </c:choose>
                        
                        <!-- 다음 페이지 -->
                        <c:choose>
                            <c:when test="${currentPage < totalPage}">
                                <a href="?keyword=${param.keyword}&category=${param.category}&sort=${param.sort}&page=${currentPage+1}">›</a>
                            </c:when>
                            <c:otherwise>
                                <span class="disabled">›</span>
                            </c:otherwise>
                        </c:choose>
                        
                        <!-- 마지막으로 -->
                        <c:choose>
                            <c:when test="${currentPage < totalPage && totalPage > 1}">
                                <a href="?keyword=${param.keyword}&category=${param.category}&sort=${param.sort}&page=${totalPage}">≫</a>
                            </c:when>
                            <c:otherwise>
                                <span class="disabled">≫</span>
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                    <c:otherwise>
                        <!-- 데이터가 없거나 페이징 정보가 없을 때 기본 페이징 -->
                        <span class="disabled">≪</span>
                        <span class="disabled">‹</span>
                        <span class="current">1</span>
                        <span class="disabled">›</span>
                        <span class="disabled">≫</span>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </main>

    <script>
        // 위시리스트 토글
        function toggleWishlist(btn) {
            btn.classList.toggle('active');
            if (btn.classList.contains('active')) {
                btn.innerHTML = '♥';
            } else {
                btn.innerHTML = '♡';
            }
            
            const productId = btn.getAttribute('data-product-id');
            console.log('위시리스트 토글:', productId);
            
            // 실제 구현시 Ajax로 위시리스트 상태 변경
            /*
            $.ajax({
                url: '/api/wishlist/toggle',
                method: 'POST',
                data: { productId: productId },
                success: function(response) {
                    console.log('위시리스트 업데이트 성공');
                }
            });
            */
        }
        
        // 상품 상세 페이지로 이동
        function goToProductDetail(productId) {
            console.log('상품 상세 보기:', productId);
             window.location.href = '/product/detail?id=' + productId;
        }
        
        // 이미지 로딩 에러 처리
        document.addEventListener('DOMContentLoaded', function() {
            const images = document.querySelectorAll('.product-image img');
            images.forEach(function(img) {
                img.addEventListener('error', function() {
                    this.parentNode.innerHTML = '<div class="no-image-placeholder">이미지 없음</div>';
                });
                
                // 이미지가 이미 로딩되었다면 즉시 표시
                if (img.complete) {
                    img.style.opacity = 1;
                }
            });
        });
    </script>
     <!-- footer -->
     <c:import url="../common/footer.jsp" />
    
</body>
</html>