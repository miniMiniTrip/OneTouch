<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OneTouch - 남성 뷰티 쇼핑몰</title>
    <meta name="description" content="해시태그 기반 맞춤 추천으로 나에게 딱 맞는 뷰티 제품을 찾아보세요" />
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Malgun Gothic', 'Apple SD Gothic Neo', sans-serif;
            background: #ffffff;
            color: #333;
        }

        /* 이벤트 배너 섹션 */
        .event-banner-section {
            position: relative;
            width: 100%;
            height: 500px;
            overflow: hidden;
            background: #1a237e;
        }

        .event-banner-container {
            position: relative;
            width: 100%;
            height: 100%;
        }

        .event-banner {
            position: absolute;
            width: 100%;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            opacity: 0;
            transition: opacity 0.5s ease-in-out;
        }

        .event-banner.active {
            opacity: 1;
        }

        .event-banner#banner1 {
            background: linear-gradient(135deg, #1a237e 0%, #3949ab 100%);
        }

        .event-banner#banner2 {
            background: linear-gradient(135deg, #283593 0%, #3f51b5 100%);
        }

        .event-banner#banner3 {
            background: linear-gradient(135deg, #1565c0 0%, #42a5f5 100%);
        }

        .banner-content {
            text-align: center;
            color: white;
            max-width: 800px;
            padding: 40px;
        }

        .banner-content h2 {
            font-size: 48px;
            margin-bottom: 20px;
            font-weight: bold;
        }

        .banner-content p {
            font-size: 22px;
            margin-bottom: 30px;
            opacity: 0.95;
        }

        .banner-btn {
            background: white;
            color: #1a237e;
            border: none;
            padding: 16px 45px;
            font-size: 18px;
            font-weight: bold;
            border-radius: 30px;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-block;
        }

        .banner-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(255, 255, 255, 0.3);
        }

        .banner-controls {
            position: absolute;
            bottom: 30px;
            left: 50%;
            transform: translateX(-50%);
            display: flex;
            align-items: center;
            gap: 20px;
            z-index: 10;
        }

        .banner-arrow {
            background: rgba(255, 255, 255, 0.3);
            border: none;
            color: white;
            width: 45px;
            height: 45px;
            border-radius: 50%;
            font-size: 24px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .banner-arrow:hover {
            background: rgba(255, 255, 255, 0.5);
        }

        .banner-dots {
            display: flex;
            gap: 10px;
        }

        .dot {
            width: 12px;
            height: 12px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.4);
            cursor: pointer;
            transition: all 0.3s;
        }

        .dot.active {
            background: white;
            width: 30px;
            border-radius: 6px;
        }

        /* 인기 해시태그 섹션 */
        .hashtag-section {
            background: linear-gradient(135deg, #f5f7fa 0%, #ffffff 100%);
            padding: 70px 0;
            margin-bottom: 60px;
        }

        .hashtag-container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 0 40px;
            text-align: center;
        }

        .section-title {
            text-align: center;
            margin-bottom: 50px;
        }

        .section-title h2 {
            font-size: 36px;
            color: #1a237e;
            margin-bottom: 15px;
            font-weight: bold;
        }

        .section-title p {
            font-size: 18px;
            color: #666;
        }

        .hashtag-list {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            justify-content: center;
            align-items: center;
        }

        .hashtag-btn {
            background: white;
            border: 2px solid #1a237e;
            color: #1a237e;
            padding: 12px 28px;
            border-radius: 25px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-block;
        }

        .hashtag-btn:hover {
            background: #1a237e;
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(26, 35, 126, 0.2);
        }

        /* 컨테이너 */
        .container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 0 40px;
        }

        /* 섹션 스타일 */
        .section {
            margin-bottom: 80px;
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 40px;
            padding-bottom: 15px;
            border-bottom: 2px solid #1a237e;
        }

        .section-header-title {
            font-size: 28px;
            font-weight: bold;
            color: #1a237e;
        }

        .view-more {
            color: #666;
            text-decoration: none;
            font-size: 15px;
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .view-more:hover {
            color: #1a237e;
        }

        /* 제품 그리드 */
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
            height: 320px;
            background: #f8f9fa;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            overflow: hidden;
        }

        .product-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .product-image::before {
            content: '';
            position: absolute;
            top: 20px;
            left: 20px;
            right: 20px;
            bottom: 20px;
            border: 2px dashed #ddd;
            z-index: 0;
        }

        .product-image span {
            color: #999;
            font-size: 14px;
            z-index: 1;
        }

        .sale-tag, .new-tag {
            position: absolute;
            top: 15px;
            right: 15px;
            padding: 6px 12px;
            border-radius: 6px;
            font-size: 12px;
            font-weight: bold;
            z-index: 2;
        }

        .sale-tag {
            background: #d32f2f;
            color: white;
        }

        .new-tag {
            background: #4caf50;
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

        .product-description {
            font-size: 14px;
            color: #666;
            margin-bottom: 12px;
            height: 40px;
            overflow: hidden;
            line-height: 1.5;
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

        /* 서비스 안내 섹션 */
        .shipping-info {
            background: #f5f7fa;
            padding: 50px 0;
            margin-top: 80px;
        }

        .shipping-info ul {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 30px;
            list-style: none;
            max-width: 1400px;
            margin: 0 auto;
            padding: 0 40px;
        }

        .shipping-info li {
            display: flex;
            align-items: center;
            gap: 20px;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }

        .media-icon {
            font-size: 40px;
            color: #1a237e;
        }

        .media-body h5 {
            font-size: 18px;
            font-weight: 600;
            color: #333;
            margin-bottom: 5px;
        }

        .media-body span {
            font-size: 14px;
            color: #666;
        }

        /* 반응형 */
        @media (max-width: 1200px) {
            .product-grid {
                grid-template-columns: repeat(3, 1fr);
            }
        }

        @media (max-width: 768px) {
            .container {
                padding: 0 20px;
            }

            .event-banner-section {
                height: 350px;
            }

            .banner-content h2 {
                font-size: 28px;
            }

            .banner-content p {
                font-size: 16px;
            }

            .product-grid {
                grid-template-columns: repeat(2, 1fr);
                gap: 20px;
            }

            .shipping-info ul {
                grid-template-columns: repeat(2, 1fr);
                gap: 20px;
            }

            .hashtag-container {
                padding: 0 20px;
            }
        }

        @media (max-width: 480px) {
            .product-grid {
                grid-template-columns: 1fr;
            }

            .shipping-info ul {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <%
        // 세션에서 로그인 정보 가져오기
        String userId = (String) session.getAttribute("userId");
        String userName = (String) session.getAttribute("userName");
        boolean isLoggedIn = (userId != null);
    %>

    <%-- 헤더 include --%>
    <%@ include file="header.jsp" %>

    <!-- 이벤트 배너 섹션 -->
    <section class="event-banner-section">
        <div class="event-banner-container">
            <div class="event-banner active" id="banner1">
                <div class="banner-content">
                    <h2>🎯 AI 피부진단 무료 체험</h2>
                    <p>나에게 딱 맞는 스킨케어 루틴을 찾아보세요</p>
                    <a href="diagnosis.jsp" class="banner-btn">지금 진단하기</a>
                </div>
            </div>
            <div class="event-banner" id="banner2">
                <div class="banner-content">
                    <h2>🎁 신규 회원 특별 혜택</h2>
                    <p>첫 구매 시 15% 할인 쿠폰 증정</p>
                    <a href="signup.jsp" class="banner-btn">회원가입하기</a>
                </div>
            </div>
            <div class="event-banner" id="banner3">
                <div class="banner-content">
                    <h2>💰 여름 시즌 특가 세일</h2>
                    <p>선케어 제품 최대 30% 할인</p>
                    <a href="products.jsp?category=suncare" class="banner-btn">특가 보러가기</a>
                </div>
            </div>
        </div>
        <div class="banner-controls">
            <button class="banner-arrow prev" onclick="changeBanner(-1)">‹</button>
            <div class="banner-dots">
                <span class="dot active" onclick="showBanner(0)"></span>
                <span class="dot" onclick="showBanner(1)"></span>
                <span class="dot" onclick="showBanner(2)"></span>
            </div>
            <button class="banner-arrow next" onclick="changeBanner(1)">›</button>
        </div>
    </section>

    <!-- 인기 해시태그 섹션 -->
    <section class="hashtag-section">
        <div class="hashtag-container">
            <div class="section-title">
                <h2>🔥 인기 해시태그</h2>
                <p>나에게 맞는 해시태그로 상품을 찾아보세요</p>
            </div>
            <div class="hashtag-list">
                <a href="search.jsp?keyword=수분크림" class="hashtag-btn">#수분크림</a>
                <a href="search.jsp?keyword=민감성피부" class="hashtag-btn">#민감성피부</a>
                <a href="search.jsp?keyword=선크림추천" class="hashtag-btn">#선크림추천</a>
                <a href="search.jsp?keyword=모공케어" class="hashtag-btn">#모공케어</a>
                <a href="search.jsp?keyword=남성스킨케어" class="hashtag-btn">#남성스킨케어</a>
                <a href="search.jsp?keyword=여드름케어" class="hashtag-btn">#여드름케어</a>
                <a href="search.jsp?keyword=두피케어" class="hashtag-btn">#두피케어</a>
                <a href="search.jsp?keyword=올인원" class="hashtag-btn">#올인원</a>
                <a href="search.jsp?keyword=신상품" class="hashtag-btn">#신상품</a>
                <a href="search.jsp?keyword=베스트셀러" class="hashtag-btn">#베스트셀러</a>
            </div>
        </div>
    </section>

    <!-- 메인 컨텐츠 -->
    <div class="container">
        <!-- 베스트상품 섹션 -->
        <section class="section">
            <div class="section-header">
                <h2 class="section-header-title">베스트 상품</h2>
                <a href="products.jsp?sort=best" class="view-more">더보기 ›</a>
            </div>
            <div class="product-grid">
                <%-- 실제로는 DAO에서 데이터 가져오기 --%>
                <div class="product-card" onclick="location.href='product-detail.jsp?id=1'">
                    <div class="product-image">
                        <span class="sale-tag">-30%</span>
                        <span>상품 이미지</span>
                    </div>
                    <div class="product-info">
                        <div class="product-category">스킨케어</div>
                        <div class="product-name">히아루론산 수분 보습 세럼</div>
                        <div class="product-description">깊은 보습과 진정 효과로 촉촉한 피부를 유지</div>
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
                        <div class="product-description">피부 장벽을 보호하는 순한 클렌징</div>
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
                        <div class="product-description">끈적임 없는 가볍고 산뜻한 텍스처</div>
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
                        <div class="product-description">피부 톤 개선과 모공 케어</div>
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
            </div>
        </section>

        <!-- 신상품 섹션 -->
        <section class="section">
            <div class="section-header">
                <h2 class="section-header-title">신상품</h2>
                <a href="products.jsp?sort=new" class="view-more">더보기 ›</a>
            </div>
            <div class="product-grid">
                <div class="product-card" onclick="location.href='product-detail.jsp?id=5'">
                    <div class="product-image">
                        <span class="new-tag">NEW</span>
                        <span>상품 이미지</span>
                    </div>
                    <div class="product-info">
                        <div class="product-category">스킨케어</div>
                        <div class="product-name">세라마이드 장벽 크림</div>
                        <div class="product-description">피부 장벽 강화 집중 케어</div>
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
                        <span class="new-tag">NEW</span>
                        <span>상품 이미지</span>
                    </div>
                    <div class="product-info">
                        <div class="product-category">헤어케어</div>
                        <div class="product-name">볼륨 샴푸</div>
                        <div class="product-description">모근 강화와 탈모 예방</div>
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
                        <span class="new-tag">NEW</span>
                        <span>상품 이미지</span>
                    </div>
                    <div class="product-info">
                        <div class="product-category">스킨케어</div>
                        <div class="product-name">비타민C 브라이트닝 토너</div>
                        <div class="product-description">피부 톤 개선과 광채</div>
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
                        <span class="new-tag">NEW</span>
                        <span>상품 이미지</span>
                    </div>
                    <div class="product-info">
                        <div class="product-category">클렌징</div>
                        <div class="product-name">딥 클렌징 오일</div>
                        <div class="product-description">메이크업과 미세먼지 완벽 제거</div>
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
        </section>
    </div>

    <!-- 서비스 안내 -->
    <section class="shipping-info">
        <div class="container">
            <ul>
                <li>
                    <div class="media-icon">🚚</div>
                    <div class="media-body">
                        <h5>무료 배송</h5>
                        <span>50,000원 이상 구매 시</span>
                    </div>
                </li>
                <li>
                    <div class="media-icon">💬</div>
                    <div class="media-body">
                        <h5>24/7 고객지원</h5>
                        <span>친절한 상담 서비스</span>
                    </div>
                </li>
                <li>
                    <div class="media-icon">💳</div>
                    <div class="media-body">
                        <h5>안전한 결제</h5>
                        <span>토스페이먼츠 보안</span>
                    </div>
                </li>
                <li>
                    <div class="media-icon">🔄</div>
                    <div class="media-body">
                        <h5>간편 반품/교환</h5>
                        <span>7일 이내 무료 반품</span>
                    </div>
                </li>
            </ul>
        </div>
    </section>

    <%-- 푸터 include --%>
    <%@ include file="footer.jsp" %>

    <script>
        let currentBanner = 0;
        const totalBanners = 3;

        // 배너 자동 슬라이드
        setInterval(() => {
            changeBanner(1);
        }, 5000);

        // 배너 변경
        function changeBanner(direction) {
            currentBanner = (currentBanner + direction + totalBanners) % totalBanners;
            showBanner(currentBanner);
        }

        // 특정 배너 표시
        function showBanner(index) {
            currentBanner = index;
            const banners = document.querySelectorAll('.event-banner');
            const dots = document.querySelectorAll('.dot');
            
            banners.forEach((banner, i) => {
                banner.classList.toggle('active', i === index);
            });

            dots.forEach((dot, i) => {
                dot.classList.toggle('active', i === index);
            });
        }
    </script>
</body>
</html>