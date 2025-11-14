<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>OneTouch-상품리스트</title>
    
    <!-- 파비콘 -->
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/images/favicon.svg" />
    
    <!-- 스타일시트 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/LineIcons.3.0.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/tiny-slider.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/glightbox.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
    
    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    
    <!-- 부트스트랩 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        /* 관리자 페이지 스타일 */
        .sidebar {
            width: 280px;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            background-color: white;
            padding: 20px 0;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            z-index: 100;
            transition: transform 0.3s ease-in-out;
        }
        
        .sidebar .logo {
            font-size: 24px;
            font-weight: 700;
            color: #3f51b5;
            padding: 0 20px;
            margin-bottom: 40px;
        }
        
        .sidebar .menu-section {
            margin-bottom: 30px;
        }
        
        .sidebar .section-title {
            font-size: 14px;
            color: #888;
            padding: 0 20px;
            margin-bottom: 15px;
        }
        
        .sidebar .nav-link {
            padding: 12px 20px;
            color: #333;
            display: flex;
            align-items: center;
            transition: background-color 0.3s;
        }
        
        .sidebar .nav-link:hover {
            background-color: #f5f5f5;
        }
        
        .sidebar .nav-link.active {
            background-color: #f0f4ff;
            color: #3f51b5;
            border-left: 3px solid #3f51b5;
        }
        
        .sidebar .nav-link .icon {
            width: 24px;
            margin-right: 10px;
            text-align: center;
        }
        
        .main-content {
            margin-left: 280px;
            padding: 20px;
            transition: margin-left 0.3s ease-in-out;
        }
        
        /* 모바일 메뉴 토글 버튼 */
        .mobile-menu-toggle {
            display: none;
            position: fixed;
            top: 15px;
            left: 15px;
            z-index: 101;
            background-color: #3f51b5;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
        }
        
        /* 오버레이 */
        .sidebar-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 99;
        }
        
        .admin-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            padding: 10px 20px;
            background-color: white;
            border-radius: 5px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
            flex-wrap: wrap;
        }
        
        .page-title {
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 15px;
            color: #333;
            display: flex;
            align-items: center;
        }
        
        .page-title .indicator {
            display: inline-block;
            width: 18px;
            height: 18px;
            border-radius: 4px;
            background-color: #f7a501;
            margin-right: 10px;
        }
        
        .action-buttons {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }
        
        .search-bar {
            margin-bottom: 20px;
            display: flex;
            gap: 10px;
        }
        
        .product-table {
            background-color: white;
            border-radius: 5px;
            overflow-x: auto;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }
        
        .product-table table {
            width: 100%;
            border-collapse: collapse;
            min-width: 800px;
        }
        
        .product-table th {
            background-color: #f8f9fa;
            padding: 12px;
            text-align: center;
            font-weight: 500;
            color: #666;
            border-bottom: 1px solid #e0e0e0;
            cursor: pointer;
        }
        
        .product-table th.sortable:hover {
            background-color: #e9ecef;
        }
        
        .product-table th.sorted-asc::after {
            content: "▲";
            margin-left: 5px;
            font-size: 12px;
        }
        
        .product-table th.sorted-desc::after {
            content: "▼";
            margin-left: 5px;
            font-size: 12px;
        }
        
        .product-table td {
            padding: 15px 12px;
            text-align: center;
            border-bottom: 1px solid #e0e0e0;
            vertical-align: middle;
        }
        
        /* 관리 버튼 세로 배치 */
        .manage-buttons {
            display: flex;
            flex-direction: column;
            gap: 5px;
            align-items: center;
        }
        
        .manage-buttons .btn {
            width: 60px;
            padding: 4px 8px;
            font-size: 12px;
        }
        
        .btn-admin {
            background-color: #dc3545;
            color: white;
        }
        
        .btn-login {
            background-color: white;
            color: #666;
            border: 1px solid #ddd;
        }
        
        .btn-blue {
            background-color: #213997;
            color: white;
        }
        
        .btn-green {
            background-color: #4caf50;
            color: white;
        }
        
        .btn-red {
            background-color: #f44336;
            color: white;
        }
        
        .hidden {
            display: none;
        }
        
        .sort-option {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
            flex-wrap: wrap;
        }
        
        .sort-option select {
            margin-left: 10px;
            max-width: 150px;
        }
        
        /* 모달 스타일 */
        .product-modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.3);
            z-index: 2000;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        
        .modal-content {
            position: relative;
            background-color: #fff;
            width: 100%;
            max-width: 600px;
            margin: 0 auto;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
            max-height: 90vh;
            overflow-y: auto;
        }
        
        .modal-header {
            padding: 12px 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #eee;
        }
        
        .modal-title {
            font-size: 18px;
            font-weight: 600;
            color: #333;
        }
        
        .close-btn {
            font-size: 20px;
            font-weight: bold;
            color: #888;
            cursor: pointer;
            background: none;
            border: none;
        }
        
        .modal-body {
            padding: 15px;
        }
        
        .form-group {
            margin-bottom: 12px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 4px;
            font-size: 14px;
            font-weight: 500;
            color: #333;
        }
        
        .form-group input,
        .form-group textarea,
        .form-group select {
            width: 100%;
            padding: 7px 10px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        
        .form-group input::placeholder,
        .form-group textarea::placeholder {
            color: #aaa;
        }
        
        .form-group textarea {
            resize: vertical;
            min-height: 60px;
        }
        
        /* 파일 선택 영역을 네모 박스로 변경 */
        .file-upload-box {
            border: 1px dashed #ccc;
            border-radius: 4px;
            padding: 10px;
            margin-top: 5px;
            background-color: #f9f9f9;
            text-align: center;
        }
        
        .file-input-label {
            display: inline-block;
            padding: 6px 12px;
            background-color: #eee;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            color: #555;
            cursor: pointer;
            margin-bottom: 8px;
        }
        
        .file-input-label:hover {
            background-color: #e0e0e0;
        }
        
        .file-input-text {
            display: block;
            font-size: 13px;
            color: #777;
            margin-top: 5px;
            word-break: break-all;
        }
        
        .hidden-file-input {
            display: none;
        }
        
        .modal-footer {
            padding: 12px 15px;
            border-top: 1px solid #eee;
            text-align: right;
        }
        
        .btn-cancel {
            padding: 6px 12px;
            margin-right: 8px;
            background-color: #f44336;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            cursor: pointer;
        }
        
        .btn-submit {
            padding: 6px 12px;
            background-color: #2e3192;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            cursor: pointer;
        }
        
        /* 관리자 페이지에서 메인 헤더 숨기기 */
        .admin-page .header {
            display: none;
        }
        
        /* 현재 이미지 표시 영역 */
        #currentImageDiv {
            margin-bottom: 12px;
            padding: 10px;
            background-color: #f5f5f5;
            border-radius: 4px;
        }
        
        #currentImage {
            max-width: 100%;
            height: auto;
            max-height: 200px;
            display: block;
            margin: 0 auto;
        }
        
        /* 태블릿 대응 (768px ~ 1024px) */
        @media (max-width: 1024px) {
            .sidebar {
                width: 220px;
            }
            
            .main-content {
                margin-left: 220px;
            }
            
            .product-table th,
            .product-table td {
                padding: 10px 8px;
                font-size: 14px;
            }
        }
        
        /* 모바일 대응 (768px 이하) */
        @media (max-width: 768px) {
            .mobile-menu-toggle {
                display: block;
            }
            
            .sidebar {
                transform: translateX(-100%);
                width: 280px;
            }
            
            .sidebar.active {
                transform: translateX(0);
            }
            
            .sidebar-overlay.active {
                display: block;
            }
            
            .main-content {
                margin-left: 0;
                padding: 60px 15px 20px;
            }
            
            .admin-header {
                padding: 10px;
                flex-direction: column;
                gap: 10px;
            }
            
            .auth-buttons {
                width: 100%;
                display: flex;
                justify-content: center;
                gap: 10px;
            }
            
            .page-title {
                font-size: 1.2rem;
                margin-bottom: 10px;
            }
            
            .action-buttons {
                width: 100%;
                justify-content: center;
            }
            
            .action-buttons button {
                flex: 1;
                min-width: 100px;
            }
            
            .search-bar {
                flex-direction: column;
            }
            
            .search-bar form {
                flex-direction: column !important;
            }
            
            .search-bar input,
            .search-bar button {
                width: 100%;
            }
            
            /* 모바일 테이블 스크롤 안내 */
            .product-table::after {
                content: "← 좌우로 스크롤 →";
                display: block;
                text-align: center;
                padding: 10px;
                color: #666;
                font-size: 12px;
            }
            
            /* 테이블 최소 너비 조정 */
            .product-table table {
                min-width: 700px;
            }
            
            .product-table th,
            .product-table td {
                padding: 8px 6px;
                font-size: 12px;
            }
            
            /* 이미지 크기 조정 */
            .product-table td img {
                max-width: 40px !important;
                max-height: 40px !important;
            }
            
            .modal-content {
                margin: 0 10px;
                max-height: 80vh;
            }
            
            .modal-footer {
                display: flex;
                flex-direction: column;
                gap: 10px;
            }
            
            .modal-footer button {
                width: 100%;
            }
        }
        
        /* 모바일 가로모드 대응 */
        @media (max-width: 768px) and (orientation: landscape) {
            .product-modal {
                padding: 10px;
            }
            
            .modal-content {
                max-height: 90vh;
            }
        }
        
        /* 초소형 모바일 대응 (400px 이하) */
        @media (max-width: 400px) {
            .page-title {
                font-size: 1rem;
            }
            
            .btn-admin,
            .btn-login,
            .btn-blue,
            .btn-red {
                padding: 6px 12px;
                font-size: 14px;
            }
            
            .product-table th,
            .product-table td {
                padding: 6px 4px;
                font-size: 11px;
            }
            
            .manage-buttons .btn {
                width: 50px;
                font-size: 11px;
                padding: 3px 6px;
            }
        }
    </style>
