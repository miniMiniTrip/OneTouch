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
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
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
    <!-- Sidebar -->
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

    <!-- Main Content -->
    <div class="main-content">
        <!-- Header -->
        <div class="header">
            <div></div>
            <div class="auth-buttons">
                <button class="btn btn-admin">관리자</button>
                <button class="btn btn-login">로그아웃</button>
            </div>
        </div>
        
        <!-- Page Title -->
        <div class="page-title">
            <span class="indicator"></span> 상품등록
        </div>
        
        <!-- Action Buttons -->
        <div class="action-buttons mb-3">
            <button class="btn btn-blue">상품등록</button>
            <button class="btn btn-green">추가</button>
            <button class="btn btn-red">삭제</button>
        </div>
        
        <!-- Search Bar -->
        <div class="search-bar">
            <select class="form-select" style="max-width: 150px;">
                <option selected>전체 카테고리</option>
                <option value="C100">C100</option>
                <option value="C200">C200</option>
                <option value="C300">C300</option>
                <option value="C400">C400</option>
            </select>
            <input type="text" class="form-control" placeholder="상품명으로 검색">
            <button class="btn btn-primary">검색</button>
        </div>
        
        <!-- Product Table -->
        <div class="product-table">
            <table>
                <thead>
                    <tr>
                        <th width="5%"><input type="checkbox"></th>
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
                    <c:forEach var="product" items="${productList}">
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>P${String.format("%03d", product.product_idx)}</td>
                            <td>C${String.format("%d", product.category_idx)}</td>
                            <td>${product.product_name}</td>
                            <td>${product.product_brand}</td>
                            <td><fmt:formatNumber value="${product.product_price}" pattern="#,###"/>원</td>
                            <td>${product.product_cnt}개</td>
                            <td>
                                <button class="btn btn-sm btn-outline-primary">수정</button>
                                <button class="btn btn-sm btn-outline-danger">삭제</button>
                            </td>
                        </tr>
                    </c:forEach>
                    
                    <!-- Sample data for preview -->
                    <c:if test="${empty productList}">
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>P001</td>
                            <td>C100</td>
                            <td>히아루론산 수분 보충 세럼</td>
                            <td>더마코스메틱</td>
                            <td>31,500원</td>
                            <td>150개</td>
                            <td>
                                <button class="btn btn-sm btn-outline-primary">수정</button>
                                <button class="btn btn-sm btn-outline-danger">삭제</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>P002</td>
                            <td>C100</td>
                            <td>비타민C 브라이트닝 세럼</td>
                            <td>클리어스킨</td>
                            <td>28,000원</td>
                            <td>80개</td>
                            <td>
                                <button class="btn btn-sm btn-outline-primary">수정</button>
                                <button class="btn btn-sm btn-outline-danger">삭제</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>P003</td>
                            <td>C200</td>
                            <td>콜라겐 안티에이징 크림</td>
                            <td>에이지케어</td>
                            <td>42,000원</td>
                            <td>30개</td>
                            <td>
                                <button class="btn btn-sm btn-outline-primary">수정</button>
                                <button class="btn btn-sm btn-outline-danger">삭제</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>P004</td>
                            <td>C300</td>
                            <td>마일드 클렌징 폼</td>
                            <td>퓨어스킨</td>
                            <td>15,000원</td>
                            <td>120개</td>
                            <td>
                                <button class="btn btn-sm btn-outline-primary">수정</button>
                                <button class="btn btn-sm btn-outline-danger">삭제</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>P005</td>
                            <td>C400</td>
                            <td>선크림 SPF50+ PA++++</td>
                            <td>선가드</td>
                            <td>22,000원</td>
                            <td>95개</td>
                            <td>
                                <button class="btn btn-sm btn-outline-primary">수정</button>
                                <button class="btn btn-sm btn-outline-danger">삭제</button>
                            </td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
    
    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- JavaScript for product listing functionality -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Select all checkbox functionality
            const mainCheckbox = document.querySelector('thead input[type="checkbox"]');
            const itemCheckboxes = document.querySelectorAll('tbody input[type="checkbox"]');
            
            mainCheckbox.addEventListener('change', function() {
                itemCheckboxes.forEach(checkbox => {
                    checkbox.checked = mainCheckbox.checked;
                });
            });
            
            // "상품등록" 버튼 클릭 이벤트
            document.querySelector('.btn-blue').addEventListener('click', function() {
                window.location.href = '${pageContext.request.contextPath}/product/insert_form';
            });
            
            // "삭제" 버튼 클릭 이벤트
            document.querySelector('.btn-red').addEventListener('click', function() {
                const checkedItems = document.querySelectorAll('tbody input[type="checkbox"]:checked');
                if (checkedItems.length === 0) {
                    alert('삭제할 상품을 선택하세요.');
                    return;
                }
                
                if (confirm('선택한 상품을 삭제하시겠습니까?')) {
                    // 선택한 상품 삭제 로직 추가
                    alert('선택한 상품이 삭제되었습니다.');
                }
            });
        });
    </script>
</body>
</html>