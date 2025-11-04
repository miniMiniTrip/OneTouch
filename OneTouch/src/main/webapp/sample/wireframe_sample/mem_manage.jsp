<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    // 샘플 회원 데이터 (실제로는 DAO에서 가져와야 함)
    // List<Member> members = memberDAO.getAllMembers();
%>

<!-- 회원관리 -->
<div class="section-card">
    <div class="section-header">
        <h2 class="section-title">👥 회원관리</h2>
    </div>

    <div class="search-bar">
        <form action="admin.jsp" method="get">
            <input type="hidden" name="section" value="members">
            <input type="text" class="search-input" name="search" placeholder="이름, 아이디, 이메일로 검색" value="${param.search}">
            <select class="search-select" name="status">
                <option value="all" ${param.status == 'all' ? 'selected' : ''}>전체</option>
                <option value="active" ${param.status == 'active' ? 'selected' : ''}>활성</option>
                <option value="inactive" ${param.status == 'inactive' ? 'selected' : ''}>탈퇴</option>
            </select>
            <button type="submit" class="btn btn-primary">검색</button>
        </form>
    </div>

    <table class="data-table">
        <thead>
            <tr>
                <th>아이디</th>
                <th>이름</th>
                <th>이메일</th>
                <th>가입일</th>
                <th>상태</th>
                <th>관리</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>user01</td>
                <td>김철수</td>
                <td>user01@email.com</td>
                <td>2024-01-15</td>
                <td><span class="status-badge status-active">활성</span></td>
                <td>
                    <button class="btn btn-secondary btn-small" onclick="editMember('user01')">수정</button>
                    <button class="btn btn-danger btn-small" onclick="deleteMember('user01')">탈퇴처리</button>
                </td>
            </tr>
            <tr>
                <td>user02</td>
                <td>이영희</td>
                <td>user02@email.com</td>
                <td>2024-02-20</td>
                <td><span class="status-badge status-active">활성</span></td>
                <td>
                    <button class="btn btn-secondary btn-small" onclick="editMember('user02')">수정</button>
                    <button class="btn btn-danger btn-small" onclick="deleteMember('user02')">탈퇴처리</button>
                </td>
            </tr>
            <tr>
                <td>user03</td>
                <td>박민수</td>
                <td>user03@email.com</td>
                <td>2024-03-10</td>
                <td><span class="status-badge status-inactive">탈퇴</span></td>
                <td>
                    <button class="btn btn-secondary btn-small" onclick="editMember('user03')">수정</button>
                </td>
            </tr>
        </tbody>
    </table>
</div>

<!-- 회원 수정 모달 -->
<div class="modal" id="memberModal">
    <div class="modal-content">
        <div class="modal-header">
            <h3 class="modal-title">회원정보 수정</h3>
            <button class="modal-close" onclick="closeModal('memberModal')">✕</button>
        </div>
        <div class="modal-body">
            <form action="updateMember.jsp" method="post">
                <div class="form-group">
                    <label class="form-label">아이디</label>
                    <input type="text" class="form-input" name="memberId" id="editMemberId" readonly>
                </div>
                <div class="form-grid">
                    <div class="form-group">
                        <label class="form-label">이름</label>
                        <input type="text" class="form-input" name="name" id="editMemberName">
                    </div>
                    <div class="form-group">
                        <label class="form-label">이메일</label>
                        <input type="email" class="form-input" name="email" id="editMemberEmail">
                    </div>
                </div>
                <div class="form-group">
                    <label class="form-label">휴대폰</label>
                    <input type="tel" class="form-input" name="phone" id="editMemberPhone">
                </div>
                <div class="form-group">
                    <label class="form-label">상태</label>
                    <select class="form-select" name="status" id="editMemberStatus">
                        <option value="active">활성</option>
                        <option value="inactive">탈퇴처리</option>
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" onclick="closeModal('memberModal')">취소</button>
                    <button type="submit" class="btn btn-primary">저장</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
function editMember(userId) {
    // AJAX로 회원 정보 가져오기
    fetch('getMember.jsp?id=' + userId)
        .then(response => response.json())
        .then(data => {
            document.getElementById('editMemberId').value = data.id;
            document.getElementById('editMemberName').value = data.name;
            document.getElementById('editMemberEmail').value = data.email;
            document.getElementById('editMemberPhone').value = data.phone;
            document.getElementById('editMemberStatus').value = data.status;
            openModal('memberModal');
        });
}

function deleteMember(userId) {
    if (confirm('해당 회원을 탈퇴 처리하시겠습니까?\n(같은 아이디로 재가입 방지를 위해 데이터는 유지됩니다)')) {
        location.href = 'deleteMember.jsp?id=' + userId;
    }
}
</script>