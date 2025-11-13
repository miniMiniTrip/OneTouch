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
        }
        
        .search-bar {
            margin-bottom: 20px;
            display: flex;
            gap: 10px;
        }
        
        .product-table {
            background-color: white;
            border-radius: 5px;
            overflow: hidden;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }
        
        .product-table table {
            width: 100%;
            border-collapse: collapse;
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
        }
        
        .modal-content {
            position: relative;
            background-color: #fff;
            width: 70%;
            max-width: 600px;
            margin: 0 auto;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
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
    </style>
</head>
<body class="admin-page">
    <!-- 헤더 영역은 관리자 페이지에서 숨김 처리 -->
    <div style="display: none;">
        <%@include file="/WEB-INF/views/common/header.jsp" %>
    </div>

   
    
    <%-- 검색 처리 (클라이언트에서 직접 URL 파라미터로 검색을 요청했을 경우) --%>
    <c:if test="${not empty param.search_field && not empty param.search_text && not empty list}">
        <jsp:useBean id="filteredList" class="java.util.ArrayList" scope="request" />
        
        <c:forEach var="product" items="${list}">
            <c:choose>
                <c:when test="${param.search_field == 'all'}">
                    <c:set var="temp" value="${filteredList.add(product)}" />
                </c:when>
                <c:when test="${param.search_field == 'product_name' && fn:contains(product.product_name, param.search_text)}">
                    <c:set var="temp" value="${filteredList.add(product)}" />
                </c:when>
                <c:when test="${param.search_field == 'product_brand' && fn:contains(product.product_brand, param.search_text)}">
                    <c:set var="temp" value="${filteredList.add(product)}" />
                </c:when>
                <c:when test="${param.search_field == 'product_idx' && product.product_idx == param.search_text}">
                    <c:set var="temp" value="${filteredList.add(product)}" />
                </c:when>
                <c:when test="${param.search_field == 'category_idx' && product.category_idx == param.search_text}">
                    <c:set var="temp" value="${filteredList.add(product)}" />
                </c:when>
            </c:choose>
        </c:forEach>
        
        <c:if test="${not empty filteredList}">
            <c:set var="list" value="${filteredList}" scope="request" />
        </c:if>
    </c:if>
    
    <%-- 정렬 처리 --%>
    <c:set var="sortField" value="${param.sort_field}" />
    <c:set var="sortOrder" value="${param.sort_order}" />
    
    <%-- 기본값으로 상품 번호 내림차순 설정 --%>
    <c:if test="${empty sortField}">
        <c:set var="sortField" value="product_idx" />
    </c:if>
    <c:if test="${empty sortOrder}">
        <c:set var="sortOrder" value="desc" />
    </c:if>

    <div class="sidebar">
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
            <span class="indicator"></span> 상품조회
        </div>
        
        <div class="action-buttons mb-3">
            <button class="btn btn-blue" id="openModal">상품등록</button>
            <button class="btn btn-green">추가</button>
            <button class="btn btn-red" id="deleteSelectedBtn">삭제</button>
        </div>
        
       <div class="search-bar">
    <!-- 검색 폼 -->
    <form id="searchForm" action="${pageContext.request.contextPath}/admin/product/list" method="get" class="d-flex w-100 gap-2">
        <select class="form-select" style="max-width: 150px;" name="search_field" id="search_field">
            <option value="all" ${param.search_field == 'all' ? 'selected' : ''}>전체 카테고리</option>
            <option value="category_idx" ${param.search_field == 'category_idx' ? 'selected' : ''}>카테고리</option>
            <option value="product_idx" ${param.search_field == 'product_idx' ? 'selected' : ''}>상품번호</option>
            <option value="product_name" ${param.search_field == 'product_name' ? 'selected' : ''}>상품명</option>
            <option value="product_brand" ${param.search_field == 'product_brand' ? 'selected' : ''}>브랜드</option>
            <option value="product_image_url" ${param.search_field == 'product_image_url' ? 'selected' : ''}>이미지</option>
        </select>
        <input type="text" class="form-control" name="search_text" id="search_text" placeholder="검색어를 입력하세요" value="${param.search_text}">
        <button type="button" class="btn btn-primary" onclick="submitSearch()">검색</button>
                
        <!-- 정렬 필드와 순서를 저장하는 hidden input -->
        <input type="hidden" name="sort_field" value="${sortField}" id="sort_field">
        <input type="hidden" name="sort_order" value="${sortOrder}" id="sort_order">
    </form>
</div>
        
        <!-- 정렬 옵션 -->
        <div class="sort-option">
            <span>정렬:</span>
            <select class="form-select" id="sort_select" onchange="changeSort(this.value)">
                <option value="product_idx_desc" ${sortField == 'product_idx' && sortOrder == 'desc' ? 'selected' : ''}>상품번호 내림차순</option>
                <option value="product_idx_asc" ${sortField == 'product_idx' && sortOrder == 'asc' ? 'selected' : ''}>상품번호 오름차순</option>
                <option value="product_name_asc" ${sortField == 'product_name' && sortOrder == 'asc' ? 'selected' : ''}>상품명 오름차순</option>
                <option value="product_name_desc" ${sortField == 'product_name' && sortOrder == 'desc' ? 'selected' : ''}>상품명 내림차순</option>
                <option value="product_price_asc" ${sortField == 'product_price' && sortOrder == 'asc' ? 'selected' : ''}>가격 오름차순</option>
                <option value="product_price_desc" ${sortField == 'product_price' && sortOrder == 'desc' ? 'selected' : ''}>가격 내림차순</option>
            </select>
        </div>
        
        <div class="product-table">
            <form id="deleteForm" action="${pageContext.request.contextPath}/admin/product/delete_batch" method="post">
                <table id="productTable">
                    <thead>
                        <tr>
                            <th width="5%"><input type="checkbox" id="checkAll"></th>
                            <th width="10%" class="sortable" data-sort="product_idx" onclick="sortTable('product_idx')">상품번호</th>
                            <th width="10%" class="sortable" data-sort="category_idx" onclick="sortTable('category_idx')">카테고리번호</th>
                            <th width="10%" class="sortable" data-sort="product_image_url" onclick="sortTable('product_image_url')">상품이미지</th>
                            <th width="25%" class="sortable" data-sort="product_name" onclick="sortTable('product_name')">상품명</th>
                            <th width="15%" class="sortable" data-sort="product_brand" onclick="sortTable('product_brand')">브랜드</th>
                            <th width="10%" class="sortable" data-sort="product_price" onclick="sortTable('product_price')">가격</th>
                            <th width="10%" class="sortable" data-sort="product_cnt" onclick="sortTable('product_cnt')">재고</th>
                            <th width="15%">관리</th>
                        </tr>
                    </thead>
                    <tbody id="productTableBody">
                        <c:choose>
                            <c:when test="${not empty list}">
                                <c:forEach var="product" items="${list}">
                                    <tr class="product-row" 
                                        data-category="${product.category_idx}" 
                                        data-id="${product.product_idx}" 
                                        data-name="${product.product_name}" 
                                        data-brand="${product.product_brand}"
                                        data-price="${product.product_price}"
                                        data-cnt="${product.product_cnt}">
                                        <td><input type="checkbox" name="product_idx_list" value="${product.product_idx}"></td>
                                        <td>P${String.format("%03d", product.product_idx)}</td>
                                        <td>C${product.category_idx}</td>
                                        <td>
                                        <img alt="${product.product_image_url}" src="${pageContext.request.contextPath}/images/${product.product_image_url}"> 
                                        </td>
                                        <td>${product.product_name}</td>
                                        <td>${product.product_brand}</td>
                                        <td><fmt:formatNumber value="${product.product_price}" pattern="#,###"/>원</td>
                                        <td>${product.product_cnt}개</td>
                                        <td>
                                            <button type="button" class="btn btn-sm btn-outline-primary" 
                                                    onclick="location.href='${pageContext.request.contextPath}/admin/product/update_form?product_idx=${product.product_idx}'">수정</button>
                                            <button type="button" class="btn btn-sm btn-outline-danger" 
                                                    onclick="deleteSingleProduct(${product.product_idx})">삭제</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr id="no-results">
                                    <td colspan="8">검색 결과가 없거나 등록된 상품이 없습니다.</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </form>
        </div>
    </div>

    <!-- 상품등록 모달 -->
    <form name="f" method="post" enctype="multipart/form-data">
        <div id="productModal" class="product-modal">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title">상품 등록</h3>
                    <button class="close-btn" id="closeModal">×</button>
                </div>
                <div class="modal-body">
                    <!-- 1. 카테고리번호 -->
                    <div class="form-group">
                        <label for="category_name">카테고리번호</label>
                        <select id="category_name" name="category_idx">
                            <option value="">카테고리 선택</option>
                            <c:forEach var="category" items="${category_list}">
                                <option value="${category.category_idx}">${category.category_name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    
                    <!-- 2. 상품명 -->
                    <div class="form-group">
                        <label for="product_name">상품명</label>
                        <input type="text" id="product_name" name="product_name" placeholder="상품명 입력">
                    </div>
                    
                    <!-- 3. 브랜드 -->
                    <div class="form-group">
                        <label for="product_brand">브랜드</label>
                        <input type="text" id="product_brand" name="product_brand" placeholder="브랜드명 입력">
                    </div>
                    
                    <!-- 4. 가격 -->
                    <div class="form-group">
                        <label for="product_price">가격</label>
                        <input type="text" id="product_price" name="product_price" placeholder="가격 입력">
                    </div>
                    
                    <!-- 5. 상품설명 -->
                    <div class="form-group">
                        <label for="product_comment">상품설명</label>
                        <textarea id="product_comment" name="product_comment" placeholder="상품설명 입력"></textarea>
                    </div>
                    
                    <!-- 6. 재고수량 -->
                    <div class="form-group">
                        <label for="product_cnt">재고수량</label>
                        <input type="text" id="product_cnt" name="product_cnt" placeholder="재고수량 입력" value="0">
                    </div>
                    
                    <!-- 7. 상품 이미지 -->
                    <div class="form-group">
                        <label for="photo">상품 이미지</label>
                        <div class="file-upload-box">
                            <input type="file" id="photo" name="photo" class="hidden-file-input">
                            <label for="photo" class="file-input-label">파일 선택</label>
                            <div class="file-input-text">선택된 파일 없음</div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn-cancel" id="cancelBtn">취소</button>
                    <button type="button" class="btn-submit" onclick="send(this.form);return false;">등록하기</button>
                </div>
            </div>
        </div>
    </form>
    
    <!-- 푸터 영역도 숨김 처리 -->
    <div style="display: none;">
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    </div>

    <!-- ========================= JS here ========================= -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/tiny-slider.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/glightbox.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // 페이지 로드 시 초기화
        $(document).ready(function() {
            // 초기 정렬 설정
            const currentSortField = "${sortField}";
            const currentSortOrder = "${sortOrder}";
            
            if (currentSortField && currentSortOrder) {
                // 테이블 헤더에 정렬 표시 업데이트
                updateSortUI(currentSortField, currentSortOrder);
                // 클라이언트 사이드에서 테이블 정렬 적용
                sortClientSide(currentSortField, currentSortOrder);
            }
            
            // 전체 선택 체크박스 기능
            $("#checkAll").change(function() {
                $("input[name='product_idx_list']").prop('checked', $(this).prop('checked'));
            });
            
            // 개별 체크박스 변경 시 전체 선택 상태 업데이트
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
            
            // 일괄 삭제 버튼 클릭 이벤트
            $("#deleteSelectedBtn").click(function() {
                const checkedItems = $("input[name='product_idx_list']:checked");
                
                if (checkedItems.length === 0) {
                    alert('삭제할 상품을 하나 이상 선택하세요.');
                    return;
                }
                
                if (confirm(checkedItems.length + '개의 상품을 정말로 삭제하시겠습니까?')) {
                    // 데모 환경에서는 실제로 삭제하지 않고 메시지만 표시
                    alert('선택한 상품들이 삭제되었습니다.');
                    // 실제 환경에서는 아래 코드 사용
                    // $("#deleteForm").submit();
                }
            });
            
            // Enter 키로 검색 실행
            $("#search_text").keypress(function(e) {
                if (e.keyCode === 13) {
                    submitSearch();
                    e.preventDefault();
                }
            });
            
            // 카테고리 변경 시 검색어 필드 상태 변경
            $("#search_field").change(function() {
                if ($(this).val() === "all") {
                    $("#search_text").val("").prop("disabled", true);
                } else {
                    $("#search_text").prop("disabled", false);
                }
            });
            
            // 초기 상태 설정 - 전체 카테고리인 경우 검색어 필드 비활성화
            if ($("#search_field").val() === "all") {
                $("#search_text").prop("disabled", true);
            }
        });
        
        // 모달 관련 스크립트
        var modal = document.getElementById("productModal");
        var openBtn = document.getElementById("openModal");
        var closeBtn = document.getElementById("closeModal");
        var cancelBtn = document.getElementById("cancelBtn");
        var fileInput = document.getElementById("photo");
        var fileInputText = document.querySelector(".file-input-text");

        // 모달 열기 - 가운데 정렬을 위해 display 설정 수정
        openBtn.onclick = function() {
            modal.style.display = "flex";
        }

        // 모달 닫기
        closeBtn.onclick = function() {
            modal.style.display = "none";
        }

        // 취소 버튼 클릭 시 모달 닫기
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

        // 폼 제출 전 유효성 검사 - ProductVo 필드 순서에 맞게 작성
        function send(f) {
            // 카테고리번호
            let category_idx = f.category_idx.value;
            // 상품명
            let product_name = f.product_name.value;
            // 브랜드
            let product_brand = f.product_brand.value;
            // 가격
            let product_price = f.product_price.value;
            // 상품설명
            let product_comment = f.product_comment.value;
            // 재고수량
            let product_cnt = f.product_cnt.value;
            // 상품 이미지
            let photo = f.photo.value;

            // 입력체크 - 필수 항목 순서대로
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

            if (photo == "") {
                alert("상품 이미지를 선택하세요!");
                return;
            }

            // 폼 제출
            f.action = "product/insert.do";
            f.submit();
        }
        
        // 정렬 변경 함수
        function changeSort(value) {
            const [field, order] = value.split('_');
            $("#sort_field").val(field);
            $("#sort_order").val(order);
            
            // 서버 측 정렬을 위한 폼 제출 (실제 환경에서 사용)
            // $("#searchForm").submit();
            
            // 클라이언트 측 정렬 (데모 환경에서 사용)
            sortClientSide(field, order);
            updateSortUI(field, order);
            
            // URL 파라미터 업데이트
            updateUrlParams(field, order);
        }
        
        // URL 파라미터 업데이트 함수
        function updateUrlParams(field, order) {
            const currentUrl = new URL(window.location.href);
            currentUrl.searchParams.set("sort_field", field);
            currentUrl.searchParams.set("sort_order", order);
            
            // 현재 페이지 URL 업데이트
            window.history.replaceState({}, '', currentUrl.toString());
        }
        
        // 테이블 헤더 클릭으로 정렬
        function sortTable(field) {
            const currentField = $("#sort_field").val();
            let newOrder = "asc";
            
            if (currentField === field) {
                // 같은 필드를 다시 클릭한 경우 정렬 순서 토글
                newOrder = $("#sort_order").val() === "asc" ? "desc" : "asc";
            } else if (field === "product_idx") {
                // 상품번호는 기본적으로 내림차순으로 시작
                newOrder = "desc";
            }
            
            $("#sort_field").val(field);
            $("#sort_order").val(newOrder);
            
            // 정렬 UI 업데이트
            updateSortUI(field, newOrder);
            
            // 클라이언트 측 정렬 적용
            sortClientSide(field, newOrder);
            
            // 정렬 선택 옵션 업데이트
            $("#sort_select").val(field + '_' + newOrder);
            
            // URL 파라미터 업데이트
            updateUrlParams(field, newOrder);
        }
        
        // 정렬 UI 업데이트 함수
        function updateSortUI(field, order) {
            // 모든 헤더에서 정렬 클래스 제거
            $(".sortable").removeClass("sorted-asc sorted-desc");
            
            // 현재 정렬 중인 헤더에 클래스 추가
            $(".sortable[data-sort='" + field + "']").addClass("sorted-" + order);
        }
        
        // 클라이언트 측 테이블 정렬 함수
        function sortClientSide(field, order) {
            const tbody = $("#productTableBody");
            if (tbody.find(".product-row").length === 0) return;
            
            // 행을 배열로 변환하여 정렬
            const rows = tbody.find(".product-row").get();
            
            rows.sort(function(a, b) {
                let aValue, bValue;
                
                // 필드에 따른 값 가져오기
                if (field === "product_idx" || field === "category_idx") {
                    aValue = parseInt($(a).attr("data-" + (field === "product_idx" ? "id" : "category")));
                    bValue = parseInt($(b).attr("data-" + (field === "product_idx" ? "id" : "category")));
                } else if (field === "product_price" || field === "product_cnt") {
                    aValue = parseInt($(a).attr("data-" + field.split('_')[1]));
                    bValue = parseInt($(b).attr("data-" + field.split('_')[1]));
                } else {
                    // 문자열 필드는 소문자로 변환하여 비교
                    aValue = $(a).attr("data-" + field.split('_')[1]).toLowerCase();
                    bValue = $(b).attr("data-" + field.split('_')[1]).toLowerCase();
                }
                
                // 정렬 순서에 따라 비교
                if (order === "asc") {
                    return aValue > bValue ? 1 : -1;
                } else {
                    return aValue < bValue ? 1 : -1;
                }
            });
            
            // 정렬된 행을 테이블에 다시 추가
            $.each(rows, function(index, row) {
                tbody.append(row);
            });
        }
        
        // 검색 폼 제출 함수
        function submitSearch() {
            const searchField = $("#search_field").val();
            const searchText = $("#search_text").val().trim();
            
            // 전체 카테고리 선택이 아니고, 검색어가 없는 경우 검증
            if (searchField !== "all" && searchText === "") {
                alert("검색어를 입력하세요!");
                $("#search_text").focus();
                return;
            }
            
            // 서버 환경에서는 이 방식으로 서버에 요청
            // $("#searchForm").submit();
            
            // 클라이언트 사이드 검색 (서버가 없는 환경에서 테스트용)
            clientSideSearch(searchField, searchText);
        }
        
        // 클라이언트 사이드 검색 (서버 환경이 아닐 때 사용)
        function clientSideSearch(searchField, searchText) {
            // URL을 현재 페이지로 변경하고 검색 파라미터 추가
            const currentUrl = new URL(window.location.href);
            currentUrl.searchParams.set("search_field", searchField);
            
            if (searchField !== "all") {
                currentUrl.searchParams.set("search_text", searchText);
            } else {
                currentUrl.searchParams.delete("search_text");
            }
            
            window.location.href = currentUrl.toString();
        }
        
        // 단일 상품 삭제 함수
        function deleteSingleProduct(product_idx) {
            if (confirm('상품번호 ' + product_idx + '번 상품을 삭제하시겠습니까?')) {
                // 데모 환경에서는 실제로 삭제하지 않고 메시지만 표시
                alert('상품이 삭제되었습니다.');
                // 실제 환경에서는 아래 코드 사용
                // window.location.href = '${pageContext.request.contextPath}/admin/product/delete?product_idx=' + product_idx;
            }
        }
    </script>
</body>
</html>