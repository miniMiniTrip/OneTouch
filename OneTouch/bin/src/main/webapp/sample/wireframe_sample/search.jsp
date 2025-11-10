<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>검색 결과 - OneTouch</title>
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

        .container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 40px;
        }

        .search-header {
            background: white;
            padding: 30px;
            border-radius: 12px;
            margin-bottom: 30px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }

        .search-title {
            font-size: 24px;
            color: #1a237e;
            margin-bottom: 20px;
        }

        .search-bar-large {
            display: flex;
            gap: 15px;
        }

        .search-input-large {
            flex: 1;
            padding: 15px 20px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 16px;
        }

        .search-input-large:focus {
            outline: none;
            border-color: #1a237e;
        }

        .search-btn-large {
            padding: 15px 40px;
            background: #1a237e;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
        }

        .search-btn-large:hover {
            background: #0d47a1;
        }

        .search-info {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }

        .search-result-text {
            font-size: 18px;
            color: #333;
        }

        .search-result-text strong {
            color: #1a237e;
        }

        .filter-section {
            display: flex;
            gap: 15px;
            align-items: center;
        }

        .filter-label {
            font-size: 14px;
            color: #666;
        }

        .filter-select {
            padding: 10px 15px;
            border: 1px solid #e0e0e0;
            border-radius: 6px;
            font-size: 14px;
            cursor: pointer;
        }

        .product-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 30px;
        }

        .product-card {
            background: white;
            border: 1px solid #e0e0e0;
            border-radius: 12px;
            overflow: hidden;
            cursor: pointer;
            transition: all 0.3s;
            position: relative;
        }

        .product-card:hover {
            box-shadow: 0 8px 24px rgba(26, 35, 126, 0.15);
            transform: translateY(-5px);
            border-color: #1a237e;
        }

        .product-image {
            width: 100%;
            height: 280px;
            background: #f8f9fa;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
        }

        .product-image::before {
            content: '';
            position: absolute;
            top: 20px;
            left: 20px;
            right: 20px;
            bottom: 20px;
            border: 2px dashed #ddd;
        }

        .product-image span {
            color: #999;
            font-size: 14px;
            z-index: 1;
        }

        .sale-tag {
            position: absolute;
            top: 15px;
            right: 15px;
            padding: 6px 12px;
            border-radius: 6px;
            font-size: 12px;
            font-weight: bold;
            z-index: 2;
            background: #d32f2f;
            color: white;
        }

        .product-info {
            padding: 20px;
        }

        .product-category {
            font-size: 13px;
            color: #999;
            margin-bottom: 8px;
        }

        .product-name {
            font-size: 17px;
            font-weight: 600;
            color: #333;
            margin-bottom: 12px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .product-review {
            display: flex;
            align-items: center;
            gap: 5px;
            margin-bottom: 12px;
            font-size: 14px;
            color: #ffa726;
        }

        .product-price {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .price-current {
            font-size: 20px;
            font-weight: bold;
            color: #1a237e;
        }

        .price-original {
            font-size: 15px;
            color: #999;
            text-decoration: line-through;
        }

        .product-hashtags {
            margin-top: 12px;
            display: flex;
            flex-wrap: wrap;
            gap: 6px;
        }

        .badge {
            padding: 4px 10px;
            background: #e8eaf6;
            color: #1a237e;
            border-radius: 4px;
            font-size: 12px;
            font-weight: 500;
        }

        .no-result {
            text-align: center;
            padding: 80px 20px;
            background: white;
            border-radius: 12px;
        }

        .no-result-icon {
            font-size: 80px;
            margin-bottom: 20px;
        }

        .no-result h3 {
            font-size: 24px;
            color: #333;
            margin-bottom: 15px;
        }

        .no-result p {
            font-size: 16px;
            color: #666;
            margin-bottom: 30px;
        }

        .btn {
            padding: 12px 30px;
            background: #1a237e;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
        }

        .btn:hover {
            background: #0d47a1;
        }

        .pagination {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 50px;
        }

        .page-btn {
            width: 40px;
            height: 40px;
            border: 1px solid #e0e0e0;
            background: white;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            transition: all 0.3s;
        }

        .page-btn:hover {
            border-color: #1a237e;
            color: #1a237e;
        }

        .page-btn.active {
            background: #1a237e;
            color: white;
            border-color: #1a237e;
        }

        @media (max-width: 1200px) {
            .product-grid {
                grid-template-columns: repeat(3, 1fr);
            }
        }

        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }

            .product-grid {
                grid-template-columns: repeat(2, 1fr);
                gap: 20px;
            }

            .search-info {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }
        }

        @media (max-width: 480px) {
            .product-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp" %>

    <%
        String keyword = request.getParameter("keyword");
        if (keyword == null) keyword = "";
        
        // 실제로는 DAO에서 검색 결과 가져오기
        // List<Product> products = productDAO.searchProducts(keyword);
    %>

    <div class="container">
        <!-- 검색 헤더 -->
        <div class="search-header">
            <h2 class="search-title">🔍 상품 검색</h2>
            <form action="search.jsp" method="get" class="search-bar-large">
                <input type="text" 
                       name="keyword" 
                       class="search-input-large" 
                       placeholder="상품명 또는 해시태그로 검색하세요"
                       value="${param.keyword}">
                <button type="submit" class="search-btn-large">검색</button>
            </form>
        </div>

        <c:choose>
            <c:when test="${not empty param.keyword}">
                <!-- 검색 정보 & 필터 -->
                <div class="search-info">
                    <div class="search-result-text">
                        '<strong>${param.keyword}</strong>' 검색 결과 <strong>8</strong>개
                    </div>
                    <div class="filter-section">
                        <span class="filter-label">정렬:</span>
                        <select class="filter-select" onchange="sortProducts(this.value)">
                            <option value="latest">최신순</option>
                            <option value="popular">인기순</option>
                            <option value="price-low">낮은 가격순</option>
                            <option value="price-high">높은 가격순</option>
                            <option value="review">리뷰 많은순</option>
                        </select>
                    </div>
                </div>

                <!-- 검색 결과 -->
                <div class="product-grid">
                    <!-- 샘플 데이터 (실제로는 DB에서 가져오기) -->
                    <div class="product-card" onclick="location.href='product-detail.jsp?id=1'">
                        <div class="product-image">
                            <span class="sale-tag">-30%</span>
                            <span>상품 이미지</span>
                        </div>
                        <div class="product-info">
                            <div class="product-category">스킨케어</div>
                            <div class="product-name">히아루론산 수분 보습 세럼</div>
                            <div class="product-review">⭐ 4.8 (2,345)</div>
                            <div class="product-price">
                                <span class="price-current">31,500원</span>
                                <span class="price-original">45,000원</span>
                            </div>
                            <div class="product-hashtags">
                                <span class="badge">#수분크림</span>
                                <span class="badge">#민감성</span>
                            </div>
                        </div>
                    </div>

                    <div class="product-card" onclick="location.href='product-detail.jsp?id=2'">
                        <div class="product-image">
                            <span class="sale-tag">-25%</span>
                            <span>상품 이미지</span>
                        </div>
                        <div class="product-info">
                            <div class="product-category">클렌징</div>
                            <div class="product-name">약산성 폼 클렌저</div>
                            <div class="product-review">⭐ 4.7 (1,892)</div>
                            <div class="product-price">
                                <span class="price-current">18,000원</span>
                                <span class="price-original">24,000원</span>
                            </div>
                            <div class="product-hashtags">
                                <span class="badge">#클렌징</span>
                                <span class="badge">#저자극</span>
                            </div>
                        </div>
                    </div>

                    <div class="product-card" onclick="location.href='product-detail.jsp?id=3'">
                        <div class="product-image">
                            <span class="sale-tag">-20%</span>
                            <span>상품 이미지</span>
                        </div>
                        <div class="product-info">
                            <div class="product-category">선케어</div>
                            <div class="product-name">올인원 선 에센스 SPF50+</div>
                            <div class="product-review">⭐ 4.9 (3,124)</div>
                            <div class="product-price">
                                <span class="price-current">26,000원</span>
                                <span class="price-original">32,500원</span>
                            </div>
                            <div class="product-hashtags">
                                <span class="badge">#선크림</span>
                                <span class="badge">#무백탁</span>
                            </div>
                        </div>
                    </div>

                    <div class="product-card" onclick="location.href='product-detail.jsp?id=4'">
                        <div class="product-image">
                            <span class="sale-tag">-15%</span>
                            <span>상품 이미지</span>
                        </div>
                        <div class="product-info">
                            <div class="product-category">스킨케어</div>
                            <div class="product-name">나이아신아마이드 토너</div>
                            <div class="product-review">⭐ 4.6 (987)</div>
                            <div class="product-price">
                                <span class="price-current">24,000원</span>
                                <span class="price-original">28,000원</span>
                            </div>
                            <div class="product-hashtags">
                                <span class="badge">#토너</span>
                                <span class="badge">#미백</span>
                            </div>
                        </div>
                    </div>

                    <div class="product-card" onclick="location.href='product-detail.jsp?id=5'">
                        <div class="product-image">
                            <span>상품 이미지</span>
                        </div>
                        <div class="product-info">
                            <div class="product-category">스킨케어</div>
                            <div class="product-name">세라마이드 장벽 크림</div>
                            <div class="product-review">⭐ 4.8 (234)</div>
                            <div class="product-price">
                                <span class="price-current">35,000원</span>
                            </div>
                            <div class="product-hashtags">
                                <span class="badge">#크림</span>
                                <span class="badge">#장벽강화</span>
                            </div>
                        </div>
                    </div>

                    <div class="product-card" onclick="location.href='product-detail.jsp?id=6'">
                        <div class="product-image">
                            <span>상품 이미지</span>
                        </div>
                        <div class="product-info">
                            <div class="product-category">헤어케어</div>
                            <div class="product-name">볼륨 샴푸</div>
                            <div class="product-review">⭐ 4.7 (156)</div>
                            <div class="product-price">
                                <span class="price-current">22,000원</span>
                            </div>
                            <div class="product-hashtags">
                                <span class="badge">#샴푸</span>
                                <span class="badge">#탈모케어</span>
                            </div>
                        </div>
                    </div>

                    <div class="product-card" onclick="location.href='product-detail.jsp?id=7'">
                        <div class="product-image">
                            <span>상품 이미지</span>
                        </div>
                        <div class="product-info">
                            <div class="product-category">스킨케어</div>
                            <div class="product-name">비타민C 브라이트닝 토너</div>
                            <div class="product-review">⭐ 4.9 (189)</div>
                            <div class="product-price">
                                <span class="price-current">28,000원</span>
                            </div>
                            <div class="product-hashtags">
                                <span class="badge">#비타민C</span>
                                <span class="badge">#미백</span>
                            </div>
                        </div>
                    </div>

                    <div class="product-card" onclick="location.href='product-detail.jsp?id=8'">
                        <div class="product-image">
                            <span>상품 이미지</span>
                        </div>
                        <div class="product-info">
                            <div class="product-category">클렌징</div>
                            <div class="product-name">딥 클렌징 오일</div>
                            <div class="product-review">⭐ 4.6 (98)</div>
                            <div class="product-price">
                                <span class="price-current">25,000원</span>
                            </div>
                            <div class="product-hashtags">
                                <span class="badge">#클렌징오일</span>
                                <span class="badge">#딥클렌징</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 페이지네이션 -->
                <div class="pagination">
                    <button class="page-btn">‹</button>
                    <button class="page-btn active">1</button>
                    <button class="page-btn">2</button>
                    <button class="page-btn">3</button>
                    <button class="page-btn">›</button>
                </div>
            </c:when>
            <c:otherwise>
                <!-- 검색어 없을 때 -->
                <div class="no-result">
                    <div class="no-result-icon">🔍</div>
                    <h3>검색어를 입력해주세요</h3>
                    <p>원하시는 상품을 찾아보세요</p>
                    <a href="index.jsp" class="btn">홈으로</a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <%@ include file="footer.jsp" %>

    <script>
        function sortProducts(sortType) {
            const currentUrl = new URL(window.location.href);
            currentUrl.searchParams.set('sort', sortType);
            window.location.href = currentUrl.toString();
        }
    </script>
</body>
</html>