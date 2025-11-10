<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 재고관리 -->
<div class="section-card">
    <div class="section-header">
        <h2 class="section-title">📋 재고관리</h2>
    </div>

    <table class="data-table">
        <thead>
            <tr>
                <th>상품명</th>
                <th>현재 재고</th>
                <th>상태</th>
                <th>관리</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>히아루론산 수분 보습 세럼</td>
                <td>150개</td>
                <td><span class="status-badge status-active">정상</span></td>
                <td>
                    <button class="btn btn-secondary btn-small" onclick="showPreview('P001')">미리보기</button>
                    <button class="btn btn-secondary btn-small" onclick="updateStock('P001')">재고수정</button>
                </td>
            </tr>
            <tr>
                <td>비타민C 브라이트닝 세럼</td>
                <td>80개</td>
                <td><span class="status-badge status-active">정상</span></td>
                <td>
                    <button class="btn btn-secondary btn-small" onclick="showPreview('P002')">미리보기</button>
                    <button class="btn btn-secondary btn-small" onclick="updateStock('P002')">재고수정</button>
                </td>
            </tr>
            <tr>
                <td>레티놀 안티에이징 크림</td>
                <td>30개</td>
                <td><span class="status-badge status-pending">부족</span></td>
                <td>
                    <button class="btn btn-secondary btn-small" onclick="showPreview('P003')">미리보기</button>
                    <button class="btn btn-secondary btn-small" onclick="updateStock('P003')">재고수정</button>
                </td>
            </tr>
            <tr>
                <td>나이아신아마이드 토너</td>
                <td>0개</td>
                <td><span class="status-badge status-inactive">품절</span></td>
                <td>
                    <button class="btn btn-secondary btn-small" onclick="showPreview('P004')">미리보기</button>
                    <button class="btn btn-secondary btn-small" onclick="updateStock('P004')">재고수정</button>
                </td>
            </tr>
        </tbody>
    </table>
</div>

<!-- 상품 미리보기 모달 -->
<div class="modal" id="previewModal">
    <div class="modal-content">
        <div class="modal-header">
            <h3 class="modal-title">상품 미리보기</h3>
            <button class="modal-close" onclick="closeModal('previewModal')">✕</button>
        </div>
        <div class="modal-body">
            <div class="product-preview">
                <div class="preview-image">상품 이미지</div>
                <div class="preview-info">
                    <div class="preview-name" id="previewName"></div>
                    <div class="preview-price" id="previewPrice"></div>
                    <div class="preview-stock" id="previewStock"></div>
                    <p style="margin-top: 16px; color: #666; line-height: 1.6;" id="previewDescription"></p>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button class="btn btn-secondary" onclick="closeModal('previewModal')">닫기</button>
        </div>
    </div>
</div>

<!-- 재고 수정 모달 -->
<div class="modal" id="stockModal">
    <div class="modal-content">
        <div class="modal-header">
            <h3 class="modal-title">재고 수정</h3>
            <button class="modal-close" onclick="closeModal('stockModal')">✕</button>
        </div>
        <div class="modal-body">
            <form action="updateStock.jsp" method="post">
                <input type="hidden" name="productCode" id="stockProductCode">
                <div class="form-group">
                    <label class="form-label">상품명</label>
                    <input type="text" class="form-input" id="stockProductName" readonly>
                </div>
                <div class="form-group">
                    <label class="form-label">현재 재고</label>
                    <input type="number" class="form-input" id="currentStock" readonly>
                </div>
                <div class="form-group">
                    <label class="form-label">변경 재고</label>
                    <input type="number" class="form-input" name="newStock" id="newStock" required min="0">
                </div>
                <div class="form-group">
                    <label class="form-label">변경 사유</label>
                    <textarea class="form-textarea" name="reason" placeholder="재고 변경 사유를 입력하세요" style="min-height: 80px;"></textarea>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" onclick="closeModal('stockModal')">취소</button>
                    <button type="submit" class="btn btn-primary">저장</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
function showPreview(productCode) {
    // AJAX로 상품 정보 가져오기
    fetch('getProduct.jsp?code=' + productCode)
        .then(response => response.json())
        .then(data => {
            document.getElementById('previewName').textContent = data.name;
            document.getElementById('previewPrice').textContent = data.price.toLocaleString() + '원';
            document.getElementById('previewStock').textContent = '재고: ' + data.stock + '개';
            document.getElementById('previewDescription').textContent = data.description || '상품 설명이 없습니다.';
            openModal('previewModal');
        });
}

function updateStock(productCode) {
    // AJAX로 상품 정보 가져오기
    fetch('getProduct.jsp?code=' + productCode)
        .then(response => response.json())
        .then(data => {
            document.getElementById('stockProductCode').value = data.code;
            document.getElementById('stockProductName').value = data.name;
            document.getElementById('currentStock').value = data.stock;
            document.getElementById('newStock').value = data.stock;
            openModal('stockModal');
        });
}
</script>