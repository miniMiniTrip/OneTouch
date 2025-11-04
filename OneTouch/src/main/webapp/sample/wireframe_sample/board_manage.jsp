<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 게시판 관리 -->
<div class="section-card">
    <div class="section-header">
        <h2 class="section-title">💬 게시판 관리</h2>
        <button class="btn btn-primary" onclick="openBoardModal('add')">FAQ 추가</button>
    </div>

    <div class="search-bar">
        <form action="admin.jsp" method="get">
            <input type="hidden" name="section" value="board">
            <select class="search-select" name="category">
                <option value="all">전체</option>
                <option value="faq" ${param.category == 'faq' ? 'selected' : ''}>FAQ</option>
                <option value="qna" ${param.category == 'qna' ? 'selected' : ''}>상품 Q&A</option>
                <option value="inquiry" ${param.category == 'inquiry' ? 'selected' : ''}>문의</option>
            </select>
            <input type="text" class="search-input" name="search" placeholder="제목, 내용으로 검색" value="${param.search}">
            <button type="submit" class="btn btn-primary">검색</button>
        </form>
    </div>

    <table class="data-table">
        <thead>
            <tr>
                <th>번호</th>
                <th>카테고리</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>답변상태</th>
                <th>관리</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>1</td>
                <td>FAQ</td>
                <td>배송은 얼마나 걸리나요?</td>
                <td>admin</td>
                <td>2025-01-10</td>
                <td><span class="status-badge status-active">답변완료</span></td>
                <td>
                    <button class="btn btn-secondary btn-small" onclick="editBoard(1)">수정</button>
                    <button class="btn btn-danger btn-small" onclick="deleteBoard(1)">삭제</button>
                </td>
            </tr>
            <tr>
                <td>2</td>
                <td>상품 Q&A</td>
                <td>민감성 피부도 사용 가능한가요?</td>
                <td>user01</td>
                <td>2025-01-12</td>
                <td><span class="status-badge status-active">답변완료</span></td>
                <td>
                    <button class="btn btn-secondary btn-small" onclick="editBoard(2)">답변</button>
                    <button class="btn btn-danger btn-small" onclick="deleteBoard(2)">삭제</button>
                </td>
            </tr>
            <tr>
                <td>3</td>
                <td>문의</td>
                <td>반품 문의드립니다</td>
                <td>user02</td>
                <td>2025-01-14</td>
                <td><span class="status-badge status-pending">답변대기</span></td>
                <td>
                    <button class="btn btn-secondary btn-small" onclick="editBoard(3)">답변</button>
                    <button class="btn btn-danger btn-small" onclick="deleteBoard(3)">삭제</button>
                </td>
            </tr>
        </tbody>
    </table>
</div>

<!-- FAQ/답변 모달 -->
<div class="modal" id="boardModal">
    <div class="modal-content">
        <div class="modal-header">
            <h3 class="modal-title" id="boardModalTitle">FAQ 추가</h3>
            <button class="modal-close" onclick="closeModal('boardModal')">✕</button>
        </div>
        <div class="modal-body">
            <form action="saveBoard.jsp" method="post">
                <input type="hidden" name="boardId" id="boardId">
                <div class="form-group">
                    <label class="form-label">카테고리</label>
                    <select class="form-select" name="category" id="boardCategory" required>
                        <option value="faq">FAQ</option>
                        <option value="qna">상품 Q&A</option>
                        <option value="inquiry">문의</option>
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-label">제목</label>
                    <input type="text" class="form-input" name="title" id="boardTitle" required>
                </div>
                <div class="form-group">
                    <label class="form-label">내용</label>
                    <textarea class="form-textarea" name="content" id="boardContent" required></textarea>
                </div>
                <div class="form-group">
                    <label class="form-label">답변</label>
                    <textarea class="form-textarea" name="answer" id="boardAnswer" placeholder="답변을 입력하세요 (선택사항)"></textarea>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" onclick="closeModal('boardModal')">취소</button>
                    <button type="submit" class="btn btn-primary">저장</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
function openBoardModal(mode, postId) {
    if (mode === 'add') {
        document.getElementById('boardModalTitle').textContent = 'FAQ 추가';
        document.getElementById('boardId').value = '';
        document.getElementById('boardCategory').value = 'faq';
        document.getElementById('boardTitle').value = '';
        document.getElementById('boardContent').value = '';
        document.getElementById('boardAnswer').value = '';
    } else {
        document.getElementById('boardModalTitle').textContent = '게시글 수정';
        // AJAX로 게시글 정보 가져오기
        fetch('getBoard.jsp?id=' + postId)
            .then(response => response.json())
            .then(data => {
                document.getElementById('boardId').value = data.id;
                document.getElementById('boardCategory').value = data.category;
                document.getElementById('boardTitle').value = data.title;
                document.getElementById('boardContent').value = data.content;
                document.getElementById('boardAnswer').value = data.answer || '';
            });
    }
    openModal('boardModal');
}

function editBoard(postId) {
    openBoardModal('edit', postId);
}

function deleteBoard(postId) {
    if (confirm('삭제하시겠습니까?')) {
        location.href = 'deleteBoard.jsp?id=' + postId;
    }
}
</script>