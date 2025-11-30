<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>상품Q&A - OneTouch</title>
	<meta name="description" content="2030 남성 뷰티 쇼핑몰 OneTouch">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" type="image/x-icon"
		href="${pageContext.request.contextPath}/assets/images/favicon.svg">
	
	<!-- ========================= CSS here ========================= -->
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/assets/css/LineIcons.3.0.css">
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/assets/css/tiny-slider.css">
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/assets/css/glightbox.min.css">
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/assets/css/main.css">
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
    position: sticky; 
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
    aspect-ratio: 3/4;  /* 스크롤 이미지 비율 조정하는곳 현재 4:3으로 되어있음 */
    overflow: hidden;
}

/* 슬라이드 트랙 */
.carousel-inner {
     display: flex;
    transition: transform 0.4s ease-in-out, height 0.3s ease;
    width: 100%;
    cursor: grab;         /* 마우스 드래그 커서 */
}

/* 슬라이드 아이템 */
.carousel-item {
    display: flex;
    justify-content: center;  /* 가로 중앙 */
    align-items: center;      /* 세로 중앙 */
    
    flex: 0 0 100%;  /* 한 번에 하나의 아이템만 보이도록 */
    width:100%;
    height:100%;
}

/* 이미지 */
.post-image {
    width: auto;
    height: auto;
    border-radius: 10px; /* 선택사항: 모서리 둥글게 */
    display: block;
    /* object-fit: cover; */ /* 이미지 비율 유지하며 꽉 채움 */
    object-fit: fill;  /* 이미지가 잘리지 않게 비율 유지 */
    object-position: center;
    /* background-color: #000; */ /* 여백 부분 색 (선택사항) */
}

/* 캐러셀 컨트롤 */
.carousel-control {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    width: 32px;
    height: 32px;
    background-color: rgba(0,0,0,0.4);
    color: #fff;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    z-index: 10;
    box-shadow: 0 2px 4px rgba(0,0,0,0.2);
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
    width: 7px;
    height: 7px;
    border-radius: 50%;
    background-color: rgba(255,255,255,0.5);
    cursor: pointer;
    transition: background-color 0.3s;
}

.indicator.active {
    background-color: var(--onetouch-light-blue);
}

/* 제품 정보 섹션 */
.product-section {
    padding: 15px;
    border-top: 1px solid #f5f5f5;
    display: flex;
    overflow-x: auto;
    gap: 10px;
    cursor: grab; /* 마우스 포인터를 '잡기' 아이콘으로 설정 */
    user-select: none; /* 텍스트 선택 방지 */
    overflow-x: hidden; /* 스크롤바 숨기기 */
    scroll-behavior: smooth; /* 부드러운 스크롤 효과 */
}

/* 상품 카드 */
.product-card {
    flex: 0 0 auto;  /* 카드가 크기를 고정되도록 설정 */
    width: 85px;  /* 카드의 고정 너비 */
    text-align: center;
    scroll-snap-align: start;  /* 카드가 스크롤될 때 시작 부분에 맞춰지도록 */
    border: 1px solid #ddd;  /* 카드 테두리 */
    border-radius: 3px;
    background-color: #fff;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); /* 약간의 그림자 효과 */
    padding: 5px;  /* 카드 내 여백 */
}

/* 링크 스타일 제거 */
.product-link {
    display: block;
    text-decoration: none; /* 기본 링크 스타일 제거 */
}

/* 상품 이미지 */
.product-img {
    width: 100%;
    height: 85px;
    object-fit: cover;
    border-radius: 3px;
    margin-bottom: 5px;
}

/* 할인 정보 */
.product-discount {
    color: var(--onetouch-accent);
    font-size: 11px;
    font-weight: 500;
    margin: 0;
}

/* 상품 가격 */
.product-price {
    font-size: 12px;
    font-weight: 600;
    margin: 0;
    color: #333;
}
/* 상품 이름 */
.product-name {
	font-size: 14px;
    font-weight: 500;
    line-height: 1.45;
    color: #111;
    letter-spacing: -0.02em;     /* 살짝 타이트하게 */
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-overflow: ellipsis;
}


/* ================================== */

/* 게시물 콘텐츠 */
.post-title {
  font-size: 16px;
  font-weight: 700;
  color: #333;
  /* margin: 10px 15px; */
}

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


/* 해시태그 css */
.product-hashtags {
   display: flex;
   flex-wrap: wrap;
   gap: 3px;
   margin: 10px 0;
   display: inline-block;
}

