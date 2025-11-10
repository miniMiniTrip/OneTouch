<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>커뮤니티</title>
    <meta name="description" content="해시태그 기반 맞춤 추천으로 나에게 딱 맞는 뷰티 제품을 찾아보세요" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/images/favicon.svg" />

    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/LineIcons.3.0.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/tiny-slider.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/glightbox.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
  <style type="text/css">
  
  table {
  border-collapse: collapse; /* 테두리 겹침 제거 */
  width: 100%;
  table-layout: fixed; /* 열 너비 고정, 균등 분배 */
}

th, td {
  border: 1px solid #aaa; /* 테두리 선명하게 */
  padding: 8px 12px; /* 셀 안 여백 추가 */
  text-align: left; /* 왼쪽 정렬 */
  word-wrap: break-word; /* 긴 텍스트 줄 바꿈 */
}

thead {
  background-color: #f2f2f2; /* 헤더 배경색 */
  font-weight: bold;
}
</style>  

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

    <!-- Start 커뮤니티  -->
    <section class="featured-categories section">
        <div class="container">
        
        <div>커뮤니티</div>
		<div style="display: flex; gap: 10px;">
		  <a href="#">전체</a>
		  <a href="#">스킨에디터</a>
		  <a href="#">리뷰(구매자 전용)</a>
		  <a href="#">자유게시판</a>
		</div>
	        
	    <table border="1" style="border-collapse: collapse;">
	     		<tr>
	     			<th>커뮤니티번호</th>
	     			<th>회원번호</th>
	     			<th>카테고리티번호</th>
	     			<th>내용</th>
	     		</tr>
	     		<c:forEach var="postVo" items="${postVo_array }">
	     	<tr>
	     		<td>
	     			${postVo.post_idx }
	     		</td>
	     		<td>
	     			${postVo.mem_idx }
	     		</td>
	     		<td>
	     			${postVo.post_category }
	     		</td>
	     		<td>
	     			${postVo.post_content }
	     		</td>
	     		
	     		<td>
	     			${postVo.post_image }
	     		</td>
	     		<td>
	     			${postVo.post_like }
	     		</td>
	     		<td>
	     			${postVo.post_comment_count }
	     		</td>
	     		
	     	</tr>
	     	<tr>
	     	<td>
	     	
	     	</td>
	     	</tr>
	     		</c:forEach>
	     </table>
        
        
        
        </div>
    </section>
    <!-- End 커뮤니티  -->


	


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
