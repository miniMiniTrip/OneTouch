<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OneTouch - 커뮤니티</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- Custom CSS -->
    <style>
        :root {
            --primary-color: #1a237e;
            --secondary-color: #f5f5f5;
            --text-color: #333;
            --light-gray: #e0e0e0;
            --dark-gray: #757575;
        }
        
        body {
            font-family: 'Noto Sans KR', sans-serif;
            color: var(--text-color);
            background-color: #f9f9f9;
        }
        
        /* 헤더 스타일 */
        .header {
            background-color: white;
            border-bottom: 1px solid #eee;
            padding: 15px 0;
        }
        
        .logo {
            font-size: 1.5rem;
            font-weight: bold;
            color: var(--primary-color);
            text-decoration: none;
        }
        
        .nav-link {
            color: var(--text-color);
            margin-left: 20px;
            font-size: 0.9rem;
        }
        
        /* 커뮤니티 헤더 */
        .community-header {
            background-color: white;
            padding: 30px 0;
            margin-bottom: 30px;
        }
        
        .community-title {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }
        
        .community-title i {
            font-size: 1.8rem;
            color: var(--primary-color);
            margin-right: 10px;
        }
        
        .community-title h1 {
            font-size: 1.8rem;
            font-weight: 700;
            margin: 0;
            color: var(--primary-color);
        }
        
        .community-description {
            color: var(--dark-gray);
            font-size: 0.95rem;
            margin-bottom: 0;
        }
        
        /* 탭 네비게이션 */
        .nav-tabs {
            border-bottom: 1px solid var(--light-gray);
            margin-bottom: 20px;
        }
        
        .nav-tabs .nav-link {
            color: var(--dark-gray);
            border: none;
            border-bottom: 2px solid transparent;
            padding: 12px 20px;
            margin-right: 10px;
            font-weight: 500;
        }
        
        .nav-tabs .nav-link.active {
            color: var(--primary-color);
            border-bottom: 2px solid var(--primary-color);
            background-color: transparent;
        }
        
        .nav-tabs .nav-link:hover {
            border-color: transparent transparent var(--light-gray);
        }
        
        /* 게시글 스타일 */
        .card {
            border: none;
            border-radius: 8px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            transition: transform 0.2s;
        }
        
        .card:hover {
            transform: translateY(-3px);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        
        .card-header {
            background-color: white;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
            padding: 15px 20px;
        }
        
        .card-category {
            display: inline-block;
            font-size: 0.8rem;
            font-weight: 500;
            color: white;
            background-color: #ff9800;
            padding: 2px 8px;
            border-radius: 4px;
            margin-bottom: 8px;
        }
        
        .card-category.notice {
            background-color: #2196f3;
        }
        
        .card-category.question {
            background-color: #9c27b0;
        }
        
        .card-title {
            font-size: 1.1rem;
            font-weight: 600;
            margin-bottom: 10px;
            line-height: 1.4;
        }
        
        .card-title a {
            color: var(--text-color);
            text-decoration: none;
        }
        
        .card-title a:hover {
            color: var(--primary-color);
        }
        
        .card-text {
            color: #666;
            font-size: 0.9rem;
            line-height: 1.5;
            margin-bottom: 15px;
        }
        
        .card-footer {
            background-color: white;
            border-top: none;
            padding: 12px 20px;
        }
        
        .card-user {
            display: flex;
            align-items: center;
            font-size: 0.85rem;
            color: var(--dark-gray);
        }
        
        .card-user img {
            width: 28px;
            height: 28px;
            border-radius: 50%;
            margin-right: 8px;
            object-fit: cover;
        }
        
        .card-stats {
            display: flex;
            font-size: 0.8rem;
            color: var(--dark-gray);
        }
        
        .card-stats div {
            margin-left: 12px;
            display: flex;
            align-items: center;
        }
        
        .card-stats i {
            margin-right: 4px;
        }
        
        /* 글쓰기 버튼 */
        .btn-write {
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: 50px;
            padding: 8px 20px;
            font-size: 0.9rem;
            font-weight: 500;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.15);
            transition: all 0.2s;
        }
        
        .btn-write:hover {
            background-color: #0d1b60;
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
        }
        
        .btn-write i {
            margin-right: 5px;
        }
        
        /* 페이지네이션 */
        .pagination {
            margin-top: 30px;
            margin-bottom: 50px;
            justify-content: center;
        }
        
        .page-item .page-link {
            color: var(--text-color);
            border: none;
            margin: 0 3px;
            border-radius: 4px;
        }
        
        .page-item.active .page-link {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }
        
        /* 추천 상품 섹션 */
        .recommended-products {
            margin-top: 50px;
            margin-bottom: 50px;
        }
        
        .section-title {
            font-size: 1.5rem;
            font-weight: 700;
            margin-bottom: 25px;
            position: relative;
            padding-left: 15px;
        }
        
        .section-title::before {
            content: '';
            position: absolute;
            left: 0;
            top: 6px;
            width: 4px;
            height: 18px;
            background-color: var(--primary-color);
            border-radius: 2px;
        }
        
        .product-card {
            background-color: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.08);
            transition: transform 0.3s, box-shadow 0.3s;
            margin-bottom: 20px;
            position: relative;
        }
        
        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }
        
        .product-img {
            height: 180px;
            position: relative;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .product-img img {
            width: 100%;
            object-fit: cover;
            transition: transform 0.5s;
        }
        
        .product-card:hover .product-img img {
            transform: scale(1.05);
        }
        
        .product-info {
            padding: 15px;
        }
        
        .product-brand {
            font-size: 0.8rem;
            color: var(--dark-gray);
            margin-bottom: 5px;
        }
        
        .product-name {
            font-size: 1rem;
            font-weight: 600;
            margin-bottom: 8px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        
        .product-price {
            font-size: 1.1rem;
            font-weight: 700;
            color: var(--primary-color);
        }
        
        .hot-badge {
            position: absolute;
            top: 10px;
            right: 10px;
            background-color: rgba(255, 0, 0, 0.8);
            color: white;
            font-size: 0.7rem;
            font-weight: 700;
            padding: 3px 8px;
            border-radius: 20px;
            z-index: 1;
        }
    </style>
</head>
<body>
    <!-- 헤더 -->
    <header class="header">
        <div class="container">
            <div class="d-flex justify-content-between align-items-center">
                <a href="#" class="logo">OneTouch</a>
                <div>
                    <a href="#" class="nav-link">로그인</a>
                    <a href="#" class="nav-link">회원가입</a>
                </div>
            </div>
        </div>
    </header>
    
    <!-- 커뮤니티 헤더 -->
    <div class="community-header">
        <div class="container">
            <div class="community-title">
                <i class="fa-solid fa-comments"></i>
                <h1>커뮤니티</h1>
            </div>
            <p class="community-description">OneTouch 회원들과 소통하고 정보를 공유해보세요.</p>
        </div>
    </div>
    
    <!-- 메인 컨텐츠 -->
    <div class="container">
        <div class="row">
            <div class="col-lg-9">
                <!-- 탭 네비게이션 -->
                <ul class="nav nav-tabs" id="communityTab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="all-tab" data-bs-toggle="tab" data-bs-target="#all" type="button" role="tab" aria-controls="all" aria-selected="true">전체</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="skincare-tab" data-bs-toggle="tab" data-bs-target="#skincare" type="button" role="tab" aria-controls="skincare" aria-selected="false">스킨케어팁</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="review-tab" data-bs-toggle="tab" data-bs-target="#review" type="button" role="tab" aria-controls="review" aria-selected="false">리뷰 (구매후기)</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="free-tab" data-bs-toggle="tab" data-bs-target="#free" type="button" role="tab" aria-controls="free" aria-selected="false">자유게시판</button>
                    </li>
                </ul>
                
                <!-- 필터/정렬 및 글쓰기 버튼 -->
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <div class="small text-muted">
                        총 3개의 게시글
                    </div>
                    <a href="#" class="btn btn-write">
                        <i class="fa-solid fa-pencil"></i> 글쓰기
                    </a>
                </div>
                
                <!-- 탭 컨텐츠 -->
                <div class="tab-content" id="communityTabContent">
                    <div class="tab-pane fade show active" id="all" role="tabpanel" aria-labelledby="all-tab">
                        <!-- 게시글 1 -->
                        <div class="card">
                            <div class="card-header">
                                <span class="card-category">자유</span>
                                <h2 class="card-title"><a href="#">겨울철 피부 관리 꿀팁</a></h2>
                                <p class="card-text">겨울이라 건조해서 고생하고 계신가요? 저도 원래 건조한 편인데 특히 겨울에는 각질도 일어나고 당기는 느낌이 심했는데, 요즘 쓰는 제품을 추천해 드릴게요. 크림 추천 받으실 분...</p>
                            </div>
                            <div class="card-footer">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="card-user">
                                        <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="User">
                                        <span>SkinCare01</span>
                                    </div>
                                    <div class="card-stats">
                                        <div>
                                            <i class="fa-regular fa-calendar"></i>
                                            <span>2023-01-14</span>
                                        </div>
                                        <div>
                                            <i class="fa-regular fa-eye"></i>
                                            <span>238</span>
                                        </div>
                                        <div>
                                            <i class="fa-regular fa-heart"></i>
                                            <span>42</span>
                                        </div>
                                        <div>
                                            <i class="fa-regular fa-comment"></i>
                                            <span>12</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- 게시글 2 -->
                        <div class="card">
                            <div class="card-header">
                                <span class="card-category notice">공지</span>
                                <h2 class="card-title"><a href="#">남성 올인원 추천해주세요</a></h2>
                                <p class="card-text">30대 남성입니다. 스스로가 귀차니즘이 심한데 스킨케어 꾸준히 하긴 해야할 것 같네요. 지금 쓰는 거 다 떨어져서 새로 사려고 하는데, 시간 절약할 수 있는 좋은 올인원 제품 추천해주실 분 계신가요? 지성 피부에...</p>
                            </div>
                            <div class="card-footer">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="card-user">
                                        <img src="https://randomuser.me/api/portraits/men/41.jpg" alt="User">
                                        <span>beaumale</span>
                                    </div>
                                    <div class="card-stats">
                                        <div>
                                            <i class="fa-regular fa-calendar"></i>
                                            <span>2023-01-14</span>
                                        </div>
                                        <div>
                                            <i class="fa-regular fa-eye"></i>
                                            <span>152</span>
                                        </div>
                                        <div>
                                            <i class="fa-regular fa-heart"></i>
                                            <span>15</span>
                                        </div>
                                        <div>
                                            <i class="fa-regular fa-comment"></i>
                                            <span>8</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- 게시글 3 -->
                        <div class="card">
                            <div class="card-header">
                                <span class="card-category question">질문</span>
                                <h2 class="card-title"><a href="#">면도후 자극 줄이는 방법 공유</a></h2>
                                <p class="card-text">2주간 서울역에서 진행하는 남성 피부과 이벤트가 있어서 방문해 봤는데 정말 만족스러웠네요. 특히 면도후 자극과 관련된 피부 트러블 상담을 받았는데, 전문의 선생님께서 알려주신 꿀팁을 공유드립니다...</p>
                            </div>
                            <div class="card-footer">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="card-user">
                                        <img src="https://randomuser.me/api/portraits/men/67.jpg" alt="User">
                                        <span>smooth10</span>
                                    </div>
                                    <div class="card-stats">
                                        <div>
                                            <i class="fa-regular fa-calendar"></i>
                                            <span>2023-01-10</span>
                                        </div>
                                        <div>
                                            <i class="fa-regular fa-eye"></i>
                                            <span>89</span>
                                        </div>
                                        <div>
                                            <i class="fa-regular fa-heart"></i>
                                            <span>24</span>
                                        </div>
                                        <div>
                                            <i class="fa-regular fa-comment"></i>
                                            <span>5</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- 페이지네이션 -->
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item"><a class="page-link" href="#">...</a></li>
                                <li class="page-item"><a class="page-link" href="#">10</a></li>
                                <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                    
                    <!-- 다른 탭의 내용은 중복을 피하기 위해 생략 -->
                    <div class="tab-pane fade" id="skincare" role="tabpanel" aria-labelledby="skincare-tab">
                        <!-- 스킨케어팁 탭 내용 -->
                    </div>
                    
                    <div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
                        <!-- 리뷰 탭 내용 -->
                    </div>
                    
                    <div class="tab-pane fade" id="free" role="tabpanel" aria-labelledby="free-tab">
                        <!-- 자유게시판 탭 내용 -->
                    </div>
                </div>
            </div>
            
            <!-- 사이드바 -->
            <div class="col-lg-3">
                <div class="card mb-4">
                    <div class="card-header">
                        <h5 class="mb-0">인기 게시물</h5>
                    </div>
                    <div class="card-body p-0">
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">
                                <a href="#" class="text-decoration-none text-dark small">겨울철 피부 관리 꿀팁</a>
                                <div class="d-flex align-items-center mt-1">
                                    <small class="text-muted me-2">SkinCare01</small>
                                    <i class="fa-regular fa-heart text-danger me-1" style="font-size: 0.8rem;"></i>
                                    <small class="text-muted">42</small>
                                </div>
                            </li>
                            <li class="list-group-item">
                                <a href="#" class="text-decoration-none text-dark small">면도 후 피부 진정 방법</a>
                                <div class="d-flex align-items-center mt-1">
                                    <small class="text-muted me-2">smooth10</small>
                                    <i class="fa-regular fa-heart text-danger me-1" style="font-size: 0.8rem;"></i>
                                    <small class="text-muted">36</small>
                                </div>
                            </li>
                            <li class="list-group-item">
                                <a href="#" class="text-decoration-none text-dark small">건성 피부 보습제 추천</a>
                                <div class="d-flex align-items-center mt-1">
                                    <small class="text-muted me-2">hydra_king</small>
                                    <i class="fa-regular fa-heart text-danger me-1" style="font-size: 0.8rem;"></i>
                                    <small class="text-muted">29</small>
                                </div>
                            </li>
                            <li class="list-group-item">
                                <a href="#" class="text-decoration-none text-dark small">남자 피부 관리 루틴 공유</a>
                                <div class="d-flex align-items-center mt-1">
                                    <small class="text-muted me-2">man_beauty</small>
                                    <i class="fa-regular fa-heart text-danger me-1" style="font-size: 0.8rem;"></i>
                                    <small class="text-muted">24</small>
                                </div>
                            </li>
                            <li class="list-group-item">
                                <a href="#" class="text-decoration-none text-dark small">여드름 관리 방법 질문</a>
                                <div class="d-flex align-items-center mt-1">
                                    <small class="text-muted me-2">clear_skin</small>
                                    <i class="fa-regular fa-heart text-danger me-1" style="font-size: 0.8rem;"></i>
                                    <small class="text-muted">18</small>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                
                <!-- 태그 클라우드 -->
                <div class="card mb-4">
                    <div class="card-header">
                        <h5 class="mb-0">인기 태그</h5>
                    </div>
                    <div class="card-body">
                        <a href="#" class="btn btn-sm btn-outline-primary mb-2 me-1">#스킨케어</a>
                        <a href="#" class="btn btn-sm btn-outline-primary mb-2 me-1">#올인원</a>
                        <a href="#" class="btn btn-sm btn-outline-primary mb-2 me-1">#면도</a>
                        <a href="#" class="btn btn-sm btn-outline-primary mb-2 me-1">#보습</a>
                        <a href="#" class="btn btn-sm btn-outline-primary mb-2 me-1">#클렌징</a>
                        <a href="#" class="btn btn-sm btn-outline-primary mb-2 me-1">#수분크림</a>
                        <a href="#" class="btn btn-sm btn-outline-primary mb-2 me-1">#선크림</a>
                        <a href="#" class="btn btn-sm btn-outline-primary mb-2 me-1">#건성피부</a>
                        <a href="#" class="btn btn-sm btn-outline-primary mb-2 me-1">#지성피부</a>
                        <a href="#" class="btn btn-sm btn-outline-primary mb-2 me-1">#피부타입</a>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- 추천 상품 섹션 -->
        <div class="recommended-products">
            <h2 class="section-title">인기 상품</h2>
            <div class="row">
                <!-- 상품 1 -->
                <div class="col-6 col-md-4 col-lg-2">
                    <div class="product-card">
                        <div class="hot-badge">HOT</div>
                        <div class="product-img">
                            <img src="https://via.placeholder.com/300x300?text=Blue+Face+Wash" alt="Blue Face Wash">
                        </div>
                        <div class="product-info">
                            <div class="product-brand">올리브영</div>
                            <div class="product-name">블루 페이스 워시 세안제</div>
                            <div class="product-price">22,000원</div>
                        </div>
                    </div>
                </div>
                
                <!-- 상품 2 -->
                <div class="col-6 col-md-4 col-lg-2">
                    <div class="product-card">
                        <div class="product-img">
                            <img src="https://via.placeholder.com/300x300?text=Grooming+Kit" alt="Grooming Kit">
                        </div>
                        <div class="product-info">
                            <div class="product-brand">닥터브로</div>
                            <div class="product-name">그루밍 키트</div>
                            <div class="product-price">36,000원</div>
                        </div>
                    </div>
                </div>
                
                <!-- 상품 3 -->
                <div class="col-6 col-md-4 col-lg-2">
                    <div class="product-card">
                        <div class="product-img">
                            <img src="https://via.placeholder.com/300x300?text=After+Shave+Balm" alt="After Shave Balm">
                        </div>
                        <div class="product-info">
                            <div class="product-brand">비버리힐즈 폴로 클럽</div>
                            <div class="product-name">애프터 쉐이브 밤</div>
                            <div class="product-price">28,000원</div>
                        </div>
                    </div>
                </div>
                
                <!-- 상품 4 -->
                <div class="col-6 col-md-4 col-lg-2">
                    <div class="product-card">
                        <div class="hot-badge">HOT</div>
                        <div class="product-img">
                            <img src="https://via.placeholder.com/300x300?text=Shower+Essentials" alt="Shower Essentials">
                        </div>
                        <div class="product-info">
                            <div class="product-brand">온리포맨</div>
                            <div class="product-name">샤워 에센셜 세트</div>
                            <div class="product-price">45,000원</div>
                        </div>
                    </div>
                </div>
                
                <!-- 상품 5 -->
                <div class="col-6 col-md-4 col-lg-2">
                    <div class="product-card">
                        <div class="product-img">
                            <img src="https://via.placeholder.com/300x300?text=Anthony+Black" alt="Anthony Black">
                        </div>
                        <div class="product-info">
                            <div class="product-brand">안토니</div>
                            <div class="product-name">안토니 블랙 | 페이셜 스크럽</div>
                            <div class="product-price">32,000원</div>
                        </div>
                    </div>
                </div>
                
                <!-- 상품 6 -->
                <div class="col-6 col-md-4 col-lg-2">
                    <div class="product-card">
                        <div class="product-img">
                            <img src="https://via.placeholder.com/300x300?text=Deep+Pore+Cleansing" alt="Deep Pore Cleansing">
                        </div>
                        <div class="product-info">
                            <div class="product-brand">맨즈스킨</div>
                            <div class="product-name">딥 포어 클렌징 마스크</div>
                            <div class="product-price">18,000원</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 푸터 -->
    <footer class="bg-dark text-white py-4 mt-5">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <h5>OneTouch</h5>
                    <p class="small">남성을 위한 최고의 뷰티 솔루션</p>
                </div>
                <div class="col-md-4">
                    <h5>고객센터</h5>
                    <p class="small">평일 10:00 - 18:00</p>
                    <p class="small">lunch 12:00 - 13:00</p>
                    <p class="small">토/일/공휴일 휴무</p>
                </div>
                <div class="col-md-4">
                    <h5>회사정보</h5>
                    <p class="small">(주)원터치 | 대표: 홍길동</p>
                    <p class="small">서울특별시 강남구 테헤란로 123</p>
                    <p class="small">사업자등록번호: 123-45-67890</p>
                </div>
            </div>
            <hr>
            <div class="text-center">
                <p class="small mb-0">&copy; 2023 OneTouch. All rights reserved.</p>
            </div>
        </div>
    </footer>
    
    <!-- 부트스트랩 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
