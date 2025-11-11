<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OneTouch 상품관리</title>
<style>
    /* 모달 스타일 */
    .product-modal {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.3);
        z-index: 1000;
        /* 모달 내용을 가운데 정렬하기 위한 설정 */
        display: none;
        align-items: center;
        justify-content: center;
    }
    
    .modal-content {
        position: relative;
        background-color: #fff;
        width: 70%; /* 너비를 70%로 설정 */
        max-width: 600px; /* 최대 너비도 키움 */
        margin: 0 auto; /* 좌우 마진을 auto로 설정하여 가운데 정렬 */
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
    
    /* 상품 목록 버튼 및 테이블 스타일 */
    .container {
        max-width: 1200px;
        margin: 20px auto;
        padding: 0 15px;
    }
    
    .header-area {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
    }
    
    .title {
        font-size: 20px;
        font-weight: 600;
        color: #333;
    }
    
    .product-btn {
        background-color: #2e3192;
        color: white;
        border: none;
        border-radius: 4px;
        padding: 6px 12px;
        font-size: 13px;
        cursor: pointer;
    }
    
    .product-table {
        width: 100%;
        border-collapse: collapse;
        border: 1px solid #eee;
    }
    
    .product-table th {
        background-color: #f5f5f5;
        padding: 8px;
        text-align: center;
        font-size: 13px;
        font-weight: 600;
        color: #333;
        border-bottom: 1px solid #ddd;
    }
    
    .product-table td {
        padding: 8px;
        text-align: center;
        font-size: 13px;
        border-bottom: 1px solid #eee;
    }
    
    .product-table tr:hover {
        background-color: #f9f9f9;
    }
    
    .checkbox-col {
        width: 30px;
    }
    
    .product-id-col, .category-col {
        width: 80px;
    }
    
    .product-name-col {
        text-align: left;
    }
    
    .action-btns {
        display: flex;
        justify-content: center;
        gap: 5px;
    }
    
    .modify-btn, .delete-btn {
        padding: 4px 8px;
        font-size: 12px;
        border: none;
        border-radius: 3px;
        cursor: pointer;
    }
    
    .modify-btn {
        background-color: #2e3192;
        color: white;
    }
    
    .delete-btn {
        background-color: #f44336;
        color: white;
    }
</style>
</head>
<body>

<!-- 헤더 포함 -->
<%@include file="/WEB-INF/views/common/header.jsp" %>

<div class="container">
    <div class="header-area">
        <h1 class="title">상품등록</h1>
        <button id="openModal" class="product-btn">상품등록</button>
    </div>
    
    <!-- 상품 목록 테이블 -->
    <table class="product-table">
        <thead>
            <tr>
                <th class="checkbox-col"><input type="checkbox"></th>
                <th class="product-id-col">상품번호</th>
                <th class="category-col">카테고리</th>
                <th class="product-name-col">상품명</th>
                <th>브랜드</th>
                <th>가격</th>
                <th>재고</th>
                <th>관리</th>
            </tr>
        </thead>
        <tbody>
            <!-- 데이터가 없는경우 -->
            <c:if test="${empty product_list}">
                <tr>
                    <td colspan="8" style="text-align: center; padding: 30px 0;">
                        <span style="color: #777;">등록된 상품이 없습니다</span>
                    </td>
                </tr>
            </c:if>
            
            <!-- 상품 리스트 -->
            <c:forEach var="vo" items="${product_list}">
                <tr>
                    <td><input type="checkbox"></td>
                    <td>${vo.product_idx}</td>
                    <td>${vo.category_idx}</td>
                    <td class="product-name-col">${vo.product_name}</td>
                    <td>${vo.product_brand}</td>
                    <td><fmt:formatNumber value="${vo.product_price}"/>원</td>
                    <td>${vo.product_cnt}개</td>
                    <td>
                        <div class="action-btns">
                            <button class="modify-btn" onclick="location.href='modify.do?product_idx=${vo.product_idx}'">수정</button>
                            <button class="delete-btn" onclick="if(confirm('정말 삭제하시겠습니까?')) location.href='delete.do?product_idx=${vo.product_idx}'">삭제</button>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            
            <!-- 샘플 데이터 (실제 사용 시 삭제 필요) -->
            <c:if test="${empty product_list}">
                <tr>
                    <td><input type="checkbox"></td>
                    <td>P001</td>
                    <td>C100</td>
                    <td class="product-name-col">하이루트온 수분 보충 세럼</td>
                    <td>더마코스메틱</td>
                    <td>31,500원</td>
                    <td>150개</td>
                    <td>
                        <div class="action-btns">
                            <button class="modify-btn">수정</button>
                            <button class="delete-btn">삭제</button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>P002</td>
                    <td>C100</td>
                    <td class="product-name-col">비타민C 브라이트닝 세럼</td>
                    <td>클리어스킨</td>
                    <td>28,000원</td>
                    <td>80개</td>
                    <td>
                        <div class="action-btns">
                            <button class="modify-btn">수정</button>
                            <button class="delete-btn">삭제</button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>P003</td>
                    <td>C200</td>
                    <td class="product-name-col">콜라겐 안티에이징 크림</td>
                    <td>에이지케어</td>
                    <td>42,000원</td>
                    <td>30개</td>
                    <td>
                        <div class="action-btns">
                            <button class="modify-btn">수정</button>
                            <button class="delete-btn">삭제</button>
                        </div>
                    </td>
                </tr>
            </c:if>
        </tbody>
    </table>
</div>

<!-- 상품등록 모달 -->
<div id="productModal" class="product-modal">
    <div class="modal-content">
        <div class="modal-header">
            <h3 class="modal-title">상품 등록</h3>
            <button class="close-btn" id="closeModal">×</button>
        </div>
        <div class="modal-body">
            <!-- 폼 시작 - ProductVo 필드 순서에 맞게 배치 -->
            <form name="f" method="post" enctype="multipart/form-data">
                <!-- 1. 상품번호 -->
                <div class="form-group">
                    <label for="product_idx">상품번호</label>
                    <input type="text" id="product_idx" name="product_idx" placeholder="상품번호 입력">
                </div>
                
                <!-- 2. 카테고리번호 -->
                <div class="form-group">
                    <label for="category_idx">카테고리번호</label>
                    <select id="category_idx" name="category_idx">
                        <option value="">카테고리 선택</option>
                        <c:forEach var="category" items="${category_list}">
                            <option value="${category.category_idx}">${category.category_name}</option>
                        </c:forEach>
                        <!-- 카테고리 데이터가 없을 경우 샘플 데이터 -->
                        <c:if test="${empty category_list}">
                            <option value="C100">C100</option>
                            <option value="C200">C200</option>
                            <option value="C300">C300</option>
                        </c:if>
                    </select>
                </div>
                
                <!-- 3. 상품명 -->
                <div class="form-group">
                    <label for="product_name">상품명</label>
                    <input type="text" id="product_name" name="product_name" placeholder="상품명 입력">
                </div>
                
                <!-- 4. 브랜드 -->
                <div class="form-group">
                    <label for="product_brand">브랜드</label>
                    <input type="text" id="product_brand" name="product_brand" placeholder="브랜드명 입력">
                </div>
                
                <!-- 5. 가격 -->
                <div class="form-group">
                    <label for="product_price">가격</label>
                    <input type="text" id="product_price" name="product_price" placeholder="가격 입력">
                </div>
                
                <!-- 6. 상품설명 -->
                <div class="form-group">
                    <label for="product_comment">상품설명</label>
                    <textarea id="product_comment" name="product_comment" placeholder="상품설명 입력"></textarea>
                </div>
                
                <!-- 7. 재고수량 -->
                <div class="form-group">
                    <label for="product_cnt">재고수량</label>
                    <input type="text" id="product_cnt" name="product_cnt" placeholder="재고수량 입력" value="0">
                </div>
                
                <!-- 8. 상품 이미지 - 별도의 네모 박스로 구현 -->
                <div class="form-group">
                    <label for="photo">상품 이미지</label>
                    <div class="file-upload-box">
                        <input type="file" id="photo" name="photo" class="hidden-file-input">
                        <label for="photo" class="file-input-label">파일 선택</label>
                        <div class="file-input-text">선택된 파일 없음</div>
                    </div>
                </div>
            </form>
            <!-- 폼 끝 -->
        </div>
        <div class="modal-footer">
            <button type="button" class="btn-cancel" id="cancelBtn">취소</button>
            <button type="button" class="btn-submit" onclick="send(document.f)">등록하기</button>
        </div>
    </div>
</div>

<!-- 푸터 포함 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script>
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
    // 1. 상품번호
    let product_idx = f.product_idx.value;
    // 2. 카테고리번호
    let category_idx = f.category_idx.value;
    // 3. 상품명
    let product_name = f.product_name.value;
    // 4. 브랜드
    let product_brand = f.product_brand.value;
    // 5. 가격
    let product_price = f.product_price.value;
    // 6. 상품설명
    let product_comment = f.product_comment.value;
    // 7. 재고수량
    let product_cnt = f.product_cnt.value;
    // 8. 상품 이미지
    let photo = f.photo.value;

    // 입력체크 - 필수 항목 순서대로
    if (product_idx == "") {
        alert("상품번호를 입력하세요!");
        f.product_idx.focus();
        return;
    }
    
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

    // 브랜드는 선택사항일 수 있으므로 검사 생략

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
    f.action = "insert.do";
    f.submit();
}
</script>
</body>
</html>