.hashtag-badge {
   display: inline-block;
   padding: 1px 4px; /* 패딩 대폭 줄임 */
   background-color: #f0f0f0;
   color: var(--onetouch-light-blue);
   border-radius: 8px; /* 더 작은 둥근 모서리 */
   font-size: 13px; /* 폰트 크기 줄임 */
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
/* end : 해시태그 css */

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
.community-pagination-all {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 20px;
    gap: 5px;
}
.community-pagination-skin {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 20px;
    gap: 5px;
}
.community-pagination-review {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 20px;
    gap: 5px;
}
.community-pagination-free {
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

.count-num{
	margin-top: 10px;
}

/* 데스크탑에서 드래그 슬라이드 */
@media (min-width: 768px) {
    .image-carousel {
        aspect-ratio: 3 / 4; /* 3:4 비율 유지 */
    }

    .carousel-inner {
        cursor: grab; /* 마우스 드래그 커서 */
    }

    .carousel-item {
        width: 100%;
        height: auto;
        display: flex;
        align-items: center;
        justify-content: cover;
    }

    .post-image {
        width: 100%;
        height: auto;
        object-fit: conter;  /* 이미지 꽉 채우기 */
    }
}

/* 반응형 설정 */
@media (max-width: 767px) {
    .community-content {
        padding: 0;
    }
}

@media (max-width: 768px) {
    .product-card {
        width: 70px;  /* 모바일에서 카드 크기 줄이기 */
    }
}

@media (min-width: 1024px) {
    .product-card {
        width: 100px;  /* 데스크탑에서 카드 크기 늘리기 */
    }
}
/* 모바일에서 이미지 잘림 방지 */
@media (max-width: 767px) {
    .image-carousel {
        aspect-ratio: auto; /* 비율 제한 해제 */
        height: 500px !important;
    }

	.image-carousel {
        aspect-ratio: unset;
        height: 500px !important;
        overflow: hidden;
    }
    .carousel-inner {
        display: flex;
        scroll-snap-type: x mandatory;
        overflow-x: auto;
        -webkit-overflow-scrolling: touch;
        transition: none;
        height: 100px;
    }
    .carousel-item {
        flex: 0 0 100%;
        width: 100%;
        scroll-snap-align: start;
    }
    .post-image {
        width: 100%;
        height: 500px !important;
        max-height: 80vh;
        display: block;
    }
    /* 화살표 버튼 숨기기 */
    /* .carousel-control { display: none !important; } */
}
/* 모바일에서 이미지 잘림 방지 + 슬라이드 정상화 */
@media (max-width: 767px) {

    /* 바깥 컨테이너는 비율 제거 */
    .image-carousel {
        aspect-ratio: auto; /* 모바일에서는 비율 해제 */
        height: auto;
    }

    /* 슬라이드 트랙은 flex 구조 유지 + 자동 높이 */
    .carousel-inner {
    	overflow-x: auto;
    	/* height:827; */
    	scroll-snap-type: x mandatory; /* 스냅 효과 */
        -webkit-overflow-scrolling: touch;
        display: flex;
        transition: none; /* transform 전환 제거 */
        /* transition: transform 0.4s ease-in-out; */
        height: auto; /* auto OK */
    }

    /* 슬라이드 아이템은 width 고정, height 자동 */
    .carousel-item {
        flex: 0 0 auto;
        scroll-snap-align: start;
        width: 100%;
        height: auto;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    /* 이미지가 슬라이드 높이를 자연스럽게 결정하도록 */
    .post-image {
        width: 100%;
        height: auto;
    }
}

/* 모바일 상품 슬라이드 가능하도록 수정 */
@media (max-width: 767px) {
    .product-section {
        overflow-x: auto;  /* 가로 스크롤 가능하게 변경 */
        -webkit-overflow-scrolling: touch; /* iOS 부드러운 스크롤 */
    }

    /* 스크롤바 숨기기 */
    .product-section::-webkit-scrollbar {
        display: none;
    }
}


/* post 등록 버튼 css------------------------------------------------------------- */
/* 게시물 작성 버튼 컨테이너 */
.post-write-container {
    text-align: center;
    margin-top: 20px;
    margin-bottom: 20px;
    padding: 10px 0;
   /*  background-color: #f9f9f9; */
}

	/* 게시물 작성 버튼 */
	.post-write-btn {
	    background: linear-gradient(135deg, var(--onetouch-navy) 0%, var(--onetouch-light-blue) 100%);
	    color: white;
	    border: none;
	    border-radius: 25px;
	    padding: 15px 30px;
	    font-size: 16px;
	    font-weight: 600;
	    cursor: pointer;
	    display: inline-flex;
	    align-items: center;
	    justify-content: center;
	    gap: 10px;
	    box-shadow: 0 8px 25px rgba(0, 0, 51, 0.4);
	    transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
	    position: relative;
	    overflow: hidden;
	    letter-spacing: 0.5px;
	}
	
	/* 호버 효과 */
	.post-write-btn:hover {
	    transform: translateY(-3px) scale(1.05);
	    box-shadow: 0 12px 35px rgba(0, 0, 51, 0.6);
	}
	
	/* 클릭 효과 */
	.post-write-btn:active {
	    transform: translateY(-1px) scale(1.02);
	}
	
	/* 버튼 내부 빛나는 효과 */
	.post-write-btn::before {
	    content: '';
	    position: absolute;
	    top: 0;
	    left: -100%;
	    width: 100%;
	    height: 100%;
	    background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
	    transition: left 0.5s;
	}
	
	.post-write-btn:hover::before {
	    left: 100%;
	}
	
	/* 아이콘 스타일 */
	.post-write-btn i {
	    font-size: 16px;
	    transition: transform 0.3s ease;
	}
	
	.post-write-btn:hover i {
	    transform: rotate(90deg);
	}
	
	/* 텍스트 스타일 */
	.post-write-btn span {
	    font-weight: 600;
	    position: relative;
	}
	.post-write-btn span {
	    background: linear-gradient(45deg, #ffffff, #f0f8ff);
	    -webkit-background-clip: text;
	    -webkit-text-fill-color: transparent;
	    background-clip: text;
	    font-weight: 700;
	    letter-spacing: 1px;
	}
	
/* end: post 등록 버튼 css------------------------------------------------------------- */

/* 점3개버튼 , 수정 삭제 버튼 css --------------------------------*/
/* 점 3개 버튼 (ellipsis) */
.more-options {
    background: none;
    border: none;
    cursor: pointer;
    margin-left: 10px;
}

.more-options i {
    font-size: 20px;
}

/* 수정/삭제 메뉴 */
.more-options-menu {
    position: absolute;
    background-color: #fff;
    border: 1px solid #ccc;
    box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
    margin-top: 5px;
    padding: 10px;
    display: none;
}

.more-options-menu button {
    background: none;
    border: none;
    padding: 10px;
    width: 100%;
    text-align: left;
    cursor: pointer;
}

.more-options-menu button:hover {
    background-color: #f0f0f0;
}
/* end: 점3개버튼 , 수정 삭제 버튼 css --------------------------------------*/
	
/* 리뷰 채워진 별(active) 색상 */
.interaction-btn.star.active i {
    color: gold; /* 노란색 */
}




/* ------------------	댓글 css		------------------ */
/* 댓글 섹션 - 기존 스타일과 동일한 패턴 */
.comments-section {
    padding: 0 15px 15px;
    background-color: #fff;
}

/* 댓글 아이템 - post-header와 동일한 구조 */
.comment-item {
    display: flex;
    flex-direction: column;
    margin-bottom: 15px;
    padding-bottom: 12px;
    border-bottom: 1px solid #f5f5f5;
}

.comment-item:last-child {
    border-bottom: none;
    margin-bottom: 0;
}

/* 댓글 헤더 - post-header와 동일 */
.comment-header {
    display: flex;
    align-items: center;
    margin-bottom: 8px;
}

.comment-profile-img {
    width: 32px;
    height: 32px;
    border-radius: 50%;
    margin-right: 10px;
}

.comment-username {
    font-weight: 600;
    font-size: 13px;
    margin: 0;
    color: #333;
}

.comment-actions {
    margin-left: auto;
    position: relative;
}

.comment-more-btn {
    background: none;
    border: none;
    color: #999;
    cursor: pointer;
    font-size: 16px;
    padding: 5px;
}

/* 점3개 메뉴 - 기존 more-options-menu와 동일 */
.comment-more-menu {
    position: absolute;
    top: 100%;
    right: 0;
    background-color: #fff;
    border: 1px solid #ccc;
    box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
    margin-top: 5px;
    padding: 10px;
    z-index: 100;
    min-width: 80px;
}

.comment-more-menu button {
    background: none;
    border: none;
    padding: 8px 10px;
    width: 100%;
    text-align: left;
    cursor: pointer;
    font-size: 13px;
    color: #333;
}

.comment-more-menu button:hover {
    background-color: #f0f0f0;
}

/* 댓글 내용 */
.comment-content-wrapper {
    padding-left: 42px;
}

.comment-text {
    font-size: 14px;
    line-height: 1.4;
    color: #333;
    margin-bottom: 5px;
}

.comment-time {
    color: #999;
    font-size: 12px;
}

.edited-mark {
    font-style: italic;
    margin-left: 5px;
}

/* 댓글 수정시 저장 버튼 취소버튼 */
/* OneTouch 댓글 저장/취소 버튼 CSS */

.comment-edit-buttons {
    display: flex;
    justify-content: flex-end;
    gap: 8px;
    margin-top: 12px;
    padding-top: 8px;
}

.comment-save-btn,
.comment-cancel-btn {
    padding: 8px 16px;
    border: none;
    border-radius: 20px;
    font-size: 12px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s cubic-bezier(0.25, 0.46, 0.45, 0.94);
    letter-spacing: 0.5px;
    min-width: 60px;
    position: relative;
    overflow: hidden;
}

/* 저장 버튼 - OneTouch 메인 컬러 */
.comment-save-btn {
    background: linear-gradient(135deg, #1e3c72 0%, #2a5298 50%, #3366cc 100%);
    color: white;
    box-shadow: 0 4px 15px rgba(30, 60, 114, 0.4);
}

.comment-save-btn:hover {
    background: linear-gradient(135deg, #1a3360 0%, #245285 50%, #2952b3 100%);
    transform: translateY(-2px);
    box-shadow: 0 6px 20px rgba(30, 60, 114, 0.6);
}

.comment-save-btn:active {
    transform: translateY(0);
    box-shadow: 0 2px 8px rgba(30, 60, 114, 0.3);
}

/* 저장 버튼 빛나는 효과 */
.comment-save-btn::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
    transition: left 0.5s;
}

.comment-save-btn:hover::before {
    left: 100%;
}

/* 취소 버튼 - 부드러운 회색 */
.comment-cancel-btn {
    background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
    color: #6c757d;
    border: 1px solid #dee2e6;
    box-shadow: 0 2px 8px rgba(108, 117, 125, 0.15);
}

.comment-cancel-btn:hover {
    background: linear-gradient(135deg, #e9ecef 0%, #dee2e6 100%);
    color: #495057;
    border-color: #ced4da;
    transform: translateY(-1px);
    box-shadow: 0 4px 12px rgba(108, 117, 125, 0.25);
}

.comment-cancel-btn:active {
    transform: translateY(0);
    box-shadow: 0 1px 4px rgba(108, 117, 125, 0.2);
}

/* 포커스 상태 */
.comment-save-btn:focus,
.comment-cancel-btn:focus {
    outline: none;
    box-shadow: 0 0 0 3px rgba(51, 102, 204, 0.25);
}

/* 로딩 상태 (선택사항) */
.comment-save-btn.loading {
    cursor: not-allowed;
    opacity: 0.7;
}

.comment-save-btn.loading::after {
    content: '';
    position: absolute;
    top: 50%;
    left: 50%;
    width: 12px;
    height: 12px;
    margin: -6px 0 0 -6px;
    border: 2px solid transparent;
    border-top: 2px solid white;
    border-radius: 50%;
    animation: spin 1s linear infinite;
}

@keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}

/* 버튼 그룹 애니메이션 */
.comment-edit-buttons {
    animation: slideUp 0.3s ease-out;
}

@keyframes slideUp {
    from {
        opacity: 0;
        transform: translateY(10px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* 성공 상태 애니메이션 */
.comment-save-btn.success {
    background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
    animation: successPulse 0.6s ease;
}

@keyframes successPulse {
    0%, 100% { transform: scale(1); }
    50% { transform: scale(1.05); }
}

/* 반응형 */
@media (max-width: 767px) {
    .comment-save-btn,
    .comment-cancel-btn {
        padding: 6px 12px;
        font-size: 11px;
        min-width: 50px;
    }
    
    .comment-edit-buttons {
        gap: 6px;
        margin-top: 10px;
    }
}

/* 다크모드 대응 (선택사항) */
@media (prefers-color-scheme: dark) {
    .comment-cancel-btn {
        background: linear-gradient(135deg, #343a40 0%, #495057 100%);
        color: #adb5bd;
        border-color: #495057;
    }
    
    .comment-cancel-btn:hover {
        background: linear-gradient(135deg, #495057 0%, #6c757d 100%);
        color: #f8f9fa;
        border-color: #6c757d;
    }
}

/* 고대비 접근성 */
@media (prefers-contrast: high) {
    .comment-save-btn {
        background: #000033;
        border: 2px solid white;
    }
    
    .comment-cancel-btn {
        background: white;
        color: #000033;
        border: 2px solid #000033;
    }
}

/* 추가: 버튼 상태별 텍스트 변경 */
.comment-save-btn[data-state="saving"]::after {
    content: "저장 중...";
}

.comment-save-btn[data-state="success"]::after {
    content: "✓ 저장됨";
}

/* 예쁜 리플 효과 */
.comment-save-btn,
.comment-cancel-btn {
    position: relative;
    overflow: hidden;
}

.comment-save-btn::after,
.comment-cancel-btn::after {
    content: '';
    position: absolute;
    top: 50%;
    left: 50%;
    width: 0;
    height: 0;
    border-radius: 50%;
    background: rgba(255, 255, 255, 0.3);
    transform: translate(-50%, -50%);
    transition: width 0.6s, height 0.6s;
}

.comment-save-btn:active::after,
.comment-cancel-btn:active::after {
    width: 200px;
    height: 200px;
}
/* end 댓글 수정시 저장 취소 버튼 */

/* 반응형 - 기존과 동일 */
@media (max-width: 767px) {
    .comment-profile-img {
        width: 28px;
        height: 28px;
    }
    
    .comment-content-wrapper {
        padding-left: 38px;
    }
    
    .comment-text {
        font-size: 13px;
    }
}
/* ------------------	end : 댓글 css		------------------ */

/* ============================= */
/* 댓글 페이지네이션 (가로 정렬 보장) */
/* ============================= */
.comment-pagination-all, .comment-pagination-free, .comment-pagination-skin,.comment-pagination-review {
    display: flex !important;      /* 강제 가로 배치 */
    flex-direction: row !important;
    justify-content: center;
    align-items: center;
    flex-wrap: nowrap;             /* 자동 줄바꿈 방지 */
    gap: 6px;
    padding: 10px 0 20px;
}

/* 페이지 버튼 */
.comment-page-link {
    display: flex !important;      /* 버튼도 강제 가로 아이템 */
    justify-content: center;
    align-items: center;

    width: 32px;
    height: 32px;

    background: #fff;
    border: 1px solid #e6e6e6;
    color: #555;

    border-radius: 8px;
    font-size: 13px;
    cursor: pointer;

    box-shadow: 0px 1px 3px rgba(0,0,0,0.06);
    transition: all 0.25s ease;

    white-space: nowrap;           /* 텍스트 줄바꿈 제거 */
}

.comment-page-link:hover {
    background: #f4f7ff;
    border-color: #cdd7f5;
    color: #224488;
}

/* 현재 페이지 */
.comment-page-link.active {
    background: linear-gradient(135deg, #1e3c72 0%, #2961c4 100%);
    border-color: transparent;
    color: #fff;
    font-weight: 700;
    box-shadow: 0 3px 10px rgba(30, 60, 114, 0.3);
    transform: translateY(-1px);
}

/* 비활성 */
.comment-page-link.disabled {
    background: #f5f5f5;
    border-color: #e8e8e8;
    color: #bbb;
    cursor: default;
    pointer-events: none;
    box-shadow: none;
}

/* 화살표 */
.comment-page-link.arrow {
    font-size: 15px;
}

@media (max-width: 767px) {
    .comment-page-link {
        width: 28px;
        height: 28px;
        font-size: 12px;
    }
    .comment-page-link.arrow {
        font-size: 13px;
    }
}
.reply-list .comment-pagination {
    display: flex !important;
    flex-direction: row !important;
    gap: 6px;
    flex-wrap: nowrap !important;
    justify-content: center;
    align-items: center;
}
.reply-list .comment-pagination .comment-page-link {
    display: inline-flex !important;
    flex: 0 0 auto !important;
}
/* --------- end : 댓글 페이지 네비게이션 ------------ */




    </style>
	
	<style>
	.post-section {
		padding: 0;
		background-color: #fff;
		min-height: calc(100vh - 400px);
	}
	
	.post-container {
		display: flex;
		max-width: 100%;
		margin: 0;
		background: transparent;
		border-radius: 0;
		overflow: visible;
		box-shadow: none;
	}


/* 컨텐츠 부분.  */
.content {
	flex: 1;
	padding: 40px;
}

.content-header {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 30px;
	padding-bottom: 15px;
	border-bottom: 2px solid #5c6bc0;
}

.content-header h2 {
	font-size: 18px;
	color: #1A237E;
	font-weight: 600;
	margin: 0;
}

.empty-state {
	text-align: center;
	padding: 80px 20px;
}

.empty-state-message {
	color: #666;
	margin-bottom: 30px;
	font-size: 14px;
}

.btn-write {
	background: #1A237E;
	color: white;
	padding: 10px 24px;
	border: none;
	border-radius: 4px;
	font-size: 14px;
	cursor: pointer;
	display: inline-flex;
	align-items: center;
	justify-content: center;
	gap: 6px;
	transition: background 0.3s;
	white-space: nowrap;
	height: 40px;
}

.btn-write:hover {
	background: #4a5aaf;
	color: white;
}

.btn-write::before {
	content: '✎';
	font-size: 16px;
}


.status-badge {
	display: inline-block;
	padding: 4px 12px;
	border-radius: 12px;
	font-size: 12px;
	font-weight: 600;
}

.status-waiting {
	background: #fff3e0;
	color: #f57c00;
}

.status-completed {
	background: #e8f5e9;
	color: #388e3c;
}

.qna-table td.title {
	text-align: center; /* 중앙 정렬 */
	vertical-align: middle; /* 세로 중앙 정렬 */
}







	/* 반응형 추가 */
	
	
	/* ========================= 반응형 ========================= */

/* 태블릿 (max 992px) */
@media (max-width: 992px) {
    /* 전체 레이아웃 세로 배치 */
    .qna-container {
        flex-direction: column;
        align-items: center;
    }

    /* 사이드바 너비 전체 */
    .sidebar {
        width: 100% !important;
        position: relative !important;
        margin-bottom: 20px;
    }

    /* 컨텐츠 */
    .content {
        width: 100% !important;
        padding: 20px !important;
    }

    /* 글쓰기 버튼 중앙 */
    .btn-write {
        display: inline-flex !important;
        justify-content: center !important;
        margin: 0 auto 20px auto !important;
        width: 40% !important;
        min-width: 120px;
    }

    /* 테이블 중앙 맞춤 */
    .qna-table {
        font-size: 13px !important;
    }
}

/* 모바일 (max 768px) */
@media (max-width: 768px) {
    .btn-write {
        width: 50% !important;
        min-width: 100px !important;
        font-size: 13px !important;
        padding: 8px 15px !important;
    }

    .qna-table th,
    .qna-table td {
        padding: 10px 5px !important;
        font-size: 12px !important;
    }
}

/* 작은 모바일 (max 480px) */
@media (max-width: 480px) {
    .content-header h2 {
        font-size: 16px !important;
    }

    .btn-write {
        width: 70% !important;
        min-width: 80px !important;
        font-size: 12px !important;
        padding: 6px 10px !important;
    }

    .qna-table th,
    .qna-table td {
        font-size: 11px !important;
        padding: 8px 5px !important;
    }
}
</style>

</head>

<body>



	<!-- Preloader -->
	<div class="preloader">
		<div class="preloader-inner">
			<div class="preloader-icon">
				<span></span> <span></span>
			</div>
		</div>
	</div>
	<!-- /End Preloader -->

	<!-- 헤더부분-->

	<c:import url="../common/header.jsp" />
	<!-- End Header Area -->

	<!-- Start Breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6 col-md-6 col-12">
					<div class="breadcrumbs-content">
						<h1 class="page-title">상품 Q&A</h1>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-12">
					<ul class="breadcrumb-nav">
						<li><a href="${pageContext.request.contextPath}/"><i
								class="lni lni-home"></i> 홈</a></li>
						<li>마이페이지</li>
						<li>상품 Q&A</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- End Breadcrumbs -->

	<!-- Start Q&A Section -->
	<section class="post-section">
		<div class="container">
			<div class="post-container">


				<!-- 사이드바 인크루드 -->
				<%@include file="/WEB-INF/views/common/mypage_side_bar.jsp"%>
				<div class="content">
   <section class="section">
        <div class="container">
			  <div class="post-write-container">
			  <c:if test="${not empty user }">
			   <button class="post-write-btn" onclick="location.href='/post/insert'">
			    <i class="fas fa-plus"></i>
			    <span>등록</span>
			  </button>
			  </c:if>
			  </div>
            <div class="community-content">
                <div class="community-tabs">
                    <div class="community-tab-item active" data-tab="all" id="post-all">전체</div>
                    <div class="community-tab-item" data-tab="skin" id="post-skin">스킨에디터</div>
                    <div class="community-tab-item" data-tab="review" id="post-review">리뷰</div>
                    <div class="community-tab-item" data-tab="free" id="post-free">자유게시판</div>
                </div>

                
                <!-- 커뮤니티 전체 목록 ============================================================= -->
                
                <div class="community-post" id="posts-container-all" data-tab="all">
                
                </div>
                <!-- /커뮤니티 전체 목록 ============================================================= -->


                <!-- 커뮤니티 스킨 목록 ============================================================= -->
                <div class="community-post" id="posts-container-skin" data-tab="skin">
                
                </div>
                <!-- /커뮤니티 스킨 목록 ============================================================= -->
                
                <!-- 커뮤니티 리뷰 목록 ============================================================= -->
                <div class="community-post" id="posts-container-review" data-tab="review">
                
                </div>
                <!-- /커뮤니티 리뷰 목록 ============================================================= -->

                <!-- 커뮤니티 자유게시판 목록 ============================================================= -->
                <div class="community-post" id="posts-container-free" data-tab="free">
               	 
                </div>
                <!-- /커뮤니티 자유게시판 목록 ============================================================= -->
                
                
            </div>
        </div>
    </section>
    <a href="#" class="scroll-top">
        <i class="lni lni-chevron-up"></i>
    </a>

    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/tiny-slider.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/glightbox.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
    
    <script type="text/javascript">
 // =========================
 // 0. 프리로더 제거
 // =========================
 window.addEventListener('load', function() {
     const preloader = document.querySelector('.preloader');
     if (preloader) {
         preloader.style.opacity = '0';
         setTimeout(() => preloader.style.display = 'none', 500);
     }
 });

//=========================
//1. 이미지 캐러셀 기능 (데스크탑 + 모바일 통합)
//=========================
function carousels(){
	
  const isMobile = window.innerWidth <= 767; // 모바일 여부 판단
  const carousels = document.querySelectorAll('.image-carousel'); // 모든 캐러셀 요소 선택

  carousels.forEach(carousel => {
      const inner = carousel.querySelector('.carousel-inner'); // 이미지 슬라이드 컨테이너
      const items = carousel.querySelectorAll('.carousel-item'); // 모든 슬라이드 아이템
      const prevBtn = carousel.querySelector('.carousel-control.prev'); // 이전 버튼
      const nextBtn = carousel.querySelector('.carousel-control.next'); // 다음 버튼
      const indicators = carousel.querySelectorAll('.indicator'); // 하단 인디케이터

      let currentIndex = 0; // 현재 슬라이드 인덱스
      const totalItems = items.length; // 전체 슬라이드 개수

      // =========================
      // 공통: 이미지 높이 자동 조정
      // =========================
      function adjustHeight(index) {
          const activeImg = items[index]?.querySelector('img');
          //if (activeImg) inner.style.height = activeImg.offsetHeight + 'px';
          if (!activeImg) return;

          // ★★★ 모바일이미지 높이! ★★★
          if (window.innerWidth <= 767) {
              inner.style.height = '500px';   // 모바일: 높이 자동
              return;
          }

          // 데스크탑에서만 827px 적용
          inner.style.height = '827px';
      }

      window.addEventListener('resize', () => adjustHeight(currentIndex));

      // =========================
      // 데스크탑 기능
      // =========================
      if (!isMobile) {

          // 슬라이드 표시 함수
          function showSlide(index) {
              if (index < 0) index = totalItems - 1;
              if (index >= totalItems) index = 0;
              currentIndex = index;

              // 슬라이드 활성화
              items.forEach((item, i) => item.classList.toggle('active', i === currentIndex));
              // 인디케이터 활성화
              indicators.forEach((ind, i) => ind.classList.toggle('active', i === currentIndex));
              // 높이 조정
              adjustHeight(currentIndex);
          }

          // 버튼 클릭 이벤트
          if (prevBtn) prevBtn.addEventListener('click', () => showSlide(currentIndex - 1));
          if (nextBtn) nextBtn.addEventListener('click', () => showSlide(currentIndex + 1));

          // 인디케이터 클릭 이벤트
          indicators.forEach((ind, i) => ind.addEventListener('click', () => showSlide(i)));

          // 초기 슬라이드 표시
          showSlide(0);

          // 자동 슬라이드 (3초 간격)
          let autoSlideInterval = setInterval(() => showSlide(currentIndex + 1), 2000);

          // 마우스 진입 시 자동 슬라이드 중지
          carousel.addEventListener('mouseenter', () => clearInterval(autoSlideInterval));
          // 마우스 떠나면 자동 슬라이드 재개
          carousel.addEventListener('mouseleave', () => {
              autoSlideInterval = setInterval(() => showSlide(currentIndex + 1), 2000);
          });

          // =========================
          // 마우스 드래그/스와이프 기능
          // =========================
          let isDragging = false;
          let startX = 0;
          let currentX = 0;

          // 커서 스타일 변경
          carousel.style.cursor = 'grab';

          // 마우스 드래그 시작
          carousel.addEventListener('mousedown', e => {
              isDragging = true;
              startX = e.clientX;
              carousel.style.cursor = 'grabbing';
              e.preventDefault();
          });

          // 마우스 이동 기록
          carousel.addEventListener('mousemove', e => {
              if (!isDragging) return;
              currentX = e.clientX;
          });

          // 마우스 드래그 종료
          carousel.addEventListener('mouseup', e => {
              if (!isDragging) return;
              isDragging = false;
              carousel.style.cursor = 'grab';

              const diff = e.clientX - startX;
              if (Math.abs(diff) > 50) {
                  if (diff > 0) showSlide(currentIndex - 1);
                  else showSlide(currentIndex + 1);
              }
          });

          // 마우스가 캐러셀 밖으로 나가도 드래그 종료 처리
          carousel.addEventListener('mouseleave', e => {
              if (isDragging) {
                  isDragging = false;
                  carousel.style.cursor = 'grab';
                  const diff = e.clientX - startX;
                  if (Math.abs(diff) > 50) {
                      if (diff > 0) showSlide(currentIndex - 1);
                      else showSlide(currentIndex + 1);
                  }
              }
          });

          // 터치 이벤트도 데스크탑과 동일하게 스와이프 처리
          carousel.addEventListener('touchstart', e => {
              isDragging = true;
              startX = e.touches[0].clientX;
          }, { passive: true });

          carousel.addEventListener('touchmove', e => {
              if (!isDragging) return;
              currentX = e.touches[0].clientX;
          }, { passive: true });

          carousel.addEventListener('touchend', e => {
              if (!isDragging) return;
              isDragging = false;
              const diff = e.changedTouches[0].clientX - startX;
              if (Math.abs(diff) > 50) {
                  if (diff > 0) showSlide(currentIndex - 1);
                  else showSlide(currentIndex + 1);
              }
          });

      } else {
          // =========================
          // 모바일 기능 (좌우 스크롤)
          // =========================
          let isDown = false;
          let startX = 0, scrollLeft = 0;

          // 터치 시작
          inner.addEventListener("touchstart", e => {
              isDown = true;
              startX = e.touches[0].pageX;
              scrollLeft = inner.scrollLeft;
          }, { passive: true });

          // 터치 이동
          inner.addEventListener("touchmove", e => {
              if (!isDown) return;
              const x = e.touches[0].pageX;
              const walk = startX - x;
              inner.scrollLeft = scrollLeft + walk;
          }, { passive: true });

          // 터치 종료
          inner.addEventListener("touchend", () => { isDown = false; });
          inner.addEventListener("touchcancel", () => { isDown = false; });

          // 이미지 드래그 방지
          items.forEach(item => {
              const img = item.querySelector('img');
              if (img) img.addEventListener('dragstart', e => e.preventDefault());
          });
      }

      // =========================
      // 초기 높이 조정
      // =========================
      adjustHeight(currentIndex);
  });
};
// end 스크롤 초기화하기

 // =========================
 // 2. 좋아요 하트 토글 기능
 // =========================
document.addEventListener('click', function(e) {
    const btn = e.target.closest('.interaction-btn');
    if (!btn) return;

    const icon = btn.querySelector('i');
    
    if (icon && icon.classList.contains('fa-heart')) {

        // 로그인 체크
        if (!'${user}') {
            alert("로그인이 필요합니다.");
            location.href="${pageContext.request.contextPath}/user/login?url="+window.location.href;
            return;
        }
        // 클릭한 버튼이 어느 게시글인지 확인
        const post_idx = btn.getAttribute('data-post-idx');

        // Ajax 요청 보내기
        $.ajax({
            url: "/post/postLike",
            type: "post",
            data: { "post_idx": post_idx },
            success: function(d) {
            	if(d.memVo==false){
            		alert("로그인이 필요합니다1.");
            		location.href="${pageContext.request.contextPath}/user/login?url="+window.location.href;
            		return;
            	}
                // 서버 성공 시 하트 토글
                const isLiked = btn.classList.toggle('active');
                if (isLiked) { //하트 표시
                    icon.classList.remove('far');
                    icon.classList.add('fas');
                } else { //하트 제거
                    icon.classList.remove('fas');
                    icon.classList.add('far');
                }
                // 같은 post_idx 버튼 모두 동기화
                
                const allBtns = document.querySelectorAll(`.interaction-btn[data-post-idx="\${d.post_idx}"]`);
                allBtns.forEach(otherBtn => {
                    const otherIcon = otherBtn.querySelector('i');
                    otherBtn.classList.toggle('active', isLiked);  // isLiked는 클릭한 버튼 상태
                    if (isLiked) {
                        otherIcon.classList.remove('far');
                        otherIcon.classList.add('fas');
                    } else {
                        otherIcon.classList.remove('fas');
                        otherIcon.classList.add('far');
                    }
                });
                
                //alert(d.post_like);
                $(".post-likes[data-post-idx='" + d.post_idx + "']").text(d.post_like);
            },
            error: function(e) {
                alert("좋아요 버튼 실패\n관리자에게 문의");
            }
        });
    }
});

 // =========================
 // 3. 탭 클릭 기능
 // =========================
 document.addEventListener('DOMContentLoaded', function() {
     const tabs = document.querySelectorAll('.community-tab-item');
     const posts = document.querySelectorAll('.community-post');
     let page = 1;
	 //초기 페이지
     posts.forEach(post => post.style.display = 'none');

     const defaultTab = document.querySelector('.community-tab-item[data-tab="all"]');
     if (defaultTab) {
         defaultTab.classList.add('active');
         posts.forEach(post => { if (post.dataset.tab === 'all') post.style.display = 'block'; });
     }

     // 탭 클릭 했을때 처리
     tabs.forEach(tab => {
         tab.addEventListener('click', function() {
        	 //alert("탭클릭");
             tabs.forEach(t => t.classList.remove('active'));
             this.classList.add('active');
				
             //클릭한 tab 타입
             const tabType = this.dataset.tab; 
        	 //alert(tabType);
        	 
        	 //전체 목록 조회
        	 
        	 listHtml(tabType,page);
        	 
             posts.forEach(post => {
                 post.style.display = (tabType === 'all') 
                     ? (post.dataset.tab === 'all' ? 'block' : 'none')
                     : (post.dataset.tab === tabType ? 'block' : 'none');
             });
         });
     });
     

			
     
 });
 
 //ajax를 이용해서 html 영역 가져오는 함수
 function listHtml(tabType,page){ 
	let mypage="mypost";
	 $.ajax({
    	url : "/post/all_list"
    	,data:{"tabType":tabType,"page":page,"mypage":mypage}
    	,success:function(d){
    		let loop =1;
    		let html = "";
    		let postVo_array;
    		if(tabType=='all'){
    			//alert("전체")
    			postVo_array=d.postVo_array;
    		}
    		if(tabType=='skin'){
    			//alert("스킨")
    			postVo_array=d.postTip_array;
    		}
    		if(tabType=='review'){
    			postVo_array=d.postReview_array;
    		}
    		if(tabType=='free'){
    			postVo_array=d.postFreeBoard_array;
    		}
    		
    		
			/* =======================================for() html 게시물 영역============================================ */	
    		for(let postVo of postVo_array){
			//alert("게시물idx=> "+postVo.post_idx);
    		
    		//프로필 부분
    		html = html+`
             <div class="post-header">
                 <img src="${pageContext.request.contextPath}/images/mem/\${postVo.mem_image_url}" alt="프로필" class="profile-img">
                 <p class="username">\${postVo.mem_id }</p>
             </div>
             `
             
         html=html+`
             <div class="image-carousel" id="carousel-1">
                 <div class="carousel-inner">
                 `
         
         // post 이미지 영역
         let imgCount=0;
         const images = `\${postVo.post_image}`.split("*"); // * 기준으로 나눔
         for(let i =0; i <images.length;i++){
        	 imgCount=imgCount+1;
         const img = images[i];
         /* alert(`\${img}`); */
         html=html+`
                     <div class="carousel-item \${i==0 ? 'active' : ''}"  >
                         <img src="${pageContext.request.contextPath }/images/posts/\${img}" alt="\${img}" class="post-image d-block w-100 h-100">
                     </div>
                     `
         }
          html=html+`
                 </div>
                 `
                 if(imgCount>1){
                	 
                 html=html+`
                 <div class="carousel-control prev" data-carousel="carousel-\${loop}">
                     <i class="fas fa-chevron-left"></i>
                 </div>
                 <div class="carousel-control next" data-carousel="carousel-\${loop}">
                     <i class="fas fa-chevron-right"></i>
                 </div>
                 `
                 }
                 
                 html=html+`
                 <div class="carousel-indicators" id="indicators-\${loop}">
                 `
         	   
            for(let s =0; s<images.length;s++){
            html=html+`
						    <div class="indicator \${s==0 ? 'active' : ''}" 
						         data-slide="\${s}" data-carousel="carousel-\${loop }"></div>
						         `
            } 
                 
            html=html+`
                 </div>
             </div>
             `
            // 상품 이미지 영역
            
            if(postVo.productList!=null){
             html=html+`
             <div class="product-section">
             `
             for(let productVo of postVo.productList){
            	 let price=productVo.product_price;
            	 let price_formatted = new Intl.NumberFormat('ko-KR').format(price);
					html=html+`	                    	
                     <div class="product-card">
                     	<a href="/product/detail?id=\${productVo.product_idx}" class="product-link">
			                            <img src="${pageContext.request.contextPath }/images/\${productVo.product_image_url}" alt="제품" class="product-img">
			                            <p class="product-name">\${productVo.product_name }</p>
			                            <p class="product-price">₩\${price_formatted}</p>
	                        </a>    
                     </div>
              	`
             }
             html=html+`
             </div>
             `
            }
				html=html+`	                    
             <div class="post-interactions">
				    <!-- 하트 버튼 -->
             `
             
             let login_mem_idx = "${sessionScope.user.mem_idx}"
             let isLiked = false;
					
				html=html+
				`
				<!-- 배열 순회하여 로그인된 유저의 like 상태 확인 -->
				`
				if(postVo.likeList!=null){
				for(let likeVo of postVo.likeList){
					if(`\${likeVo.mem_idx}`==`\${login_mem_idx}`){
						isLiked=true;
					}
					
				}
				}
				
				html=html+`
					<!-- 좋아요를 누른 경우 -->
				`
				//alert(`\${!isLiked}`);
				if(isLiked){
					html=html+`
					    <button class="interaction-btn active" data-post-idx="\${postVo.post_idx}">
					        <i class="fas fa-heart"></i> <!-- 채워진 하트 -->
					    </button>
					`
				}
				html=html+`
					<!-- 좋아요를 누르지 않은 경우 -->
				`
				if(!isLiked){
					html=html+`
					    <button class="interaction-btn" data-post-idx="\${postVo.post_idx}">
					        <i class="far fa-heart"></i> <!-- 빈 하트 -->
					    </button>
					    `
				}
				html=html+`
					<p class="post-likes count-num" data-post-idx="\${postVo.post_idx }">\${postVo.post_like }</p>
				    <button class="interaction-btn">
				        <i class="far fa-comment"></i>
				    </button>
			<!-- 	    <button class="interaction-btn">
				        <i class="far fa-share-square"></i>
				    </button> -->
				    
					<!-- 채워진 별 -->
				`
				if(postVo.post_rating != 0){
					
					html=html+`
					<button class="interaction-btn star active" data-post-idx="\${postVo.post_idx}">
					    <i class="fas fa-star"></i>
					</button>
					<p class="count-num">\${postVo.post_rating }</p>  
					`
				}						    
				//post 수정 삭제 부분
				if(postVo.mem_idx==`${user.mem_idx}`){
				html=html+`
				    <!-- 추가된 점 3개 버튼 (ellipsis) -->
				    <button class="interaction-btn more-options">
				        <i class="fas fa-ellipsis-h"></i> <!-- 점 3개 아이콘 -->
				    </button>
				
				    <!-- 숨겨진 수정/삭제 버튼 -->
				    <div class="more-options-menu" style="display: none;">
				        <button class="edit-btn" data-post-idx="\${postVo.post_idx }" data-mem-idx="\${postVo.mem_idx }">수정</button>
				        <button class="delete-btn" data-post-idx="\${postVo.post_idx }">삭제</button>
				    </div>
				`
				}
				html=html+
				`
				</div>
             
             <div class="post-content">
                 
             	<p class="post-title">\${postVo.post_title}</p>
                 <p class="post-text">\${postVo.post_content }</p>
                 `
                 for(let hashtag of postVo.hashtagList){
             html=html+`
                 <div class="product-hashtags" style="margin: 10px 0;">
                 <a href="${pageContext.request.contextPath}/hashtag/search.do?hashtag_idx=\${hashtag.hashtag_idx}" 
                     class="hashtag-badge">#\${hashtag.hashtag_name}</a>
                 </div>
                 `
                 }
             html=html+`
                 <p class="post-time">\${postVo.post_time }</p>
             </div>
             
             <div class="comment-input">
                 <input type="text" class="post-comment" data-post-idx="\${postVo.post_idx}" data-post-category="\${d.post_category}"  placeholder="댓글을 남겨보세요...">
                 <button class="comment-submit" data-postidx="\${postVo.post_idx}" data-now-page="\${d.nowPage}" data-post-category="\${d.post_category}" onclick="replyInsert(this);">댓글</button>
             </div>
             <br>
             <!-- 댓글 섹션 -->
             <div class="reply-list" data-post-idx=\${postVo.post_idx}>
             </div>
             `
       		 //replyHtml(postVo.post_idx,d.post_category,d.nowReplyPage);		
            
             
             html=html+`
             <br>
             <br>
             
				`
    			
    		loop=loop+1;
    		} 
    		/* =======================================end : for() html 게시물 영역============================================ */
    		
    		/* 페이지처리 영역 */
    		html=html+d.pagination;
    		if(tabType=='all'){
    		$("#posts-container-all").html(html);
    		}
    		if(tabType=='skin'){
    		$("#posts-container-skin").html(html);
    		}
    		if(tabType=='review'){
    		$("#posts-container-review").html(html);
    		}
    		if(tabType=='free'){
    		$("#posts-container-free").html(html);
    		}
    		

    		
    		carousels(); // 이미지 슬라이드
    		productSection(); // 상품 슬라이드
    		moreButtons(); // 수정 삭제버튼 초기화
    		
    		
    		let pagingtionContainer="";
    	     // 페이지 클릭 했을때 처리
    	     if(tabType==='all'){
    	      pagingtionContainer = document.querySelector('.community-pagination-all');
    	     }
    	     if(tabType==='skin'){
    	      pagingtionContainer = document.querySelector('.community-pagination-skin');
    	     }
    	     if(tabType==='review'){
    	      pagingtionContainer = document.querySelector('.community-pagination-review');
    	     }
    	     if(tabType==='free'){
    	      pagingtionContainer = document.querySelector('.community-pagination-free');
    	     }
    	     pagingtionContainer.addEventListener('click',function(e){
    	    	 if(e.target && e.target.matches('.pagination-link')){
    	    	 e.preventDefault();
    				const url=e.target.dataset.url;
    				const page=e.target.dataset.page;
    				const tabType=e.target.dataset.category;
    				//alert(page);
    				//alert(tabType);
    				
    				listHtml(tabType,page);
    				window.scrollTo(0,420)
    	    	 }
    	     });
    	     
    	     /* end: 페이지 처리 영역 */
    	     
    	     
     		//댓글list보여주는 처리 함수
     		for(let postVo of postVo_array){
     		    replyHtml(postVo.post_idx, d.post_category, d.nowReplyPage);
     		}
    	    

    	     
    	}//end : success
     ,error:function(e){
     	
     }
     
     });
}  

 // =========================
 // 		 댓글
 // =========================
	 
 /* --- 댓글 List 출력 함수 ---*/
 function replyHtml(post_idx,post_category,nowReplyPage){
	 //alert("댓글영역");
	 //alert(post_idx);
	 //alert(post_category);
	
	 if(!nowReplyPage){
	 nowReplyPage=1;
	 //alert(nowReplyPage);
	 }
	 
	 $.ajax({
		 url:"/post/reply_list"
		 ,data:{"post_idx":post_idx,"post_category":post_category,"nowReplyPage":nowReplyPage}
		 ,success:function(d){
			 //alert("댓글list 성공");
			 //댓글부분 List
		    let html=""
		     if(d.replyList && d.replyList.length>0){
		    	 for(let replys of d.replyList){
			// alert(replys.reply_idx);
			 
		    		 if(replys.reply_content!=null){
		    			 
		    html=html+`
		     <div class="comments-section">
		         <!-- 댓글 목록 -->
		                     <div class="comment-item" data-reply-idx="\${replys.reply_idx}">
		                         <div class="comment-header">
		                             <img src="${pageContext.request.contextPath}/images/mem/\${replys.mem_image_url}" 
		                                  alt="프로필" class="comment-profile-img">
		                             <p class="comment-username">\${replys.mem_id}</p>
		                             
		                             <!-- 본인 댓글일 때만 점3개 버튼 -->
		                                 <div class="comment-actions">
		                                     <button class="comment-more-btn">
		                                         <i class="fas fa-ellipsis-h"></i>
		                                     </button>
		                                     <div class="comment-more-menu" style="display: none;">
		                                         <button class="comment-edit-btn" data-reply-idx="\${replys.reply_idx}">수정</button>
		                                         <button class="comment-delete-btn" data-reply-idx="\${replys.reply_idx}" data-now-page="\${d.nowReplyPage}" data-post-category="\${d.post_category}">삭제</button>
		                                     </div>
		                                 </div>
		                         </div>
		                         
		                         <div class="comment-content-wrapper">
		                             <div class="comment-text">\${replys.reply_content}</div>
		                             <div class="comment-time">
		                             `
		                             	  	 html=html+`
		                                     <span class="edited-mark">등록일:\${replys.reply_time}</span>
		                                     `
		                                     if(replys.reply_update||replys.reply_update!=null){
		                                     html=html+`
		                                     <span class="edited-mark">수정일:\${replys.reply_update}</span>
		                                     `
		                                     }
		                                     
		                                     html=html+`
		                             </div>
		                         </div>
		                     </div>
		     </div>
		     `
		    	 	}
		    	 } //end : for
		    	 
		    	 //댓글 페이지 처리
		    	 html=html+d.ReplyPagingation;
		    	 
	
		   	}
			 //alert(`"\${post_idx}"`);
		  let replyDivList=document.querySelectorAll(`.reply-list[data-post-idx="\${post_idx}"]`);
			 if(replyDivList){
			//alert(replyDiv);
				 replyDivList.forEach(div => {
					    div.innerHTML = html;
					});
			 } 
		 }//end succes
	 	,error:function(e){
	 		alert("댓글list 실패\n관리자문의");
	 	}
	 });//end : ajax 통신 댓글리스트
		 
		 
 }//end 댓글 list 함수종료
 
 /* --- end: 댓글 List 출력 함수 ---*/
 
 	//댓글 페이지 선택시 댓글 새로 뿌려주기
	 document.addEventListener("click",function(e){
		 if(e.target && e.target.matches('.comment-page-link')){
		 let post_idx=e.target.dataset.postIdx;
		 let post_category=e.target.dataset.category;
		 let nowReplyPage=e.target.dataset.page;
		 //alert(post_idx);
		 //alert(post_category);
		 //alert(nowReplyPage);
		 replyHtml(post_idx,post_category,nowReplyPage);		 
		 }
			 
	 });
 
 /* ------------------------댓글 등록 함수--------------------------- */
 function replyInsert(btn){
 	let postIdx=btn.dataset.postidx;  
 	let nowPage=btn.dataset.nowPage;  
 	let postCategory=btn.dataset.postCategory;  
 	let replyInput = document.querySelector(`.post-comment[data-post-idx="\${postIdx}"][data-post-category="\${postCategory}"]`);
 	//alert("1862번라인 : "+replyInput);
 	let replyContent=replyInput.value.trim();
    //end 댓글유효성
	//alert(nowPage);
	//alert(postCategory);
	//alert(postIdx);
	//alert(replyContent); // 댓글 내용
	//로그인 유저 체크 하고 있으면 댓글달기 실행
	let login_mem_idx="${user.mem_idx}";
	if(login_mem_idx>0){
		
 	//댓글 유효성 검사 (댓글이 써져있는지)
 	const input = document.querySelector(`.post-comment[data-post-idx="\${postIdx}"][data-post-category="\${postCategory}"]`);
    	//alert(input);
    if(!input) {
        alert("댓글 입력창을 찾을 수 없습니다.");
        return;
    }

    const content = input.value.trim(); // 앞뒤 공백 제거
    if(content === "") {
        alert("댓글 내용을 입력해주세요.");
        input.focus();
        return;
    }
		//alert(login_mem_idx); // 로그인 유저 idx
			$.ajax({
	 		url:"/post/reply"
	 		,data:{"post_idx":postIdx,"mem_idx":login_mem_idx,"reply_content":replyContent}
	 		,success:function(d){
	 			//alert("성공");
	 			listHtml(postCategory,nowPage);
	 		}
	 		,error:function(e){
	 			
	 			alert("댓글 달기 실패 관리자에게 문의");
	 		}
	 	});//end 댓글달기 ajax 
	}else{
		alert("로그인이 필요합니다.");
		location.href="${pageContext.request.contextPath}/user/login?url="+window.location.href;
	}
   	    	    /*  document.addEventListener("click", function(e) {
   	    	    	alert() 
   	    	     } */
   	    	     //let postComments = document.querySelectorAll('.comment-input'); // .을 추가하여 클래스를 선택하도록 수정
   	    	     //postComments.forEach(function(comment) {
   	    	     //    comment.addEventListener('click', function(e) {
   	    	     //        alert(e.target.dataset.postIdx); // data-post-idx는 data-postIdx로 변경해야 함
   	    	     //    });
   	    	     //});
     }
 /* ------------------------end:댓글 등록 함수--------------------------- */
 
 
 
 // =====================
 //  댓글 수정버튼	 
 // =====================
  // 댓글 점3개 메뉴 토글 - 기존 패턴과 동일
    	     document.addEventListener('click', function(e) {
   	    	    // 1) 점3개 버튼 클릭
   	    	    const moreBtn = e.target.closest('.comment-more-btn');
   	    	    if(moreBtn){
   	    	        e.preventDefault();

   	    	        const menu = moreBtn.nextElementSibling; // 현재 메뉴

   	    	        // 2) 다른 메뉴 닫기
   	    	        document.querySelectorAll('.comment-more-menu').forEach(m=>{
   	    	            if(m !== menu) m.style.display = 'none';
   	    	        });

   	    	        // 3) 다른 댓글 수정창 닫기
  	    	            document.querySelectorAll('.comment-edit-box').forEach(box=>{
	    	            const commentItem = box.closest('.comment-item');

  	    	            // 원래 댓글 내용 가져오기
  	    	            const originalText = commentItem.dataset.originalContent || '';

  	    	            const textDiv = document.createElement('div');
  	    	            textDiv.className = 'comment-text';
  	    	            textDiv.innerText = originalText;

  	    	            box.replaceWith(textDiv); // 수정창 → 원래 댓글로 복원
				    });

   	    	        // 4) 현재 메뉴 토글
   	    	        menu.style.display = (menu.style.display === 'none' || menu.style.display === '') ? 'block' : 'none';
   	    	    }
    	         
    	         // 댓글 점3개 수정 버튼
    	         if (e.target.matches('.comment-edit-btn')) {
    	        	 const menu = e.target.closest('.comment-more-menu');
    	        	 if (menu) menu.style.display = 'none';
    	             const reply_idx = e.target.dataset.replyIdx; //댓글번호
    	             const commentItem=e.target.closest('.comment-item'); 
    	             const textDiv = commentItem.querySelector('.comment-text');
    	             // 원본 댓글 내용 저장 (한 번만)
    	             if (!commentItem.dataset.originalContent) {
    	                 commentItem.dataset.originalContent = textDiv.innerText;
    	             }
    	             const originalText=textDiv.innerText; //댓글 원본 내용
    	             if(commentItem.querySelector('.comment-edit-input'))return;
    	             
    	             //수정폼으로 교체
    	            let editHTML=`
    	             <div class="comment-edit-box">
    	            	<div class="comment-input">
      	            	 <input type="text" class="post-comment post-comment-content" value="\${originalText}">
    	                 <button class="comment-save-btn" data-reply-idx="\${reply_idx}">저장</button>
    	                 <button class="comment-cancel-btn">취소</button>
      	            	 </div
    	             </div>
    	             `
    	             
   	                 // comment-text → textarea + 버튼으로 교체
				    const temp = document.createElement("div");
				    temp.innerHTML = editHTML;
				    
				    textDiv.replaceWith(temp);
				    
    	             //alert('댓글 수정 기능 - reply_content: ' + reply_content);
    	             //alert('댓글 수정 기능 - reply_idx: ' + reply_idx);
    	             
    	  
    	          
    	         }//end : if 댓글 수정버튼 클릭
    	         
    	         // 댓글 저장버튼
    	         if(e.target.matches('.comment-save-btn')){
    	        	 //alert("저장버튼");
    	        	 const reply_idx = e.target.dataset.replyIdx; //댓글번호
    	             const commentItem=e.target.closest('.comment-item');
    	        	 const input=commentItem.querySelector('.post-comment-content'); //수정입력창
    	             const reply_content=input.value.trim();
    	        	 
    	             //alert('댓글 수정 기능 - reply_content: ' + reply_content);
    	             //alert('댓글 수정 기능 - reply_idx: ' + reply_idx);
    	             // 댓글 수정처리
    	             
    	             $.ajax({
    	            	 url:"/post/reply_modify"
    	            	,data:{"reply_idx":reply_idx,"reply_content":reply_content}
    	             	,success:function(d){
    	             		if(d.res){
    	             				
    	             		    
    	                        // ★ 화면 업데이트 ★
    	                        const newTextDiv = document.createElement("div");
    	                        newTextDiv.className = "comment-text";
    	                        newTextDiv.innerText = reply_content;

    	                        // input + 버튼 wrapper를 comment-text로 교체
    	                        const editWrapper = commentItem.querySelector('.comment-edit-box');
    	                        if(editWrapper){
    	                            editWrapper.replaceWith(newTextDiv);
    	                        }
    	             			setTimeout(function(){
    	             			alert("수정되었습니다.");
    	             				
    	             			},1)
    	             		}
    	             	}//success
    	             	,error:function(e){
    	             		alert("수정실패 관리자에게 문의");
    	             	}
    	             });//end 수정 ajax
    	             
    	         }//end : if 댓글 저장버튼
    	             
    	         //댓글 취소버튼
    	         if(e.target.matches('.comment-cancel-btn')){
   	        	    const commentItem = e.target.closest('.comment-item'); // 댓글 전체
   	        	    const editBox = commentItem.querySelector('.comment-edit-box'); // 수정창
   	        	    const originalText = commentItem.dataset.originalContent || ''; // 저장된 원본 내용

   	        	    // 수정창을 원래 댓글 div로 교체
   	        	    const textDiv = document.createElement('div');
   	        	    textDiv.className = 'comment-text';
   	        	    textDiv.innerText = originalText;

   	        	    if(editBox){
   	        	        editBox.replaceWith(textDiv);
   	        	    }
    	         }//end : 댓글 취소버튼
    	             
    	         
    	         // 댓글 삭제 버튼
    	         if (e.target.matches('.comment-delete-btn')) {
    	             const replyIdx = e.target.dataset.replyIdx;
    	             const nowPage = e.target.dataset.nowPage;
    	             const postCategory=e.target.dataset.postCategory;
    	             //alert("댓글삭제");
    	             if (confirm('댓글을 삭제하시겠습니까?')) {
    	                 //alert('댓글 삭제 기능 - reply_idx: ' + replyIdx);
    	                 $.ajax({
    	                	 url:"/post/reply_delete"
    	                	,data:{"reply_idx":replyIdx}
    	                 	,success:function(d){
    	                 		listHtml(postCategory,nowPage);
    	                 		setTimeout(function(){
    	                 		alert("댓글이 삭제 되었습니다");
    	                 		}
    	                 				,100);
    	                 	}//end success
    	                 	,error:function(e){
    	                 		alert("댓글삭제 실패 /n관리자에게 문의하세요");
    	                 	}
    	                 });//end : ajax 댓글삭제버튼
    	                 
    	                 // 여기에 삭제 로직 추가
    	             }
    	         }
    	         
    	         // 외부 클릭 시 메뉴 닫기
    	         if (!e.target.closest('.comment-actions')) {
    	             document.querySelectorAll('.comment-more-menu').forEach(menu => {
    	                 menu.style.display = 'none';
    	             });
    	         }
    	     });
 //============================================
 
 
 
 
 // =========================
 // 4. 상품 스크롤 드래그 기능
 // =========================
 function productSection(){

     const productSections = document.querySelectorAll('.product-section');

     productSections.forEach(productSection => {
         let isMouseDown = false;
         let startX = 0;
         let scrollLeft = 0;
         let isDragging = false;
         let clickTimeout;

         productSection.addEventListener('mousedown', (e) => {
             isMouseDown = true;
             isDragging = false;
             productSection.style.cursor = 'grabbing';
             startX = e.pageX - productSection.offsetLeft;
             scrollLeft = productSection.scrollLeft;
             e.preventDefault();
         });

         productSection.addEventListener('mouseleave', () => {
             isMouseDown = false;
             isDragging = false;
             productSection.style.cursor = 'grab';
         });

         productSection.addEventListener('mouseup', () => {
             isMouseDown = false;
             productSection.style.cursor = 'grab';
         });

         productSection.addEventListener('mousemove', (e) => {
             if (!isMouseDown) return;
             e.preventDefault();
             isDragging = true;
             const x = e.pageX - productSection.offsetLeft;
             const walk = (x - startX) * 2;
             requestAnimationFrame(() => { productSection.scrollLeft = scrollLeft - walk; });
         });

         const productLinks = productSection.querySelectorAll('.product-link');
         productLinks.forEach(link => {
             link.addEventListener('click', (e) => {
                 if (isDragging) {
                     e.preventDefault();
                     clearTimeout(clickTimeout);
                     clickTimeout = setTimeout(() => { window.location.href = link.href; }, 500);
                 }
             });
         });
     });
 };
 /* ------------------------------------------------------------------------ */
 
 /* 내용에서 수정삭제 머튼 컨트롤 js------------------------------------------------------------------------ */
 function moreButtons(){
	 

 $(document).ready(function() {
    // 점 3개 버튼 클릭 시 수정/삭제 메뉴 토글
    $('.more-options').click(function(e) {
        e.stopPropagation(); // 클릭 이벤트가 부모 요소로 전달되지 않게 함
        $(this).siblings('.more-options-menu').toggle(); // 해당 메뉴를 보이거나 숨김
    });

    // 메뉴 바깥 영역 클릭 시 메뉴 숨기기
    $(document).click(function(e) {
        if (!$(e.target).closest('.post-interactions').length) {
            $('.more-options-menu').hide(); // .post-interactions 외 클릭 시 숨김
        }
    });

    // 수정 버튼 클릭 시 수정페이지로 이동
    $('.edit-btn').click(function() {
        // 여기에 수정 처리 로직을 추가하세요
    	
        let post_idx=$(this).data('post-idx');
        location.href="/post/modify?post_idx="+post_idx;
    });

    // 삭제 버튼 클릭 시 처리
    $('.delete-btn').click(function() {
            // 여기에 삭제 처리 로직을 추가하세요
        if (confirm("정말 삭제하시겠습니까?")) {
            const deleteBtn=document.querySelector('.delete-btn');
            const postIdx=this.getAttribute('data-post-idx');
            
     		$.ajax({
     			url:"/post/delete"
     			,data:{"post_idx":postIdx}
     			,method:"post"
     			,success:function(d){
     				if(d.post_delete){
     				//alert("삭제성공");
     				location.href="/post/list"
     				};
     				
     			}
     			,error:function(e){
     				alert("삭제처리 실패");
     			}
     			
     		});
           	//alert(postIdx);
        }
    });
});
 }
 /* end: 내용에서 수정삭제 머튼 컨트롤 js------------------------------------------------------------------------ */



 /* post 페이지에 처음 들어왔을때 전체보기 1번클릭할수 있게 초기화 */
 document.addEventListener('DOMContentLoaded', function() {
    // 원하는 탭을 찾고 자동으로 클릭
    const defaultTab = document.getElementById('post-all');
    if (defaultTab) {
        defaultTab.click(); // 자동으로 클릭 이벤트 발생
    }
});


 
    </script>
				</div>
			</div>
		</div>
	</section>
	<!-- End Q&A Section -->
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
	<!-- ========================= scroll-top ========================= -->
	<a href="#" class="scroll-top"> <i class="lni lni-chevron-up"></i>
	</a>



	<!-- ========================= JS here ========================= -->
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/tiny-slider.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/glightbox.min.js"></script>
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
    
    </script>

</body>
</html>