</head>
<body class="admin-page">
    <!-- 모바일 메뉴 토글 버튼 -->
    <button class="mobile-menu-toggle" id="mobileMenuToggle">
        <i class="lni lni-menu"></i>
    </button>
    
    <!-- 사이드바 오버레이 -->
    <div class="sidebar-overlay" id="sidebarOverlay"></div>
    
    <div class="sidebar" id="sidebar">
        <div class="logo">OneTouch</div>
        
        <div class="menu-section">
            <div class="section-title">대시보드</div>
            <nav class="nav flex-column">
                <a class="nav-link" href="#">
                    <span class="icon">📊</span> 통계 대시보드
                </a>
            </nav>
        </div>
        
        <div class="menu-section">
            <div class="section-title">관리</div>
            <nav class="nav flex-column">
                <a class="nav-link" href="#">
                    <span class="icon">👤</span> 회원관리
                </a>
                <a class="nav-link active" href="#">
                    <span class="icon">🛒</span> 상품등록
                </a>
                <a class="nav-link" href="#">
                    <span class="icon">📝</span> 재고관리
                </a>
                <a class="nav-link" href="#">
                    <span class="icon">🧾</span> 주문관리
                </a>
            </nav>
        </div>
        
        <div class="menu-section">
            <div class="section-title">-</div>
            <nav class="nav flex-column">
                <a class="nav-link" href="#">
                    <span class="icon">⚙️</span> 시스템 관리
                </a>
            </nav>
        </div>
    </div>

    <div class="main-content">
        <div class="admin-header">
            <div></div>
            <div class="auth-buttons">
                <button class="btn btn-admin">관리자</button>
                <button class="btn btn-login">로그아웃</button>
            </div>
        </div>
        
        <div class="page-title">
            <span class="indicator"></span> 상품조회 및 등록
        </div>
        
        <div class="action-buttons mb-3">
            <button class="btn btn-blue" id="openModal">상품등록</button>
            <button class="btn btn-red" id="deleteSelectedBtn">선택삭제</button>
        </div>
        
        <div class="search-bar">
            <form id="searchForm" action="${pageContext.request.contextPath}/admin/products" method="get" class="d-flex w-100 gap-2">
                <input type="text" class="form-control" name="keyword" id="search_text"
                       placeholder="검색어를 입력하세요" value="${param.keyword}">
                <button type="submit" class="btn btn-primary">검색</button>
            </form>
        </div>
        
        <div class="product-table">
            <form id="deleteForm" action="${pageContext.request.contextPath}/admin/product/delete_batch" method="post">
                <table id="productTable">
                    <thead>
                        <tr>
                            <th width="5%"><input type="checkbox" id="checkAll"></th>
                            <th width="10%">상품번호</th>
                            <th width="10%">카테고리번호</th>
                            <th width="10%">상품이미지</th>
                            <th width="25%">상품명</th>
                            <th width="15%">브랜드</th>
                            <th width="10%">가격</th>
                            <th width="10%">재고</th>
                            <th width="15%">관리</th>
                        </tr>
                    </thead>
                    <tbody id="productTableBody">
                        <c:choose>
                            <c:when test="${not empty list}">
                                <c:forEach var="product" items="${list}">
                                    <tr>
                                        <td><input type="checkbox" name="product_idx_list" value="${product.product_idx}"></td>
                                        <td>P${String.format("%03d", product.product_idx)}</td>
                                        <td>C${product.category_idx}</td>
                                        <td>
                                            <img src="${pageContext.request.contextPath}/images/${product.product_image_url}" 
                                                 style="max-width: 60px; max-height: 60px;">
                                        </td>
                                        <td>${product.product_name}</td>
                                        <td>${product.product_brand}</td>
                                        <td><fmt:formatNumber value="${product.product_price}" pattern="#,###"/>원</td>
                                        <td>${product.product_cnt}개</td>
                                        <td>
                                            <div class="manage-buttons">
                                                <button type="button" class="btn btn-sm btn-outline-primary" 
                                                        onclick="editProduct(${product.product_idx})">수정</button>
                                                <button type="button" class="btn btn-sm btn-outline-danger" 
                                                        onclick="deleteSingleProduct(${product.product_idx})">삭제</button>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="9">검색 결과가 없거나 등록된 상품이 없습니다.</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </form>
        </div>
    </div>

    <!-- 상품등록/수정 모달 -->
    <form name="f" method="post" enctype="multipart/form-data" id="productForm">
        <input type="hidden" id="product_idx" name="product_idx" value="0">
        <input type="hidden" id="mode" name="mode" value="insert">
        
        <div id="productModal" class="product-modal">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="modalTitle">상품 등록</h3>
                    <button class="close-btn" id="closeModal">×</button>
                </div>
                <div class="modal-body">
                    <!-- 현재 이미지 표시 (수정 모드일 때만 표시) -->
                    <div class="form-group" id="currentImageDiv" style="display:none;">
                        <label>현재 이미지</label>
                        <div>
                            <img id="currentImage" src="">
                        </div>
                    </div>
                    
                    <!-- 카테고리번호 -->
                    <div class="form-group">
                        <label for="category_idx">카테고리번호</label>
                        <select id="category_idx" name="category_idx">
                            <option value="">카테고리 선택</option>
                            <c:forEach var="category" items="${category_list}">
                                <option value="${category.category_idx}">${category.category_name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    
                    <!-- 상품명 -->
                    <div class="form-group">
                        <label for="product_name">상품명</label>
                        <input type="text" id="product_name" name="product_name" placeholder="상품명 입력">
                    </div>
                    
                    <!-- 브랜드 -->
                    <div class="form-group">
                        <label for="product_brand">브랜드</label>
                        <input type="text" id="product_brand" name="product_brand" placeholder="브랜드명 입력">
                    </div>
                    
                    <!-- 가격 -->
                    <div class="form-group">
                        <label for="product_price">가격</label>
                        <input type="text" id="product_price" name="product_price" placeholder="가격 입력">
                    </div>
                    
                    <!-- 상품설명 -->
                    <div class="form-group">
                        <label for="product_comment">상품설명</label>
                        <textarea id="product_comment" name="product_comment" placeholder="상품설명 입력"></textarea>
                    </div>
                    
                    <!-- 재고수량 -->
                    <div class="form-group">
                        <label for="product_cnt">재고수량</label>
                        <input type="text" id="product_cnt" name="product_cnt" placeholder="재고수량 입력" value="0">
                    </div>
                    
                    <!-- 상품 이미지 -->
                    <div class="form-group">
                        <label for="photo" id="photoLabel">상품 이미지</label>
                        <div class="file-upload-box">
                            <input type="file" id="photo" name="photo" class="hidden-file-input">
                            <label for="photo" class="file-input-label">파일 선택</label>
                            <div class="file-input-text" id="fileInputText">선택된 파일 없음</div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn-cancel" id="cancelBtn">취소</button>
                    <button type="button" class="btn-submit" id="submitBtn" onclick="send(this.form);return false;">등록하기</button>
                </div>
            </div>
        </div>
    </form>

    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <script>
        // 모바일 메뉴 토글
        const mobileMenuToggle = document.getElementById('mobileMenuToggle');
        const sidebar = document.getElementById('sidebar');
        const sidebarOverlay = document.getElementById('sidebarOverlay');
        
        mobileMenuToggle.addEventListener('click', function() {
            sidebar.classList.toggle('active');
            sidebarOverlay.classList.toggle('active');
        });
        
        sidebarOverlay.addEventListener('click', function() {
            sidebar.classList.remove('active');
            sidebarOverlay.classList.remove('active');
        });
        
        // 화면 크기 변경 시 사이드바 초기화
        window.addEventListener('resize', function() {
            if (window.innerWidth > 768) {
                sidebar.classList.remove('active');
                sidebarOverlay.classList.remove('active');
            }
        });
        
        // 모달 관련 변수
        var modal = document.getElementById("productModal");
        var openBtn = document.getElementById("openModal");
        var closeBtn = document.getElementById("closeModal");
        var cancelBtn = document.getElementById("cancelBtn");
        var fileInput = document.getElementById("photo");
        var fileInputText = document.getElementById("fileInputText");

        // 모달 열기 - 등록 모드
        openBtn.onclick = function() {
            console.log("[openModal] 등록 모드로 모달 열기");
            
            // 모드 설정
            document.getElementById("mode").value = "insert";
            document.getElementById("product_idx").value = "0";
            document.getElementById("modalTitle").textContent = "상품 등록";
            document.getElementById("submitBtn").textContent = "등록하기";
            document.getElementById("photoLabel").textContent = "상품 이미지";
            document.getElementById("currentImageDiv").style.display = "none";
            
            // 폼 초기화
            document.getElementById("productForm").reset();
            fileInputText.textContent = "선택된 파일 없음";
            
            modal.style.display = "flex";
        }

        // 수정 버튼 클릭 시
        function editProduct(product_idx) {
            console.log("[editProduct] product_idx:", product_idx);
            
            // Ajax로 상품 정보 조회
            $.ajax({
                url: "${pageContext.request.contextPath}/admin/product/get",
                type: "GET",
                data: { product_idx: product_idx },
                success: function(vo) {
                    console.log("[editProduct] 조회된 상품:", vo);
                    
                    // 모드 설정
                    document.getElementById("mode").value = "update";
                    document.getElementById("product_idx").value = vo.product_idx;
                    document.getElementById("modalTitle").textContent = "상품 수정";
                    document.getElementById("submitBtn").textContent = "수정하기";
                    document.getElementById("photoLabel").textContent = "새 이미지 (변경시에만 선택)";
                    
                    // 폼 필드에 값 설정
                    document.getElementById("category_idx").value = vo.category_idx;
                    document.getElementById("product_name").value = vo.product_name;
                    document.getElementById("product_brand").value = vo.product_brand || '';
                    document.getElementById("product_price").value = vo.product_price;
                    document.getElementById("product_comment").value = vo.product_comment ? vo.product_comment.replace(/<br>/g, '\n') : '';
                    document.getElementById("product_cnt").value = vo.product_cnt;
                    
                    // 현재 이미지 표시
                    if (vo.product_image_url) {
                        document.getElementById("currentImageDiv").style.display = "block";
                        document.getElementById("currentImage").src = 
                            "${pageContext.request.contextPath}/images/" + vo.product_image_url;
                    }
                    
                    // 파일 입력 초기화
                    document.getElementById("photo").value = "";
                    fileInputText.textContent = "선택된 파일 없음";
                    
                    // 모달 열기
                    modal.style.display = "flex";
                },
                error: function() {
                    alert("상품 정보를 불러오는데 실패했습니다.");
                }
            });
        }

        // 모달 닫기
        closeBtn.onclick = function() {
            modal.style.display = "none";
        }

        // 취소 버튼
        cancelBtn.onclick = function() {
            modal.style.display = "none";
        }

        // 모달 외부 클릭시 닫기
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }

        // 파일 선택 시 파일명 표시
        fileInput.addEventListener("change", function() {
            if (fileInput.files.length > 0) {
                fileInputText.textContent = fileInput.files[0].name;
            } else {
                fileInputText.textContent = "선택된 파일 없음";
            }
        });

        // 폼 제출
        function send(f) {
            let mode = f.mode.value;
            console.log("[send] mode:", mode);
            
            // 필드 값 가져오기
            let category_idx = f.category_idx.value;
            let product_name = f.product_name.value;
            let product_price = f.product_price.value;
            let product_comment = f.product_comment.value;
            let product_cnt = f.product_cnt.value;
            let photo = f.photo.value;

            // 입력 검증
            if (category_idx == "") {
                alert("카테고리를 선택하세요!");
                f.category_idx.focus();
                return;
            }

            if (product_name == "") {
                alert("상품명을 입력하세요!");
                f.product_name.focus();
                return;
            }

            if (product_price == "") {
                alert("가격을 입력하세요!");
                f.product_price.focus();
                return;
            }

            if (isNaN(product_price.replace(/,/g, ''))) {
                alert("가격은 숫자만 입력하세요!");
                f.product_price.value = "";
                f.product_price.focus();
                return;
            }

            if (product_comment == "") {
                alert("상품설명을 입력하세요!");
                f.product_comment.focus();
                return;
            }

            if (product_cnt == "" || isNaN(product_cnt)) {
                alert("재고수량은 숫자로 입력하세요!");
                f.product_cnt.focus();
                return;
            }

            // 등록 모드에서만 이미지 필수
            if (mode == "insert" && photo == "") {
                alert("상품 이미지를 선택하세요!");
                return;
            }

            // 폼 제출
            if (mode == "insert") {
                f.action = "${pageContext.request.contextPath}/admin/product/insert";
            } else {
                f.action = "${pageContext.request.contextPath}/admin/product/update";
            }
            
            console.log("[send] action:", f.action);
            f.submit();
        }

        // 단일 삭제
        function deleteSingleProduct(product_idx) {
            if (confirm('상품번호 ' + product_idx + '번 상품을 삭제하시겠습니까?')) {
                window.location.href = '${pageContext.request.contextPath}/admin/product/delete?product_idx=' + product_idx;
            }
        }

        // 페이지 로드 시 초기화
        $(document).ready(function() {
            // 전체 선택 체크박스
            $("#checkAll").change(function() {
                $("input[name='product_idx_list']").prop('checked', $(this).prop('checked'));
            });
            
            // 개별 체크박스
            $(document).on("change", "input[name='product_idx_list']", function() {
                let allChecked = true;
                $("input[name='product_idx_list']").each(function() {
                    if (!$(this).prop('checked')) {
                        allChecked = false;
                        return false;
                    }
                });
                $("#checkAll").prop('checked', allChecked);
            });
            
            // 선택 삭제 버튼
            $("#deleteSelectedBtn").click(function() {
                const checkedItems = $("input[name='product_idx_list']:checked");
                
                if (checkedItems.length === 0) {
                    alert('삭제할 상품을 하나 이상 선택하세요.');
                    return;
                }
                
                if (confirm(checkedItems.length + '개의 상품을 정말로 삭제하시겠습니까?')) {
                    $("#deleteForm").submit();
                }
            });
        });
    </script>
</body>
</html>