<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>해시태그 입력 테스트 - OneTouch</title>
    <meta name="description" content="2030 남성 뷰티 쇼핑몰 OneTouch">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/images/favicon.svg">

    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/LineIcons.3.0.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/tiny-slider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/glightbox.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
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
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
    <!-- End Header Area -->
    
    <div class="container">
	  <h1>Hello World!</h1>
	  
	      <!-- 입력 -->
	   <div>
	   	<form>
	    	<input class="form-inline" name="hashtag">
	    	<input type="button" class="form-inline" name="click" value="검색" onclick="search_hashtag(this.form);">
	    </form>
	   </div>
	    
	  <div class="row" id="tag_list">
	    <div class="col-sm-12" style="background-color:yellow;">
	      <p>Lorem ipsum...</p>
	    </div>
	    <div class="col-sm-12" style="background-color:pink;">
	      <p>Sed ut perspiciatis...</p>
	    </div>
	  </div>
	</div>
    <!-- Start Footer Area -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <!-- End Footer Area -->
        <!-- ========================= JS here ========================= -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/tiny-slider.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/glightbox.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
    
    <script>
        // 프리로더 제거
        window.addEventListener('load', function() {
            const preloader = document.querySelector('.preloader');
            if (preloader) {
                preloader.style.opacity = '0';
                setTimeout(() => {
                    preloader.style.display = 'none';
                }, 500);
            }
        });
        
    </script>
</body>
</html>