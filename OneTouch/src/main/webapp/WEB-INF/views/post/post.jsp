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

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/LineIcons.3.0.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/tiny-slider.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/glightbox.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
    
    <style>
        /* OneTouch 커뮤니티 스타일 */
        :root {
            --onetouch-navy: #000033;
            --onetouch-light-blue: #3366cc;
            --onetouch-accent: #ff3366;
            --onetouch-text: #333333;
            --onetouch-light-gray: #f4f5f7;
            --onetouch-border: #e0e0e0;
        }
        
        body {
            background-color: #f9f9f9;
            font-family: 'Noto Sans KR', sans-serif;
            color: var(--onetouch-text);
        }
        
        /* 커뮤니티 메인 스타일 */
        .community-content {
            max-width: 620px;
            margin: 0 auto;
            padding-bottom: 50px;
        }
        
        /* 상단 탭 내비게이션 */
        .community-tabs {
            display: flex;
            justify-content: space-around;
            border-bottom: 1px solid #ddd;
            margin-bottom: 20px;
            background-color: #fff;
            padding: 0;
            position: sticky; /* 스티키 헤더처럼 상단 고정 */
            top: 0;
            z-index: 100;
        }
        
        .community-tab-item {
            flex: 1;
            text-align: center;
            padding: 15px 5px;
            font-size: 15px;
            color: #666;
            cursor: pointer;
            position: relative;
            transition: all 0.3s ease;
        }
        
        .community-tab-item.active {
            color: var(--onetouch-navy);
            font-weight: 500;
        }
        
        .community-tab-item.active::after {
            content: '';
            position: absolute;
            bottom: -1px;
            left: 0;
            width: 100%;
            height: 2px;
            background-color: var(--onetouch-navy);
        }
        
        /* 게시물 스타일 */
        .community-post {
            background-color: #fff;
            border-radius: 0;
            overflow: hidden;
            margin-bottom: 10px;
        }
        
        .post-header {
            display: flex;
            align-items: center;
            padding: 12px 15px;
        }
        
        .profile-img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 10px;
        }
        
        .username {
            font-weight: 600;
            font-size: 14px;
            margin: 0;
            color: #333;
        }
        
        .post-actions {
            margin-left: auto;
        }
        
        .follow-btn {
            background: none;
            border: none;
            color: #999;
            cursor: pointer;
            font-size: 20px;
        }
        
        /* 이미지 캐러셀 */
        .image-carousel {
            position: relative;
            width: 100%;
            overflow: hidden;
        }
        
        .carousel-inner {
            display: flex;
            transition: transform 0.3s ease-in-out;
            width: 100%;
            /* 캐러셀 이미지가 세로로 길 때 영역을 유지하도록 설정 */
            aspect-ratio: 1 / 1.3333; /* 3:4 비율, 예시 */
        }
        
        .carousel-item {
            flex: 0 0 100%;
            width: 100%;
            height: 100%; /* 부모 높이에 맞춤 */
        }
        
        .post-image {
            width: 100%;
            height: 100%;
            display: block;
            object-fit: cover; /* 이미지가 잘리더라도 영역을 꽉 채움 */
        }
        
        .carousel-control {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            width: 32px; /* 버튼 크기 축소 */
            height: 32px;
            background-color: rgba(0, 0, 0, 0.4); /* 배경색 어둡게 */
            color: #fff; /* 아이콘 색상 흰색 */
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            z-index: 10;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
            opacity: 0.8;
            transition: opacity 0.3s;
            font-size: 14px;
        }
        
        .carousel-control:hover {
            opacity: 1;
        }
        
        .carousel-control.prev {
            left: 10px;
        }
        
        .carousel-control.next {
            right: 10px;
        }
        
        .carousel-indicators {
            position: absolute;
            bottom: 10px;
            left: 0;
            right: 0;
            display: flex;
            justify-content: center;
            gap: 5px;
            padding: 0;
            margin: 0;
        }
        
        .indicator {
            width: 7px; /* 인디케이터 크기 축소 */
            height: 7px;
            border-radius: 50%;
            background-color: rgba(255, 255, 255, 0.5);
            cursor: pointer;
            transition: background-color 0.3s;
        }
        
        .indicator.active {
            background-color: var(--onetouch-light-blue); /* 활성 인디케이터 색상 변경 */
        }
        
        /* 제품 정보 섹션 */
        .product-section {
            padding: 15px;
            border-top: 1px solid #f5f5f5;
            display: flex;
            overflow-x: auto;
            gap: 10px;
        }
        
        .product-card {
            flex: 0 0 auto;
            width: 85px;
            text-align: center;
        }
        
        .product-img {
            width: 100%;
            height: 85px;
            object-fit: cover;
            border-radius: 3px;
            margin-bottom: 5px;
        }
        
        .product-discount {
            color: var(--onetouch-accent);
            font-size: 11px;
            font-weight: 500;
            margin: 0;
        }
        
        .product-price {
            font-size: 12px;
            font-weight: 600;
            margin: 0;
            color: #333;
        }
        
        /* 게시물 콘텐츠 */
        .post-content {
            padding: 15px;
        }
        
        .post-likes {
            font-weight: 600;
            font-size: 14px;
            margin-bottom: 8px;
        }
        
        .post-text {
            font-size: 14px;
            margin-bottom: 8px;
        }
        
        .post-tags {
            color: var(--onetouch-light-blue);
            font-size: 13px;
            margin-bottom: 10px;
        }
        
        .post-time {
            color: #999;
            font-size: 12px;
            margin: 0;
        }
        
        /* 인터랙션 영역 */
        .post-interactions {
            display: flex;
            padding: 10px 15px;
            gap: 20px;
        }
        
        .interaction-btn {
            background: none;
            border: none;
            color: #333;
            font-size: 22px;
            cursor: pointer;
        }
        
        .interaction-btn.active {
            color: var(--onetouch-accent);
        }
        
        /* 댓글 입력 */
        .comment-input {
            padding: 10px 15px 15px;
            display: flex;
            align-items: center;
            border-top: 1px solid #f5f5f5;
        }
        
        .comment-input input {
            flex: 1;
            border: none;
            font-size: 14px;
            outline: none;
            padding: 8px 0;
        }
        
        .comment-input input::placeholder {
            color: #999;
        }
        
        .comment-submit {
            background: none;
            border: none;
            color: var(--onetouch-light-blue);
            font-weight: 600;
            font-size: 14px;
            cursor: pointer;
        }
        
        /* 페이지네이션 */
        .community-pagination {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
            gap: 5px;
        }
        
        .pagination-link {
            width: 30px;
            height: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 1px solid #ddd;
            color: #666;
            text-decoration: none;
            font-size: 13px;
        }
        
        .pagination-link.active {
            background-color: var(--onetouch-navy);
            color: #fff;
            border-color: var(--onetouch-navy);
        }
        
        /* 반응형 설정 */
        @media (max-width: 767px) {
            .community-content {
                padding: 0;
            }
        }
    </style>
