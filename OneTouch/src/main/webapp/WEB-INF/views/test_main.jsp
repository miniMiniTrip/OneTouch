<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>OneTouch - 2030 남성을 위한 맞춤 뷰티 쇼핑몰</title>
    <meta name="description" content="해시태그 기반 맞춤 추천으로 나에게 딱 맞는 뷰티 제품을 찾아보세요" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/images/favicon.svg" />

    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/LineIcons.3.0.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/tiny-slider.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/glightbox.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
</head>

<body>
    <!-- Preloader -->
    <div class="preloader">
        <div class="preloader-inner">
            <div class="preloader-icon">
                <span></span>
                <span></span>
            </div>
        </div>
    </div>
    <!-- /End Preloader -->

    <!-- Start Header Area -->
<%-- 	<jsp:include page="/WEB-INF/views/common/header.jsp" /> --%>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
    <!-- End Header Area -->

    <!-- Start Hero Area -->
    <section class="hero-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-12 custom-padding-right">
                    <div class="slider-head">
                        <!-- Start Hero Slider -->
                        <div class="hero-slider">
                            <c:forEach var="banner" items="${mainBanners}">
                                <!-- Start Single Slider -->
                                <div class="single-slider" 
                                     style="background-image: url('${pageContext.request.contextPath}${banner.imageUrl}');">
                                    <div class="content">
                                        <h2>
                                            <c:if test="${not empty banner.subtitle}">
                                                <span>${banner.subtitle}</span>
                                            </c:if>
                                            ${banner.title}
                                        </h2>
                                        <p>${banner.description}</p>
                                        <c:if test="${not empty banner.salePrice}">
                                            <h3>
                                                <span>특가</span> 
                                                <fmt:formatNumber value="${banner.salePrice}" pattern="#,###"/>원
                                            </h3>
                                        </c:if>
                                        <div class="button">
                                            <a href="${banner.linkUrl}" class="btn">지금 구매하기</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Single Slider -->
                            </c:forEach>
                        </div>
                        <!-- End Hero Slider -->
                    </div>
                </div>
                <div class="col-lg-4 col-12">
                    <div class="row">
                        <c:forEach var="smallBanner" items="${smallBanners}">
                            <div class="col-lg-12 col-md-6 col-12 md-custom-padding">
                                <!-- Start Small Banner -->
                                <div class="hero-small-banner" 
                                     style="background-image: url('${pageContext.request.contextPath}${smallBanner.imageUrl}');">
                                    <div class="content">
                                        <h2>
                                            <c:if test="${not empty smallBanner.subtitle}">
                                                <span>${smallBanner.subtitle}</span>
                                            </c:if>
                                            ${smallBanner.title}
                                        </h2>
                                        <c:if test="${not empty smallBanner.salePrice}">
                                            <h3>
                                                <fmt:formatNumber value="${smallBanner.salePrice}" pattern="#,###"/>원
                                            </h3>
                                        </c:if>
                                    </div>
                                </div>
                                <!-- End Small Banner -->
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Hero Area -->

    <!-- Start Featured Categories Area (OneTouch: 해시태그 기반) -->
    <section class="featured-categories section">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2>인기 해시태그</h2>
                        <p>나에게 맞는 해시태그로 상품을 찾아보세요</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <c:forEach var="hashtag" items="${popularHashtags}">
                    <div class="col-lg-3 col-md-6 col-12">
                        <!-- Start Single Category -->
                        <div class="single-category">
                            <h3 class="heading">#${hashtag.name}</h3>
                            <ul>
                                <c:forEach var="product" items="${hashtag.topProducts}" end="4">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/product/detail/${product.productId}">
                                            ${product.name}
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                            <div class="button">
                                <a href="${pageContext.request.contextPath}/product/list?hashtagId=${hashtag.hashtagId}" 
                                   class="btn">더보기</a>
                            </div>
                        </div>
                        <!-- End Single Category -->
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>
    <!-- End Featured Categories Area -->

    <!-- Start Trending Product Area (OneTouch: 판매량 기반 베스트) -->
    <section class="trending-product section">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2>베스트 상품</h2>
                        <p>OneTouch에서 가장 인기있는 제품들을 만나보세요</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <c:forEach var="product" items="${bestProducts}">
                    <div class="col-lg-3 col-md-6 col-12">
                        <!-- Start Single Product -->
                        <div class="single-product">
                            <div class="product-image">
                                <img src="${pageContext.request.contextPath}${product.imageUrl}" 
                                     alt="${product.name}">
                                
                                <!-- 할인 태그 -->
                                <c:if test="${product.discountRate > 0}">
                                    <span class="sale-tag">-${product.discountRate}%</span>
                                </c:if>
                                
                                <!-- 신상품 태그 -->
                                <c:if test="${product.isNew}">
                                    <span class="new-tag">NEW</span>
                                </c:if>
                                
                                <div class="button">
                                    <a href="${pageContext.request.contextPath}/product/detail/${product.productId}" 
                                       class="btn">
                                        <i class="lni lni-cart"></i> 장바구니
                                    </a>
                                </div>
                            </div>
                            <div class="product-info">
                                <span class="category">${product.categoryName}</span>
                                <h4 class="title">
                                    <a href="${pageContext.request.contextPath}/product/detail/${product.productId}">
                                        ${product.name}
                                    </a>
                                </h4>
                                
                                <!-- 별점 -->
                                <ul class="review">
                                    <c:forEach begin="1" end="5" var="i">
                                        <li>
                                            <i class="lni lni-star${i <= product.avgRating ? '-filled' : ''}"></i>
                                        </li>
                                    </c:forEach>
                                    <li><span>${product.avgRating} (${product.reviewCount})</span></li>
                                </ul>
                                
                                <!-- 가격 -->
                                <div class="price">
                                    <c:choose>
                                        <c:when test="${product.discountRate > 0}">
                                            <span><fmt:formatNumber value="${product.salePrice}" pattern="#,###"/>원</span>
                                            <span class="discount-price">
                                                <fmt:formatNumber value="${product.price}" pattern="#,###"/>원
                                            </span>
                                        </c:when>
                                        <c:otherwise>
                                            <span><fmt:formatNumber value="${product.price}" pattern="#,###"/>원</span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                
                                <!-- 해시태그 (OneTouch 특화) -->
                                <c:if test="${not empty product.hashtags}">
                                    <div class="product-hashtags mt-2">
                                        <c:forEach var="hashtag" items="${product.hashtags}" end="2">
                                            <small class="badge bg-light text-dark me-1">
                                                #${hashtag}
                                            </small>
                                        </c:forEach>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                        <!-- End Single Product -->
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>
    <!-- End Trending Product Area -->

    <!-- Start Banner Area (OneTouch: 맞춤 추천 배너) -->
    <c:if test="${not empty user}">
        <section class="banner section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-12">
                        <div class="single-banner" 
                             style="background-image:url('${pageContext.request.contextPath}/assets/images/banner/banner-1-bg.jpg')">
                            <div class="content">
                                <h2>${user.mem_name}님을 위한 추천</h2>
                                <p>나의 피부 타입과 고민에 맞는 제품을 만나보세요</p>
                                <div class="button">
                                    <a href="${pageContext.request.contextPath}/user/mypage/recommendations" 
                                       class="btn">맞춤 추천 보기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-12">
                        <div class="single-banner custom-responsive-margin" 
                             style="background-image:url('${pageContext.request.contextPath}/assets/images/banner/banner-2-bg.jpg')">
                            <div class="content">
                                <h2>리뷰 작성하고 포인트 받기</h2>
                                <p>구매한 상품에 리뷰를 남기면 포인트를 드립니다</p>
                                <div class="button">
                                    <a href="${pageContext.request.contextPath}/user/mypage/orders" 
                                       class="btn">주문 내역 보기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </c:if>
    <!-- End Banner Area -->

    <!-- Start New Arrival Product Area (OneTouch: 신상품) -->
    <section class="trending-product section">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2>신상품</h2>
                        <p>막 출시된 따끈따끈한 신제품들</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <c:forEach var="product" items="${newProducts}">
                    <div class="col-lg-3 col-md-6 col-12">
                        <!-- Start Single Product -->
                        <div class="single-product">
                            <div class="product-image">
                                <img src="${pageContext.request.contextPath}${product.imageUrl}" 
                                     alt="${product.name}">
                                <span class="new-tag">NEW</span>
                                <div class="button">
                                    <a href="${pageContext.request.contextPath}/product/detail/${product.productId}" 
                                       class="btn">
                                        <i class="lni lni-cart"></i> 장바구니
                                    </a>
                                </div>
                            </div>
                            <div class="product-info">
                                <span class="category">${product.categoryName}</span>
                                <h4 class="title">
                                    <a href="${pageContext.request.contextPath}/product/detail/${product.productId}">
                                        ${product.name}
                                    </a>
                                </h4>
                                <ul class="review">
                                    <c:forEach begin="1" end="5" var="i">
                                        <li>
                                            <i class="lni lni-star${i <= product.avgRating ? '-filled' : ''}"></i>
                                        </li>
                                    </c:forEach>
                                    <li><span>${product.avgRating} (${product.reviewCount})</span></li>
                                </ul>
                                <div class="price">
                                    <span><fmt:formatNumber value="${product.price}" pattern="#,###"/>원</span>
                                </div>
                                <c:if test="${not empty product.hashtags}">
                                    <div class="product-hashtags mt-2">
                                        <c:forEach var="hashtag" items="${product.hashtags}" end="2">
                                            <small class="badge bg-light text-dark me-1">
                                                #${hashtag}
                                            </small>
                                        </c:forEach>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                        <!-- End Single Product -->
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>
    <!-- End New Arrival Product Area -->

    <!-- Start Shipping Info (OneTouch: 서비스 안내) -->
    <section class="shipping-info">
        <div class="container">
            <ul>
                <!-- Free Shipping -->
                <li>
                    <div class="media-icon">
                        <i class="lni lni-delivery"></i>
                    </div>
                    <div class="media-body">
                        <h5>무료 배송</h5>
                        <span>50,000원 이상 구매 시</span>
                    </div>
                </li>
                <!-- Money Return -->
                <li>
                    <div class="media-icon">
                        <i class="lni lni-support"></i>
                    </div>
                    <div class="media-body">
                        <h5>24/7 고객지원</h5>
                        <span>친절한 상담 서비스</span>
                    </div>
                </li>
                <!-- Support 24/7 -->
                <li>
                    <div class="media-icon">
                        <i class="lni lni-credit-cards"></i>
                    </div>
                    <div class="media-body">
                        <h5>안전한 결제</h5>
                        <span>토스페이먼츠 보안</span>
                    </div>
                </li>
                <!-- Safe Payment -->
                <li>
                    <div class="media-icon">
                        <i class="lni lni-reload"></i>
                    </div>
                    <div class="media-body">
                        <h5>간편 반품/교환</h5>
                        <span>7일 이내 무료 반품</span>
                    </div>
                </li>
            </ul>
        </div>
    </section>
    <!-- End Shipping Info -->

    <!-- Start Footer Area -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <!-- End Footer Area -->

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top">
        <i class="lni lni-chevron-up"></i>
    </a>

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
        });

        //========= Hero Slider 
        tns({
            container: '.hero-slider',
            slideBy: 'page',
            autoplay: true,
            autoplayButtonOutput: false,
            mouseDrag: true,
            gutter: 0,
            items: 1,
            nav: false,
            controls: true,
            controlsText: ['<i class="lni lni-chevron-left"></i>', '<i class="lni lni-chevron-right"></i>'],
        });

        //======== Tiny Slider For Product Carousel
        tns({
            container: '.product-carousel',
            slideBy: 'page',
            autoplay: false,
            autoplayButtonOutput: false,
            mouseDrag: true,
            gutter: 15,
            nav: true,
            controls: false,
            responsive: {
                0: {
                    items: 1,
                },
                540: {
                    items: 2,
                },
                768: {
                    items: 3,
                },
                992: {
                    items: 4,
                }
            }
        });
    </script>
</body>
</html>
