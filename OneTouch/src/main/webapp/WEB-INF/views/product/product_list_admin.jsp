<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>OneTouch-상품리스트</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* 기존 CSS 스타일은 그대로 유지합니다. */
        :root {
            --primary-color: #0a3d62;
            --secondary-color: #3c6382;
            --accent-color: #ff6b6b;
            --light-color: #f1f2f6;
        }
        
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f8f9fa;
        }
        
        .sidebar {
            width: 280px;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            background-color: white;
            padding: 20px 0;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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
        
        .header {
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
    </style>
</head>
<body>
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
            <div class="section-title">시스템</div>
            <nav class="nav flex-column">
                <a class="nav-link" href="#">
                    <span class="icon">⚙️</span> 시스템 관리
                </a>
            </nav>
        </div>
    </div>

    <div class="main-content">
        <div class="header">
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
            <button class="btn btn-blue" onclick="location.href='${pageContext.request.contextPath}/product/insert_form'">상품등록</button>
            <button class="btn btn-green" onclick="location.href='${pageContext.request.contextPath}/product/insert_form'">추가</button>
            <button class="btn btn-red" id="deleteSelectedBtn">삭제</button>
        </div>
        
        <div class="search-bar">
            <form action="${pageContext.request.contextPath}/admin/product/list" method="get" class="d-flex w-100 gap-2">
                
                <select class="form-select" style="max-width: 150px;" name="category_filter">
                    <option value="0" ${current_category == 0 ? 'selected' : ''}>전체 카테고리</option>
                    
                    <option value="100" ${current_category == 100 ? 'selected' : ''}>C100</option>
                    <option value="200" ${current_category == 200 ? 'selected' : ''}>C200</option>
                    <option value="300" ${current_category == 300 ? 'selected' : ''}>C300</option>
                    <option value="400" ${current_category == 400 ? 'selected' : ''}>C400</option>
                </select>
                
                <input type="text" class="form-control" placeholder="상품명으로 검색" name="search_keyword" 
                       value="${current_keyword}">
                       
                <button class="btn btn-primary" type="submit">검색</button>
            </form>
        </div>
        
        <div class="product-table">
            <form id="deleteForm" action="${pageContext.request.contextPath}/product/delete_batch" method="post">
                <table>
                    <thead>
                        <tr>
                            <th width="5%"><input type="checkbox" id="checkAll"></th>
                            <th width="10%">상품번호</th>
                            <th width="10%">카테고리번호</th>
                            <th width="25%">상품명</th>
                            <th width="15%">브랜드</th>
                            <th width="10%">가격</th>
                            <th width="10%">재고</th>
                            <th width="15%">관리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty productList}">
                                <c:forEach var="product" items="${productList}">
                                    <tr>
                                        <td><input type="checkbox" name="product_idx_list" value="${product.product_idx}"></td>
                                        <td>P${String.format("%03d", product.product_idx)}</td>
                                        <td>C${String.format("%d", product.category_idx)}</td>
                                        <td>${product.product_name}</td>
                                        <td>${product.product_brand}</td>
                                        <td><fmt:formatNumber value="${product.product_price}" pattern="#,###"/>원</td>
                                        <td>${product.product_cnt}개</td>
                                        <td>
                                            <button type="button" class="btn btn-sm btn-outline-primary" 
                                                    onclick="location.href='${pageContext.request.contextPath}/product/update_form?product_idx=${product.product_idx}'">수정</button>
                                            
                                            <button type="button" class="btn btn-sm btn-outline-danger" 
                                                    onclick="deleteSingleProduct(${product.product_idx})">삭제</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="8">검색 결과가 없거나 등록된 상품이 없습니다.</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </form>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const mainCheckbox = document.getElementById('checkAll');
            const itemCheckboxes = document.querySelectorAll('input[name="product_idx_list"]');
            const deleteSelectedBtn = document.getElementById('deleteSelectedBtn');
            const deleteForm = document.getElementById('deleteForm');

            // 1. 전체 선택 체크박스 기능
            mainCheckbox.addEventListener('change', function() {
                itemCheckboxes.forEach(checkbox => {
                    checkbox.checked = mainCheckbox.checked;
                });
            });
            
            // 2. 일괄 삭제 버튼 클릭 이벤트
            deleteSelectedBtn.addEventListener('click', function() {
                const checkedItems = document.querySelectorAll('input[name="product_idx_list"]:checked');
                
                if (checkedItems.length === 0) {
                    alert('삭제할 상품을 하나 이상 선택하세요.');
                    return;
                }
                
                if (confirm(checkedItems.length + '개의 상품을 정말로 삭제하시겠습니까?')) {
                    // 선택된 상품의 product_idx를 담은 폼을 서버로 제출 (POST 방식)
                    deleteForm.submit();
                }
            });

            // 3. 개별 상품 삭제 함수 (버튼에서 호출)
            window.deleteSingleProduct = function(product_idx) {
                if (confirm('상품번호 ' + product_idx + '번 상품을 삭제하시겠습니까?')) {
                    // GET 방식으로 단일 삭제 요청
                    window.location.href = '${pageContext.request.contextPath}/product/delete?product_idx=' + product_idx;
                }
            };
        });
    </script>
</body>
</html>