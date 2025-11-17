<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OneTouch - 상품관리</title>
    <style>
        /* 기존 스타일 그대로 사용 */
        /* ... 생략 ... */
    </style>
</head>
<body>
    <header>
        <div class="header-container">
            <div class="logo">
                <a href="#" class="logo-text">OneTouch</a>
                <span class="admin-badge">관리자</span>
            </div>
            <div class="user-menu">
                <a href="#" class="user-menu-item">
                    <span>관리자님</span>
                </a>
                <a href="#" class="user-menu-item">
                    <span>로그아웃</span>
                </a>
            </div>
        </div>
    </header>
    
    <div class="main-container">
        <div class="sidebar">
            <div class="sidebar-section">
                <h3 class="sidebar-title">대시보드</h3>
                <ul class="sidebar-menu">
                    <li class="sidebar-menu-item">
                        <span>📊</span> 통계 대시보드
                    </li>
                </ul>
            </div>
            
            <div class="sidebar-section">
                <h3 class="sidebar-title">관리</h3>
                <ul class="sidebar-menu">
                    <li class="sidebar-menu-item">
                        <span>👥</span> 회원관리
                    </li>
                    <li class="sidebar-menu-item <c:if test='${page eq "products"}'>active</c:if>'">
                        <a href="/adminpage/products">📦 상품관리</a>
                    </li>
                    <li class="sidebar-menu-item <c:if test='${page eq "inventory"}'>active</c:if>'">
                        <span>📦</span> 재고관리
                    </li>
                    <li class="sidebar-menu-item">
                        <span>🚚</span> 주문관리
                    </li>
                </ul>
            </div>
            
            <div class="sidebar-section">
                <h3 class="sidebar-title">시스템</h3>
                <ul class="sidebar-menu">
                    <li class="sidebar-menu-item">
                        <span>🔧</span> Q&A F&A 게시판 관리
                    </li>
                </ul>
            </div>
        </div>
        
        <div class="content">
            <div class="content-header">
                <h2 class="content-title">
                    <span>📦</span> 재고관리
                </h2>
            </div>
            
            <div class="product-filter">
                <div class="filter-item">
                    <label class="filter-label">상품명</label>
                    <input type="text" class="filter-select" placeholder="상품명 검색" value="${param.productName}">
                </div>
                <div class="filter-item">
                    <label class="filter-label">상태</label>
                    <select class="filter-select">
                        <option value="">전체</option>
                        <option value="in-stock" <c:if test='${param.status eq "in-stock"}'>selected</c:if>>정상</option>
                        <option value="low-stock" <c:if test='${param.status eq "low-stock"}'>selected</c:if>>부족</option>
                        <option value="out-stock" <c:if test='${param.status eq "out-stock"}'>selected</c:if>>품절</option>
                    </select>
                </div>
                <div class="filter-item">
                    <label class="filter-label">입고일자</label>
                    <input type="date" class="filter-select" placeholder="입고일자" value="${param.inDate}">
                </div>
                <div class="filter-item">
                    <label class="filter-label">출고일자</label>
                    <input type="date" class="filter-select" placeholder="출고일자" value="${param.outDate}">
                </div>
                <div class="filter-item">
                    <button class="search-btn">검색</button>
                </div>
            </div>
            
            <table class="product-table">
                <thead>
                    <tr>
                        <th>상품코드</th>
                        <th>상품명</th>
                        <th>카테고리</th>
                        <th>현재 재고</th>
                        <th>상태</th>
                        <th>최근 입고일</th>
                        <th>최근 출고일</th>
                        <th>재고 관리</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="product" items="${productList}">
                        <tr>
                            <td>${product.code}</td>
                            <td>${product.name}</td>
                            <td>${product.category}</td>
                            <td>${product.stock}개</td>
                            <td>
                                <span class="status-badge 
                                    <c:choose>
                                        <c:when test='${product.status eq "in-stock"}'>status-in-stock</c:when>
                                        <c:when test='${product.status eq "low-stock"}'>status-low-stock</c:when>
                                        <c:when test='${product.status eq "out-stock"}'>status-out-stock</c:when>
                                    </c:choose>
                                ">
                                    ${product.statusName}
                                </span>
                            </td>
                            <td>${product.lastInDate}</td>
                            <td>${product.lastOutDate}</td>
                            <td>
                                <div class="action-buttons">
                                    <button class="action-button in" onclick="openStockInModal('${product.code}')">입고</button>
                                    <button class="action-button out" onclick="openStockOutModal('${product.code}')">출고</button>
                                    <button class="action-button edit" onclick="openEditProductModal('${product.code}')">수정</button>
                                    <button class="action-button delete" onclick="deleteProduct('${product.code}')">삭제</button>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            
            <div class="pagination">
                <c:forEach var="i" begin="1" end="${totalPages}">
                    <div class="pagination-item <c:if test='${i eq currentPage}'>active</c:if>">${i}</div>
                </c:forEach>
            </div>
        </div>
    </div>
    
    <!-- 모달 및 JS 동일 -->
    <script>
        // 기존 JS 그대로 사용 가능
        // ...
    </script>
</body>
</html>
