<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OneTouch - 재고관리</title>
    <style>
        /* ===== 기본 설정 ===== */
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

        /* ===== 헤더 영역 ===== */
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

        /* ===== 메인 레이아웃 ===== */
        .container {
            max-width: 1600px;
            margin: 40px auto;
            padding: 0 40px;
        }

        .admin-layout {
            display: grid;
            grid-template-columns: 250px 1fr;
            gap: 30px;
        }

        /* ===== 사이드바 영역 ===== */
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

        /* ===== 메인 컨텐츠 영역 ===== */
        .main-content {
            min-height: 600px;
        }

        .content-section {
            display: block;
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

        .header-buttons {
            display: flex;
            gap: 12px;
        }

        /* ===== 버튼 스타일 ===== */
        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 8px;
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

        /* ===== 검색 영역 ===== */
        .search-section {
            background: #f8f9fa;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            border: 1px solid #e0e0e0;
        }

        .search-form {
            display: flex;
            gap: 12px;
            align-items: center;
        }

        .search-input {
            flex: 1;
            padding: 12px 16px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 14px;
            background: white;
        }

        .search-input:focus {
            outline: none;
            border-color: #1a237e;
            box-shadow: 0 0 0 3px rgba(26, 35, 126, 0.1);
        }

        .search-btn {
            background: #1a237e;
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
        }

        .search-btn:hover {
            background: #0d47a1;
        }

        /* ===== 상품 그리드 영역 ===== */
        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(450px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .product-card {
            background: white;
            border-radius: 8px;
            padding: 20px;
            border: 1px solid #e0e0e0;
            transition: all 0.3s;
        }

        .product-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        .product-row {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .product-checkbox {
            width: 18px;
            height: 18px;
            cursor: pointer;
        }

        .product-code {
            font-size: 13px;
            color: #666;
            min-width: 60px;
            font-weight: 600;
        }

        .product-category {
            font-size: 11px;
            background: #f5f5f5;
            color: #666;
            padding: 4px 8px;
            border-radius: 4px;
            min-width: 35px;
            text-align: center;
            font-weight: 600;
        }

        .product-image {
            width: 60px;
            height: 60px;
            border-radius: 8px;
            object-fit: cover;
            border: 1px solid #e0e0e0;
        }

        .product-info {
            flex: 1;
        }

        .product-name {
            font-size: 16px;
            font-weight: 600;
            color: #333;
            margin-bottom: 4px;
        }

        .product-brand {
            font-size: 14px;
            color: #666;
            margin-bottom: 8px;
        }

        .product-details {
            display: flex;
            gap: 20px;
            align-items: center;
        }

        .product-price {
            font-size: 16px;
            font-weight: bold;
            color: #1a237e;
        }

        .product-stock {
            font-size: 14px;
            color: #666;
        }

        /* ===== 액션 버튼 영역 ===== */
        .action-buttons {
            display: flex;
            gap: 8px;
            margin-left: auto;
        }

        .action-btn {
            padding: 8px 12px;
            border: none;
            border-radius: 6px;
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
        }

        .btn-edit {
            background: #1a237e;
            color: white;
        }

        .btn-edit:hover {
            background: #0d47a1;
        }

        .btn-delete {
            background: #d32f2f;
            color: white;
        }

        .btn-delete:hover {
            background: #b71c1c;
        }

        /* ===== 반응형 디자인 ===== */
        @media (max-width: 1200px) {
            .product-grid {
                grid-template-columns: repeat(auto-fill, minmax(400px, 1fr));
            }
        }

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

            .product-grid {
                grid-template-columns: 1fr;
            }

            .search-form {
                flex-direction: column;
                gap: 12px;
            }

            .search-input {
                width: 100%;
            }

            .section-header {
                flex-direction: column;
                gap: 15px;
                align-items: flex-start;
            }

            .header-buttons {
                width: 100%;
                justify-content: flex-start;
            }
        }
    </style>
</head>
<body>
    <!-- 헤더 - 기존 관리자 페이지와 동일한 스타일 -->
    <header class="header">
        <div>
            <span class="logo" onclick="goToHome()">One<span>Touch</span></span>
            <span class="admin-badge">관리자</span>
        </div>
        <div class="header-right">
            <span class="header-user">관리자님</span>
            <button class="btn-logout" onclick="handleLogout()">로그아웃</button>
        </div>
    </header>
    
    <!-- 메인 컨테이너 - 기존 관리자 페이지 레이아웃 적용 -->
    <div class="container">
        <div class="admin-layout">
            <!-- 사이드바 - 기존 스타일 유지하며 재고관리 active -->
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
                        <li><a href="/adminpage/members">👥 회원관리</a></li>
                        <li><a href="/adminpage/product">📦 상품관리</a></li>
                        <li><a href="/adminpage/remain" class="active">📋 재고관리</a></li>
                        <li><a href="/adminpage/orders">🚚 주문관리</a></li>
                    </ul>
                </div>

                <div class="sidebar-section">
                    <div class="sidebar-title">시스템</div>
                    <ul class="sidebar-menu">
                        <li><a href="/adminpage/board">💬 게시판 관리</a></li>
                    </ul>
                </div>
            </aside>

            <!-- 메인 컨텐츠 - 재고관리 전용 영역 -->
            <main class="main-content">
                <!-- 재고관리 섹션 -->
                <section class="content-section active">
                    <div class="section-card">
                        <div class="section-header">
                            <h2 class="section-title">📋 재고 관리</h2>
                            <div class="header-buttons">
                                <button class="btn btn-primary" onclick="openAddProductModal()">
                                    ➕ 상품 등록
                                </button>
                                <button class="btn btn-secondary" onclick="openBulkEditModal()">
                                    📝 선택 삭제
                                </button>
                            </div>
                        </div>
                        
                        <!-- 검색 영역 -->
                        <div class="search-section">
                            <div class="search-form">
                                <input type="text" class="search-input" placeholder="상품명으로 검색하세요" id="searchInput">
                                <button class="search-btn" onclick="searchProducts()">검색</button>
                            </div>
                        </div>
                        
                        <!-- 상품 그리드 -->
                        <div class="product-grid" id="productGrid">
                            <!-- 상품 카드들 - DB에서 가져온 데이터 -->
                            <c:forEach var="product" items="${productList}">
                                <div class="product-card">
                                    <div class="product-row">
                                        <input type="checkbox" class="product-checkbox" value="${product.productCode}">
                                        <span class="product-code">${product.productCode}</span>
                                        <span class="product-category">${product.categoryCode}</span>
                                        <img src="${product.productImage != null ? product.productImage : 'https://via.placeholder.com/60x60/E0E0E0/666?text=No+Image'}" 
                                             alt="${product.productName}" class="product-image">
                                        <div class="product-info">
                                            <div class="product-name">${product.productName}</div>
                                            <div class="product-brand">${product.brandName}</div>
                                            <div class="product-details">
                                                <span class="product-price">${product.price}원</span>
                                                <span class="product-stock">${product.remain}개</span>
                                            </div>
                                        </div>
                                        <div class="action-buttons">
                                            <button class="action-btn btn-edit" onclick="editProduct('${product.productCode}')">수정</button>
                                            <button class="action-btn btn-delete" onclick="deleteProduct('${product.productCode}')">삭제</button>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            
                            <!-- 데이터가 없을 경우 -->
                            <c:if test="${empty productList}">
                                <div style="grid-column: 1 / -1; text-align: center; padding: 50px; color: #666;">
                                    <p style="font-size: 18px;">등록된 상품이 없습니다.</p>
                                    <p style="font-size: 14px; margin-top: 10px;">새로운 상품을 등록해보세요.</p>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </section>
            </main>
        </div>
    </div>

    <script>
        /* ===== 검색 기능 ===== */
        function searchProducts() {
            const searchTerm = document.getElementById('searchInput').value.toLowerCase();
            const productCards = document.querySelectorAll('.product-card');
            
            productCards.forEach(card => {
                const productName = card.querySelector('.product-name').textContent.toLowerCase();
                if (productName.includes(searchTerm)) {
                    card.style.display = 'block';
                } else {
                    card.style.display = 'none';
                }
            });

            console.log(`검색어: ${searchTerm}`);
        }

        /* ===== 상품 관리 기능 ===== */
        function editProduct(productCode) {
            console.log(`상품 수정: ${productCode}`);
            alert(`${productCode} 상품을 수정합니다.`);
            // 여기에 수정 모달이나 페이지 이동 로직 추가
        }

        function deleteProduct(productCode) {
            if (confirm(`${productCode} 상품을 삭제하시겠습니까?`)) {
                console.log(`상품 삭제: ${productCode}`);
                alert(`${productCode} 상품이 삭제되었습니다.`);
                // 여기에 삭제 로직 추가
            }
        }

        function openAddProductModal() {
            console.log('상품 등록 모달 열기');
            alert('상품 등록 모달을 엽니다.');
            // 여기에 등록 모달 로직 추가
        }

        function openBulkEditModal() {
            const checkedBoxes = document.querySelectorAll('.product-checkbox:checked');
            if (checkedBoxes.length === 0) {
                alert('삭제할 상품을 선택해주세요.');
                return;
            }
            
            if (confirm(`선택한 ${checkedBoxes.length}개의 상품을 삭제하시겠습니까?`)) {
                console.log(`선택 삭제: ${checkedBoxes.length}개 상품`);
                alert('선택한 상품들이 삭제되었습니다.');
                // 여기에 일괄 삭제 로직 추가
            }
        }

        /* ===== 네비게이션 기능 ===== */
        function goToHome() {
            window.location.href = '/';
        }

        function handleLogout() {
            if (confirm('로그아웃 하시겠습니까?')) {
                console.log('로그아웃 처리');
                alert('로그아웃되었습니다.');
                // 여기에 로그아웃 로직 추가
                window.location.href = '/';
            }
        }

        /* ===== 검색 입력 이벤트 ===== */
        document.addEventListener('DOMContentLoaded', function() {
            const searchInput = document.getElementById('searchInput');
            if (searchInput) {
                searchInput.addEventListener('keypress', function(e) {
                    if (e.key === 'Enter') {
                        searchProducts();
                    }
                });
            }
        });
    </script>
</body>
</html>