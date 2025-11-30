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

<style>
	    /* 인기 해시 태그 영역  */
		.hashtag-div{
			display: flex;
 		    justify-content: center;  /* 가로 가운데 */
		}
	    .hashtag-list {
	    	width : 500px !important;
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

        /* 상품 이미지 영역 */
        .product-div{
			display: flex;
 		    justify-content: center;  /* 가로 가운데 */
		}
        .product-image {
            position: relative;
            
            border-radius: 8px;
            height: 280px;
            background: #f5f5f5;
        }

        .product-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .product-image:hover img {
            transform: scale(1.05);
        }

        .no-image {
            width: 100%;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #e0e0e0;
            color: #999;
            font-size: 14px;
        }

        
        /* 상품 카드 기본 스타일 */
        .single-product {
            margin-bottom: 30px;
            transition: all 0.3s ease;
            height: 500px;
        }

        .single-product:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        /* 상품카드에 들어가는 해시 태그 css */
        .product-hashtags {
            display: flex;
            flex-wrap: wrap;
            gap: 3px;
            margin: 10px 0;
        }

        .hashtag-badge {
            display: inline-block;
            padding: 1px 4px; /* 패딩 대폭 줄임 */
            background-color: #f0f0f0;
            color: #555;
            border-radius: 8px; /* 더 작은 둥근 모서리 */
            font-size: 11px; /* 폰트 크기 줄임 */
            text-decoration: none;
            transition: all 0.2s ease;
            border: 1px solid #e0e0e0;
            line-height: 1.2; /* 줄간격 조정 */
        }

        .hashtag-badge:hover {
            background-color: #5c6bc0;
            color: white;
            border-color: #5c6bc0;
            transform: translateY(-1px); /* 호버 이동 거리 줄임 */
            box-shadow: 0 1px 3px rgba(92, 107, 192, 0.3); /* 그림자 줄임 */
        }

        .hashtag-badge:active {
            transform: translateY(0);
        }
</style>
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
            <div class="row hashtag-div">
                            <div class="hashtag-list">
                <c:forEach var="hashtag" items="${hashtagRank}">
                            	<a class="hashtag-btn" href="${pageContext.request.contextPath}/hashtag/search.do?hashtag_idx=${hashtag.hashtag_idx}">#${hashtag.hashtag_name }</a>
                </c:forEach>
                            </div>
                        <!-- End Single Category -->
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
 <!-- Start New Arrival Product Area (OneTouch: 신상품) -->
   
        <section class="banner section">
            <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2>신상품</h2>
                        <p>막 출시된 따끈따끈한 신제품들</p>
                    </div>
                </div>
            </div>
            <div class="row product-div" >
                <c:forEach var="product" items="${ProductVoList}">
                <div class="col-lg-3 col-md-6 col-12">
                        <!-- Start Single Product -->
                        <div class="single-product">
                            <div class="product-image">
                                <img src="${pageContext.request.contextPath}/images/products_list/${product.product_image_url}" 
                                     alt="${product.product_name}" onclick="location.href='${pageContext.request.contextPath}/product/detail?id=${product.product_idx}'">
                                <span class="new-tag">NEW</span>
                                <div class="button">
                                    <a href="" 
                                       class="btn">
                                        <i class="lni lni-cart"></i> 장바구니
                                    </a>
                                </div>
                            </div>
                            <div class="product-info">
                                <span class="category">${product.category_name}</span>
                                <h4 class="title">
                                    <a href="${pageContext.request.contextPath}/product/detail?id=${product.product_idx}">
                                        ${product.product_name}
                                    </a>
                                </h4>
                                <ul class="review">
                                    <c:forEach begin="1" end="5" var="i">
                                        <li>
                                            <i class="lni lni-star${i <= 4?'-filled':''}"></i>
                                        </li>
                                    </c:forEach>
                                    <li><span>4 (?)</span></li>
                                </ul>
                                <div class="price">
                                    <span><fmt:formatNumber value="${product.product_price}" pattern="#,###"/>원</span>
                                </div>
                                <!-- ⭐ 해시태그 추가 -->
                                <c:if test="${not empty product.hashtag_list}">
                                    <div class="product-hashtags" style="margin: 10px 0;">
                                        <c:forEach var="hashtag" items="${product.hashtag_list}">
                                        <a
                                            href="${pageContext.request.contextPath}/hashtag/search_products.do?hashtag_idx=${hashtag.hashtag_idx}"
                                            class="hashtag-badge"
                                            title="#${hashtag.hashtag_name} 상품 보기">
                                            #${hashtag.hashtag_name} </a>
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
    <!-- End Banner Area -->

    <!-- Start Banner Area (OneTouch: 맞춤 추천 배너) -->
    <section class="trending-product section">
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
        /* tns({
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
        }); */

        //======== Tiny Slider For Product Carousel
        /* tns({
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
        }); */
    </script>
</body>
</html>
