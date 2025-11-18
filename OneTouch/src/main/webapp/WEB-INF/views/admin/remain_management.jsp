<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OneTouch - 상품관리</title>
    <style>
        <!-- 추가해야함 -->
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
                    <li class="sidebar-menu-item <c:if test='${page eq "remain"}'>active</c:if>'">
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
                        <option value="in-remain" <c:if test='${param.status eq "in-remain"}'>selected</c:if>>정상</option>
                        <option value="low-remain" <c:if test='${param.status eq "low-remain"}'>selected</c:if>>부족</option>
                        <option value="out-remain" <c:if test='${param.status eq "out-remain"}'>selected</c:if>>품절</option>
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
                            <td>${product.remain}개</td>
                            <td>
                                <span class="status-badge 
                                    <c:choose>
                                        <c:when test='${product.status eq "in-remain"}'>status-in-remain</c:when>
                                        <c:when test='${product.status eq "low-remain"}'>status-low-remain</c:when>
                                        <c:when test='${product.status eq "out-remain"}'>status-out-remain</c:when>
                                    </c:choose>
                                ">
                                    ${product.statusName}
                                </span>
                            </td>
                            <td>${product.lastInDate}</td>
                            <td>${product.lastOutDate}</td>
                            <td>
                                <div class="action-buttons">
                                    <button class="action-button in" onclick="openRemainInModal('${product.code}')">입고</button>
                                    <button class="action-button out" onclick="openRemainOutModal('${product.code}')">출고</button>
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
    // 섹션 표시
    function showSection(sectionName) {
        document.querySelectorAll('.content-section').forEach(section => {
            section.classList.remove('active');
        });
        document.querySelectorAll('.sidebar-menu a').forEach(link => {
            link.classList.remove('active');
        });

        const sections = {
            'dashboard': 'dashboardSection',
            'members': 'memberSection',
            'remain': 'remainSection',
            'order': 'orderSection',
            'board': 'boardSection'
        };

        document.getElementById(sections[sectionName]).classList.add('active');
        event.target.classList.add('active');
    }

    function goToHome() {
        window.location.href = '/';
    }

    function handleLogout() {
        if (confirm('로그아웃 하시겠습니까?')) {
            alert('로그아웃되었습니다.');
            window.location.href = '/';
        }
    }
</script>
  
</body>
</html>