</head>

<body>
    <div class="preloader">
        <div class="preloader-inner">
            <div class="preloader-icon">
                <span></span>
                <span></span>
            </div>
        </div>
    </div>
    <%@include file="/WEB-INF/views/common/header.jsp" %>
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">커뮤니티</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="${pageContext.request.contextPath}/"><i class="lni lni-home"></i> 홈</a></li>
                        <li>커뮤니티</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <section class="section">
        <div class="container">
            <div class="community-content">
                <div class="community-tabs">
                    <div class="community-tab-item active" data-tab="all">전체</div>
                    <div class="community-tab-item" data-tab="skineditor">스킨에디터</div>
                    <div class="community-tab-item" data-tab="review">리뷰</div>
                    <div class="community-tab-item" data-tab="free">자유게시판</div>
                </div>
                
                <div class="community-post">
                    <div class="post-header">
                        <img src="https://randomuser.me/api/portraits/women/44.jpg" alt="프로필" class="profile-img">
                        <p class="username">진유</p>
                        <div class="post-actions">
                            <button class="follow-btn">
                                <i class="fas fa-ellipsis-h"></i>
                            </button>
                        </div>
                    </div>
                    
                    <div class="image-carousel" id="carousel-1">
                        <div class="carousel-inner">
                            <div class="carousel-item">
                                <img src="https://via.placeholder.com/600x800?text=Image+1" alt="게시물 이미지" class="post-image">
                            </div>
                            <div class="carousel-item">
                                <img src="https://via.placeholder.com/600x800?text=Image+2" alt="게시물 이미지" class="post-image">
                            </div>
                            <div class="carousel-item">
                                <img src="https://via.placeholder.com/600x800?text=Image+3" alt="게시물 이미지" class="post-image">
                            </div>
                            <div class="carousel-item">
                                <img src="https://via.placeholder.com/600x800?text=Image+4" alt="게시물 이미지" class="post-image">
                            </div>
                            <div class="carousel-item">
                                <img src="https://via.placeholder.com/600x800?text=Image+5" alt="게시물 이미지" class="post-image">
                            </div>
                        </div>
                        
                        <div class="carousel-control prev" data-carousel="carousel-1">
                            <i class="fas fa-chevron-left"></i>
                        </div>
                        <div class="carousel-control next" data-carousel="carousel-1">
                            <i class="fas fa-chevron-right"></i>
                        </div>
                        
                        <div class="carousel-indicators" id="indicators-1">
                            <div class="indicator active" data-slide="0" data-carousel="carousel-1"></div>
                            <div class="indicator" data-slide="1" data-carousel="carousel-1"></div>
                            <div class="indicator" data-slide="2" data-carousel="carousel-1"></div>
                            <div class="indicator" data-slide="3" data-carousel="carousel-1"></div>
                            <div class="indicator" data-slide="4" data-carousel="carousel-1"></div>
                        </div>
                    </div>
                    
                    <div class="product-section">
                        <div class="product-card">
                            <img src="https://via.placeholder.com/100?text=제품" alt="제품" class="product-img">
                            <p class="product-discount">19% 할인</p>
                            <p class="product-price">55,900원</p>
                        </div>
                        <div class="product-card">
                            <img src="https://via.placeholder.com/100?text=제품" alt="제품" class="product-img">
                            <p class="product-discount">10% 할인</p>
                            <p class="product-price">25,800원</p>
                        </div>
                        <div class="product-card">
                            <img src="https://via.placeholder.com/100?text=제품" alt="제품" class="product-img">
                            <p class="product-price">33,000원</p>
                        </div>
                        <div class="product-card">
                            <img src="https://via.placeholder.com/100?text=제품" alt="제품" class="product-img">
                            <p class="product-discount">15% 할인</p>
                            <p class="product-price">42,500원</p>
                        </div>
                    </div>
                    
                    <div class="post-interactions">
                        <button class="interaction-btn">
                            <i class="far fa-heart"></i>
                        </button>
                        <button class="interaction-btn">
                            <i class="far fa-comment"></i>
                        </button>
                        <button class="interaction-btn">
                            <i class="far fa-share-square"></i>
                        </button>
                    </div>
                    
                    <div class="post-content">
                        <p class="post-likes">좋아요 503개</p>
                        <p class="post-text">최근에 구매한 원터치 화장품! 남자 피부에 딱 좋은 제품이네요.</p>
                        <p class="post-tags">#원터치 #남자화장품 #데일리 #스킨케어 #뷰티그램</p>
                        <p class="post-time">2일 전</p>
                    </div>
                    
                    <div class="comment-input">
                        <input type="text" placeholder="댓글을 남겨보세요...">
                        <button class="comment-submit">게시</button>
                    </div>
                </div>
                
                <div class="community-post">
                    <div class="post-header">
                        <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="프로필" class="profile-img">
                        <p class="username">준우</p>
                        <div class="post-actions">
                            <button class="follow-btn">
                                <i class="fas fa-ellipsis-h"></i>
                            </button>
                        </div>
                    </div>
                    
                    <div class="image-carousel" id="carousel-2">
                        <div class="carousel-inner">
                            <div class="carousel-item">
                                <img src="https://via.placeholder.com/600x800?text=제품+리뷰" alt="게시물 이미지" class="post-image">
                            </div>
                            <div class="carousel-item">
                                <img src="https://via.placeholder.com/600x800?text=사용법" alt="게시물 이미지" class="post-image">
                            </div>
                            <div class="carousel-item">
                                <img src="https://via.placeholder.com/600x800?text=효과" alt="게시물 이미지" class="post-image">
                            </div>
                        </div>
                        
                        <div class="carousel-control prev" data-carousel="carousel-2">
                            <i class="fas fa-chevron-left"></i>
                        </div>
                        <div class="carousel-control next" data-carousel="carousel-2">
                            <i class="fas fa-chevron-right"></i>
                        </div>
                        
                        <div class="carousel-indicators" id="indicators-2">
                            <div class="indicator active" data-slide="0" data-carousel="carousel-2"></div>
                            <div class="indicator" data-slide="1" data-carousel="carousel-2"></div>
                            <div class="indicator" data-slide="2" data-carousel="carousel-2"></div>
                        </div>
                    </div>
                    
                    <div class="product-section">
                        <div class="product-card">
                            <img src="https://via.placeholder.com/100?text=올인원" alt="제품" class="product-img">
                            <p class="product-discount">25% 할인</p>
                            <p class="product-price">28,900원</p>
                        </div>
                        <div class="product-card">
                            <img src="https://via.placeholder.com/100?text=로션" alt="제품" class="product-img">
                            <p class="product-price">19,900원</p>
                        </div>
                    </div>
                    
                    <div class="post-interactions">
                        <button class="interaction-btn active">
                            <i class="fas fa-heart"></i>
                        </button>
                        <button class="interaction-btn">
                            <i class="far fa-comment"></i>
                        </button>
                        <button class="interaction-btn">
                            <i class="far fa-share-square"></i>
                        </button>
                    </div>
                    
                    <div class="post-content">
                        <p class="post-likes">좋아요 127개</p>
                        <p class="post-text">올인원 제품 2주 사용 후기 공유합니다. 지성 피부인데 기름기 컨트롤도 잘되고 향도 은은해서 좋아요. 특히 사용감이 가볍고 흡수도 빨라서 아침에 바쁠 때 딱이에요!</p>
                        <p class="post-tags">#올인원 #남자스킨케어 #지성피부 #원터치</p>
                        <p class="post-time">5일 전</p>
                    </div>
                    
                    <div class="comment-input">
                        <input type="text" placeholder="댓글을 남겨보세요...">
                        <button class="comment-submit">게시</button>
                    </div>
                </div>
                
                <div class="community-pagination">
                    <a href="#" class="pagination-link"><i class="fas fa-angle-double-left"></i></a>
                    <a href="#" class="pagination-link active">1</a>
                    <a href="#" class="pagination-link">2</a>
                    <a href="#" class="pagination-link">3</a>
                    <a href="#" class="pagination-link">4</a>
                    <a href="#" class="pagination-link">5</a>
                    <a href="#" class="pagination-link"><i class="fas fa-angle-double-right"></i></a>
                </div>
            </div>
        </div>
    </section>
    <%@include file="/WEB-INF/views/common/footer.jsp" %>
    <a href="#" class="scroll-top">
        <i class="lni lni-chevron-up"></i>
    </a>

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

        // =========================
        // 1. 이미지 캐러셀 기능 (슬라이드 구현)-이미지!
        // =========================
        document.addEventListener('DOMContentLoaded', function() {
            // 캐러셀 상태 관리 및 초기화
            const carousels = {};
            
            document.querySelectorAll('.image-carousel').forEach(carousel => {
                const carouselId = carousel.id;
                const carouselInner = carousel.querySelector('.carousel-inner');
                const slides = carouselInner.querySelectorAll('.carousel-item');
                
                carousels[carouselId] = {
                    element: carouselInner,
                    slides: slides,
                    currentIndex: 0,
                    totalSlides: slides.length
                };
            });
            
            // 캐러셀 이동 함수
            function moveCarousel(carouselId, direction) {
                const carousel = carousels[carouselId];
                if (!carousel) return;
                
                let newIndex = carousel.currentIndex + direction;
                
                // 범위 체크: 첫 번째/마지막 슬라이드에서 멈춤
                if (newIndex < 0) newIndex = 0;
                if (newIndex >= carousel.totalSlides) newIndex = carousel.totalSlides - 1;
                
                if (newIndex !== carousel.currentIndex) {
                    carousel.currentIndex = newIndex;
                    // translateX를 사용하여 슬라이드 이동
                    const translateX = -newIndex * 100 + '%';
                    carousel.element.style.transform = `translateX(${translateX})`;
                    
                    // 인디케이터 업데이트
                    updateIndicators(carouselId);
                }
            }
            
            // 특정 슬라이드로 이동
            function goToSlide(carouselId, slideIndex) {
                const carousel = carousels[carouselId];
                if (!carousel) return;
                
                if (slideIndex >= 0 && slideIndex < carousel.totalSlides) {
                    carousel.currentIndex = slideIndex;
                    const translateX = -slideIndex * 100 + '%';
                    carousel.element.style.transform = `translateX(${translateX})`;
                    
                    // 인디케이터 업데이트
                    updateIndicators(carouselId);
                }
            }
            
            // 인디케이터 업데이트
            function updateIndicators(carouselId) {
                // 캐러셀 ID를 기반으로 인디케이터 그룹을 찾습니다. (예: indicators-1)
                const indicators = document.querySelectorAll(`#indicators-${carouselId.split('-')[1]} .indicator`);
                const currentIndex = carousels[carouselId].currentIndex;
                
                indicators.forEach((indicator, index) => {
                    if (index === currentIndex) {
                        indicator.classList.add('active');
                    } else {
                        indicator.classList.remove('active');
                    }
                });
            }
            
            // 이전/다음 버튼 이벤트 리스너
            document.querySelectorAll('.carousel-control').forEach(button => {
                button.addEventListener('click', function() {
                    const carouselId = this.dataset.carousel;
                    const direction = this.classList.contains('prev') ? -1 : 1;
                    moveCarousel(carouselId, direction);
                });
            });
            
            // 인디케이터 클릭 이벤트 리스너
            document.querySelectorAll('.indicator').forEach(indicator => {
                indicator.addEventListener('click', function() {
                    const slideIndex = parseInt(this.dataset.slide);
                    const carouselId = this.dataset.carousel;
                    goToSlide(carouselId, slideIndex);
                });
            });


    
            // =========================
            document.querySelectorAll('.interaction-btn').forEach(button => {
                // 좋아요 버튼에만 이벤트 리스너 추가
                if (button.querySelector('.fa-heart')) {
                    button.addEventListener('click', function() {
                        const icon = this.querySelector('i');
                        const isLiked = this.classList.toggle('active'); // active 클래스 토글

                        if (isLiked) {
                            icon.classList.remove('far'); // 빈 하트
                            icon.classList.add('fas'); // 채워진 하트
                        } else {
                            icon.classList.remove('fas');
                            icon.classList.add('far');
                        }
                    });
                }
            });


          
            // =========================
            document.querySelectorAll('.community-tab-item').forEach(tab => {
                tab.addEventListener('click', function() {
                    // 모든 탭의 active 클래스 제거
                    document.querySelectorAll('.community-tab-item').forEach(item => {
                        item.classList.remove('active');
                    });

                    // 클릭한 탭에 active 클래스 추가 (시각적 효과)
                    this.classList.add('active');
                    
                    const tabName = this.textContent.trim();
                    const tabData = this.dataset.tab;
                    
                    // 실제 탭 이동 로직 (Alert로 대체)
                    // 실제 구현 시, 이 부분에 AJAX를 이용한 게시물 로딩이나 페이지 리다이렉션을 구현해야 합니다.
                    console.log(`탭 전환 요청: ${tabData} (${tabName})`);
                    alert(`"${tabName}" 탭이 선택되었습니다. 실제 게시물 로딩 기능을 추가해야 합니다.`);
                });
            });
        });
    </script>
</body>
</html>