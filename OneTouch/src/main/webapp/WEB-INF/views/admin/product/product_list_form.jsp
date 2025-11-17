<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OneTouch - 상품관리</title>
    
    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    
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

        /* 헤더 */
        .header {
            background: white;
            border-bottom: 1px solid #e0e0e0;
            padding: 20px 40px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 28px;
            font-weight: bold;
            color: #1a237e;
            letter-spacing: -1px;
            cursor: pointer;
            text-decoration: none;
        }
        
        .logo span {
            color: #3949ab;
        }

        .admin-badge {
            background: #d32f2f;
            color: white;
            padding: 6px 12px;
            border-radius: 6px;
            font-size: 13px;
            font-weight: 600;
            margin-left: 12px;
        }

        .header-right {
            display: flex;
            gap: 16px;
            align-items: center;
        }

        .header-user {
            font-size: 14px;
            color: #666;
        }

        .btn-logout {
            padding: 8px 16px;
            background: white;
            border: 1px solid #e0e0e0;
            border-radius: 6px;
            cursor: pointer;
            font-size: 13px;
            transition: all 0.3s;
        }

        .btn-logout:hover {
            border-color: #1a237e;
            color: #1a237e;
        }

        /* 컨테이너 */
        .container {
            max-width: 1600px;
            margin: 40px auto;
            padding: 0 40px;
        }

        /* 레이아웃 */
        .admin-layout {
            display: grid;
            grid-template-columns: 250px 1fr;
            gap: 30px;
        }

        /* 사이드바 */
        .sidebar {
            background: white;
            border-radius: 12px;
            padding: 30px 0;
            height: fit-content;
            position: sticky;
            top: 20px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }

        .sidebar-section {
            margin-bottom: 30px;
        }

        .sidebar-title {
            padding: 0 24px 12px;
            font-size: 14px;
            font-weight: 600;
            color: #999;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .sidebar-menu {
            list-style: none;
        }

        .sidebar-menu a {
            display: block;
            padding: 14px 24px;
            color: #666;
            text-decoration: none;
            font-size: 15px;
            transition: all 0.3s;
            border-left: 3px solid transparent;
        }

        .sidebar-menu a:hover {
            background: #f5f7fa;
            color: #1a237e;
        }

        .sidebar-menu a.active {
            background: #e8eaf6;
            color: #1a237e;
            font-weight: 600;
            border-left-color: #1a237e;
        }

        /* 메인 컨텐츠 */
        .main-content {
            min-height: 600px;
        }

        .section-card {
            background: white;
            border-radius: 12px;
            padding: 30px;
            margin-bottom: 20px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 24px;
            padding-bottom: 16px;
            border-bottom: 2px solid #1a237e;
        }

        .section-title {
            font-size: 24px;
            font-weight: bold;
            color: #1a237e;
        }

        /* 버튼 */
        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-block;
        }

        .btn-primary {
            background: #1a237e;
            color: white;
        }

        .btn-primary:hover {
            background: #0d47a1;
            transform: translateY(-2px);
        }

        .btn-secondary {
            background: white;
            color: #1a237e;
            border: 2px solid #1a237e;
        }

        .btn-secondary:hover {
            background: #f5f7fa;
        }

        .btn-danger {
            background: #d32f2f;
            color: white;
        }

        .btn-danger:hover {
            background: #c62828;
        }

        /* 검색바 */
        .search-controls {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
            flex-wrap: wrap;
        }

        .search-input {
            flex: 1;
            padding: 12px 15px;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            font-size: 14px;
        }

        .search-input:focus {
            outline: none;
            border-color: #1a237e;
        }

        /* 테이블 스타일 */
        .table-container {
            overflow-x: auto;
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }

        .product-table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            min-width: 800px;
        }

        .product-table th {
            background: #f8f9fa;
            padding: 15px 12px;
            text-align: center;
            font-weight: 600;
            color: #666;
            border-bottom: 2px solid #e0e0e0;
            font-size: 14px;
        }

        .product-table td {
            padding: 15px 12px;
            text-align: center;
            border-bottom: 1px solid #f0f0f0;
            vertical-align: middle;
            font-size: 14px;
        }

        .product-table tbody tr:hover {
            background: #f5f7fa;
        }

        .product-table td.text-left {
            text-align: left;
        }

        .product-image {
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        /* 관리 버튼 */
        .manage-buttons {
            display: flex;
            flex-direction: column;
            gap: 5px;
            align-items: center;
        }

        .btn-sm {
            padding: 6px 12px;
            font-size: 12px;
            border-radius: 6px;
            min-width: 60px;
        }

        /* 페이징 스타일 */
        .pagination-wrapper {
            display: flex;
            justify-content: center;
            margin-top: 30px;
        }

        .pagination {
            display: flex;
            gap: 5px;
            list-style: none;
            padding: 0;
        }

        .page-item {
            margin: 0;
        }

        .page-link {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 8px 12px;
            min-width: 40px;
            height: 40px;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            color: #1a237e;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s;
        }

        .page-link:hover {
            background: #f5f7fa;
            border-color: #1a237e;
            transform: translateY(-2px);
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .page-item.active .page-link {
            background: #1a237e;
            border-color: #1a237e;
            color: white;
            font-weight: 600;
            box-shadow: 0 2px 5px rgba(26, 35, 126, 0.3);
        }

        /* 모달 스타일 */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 2000;
            overflow-y: auto;
        }

        .modal.active {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .modal-content {
            background: white;
            border-radius: 12px;
            width: 100%;
            max-width: 600px;
            max-height: 90vh;
            overflow-y: auto;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
        }

        .modal-header {
            padding: 24px;
            border-bottom: 1px solid #e0e0e0;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .modal-title {
            font-size: 20px;
            font-weight: bold;
            color: #1a237e;
        }

        .modal-close {
            background: none;
            border: none;
            font-size: 28px;
            color: #999;
            cursor: pointer;
            transition: color 0.3s;
        }

        .modal-close:hover {
            color: #333;
        }

        .modal-body {
            padding: 24px;
        }

        .modal-footer {
            padding: 24px;
            border-top: 1px solid #e0e0e0;
            display: flex;
            gap: 12px;
            justify-content: flex-end;
        }

        /* 폼 스타일 */
        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
            margin-bottom: 8px;
            font-size: 14px;
            font-weight: 600;
            color: #333;
        }

        .form-input,
        .form-select,
        .form-textarea {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            font-size: 14px;
            font-family: inherit;
            transition: border-color 0.3s;
        }

        .form-input:focus,
        .form-select:focus,
        .form-textarea:focus {
            outline: none;
            border-color: #1a237e;
            box-shadow: 0 0 0 2px rgba(26, 35, 126, 0.1);
        }

        .form-textarea {
            resize: vertical;
            min-height: 100px;
        }

        /* 현재 이미지 표시 */
        .current-image-container {
            margin-bottom: 20px;
            text-align: center;
        }

        .current-image {
            max-width: 200px;
            max-height: 200px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        /* 반응형 */
        @media (max-width: 768px) {
            .container {
                padding: 0 20px;
            }

            .admin-layout {
                grid-template-columns: 1fr;
            }

            .sidebar {
                position: static;
            }

            .search-controls {
                flex-direction: column;
            }

            .search-input {
                width: 100%;
            }

            .product-table {
                font-size: 12px;
            }

            .product-table th,
            .product-table td {
                padding: 8px 6px;
            }

            .product-image {
                width: 40px;
                height: 40px;
            }

            .modal-content {
                margin: 10px;
            }
        }
    </style>
</head>
<body>
    <!-- 헤더 -->
    <header class="header">
        <div>
            <a href="/" class="logo">One<span>Touch</span></a>
            <span class="admin-badge">관리자</span>
        </div>
        <div class="header-right">
            <span class="header-user">관리자님</span>
            <button class="btn-logout" onclick="handleLogout()">로그아웃</button>
        </div>
    </header>

    <!-- 메인 컨테이너 -->
    <div class="container">
        <div class="admin-layout">
            <!-- 사이드바 -->
            <aside class="sidebar">
                <div class="sidebar-section">
                    <div class="sidebar-title">대시보드</div>
                    <ul class="sidebar-menu">
                        <li><a href="/adminpage/dashboard">📊 통계 대시보드</a></li>
                    </ul>
                </div>

                <div class="sidebar-section">
                    <div class="sidebar-title">관리</div>
                    <ul class="sidebar-menu">
                        <li><a href="#">👥 회원관리</a></li>
                        <li><a href="/adminpage/products" class="active">📦 상품관리</a></li>
                        <li><a href="#">📋 재고관리</a></li>
                        <li><a href="#">🚚 주문관리</a></li>
                    </ul>
                </div>

                <div class="sidebar-section">
                    <div class="sidebar-title">시스템</div>
                    <ul class="sidebar-menu">
                        <li><a href="/adminpage/board">💬 게시판 관리</a></li>
                    </ul>
                </div>
            </aside>

            <!-- 메인 컨텐츠 -->
            <main class="main-content">
                <div class="section-card">
                    <div class="section-header">
                        <h2 class="section-title">📦 상품 관리</h2>
                        <div style="display: flex; gap: 10px;">
                            <button class="btn btn-primary" id="openModal">상품 등록</button>
                            <button class="btn btn-danger" id="deleteSelectedBtn">선택 삭제</button>
                        </div>
                    </div>

                    <!-- 검색 컨트롤 -->
                    <div class="search-controls">
                        <form action="${pageContext.request.contextPath}/adminpage/products" method="get" style="display: flex; gap: 10px; width: 100%;">
                            <input type="text" class="search-input" name="keyword" 
                                   placeholder="상품명으로 검색하세요" value="${param.keyword}">
                            <button type="submit" class="btn btn-primary">검색</button>
                        </form>
                    </div>

                    <!-- 상품 테이블 -->
                    <div class="table-container">
                        <form id="deleteForm" action="${pageContext.request.contextPath}/adminpage/product/delete_batch" method="post">
                            <table class="product-table">
                                <thead>
                                    <tr>
                                        <th width="5%"><input type="checkbox" id="checkAll"></th>
                                        <th width="10%">상품번호</th>
                                        <th width="10%">카테고리</th>
                                        <th width="10%">이미지</th>
                                        <th width="25%">상품명</th>
                                        <th width="15%">브랜드</th>
                                        <th width="10%">가격</th>
                                        <th width="8%">재고</th>
                                        <th width="12%">관리</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:choose>
                                        <c:when test="${not empty list}">
                                            <c:forEach var="product" items="${list}">
                                                <tr>
                                                    <td><input type="checkbox" name="product_idx_list" value="${product.product_idx}"></td>
                                                    <td>P${String.format("%03d", product.product_idx)}</td>
                                                    <td>C${product.category_idx}</td>
                                                    <td>
                                                        <img src="${pageContext.request.contextPath}/images/${product.product_image_url}" 
                                                             class="product-image" alt="상품이미지">
                                                    </td>
                                                    <td class="text-left">${product.product_name}</td>
                                                    <td>${product.product_brand}</td>
                                                    <td><fmt:formatNumber value="${product.product_price}" pattern="#,###"/>원</td>
                                                    <td>${product.product_cnt}개</td>
                                                    <td>
                                                        <div class="manage-buttons">
                                                            <button type="button" class="btn btn-primary btn-sm" 
                                                                    onclick="editProduct(${product.product_idx})">수정</button>
                                                            <button type="button" class="btn btn-danger btn-sm" 
                                                                    onclick="deleteSingleProduct(${product.product_idx})">삭제</button>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td colspan="9" style="padding: 40px; color: #666; font-style: italic;">
                                                    검색 결과가 없거나 등록된 상품이 없습니다.
                                                </td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                </tbody>
                            </table>
                        </form>
                    </div>

                    <!-- 페이징 -->
                    <div class="pagination-wrapper">
                        <ul class="pagination">
                            <!-- 처음으로 -->
                            <c:if test="${currentPage > 1}">
                                <li class="page-item">
                                    <a class="page-link" href="?page=1<c:if test='${keyword != null}'>&keyword=${keyword}</c:if>">
                                        &laquo;&laquo;
                                    </a>
                                </li>
                            </c:if>
                            
                            <!-- 이전 페이지 -->
                            <c:if test="${currentPage > 1}">
                                <li class="page-item">
                                    <a class="page-link" href="?page=${currentPage-1}<c:if test='${keyword != null}'>&keyword=${keyword}</c:if>">
                                        &laquo;
                                    </a>
                                </li>
                            </c:if>
                            
                            <!-- 페이지 번호 -->
                            <c:forEach var="pageNum" begin="${startPage}" end="${endPage}">
                                <li class="page-item ${pageNum == currentPage ? 'active' : ''}">
                                    <a class="page-link" href="?page=${pageNum}<c:if test='${keyword != null}'>&keyword=${keyword}</c:if>">${pageNum}</a>
                                </li>
                            </c:forEach>
                            
                            <!-- 다음 페이지 -->
                            <c:if test="${currentPage < totalPage}">
                                <li class="page-item">
                                    <a class="page-link" href="?page=${currentPage+1}<c:if test='${keyword != null}'>&keyword=${keyword}</c:if>">
                                        &raquo;
                                    </a>
                                </li>
                            </c:if>
                            
                            <!-- 마지막으로 -->
                            <c:if test="${currentPage < totalPage}">
                                <li class="page-item">
                                    <a class="page-link" href="?page=${totalPage}<c:if test='${keyword != null}'>&keyword=${keyword}</c:if>">
                                        &raquo;&raquo;
                                    </a>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <!-- 상품등록/수정 모달 -->
    <div id="productModal" class="modal">
        <div class="modal-content">
            <form name="f" method="post" enctype="multipart/form-data" id="productForm">
                <input type="hidden" id="product_idx" name="product_idx" value="0">
                <input type="hidden" id="mode" name="mode" value="insert">
                
                <div class="modal-header">
                    <h3 class="modal-title" id="modalTitle">상품 등록</h3>
                    <button class="modal-close" id="closeModal">×</button>
                </div>
                
                <div class="modal-body">
                    <!-- 현재 이미지 표시 (수정 모드일 때만) -->
                    <div class="current-image-container" id="currentImageDiv" style="display:none;">
                        <label class="form-label">현재 이미지</label>
                        <img id="currentImage" src="" class="current-image">
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label" for="category_idx">카테고리</label>
                        <select id="category_idx" name="category_idx" class="form-select">
                            <option value="">카테고리 선택</option>
                            <c:forEach var="category" items="${category_list}">
                                <option value="${category.category_idx}">${category.category_name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label" for="product_name">상품명</label>
                        <input type="text" id="product_name" name="product_name" class="form-input" placeholder="상품명을 입력하세요">
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label" for="product_brand">브랜드</label>
                        <input type="text" id="product_brand" name="product_brand" class="form-input" placeholder="브랜드명을 입력하세요">
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label" for="product_price">가격</label>
                        <input type="number" id="product_price" name="product_price" class="form-input" placeholder="가격을 입력하세요">
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label" for="product_comment">상품설명</label>
                        <textarea id="product_comment" name="product_comment" class="form-textarea" placeholder="상품설명을 입력하세요"></textarea>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label" for="product_cnt">재고수량</label>
                        <input type="number" id="product_cnt" name="product_cnt" class="form-input" placeholder="재고수량을 입력하세요" value="0">
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label" for="photo">상품 이미지</label>
                        <input type="file" id="photo" name="photo" class="form-input" accept="image/*">
                    </div>
                </div>
                
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" id="cancelBtn">취소</button>
                    <button type="button" class="btn btn-primary" id="submitBtn" onclick="send(this.form);return false;">등록하기</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        // 모달 관련 변수
        var modal = document.getElementById("productModal");
        var openBtn = document.getElementById("openModal");
        var closeBtn = document.getElementById("closeModal");
        var cancelBtn = document.getElementById("cancelBtn");

        // 모달 열기 - 등록 모드
        openBtn.onclick = function() {
            document.getElementById("mode").value = "insert";
            document.getElementById("product_idx").value = "0";
            document.getElementById("modalTitle").textContent = "상품 등록";
            document.getElementById("submitBtn").textContent = "등록하기";
            document.getElementById("currentImageDiv").style.display = "none";
            
            // 폼 초기화
            document.getElementById("productForm").reset();
            
            modal.classList.add("active");
        }

        // 수정 버튼 클릭 시
        function editProduct(product_idx) {
            $.ajax({
                url: "${pageContext.request.contextPath}/adminpage/product/get",
                type: "GET",
                data: { product_idx: product_idx },
                success: function(vo) {
                    // 모드 설정
                    document.getElementById("mode").value = "update";
                    document.getElementById("product_idx").value = vo.product_idx;
                    document.getElementById("modalTitle").textContent = "상품 수정";
                    document.getElementById("submitBtn").textContent = "수정하기";
                    
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
                    
                    // 모달 열기
                    modal.classList.add("active");
                },
                error: function() {
                    alert("상품 정보를 불러오는데 실패했습니다.");
                }
            });
        }

        // 모달 닫기
        function closeModal() {
            modal.classList.remove("active");
        }

        closeBtn.onclick = closeModal;
        cancelBtn.onclick = closeModal;

        // 모달 외부 클릭시 닫기
        window.onclick = function(event) {
            if (event.target == modal) {
                closeModal();
            }
        }

        // 폼 제출
        function send(f) {
            let mode = f.mode.value;
            
            // 입력 검증
            if (f.category_idx.value == "") {
                alert("카테고리를 선택하세요!");
                return;
            }
            if (f.product_name.value == "") {
                alert("상품명을 입력하세요!");
                return;
            }
            if (f.product_price.value == "") {
                alert("가격을 입력하세요!");
                return;
            }
            if (f.product_comment.value == "") {
                alert("상품설명을 입력하세요!");
                return;
            }
            if (f.product_cnt.value == "") {
                alert("재고수량을 입력하세요!");
                return;
            }
            if (mode == "insert" && f.photo.value == "") {
                alert("상품 이미지를 선택하세요!");
                return;
            }

            // 폼 제출
            if (mode == "insert") {
                f.action = "${pageContext.request.contextPath}/adminpage/product/insert";
            } else {
                f.action = "${pageContext.request.contextPath}/adminpage/product/update";
            }
            f.submit();
        }

        // 단일 삭제
        function deleteSingleProduct(product_idx) {
            if (confirm('상품을 삭제하시겠습니까?')) {
                window.location.href = '${pageContext.request.contextPath}/adminpage/product/delete?product_idx=' + product_idx;
            }
        }

        // 로그아웃
        function handleLogout() {
            if (confirm('로그아웃 하시겠습니까?')) {
                alert('로그아웃되었습니다.');
                window.location.href = '/';
            }
        }

        // 페이지 로드 시 초기화
        $(document).ready(function() {
            // 전체 선택 체크박스
            $("#checkAll").change(function() {
                $("input[name='product_idx_list']").prop('checked', $(this).prop('checked'));
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