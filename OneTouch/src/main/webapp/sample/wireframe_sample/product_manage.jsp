<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 상품관리 -->
<div class="section-card">
    <div class="section-header">
        <h2 class="section-title">📦 상품관리</h2>
        <button class="btn btn-primary" onclick="openProductModal('add')">상품 등록</button>
    </div>

    <div class="search-bar">
        <form action="admin.jsp" method="get">
            <input type="hidden" name="section" value="products">
            <input type="text" class="search-input" name="search" placeholder="상품명으로 검색" value="${param.search}">
            <select class="search-select" name="category">
                <option value="all">전체 카테고리</option>
                <option value="skincare" ${param.category == 'skincare' ? 'selected' : ''}>스킨케어</option>
                <option value="makeup" ${param.category == 'makeup' ? 'selected' : ''}>메이크업</option>
                <option value="haircare" ${param.category == 'haircare' ? 'selected' : ''}>헤어케어</option>
            </select>
            <button type="submit" class="btn btn-primary">검색</button>
        </form>
    </div>

    <table class="data-table">
        <thead>
            <tr>
                <th>상품코드</th>
                <th>상품명</th>
                <th>카테고리</th>
                <th>가격</th>
                <th>재고</th>
                <th>관리</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>P001</td>
                <td>히아루론산 수분 보습 세럼</td>
                <td>스킨케어</td>
                <td>31,500원</td>
                <td>150개</td>
                <td>
                    <button class="btn btn-secondary btn-small" onclick="editProduct('P001')">수정</button>
                    <button class="btn btn-danger btn-small" onclick="deleteProduct('P001')">삭제</button>
                </td>
            </tr>
            <tr>
                <td>P002</td>
                <td>비타민C 브라이트닝 세럼</td>
                <td>스킨케어</td>
                <td>28,000원</td>
                <td>80개</td>
                <td>
                    <button class="btn btn-secondary btn-small" onclick="editProduct('P002')">수정</button>
                    <button class="btn btn-danger btn-small" onclick="deleteProduct('P002')">삭제</button>
                </td>
            </tr>
            <tr>
                <td>P003</td>
                <td>레티놀 안티에이징 크림</td>
                <td>스킨케어</td>
                <td>42,000원</td>
                <td>30개</td>
                <td>
                    <button class="btn btn-secondary btn-small" onclick="editProduct('P003')">수정</button>
                    <button class="btn btn-danger btn-small" onclick="deleteProduct('P003')">삭제</button>
                </td>
            </tr>
        </tbody>
    </table>
</div>

<!-- 상품 등록/수정 모달 -->
<div class="modal" id="productModal">
    <div class="modal-content">
        <div class="modal-header">
            <h3 class="modal-title" id="productModalTitle">상품 등록</h3>
            <button class="modal-close" onclick="closeModal('productModal')">✕</button>
        </div>
        <div class="modal-body">
            <form action="saveProduct.jsp" method="post" enctype="multipart/form-data">
                <input type="hidden" name="productCode" id="productCode">
                <div class="form-group">
                    <label class="form-label">상품명</label>
                    <input type="text" class="form-input" name="name" id="productName" required>
                </div>
                <div class="form-grid">
                    <div class="form-group">
                        <label class="form-label">카테고리</label>
                        <select class="form-select" name="category" id="productCategory" required>
                            <option value="skincare">스킨케어</option>
                            <option value="makeup">메이크업</option>
                            <option value="haircare">헤어케어</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="form-label">가격</label>
                        <input type="number" class="form-input" name="price" id="productPrice" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="form-label">재고</label>
                    <input type="number" class="form-input" name="stock" id="productStock" required>
                </div>
                <div class="form-group">
                    <label class="form-label">상품 설명</label>
                    <textarea class="form-textarea" name="description" id="productDescription"></textarea>
                </div>
                <div class="form-group">
                    <label class="form-label">상품 이미지</label>
                    <input type="file" class="form-input" name="image" accept="image/*">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" onclick="closeModal('productModal')">취소</button>
                    <button type="submit" class="btn btn-primary">저장</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
function openProductModal(mode, productCode) {
    if (mode === 'add') {
        document.getElementById('productModalTitle').textContent = '상품 등록';
        document.getElementById('productCode').value = '';
        document.getElementById('productName').value = '';
        document.getElementById('productCategory').value = 'skincare';
        document.getElementById('productPrice').value = '';
        document.getElementById('productStock').value = '';
        document.getElementById('productDescription').value = '';
    } else {
        document.getElementById('productModalTitle').textContent = '상품 수정';
        // AJAX로 상품 정보 가져오기
        fetch('getProduct.jsp?code=' + productCode)
            .then(response => response.json())
            .then(data => {
                document.getElementById('productCode').value = data.code;
                document.getElementById('productName').value = data.name;
                document.getElementById('productCategory').value = data.category;
                document.getElementById('productPrice').value = data.price;
                document.getElementById('productStock').value = data.stock;
                document.getElementById('productDescription').value = data.description;
            });
    }
    openModal('productModal');
}

function editProduct(productCode) {
    openProductModal('edit', productCode);
}

function deleteProduct(productCode) {
    if (confirm('정말 삭제하시겠습니까?')) {
        location.href = 'deleteProduct.jsp?code=' + productCode;
    }
}
</script>