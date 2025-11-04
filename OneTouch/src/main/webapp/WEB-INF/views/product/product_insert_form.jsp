<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품등록 및 조회</title>
    <style>
        body {
            font-family: 'Malgun Gothic', 'Apple SD Gothic Neo', sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            padding: 20px;
        }
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .logo {
            font-size: 24px;
            font-weight: bold;
            color: #3f51b5;
        }
        .header-buttons {
            display: flex;
            gap: 10px;
        }
        .header-button {
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            background-color: white;
            color: #555;
            cursor: pointer;
        }
        .register-button {
            background-color: #e53935;
            color: white;
        }
        .login-button {
            background-color: white;
            border: 1px solid #ddd;
        }
        .product-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .product-title {
            font-size: 20px;
            font-weight: bold;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .product-icon {
            width: 24px;
            height: 24px;
            background-color: #ff9800;
            border-radius: 4px;
        }
        .action-button {
            padding: 10px 20px;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            margin-left: 10px;
        }
        .register-product {
            background-color: #1a237e;
        }
        .add-product-btn {
            background-color: #4CAF50;
        }
        .delete-product-btn {
            background-color: #F44336;
        }
        .search-bar {
            display: flex;
            margin-bottom: 20px;
        }
        .search-input {
            flex: 1;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px 0 0 4px;
            font-size: 14px;
        }
        .search-filter {
            padding: 10px;
            border: 1px solid #ddd;
            border-left: none;
            background-color: white;
            border-radius: 0;
        }
        .search-button {
            padding: 10px 20px;
            background-color: #1a237e;
            color: white;
            border: none;
            border-radius: 0 4px 4px 0;
            cursor: pointer;
        }
        .product-table {
            width: 100%;
            border-collapse: collapse;
        }
        .product-table th {
            background-color: #f5f5f5;
            padding: 12px;
            text-align: left;
            font-weight: normal;
            border-top: 1px solid #ddd;
            border-bottom: 1px solid #ddd;
        }
        .product-table td {
            padding: 12px;
            border-bottom: 1px solid #eee;
        }
        .action-buttons {
            display: flex;
            gap: 5px;
        }
        .edit-button, .delete-button {
            padding: 6px 12px;
            border-radius: 4px;
            border: 1px solid #ddd;
            background-color: white;
            cursor: pointer;
        }
        .edit-button {
            color: #3f51b5;
        }
        .delete-button {
            color: #e53935;
        }
        .sidebar {
            width: 250px;
            background-color: white;
            padding: 20px 0;
            border-right: 1px solid #eee;
        }
        .main-content {
            display: flex;
        }
        .content {
            flex: 1;
            padding: 0 20px;
        }
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5);
            z-index: 1000;
            justify-content: center;
            align-items: center;
        }
        .modal-content {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            width: 500px;
            max-width: 90%;
        }
        .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .modal-title {
            font-size: 18px;
            font-weight: bold;
        }
        .close-button {
            background: none;
            border: none;
            font-size: 20px;
            cursor: pointer;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .submit-button {
            padding: 10px 20px;
            background-color: #1a237e;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            margin-top: 10px;
        }
        .button-group {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
        }
        /* 모달 표시를 위한 스타일 */
        .show-modal {
            display: flex;
        }
        .checkbox-column {
            width: 40px;
            text-align: center;
        }
        /* 추가 스타일 */
        img { 
            max-width: 100px; 
            max-height: 100px; 
        }
        .product-form {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .form-row {
            margin-bottom: 15px;
        }
        .form-row label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-row input, .form-row textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .form-row textarea {
            min-height: 100px;
            resize: vertical;
        }
        .form-submit {
            padding: 10px 20px;
            background-color: #1a237e;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
        }
        .product-list {
            list-style: none;
            padding: 0;
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
        }
        .product-item {
            border: 1px solid #eee;
            border-radius: 8px;
            padding: 15px;
            background-color: white;
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .product-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        .product-item img {
            width: 100%;
            height: 150px;
            object-fit: contain;
            margin-bottom: 10px;
            border-radius: 4px;
        }
        .product-item a {
            color: #333;
            text-decoration: none;
            font-weight: bold;
        }
        .product-item a:hover {
            color: #3f51b5;
        }
        hr {
            border: none;
            border-top: 1px solid #eee;
            margin: 30px 0;
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: bold;
        }
        .tab-container {
            margin-bottom: 20px;
        }
        .tab-buttons {
            display: flex;
            border-bottom: 1px solid #ddd;
            margin-bottom: 20px;
        }
        .tab-button {
            padding: 10px 20px;
            border: none;
            background: none;
            cursor: pointer;
            font-weight: bold;
            color: #777;
        }
        .tab-button.active {
            color: #3f51b5;
            border-bottom: 2px solid #3f51b5;
        }
        .tab-content {
            display: none;
        }
        .tab-content.active {
            display: block;
        }
        .required-field label::after {
            content: " *";
            color: red;
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <div class="logo">OneTouch</div>
            <div class="header-buttons">
                <button class="header-button register-button">관리자</button>
                <button class="header-button login-button">로그아웃</button>
            </div>
        </header>

        <div class="main-content">
            <div class="sidebar">
                <div style="padding: 15px;">
                    <div style="font-size: 16px; color: #777; margin-bottom: 15px;">대시보드</div>
                    <div style="padding: 10px; color: #333; display: flex; align-items: center; gap: 10px; margin-bottom: 5px;">
                        <span>📊</span> 통계 대시보드
                    </div>
                    
                    <div style="font-size: 16px; color: #777; margin: 20px 0 15px 0;">관리</div>
                    <div style="padding: 10px; color: #333; display: flex; align-items: center; gap: 10px; margin-bottom: 5px;">
                        <span>👤</span> 회원관리
                    </div>
                    <div style="padding: 10px; background-color: #eaefff; color: #3f51b5; border-left: 3px solid #3f51b5; display: flex; align-items: center; gap: 10px; margin-bottom: 5px;">
                        <span>📦</span> 상품등록
                    </div>
                    <div style="padding: 10px; color: #333; display: flex; align-items: center; gap: 10px; margin-bottom: 5px;">
                        <span>📝</span> 재고관리
                    </div>
                    <div style="padding: 10px; color: #333; display: flex; align-items: center; gap: 10px; margin-bottom: 5px;">
                        <span>📊</span> 주문관리
                    </div>
                    
                    <div style="font-size: 16px; color: #777; margin: 20px 0 15px 0;">시스템</div>
                    <div style="padding: 10px; color: #333; display: flex; align-items: center; gap: 10px; margin-bottom: 5px;">
                        <span>⚙️</span> 시스템 관리
                    </div>
                </div>
            </div>
            
            <div class="content">
                <div class="product-header">
                    <div class="product-title">
                        <div class="product-icon"></div>
                        상품등록
                    </div>
                    <div class="tab-buttons">
                        <button class="tab-button active" onclick="showTab('register')">상품등록</button>
                        <button class="tab-button" onclick="showTab('list')">상품목록</button>
                    </div>
                </div>
                
                <div class="tab-content active" id="register-tab">
                    <div class="product-form">
                        <h2>상품 등록</h2>
                        <form action="/product/insert" method="post" enctype="multipart/form-data">
                            <div class="form-row required-field">
                                <label for="product_idx">상품번호</label>
                                <input type="number" id="product_idx" name="product_idx" required placeholder="상품 번호를 입력하세요">
                            </div>
                            <div class="form-row required-field">
                                <label for="category_idx">카테고리</label>
                                <input type="number" id="category_idx" name="category_idx" required placeholder="카테고리 번호를 입력하세요">
                            </div>
                            <div class="form-row">
                                <label for="product_wishlist">찜수</label>
                                <input type="number" id="product_wishlist" name="product_wishlist" placeholder="찜 수를 입력하세요">
                            </div>
                            <div class="form-row">
                                <label for="product_price">가격</label>
                                <input type="number" id="product_price" name="product_price" placeholder="상품 가격을 입력하세요">
                            </div>
                            <div class="form-row required-field">
                                <label for="product_name">상품명</label>
                                <input type="text" id="product_name" name="product_name" required placeholder="상품명을 입력하세요">
                            </div>
                            <div class="form-row">
                                <label for="product_brand">브랜드</label>
                                <input type="text" id="product_brand" name="product_brand" placeholder="브랜드명을 입력하세요">
                            </div>
                            <div class="form-row">
                                <label for="product_comment">상품설명</label>
                                <textarea id="product_comment" name="product_comment" placeholder="상품에 대한 상세 설명을 입력하세요"></textarea>
                            </div>
                            <div class="form-row">
                                <label for="product_cnt">재고수량</label>
                                <input type="number" id="product_cnt" name="product_cnt" placeholder="재고 수량을 입력하세요">
                            </div>
                            <div class="form-row">
                                <label for="product_time">등록시간</label>
                                <input type="time" id="product_time" name="product_time">
                            </div>
                            <div class="form-row">
                                <label for="product_update">수정시간</label>
                                <input type="time" id="product_update" name="product_update">
                            </div>
                            <div class="form-row">
                                <label for="product_image">상품 이미지</label>
                                <input type="file" id="product_image" name="product_image" accept="image/*">
                                <p style="margin-top: 5px; color: #777; font-size: 12px;">* 이미지는 JPG, PNG 형식만 가능합니다. 최대 크기: 5MB</p>
                            </div>
                            
                            <div style="display: flex; gap: 10px; margin-top: 20px;">
                                <button type="submit" class="form-submit">상품등록하기</button>
                                <button type="reset" class="form-submit" style="background-color: #9e9e9e;">초기화</button>
                            </div>
                        </form>
                    </div>
                </div>
                
                <div class="tab-content" id="list-tab">
                    <div class="search-bar">
                        <input type="text" class="search-input" placeholder="상품명으로 검색">
                        <select class="search-filter">
                            <option>전체 카테고리</option>
                            <option>skincare</option>
                            <option>makeup</option>
                            <option>haircare</option>
                        </select>
                        <button class="search-button">검색</button>
                    </div>
                    
                    <div class="button-group" style="margin-bottom: 15px;">
                        <button class="action-button add-product-btn" onclick="showTab('register')">상품추가</button>
                        <button class="action-button delete-product-btn" id="deleteSelected">선택삭제</button>
                    </div>
                    
                    <!-- 표 형식으로 보여주기 -->
                    <table class="product-table">
                        <thead>
                            <tr>
                                <th class="checkbox-column"><input type="checkbox" id="selectAll"></th>
                                <th>상품이미지</th>
                                <th>상품번호</th>
                                <th>카테고리</th>
                                <th>상품명</th>
                                <th>브랜드</th>
                                <th>가격</th>
                                <th>재고</th>
                                <th>찜수</th>
                                <th>관리</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${list}">
                                <tr>
                                    <td class="checkbox-column"><input type="checkbox" class="item-checkbox" value="${item.product_idx}"></td>
                                    <td>
                                        <c:if test="${not empty item.product_image_url}">
                                            <img src="${item.product_image_url}" alt="상품이미지"/>
                                        </c:if>
                                        <c:if test="${empty item.product_image_url}">
                                            <img src="${pageContext.request.contextPath}/resources/images/no-image.jpg" alt="이미지 없음"/>
                                        </c:if>
                                    </td>
                                    <td>${item.product_idx}</td>
                                    <td>${item.category_idx}</td>
                                    <td><a href="/product/detail/${item.product_idx}">${item.product_name}</a></td>
                                    <td>${item.product_brand}</td>
                                    <td>${item.product_price}원</td>
                                    <td>${item.product_cnt}개</td>
                                    <td>${item.product_wishlist}</td>
                                    <td class="action-buttons">
                                        <button class="edit-button" onclick="location.href='/product/edit/${item.product_idx}'">수정</button>
                                        <button class="delete-button" onclick="deleteProduct(${item.product_idx})">삭제</button>
                                    </td>
                                </tr>
                            </c:forEach>
                            
                            <!-- 데이터가 없을 경우 -->
                            <c:if test="${empty list}">
                                <tr>
                                    <td colspan="10" style="text-align: center; padding: 30px;">등록된 상품이 없습니다.</td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                    
                    <!-- 그리드 형식으로 보기 -->
                    <h3 style="margin-top: 30px;">그리드 형식으로 보기</h3>
                    <ul class="product-list">
                        <c:forEach var="item" items="${list}">
                            <li class="product-item">
                                <c:if test="${not empty item.product_image_url}">
                                    <img src="${item.product_image_url}" alt="상품이미지"/>
                                </c:if>
                                <c:if test="${empty item.product_image_url}">
                                    <img src="${pageContext.request.contextPath}/resources/images/no-image.jpg" alt="이미지 없음"/>
                                </c:if>
                                <a href="/product/detail/${item.product_idx}">
                                    ${item.product_name}
                                </a>
                                <p>${item.product_brand}</p>
                                <p><strong>${item.product_price}원</strong></p>
                                <p>재고: ${item.product_cnt}개</p>
                                <p>찜: ${item.product_wishlist}</p>
                            </li>
                        </c:forEach>
                        
                        <!-- 데이터가 없을 경우 -->
                        <c:if test="${empty list}">
                            <li style="grid-column: 1 / -1; text-align: center; padding: 50px; background: none; border: 1px dashed #ddd;">
                                등록된 상품이 없습니다.
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <script>
        // 탭 전환 기능
        function showTab(tabName) {
            // 모든 탭 내용 숨기기
            document.querySelectorAll('.tab-content').forEach(tab => {
                tab.classList.remove('active');
            });
            
            // 모든 탭 버튼 비활성화
            document.querySelectorAll('.tab-button').forEach(button => {
                button.classList.remove('active');
            });
            
            // 선택한 탭 표시
            document.getElementById(tabName + '-tab').classList.add('active');
            
            // 해당 버튼 활성화 - 이벤트 객체가 없을 때 처리
            document.querySelector('.tab-button:nth-of-type(' + (tabName === 'register' ? '1' : '2') + ')').classList.add('active');
        }
        
        // 초기 탭 설정
        document.addEventListener('DOMContentLoaded', function() {
            // URL에 #list가 있으면 목록 탭 표시
            if(window.location.hash === '#list') {
                showTab('list');
            }
        });
        
        // 전체 선택 기능
        document.getElementById('selectAll').addEventListener('change', function() {
            var isChecked = this.checked;
            var checkboxes = document.getElementsByClassName('item-checkbox');
            
            for (var i = 0; i < checkboxes.length; i++) {
                checkboxes[i].checked = isChecked;
            }
        });
        
        // 상품 삭제 함수
        function deleteProduct(productId) {
            if(confirm('정말 이 상품을 삭제하시겠습니까?')) {
                location.href = '/product/delete/' + productId;
            }
        }
        
        // 선택 삭제 기능
        document.getElementById('deleteSelected').addEventListener('click', function() {
            var selected = document.querySelectorAll('.item-checkbox:checked');
            
            if(selected.length === 0) {
                alert('삭제할 상품을 선택해주세요.');
                return;
            }
            
            if(confirm('선택한 ' + selected.length + '개의 상품을 삭제하시겠습니까?')) {
                var ids = [];
                selected.forEach(function(checkbox) {
                    ids.push(checkbox.value);
                });
                
                // 여기에 선택 삭제 로직 추가
                // 예: location.href = '/product/delete-multiple?ids=' + ids.join(',');
                console.log('삭제할 상품 ID:', ids);
                
                // AJAX로 삭제 요청을 보낼 수도 있습니다.
                alert('선택한 상품을 삭제하시겠습니까?');
            }
        });
    </script>
</body>
</html>
