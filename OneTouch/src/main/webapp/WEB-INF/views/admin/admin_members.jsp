<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OneTouch - 회원관리</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Malgun Gothic', 'Apple SD Gothic Neo', sans-serif;
            background: #f5f7fa;
            color: #333;
        }

        /* 컨테이너 */
        .container {
            max-width: 1600px;
            margin: 40px auto;
            padding: 0 40px;
        }

        /* 레이아웃 */
        .admin-layout {
            display: grid;
            grid-template-columns: 250px 1fr;
            gap: 30px;
        }

        /* 메인 컨텐츠 */
        .main-content {
            background: white;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 2px solid #1a237e;
        }

        .section-title {
            font-size: 20px;
            font-weight: bold;
            color: #1a237e;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        /* 검색 영역 */
        .search-area {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
            align-items: center;
        }

        .search-input {
            flex: 1;
            padding: 10px 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }

        .search-select {
            padding: 10px 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            background: white;
            cursor: pointer;
            min-width: 100px;
        }

        .btn-search {
            padding: 10px 24px;
            background: #1a237e;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
        }

        .btn-search:hover {
            background: #0d47a1;
        }

        /* 테이블 스타일 */
        .members-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .members-table thead {
            background: #f8f9fa;
            border-top: 2px solid #1a237e;
            border-bottom: 1px solid #dee2e6;
        }

        .members-table th {
            padding: 15px 10px;
            font-size: 13px;
            font-weight: 600;
            color: #333;
            text-align: center;
        }

        .members-table tbody tr {
            border-bottom: 1px solid #dee2e6;
            transition: background 0.2s;
        }

        .members-table tbody tr:hover {
            background: #f8f9fa;
        }

        .members-table td {
            padding: 15px 10px;
            font-size: 13px;
            color: #666;
            text-align: center;
        }

        /* 상태 배지 */
        .status-badge {
            display: inline-block;
            padding: 6px 12px;
            border-radius: 12px;
            font-size: 12px;
            font-weight: 600;
        }

        .status-active {
            background: #e8f5e9;
            color: #388e3c;
        }

        .status-inactive {
            background: #ffebee;
            color: #c62828;
        }

        /* 액션 버튼 */
        .action-buttons {
            display: flex;
            gap: 6px;
            justify-content: center;
        }

        .btn-small {
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            white-space: nowrap;
        }

        .btn-edit {
            background: white;
            color: #1a237e;
            border: 1px solid #1a237e;
        }

        .btn-edit:hover {
            background: #1a237e;
            color: white;
        }

        .btn-delete {
            background: white;
            color: #d32f2f;
            border: 1px solid #d32f2f;
        }

        .btn-delete:hover {
            background: #d32f2f;
            color: white;
        }

        /* 페이지네이션 */
        .pagination {
            display: flex;
            justify-content: center;
            gap: 5px;
            margin-top: 30px;
        }

        .pagination a,
        .pagination span {
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 13px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .pagination a:hover,
        .pagination a.active {
            background: #1a237e;
            color: white;
            border-color: #1a237e;
        }

        .pagination span {
            color: #999;
        }

        /* 반응형 */
        @media (max-width: 768px) {
            .container {
                padding: 0 20px;
            }

            .admin-layout {
                grid-template-columns: 1fr;
            }

            .search-area {
                flex-wrap: wrap;
            }

            .search-input {
                flex: 1 1 100%;
            }

            .members-table {
                font-size: 12px;
            }

            .members-table th,
            .members-table td {
                padding: 10px 5px;
            }

            .action-buttons {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <!-- 헤더 -->
    <%@ include file="admin_header.jsp" %>

    <!-- 메인 컨테이너 -->
    <div class="container">
        <div class="admin-layout">
            <!-- 사이드바 -->
            <%@ include file="admin_side.jsp"%>

            <!-- 메인 컨텐츠 -->
            <main class="main-content">
                <div class="section-header">
                    <h2 class="section-title">👥 회원관리</h2>
                </div>

                <!-- 검색 영역 -->
                <div class="search-area">
                    <input type="text" class="search-input" placeholder="이름, 아이디, 이메일 검색" id="searchKeyword">
                    <select class="search-select" id="searchType">
                        <option value="">전체</option>
                        <option value="name">이름</option>
                        <option value="id">아이디</option>
                        <option value="email">이메일</option>
                    </select>
                    <select class="search-select" id="searchStatus">
                        <option value="">상태</option>
                        <option value="active">활성</option>
                        <option value="inactive">비활성</option>
                    </select>
                    <button class="btn-search" onclick="searchMembers()">검색</button>
                </div>

                <!-- 회원 테이블 -->
                <c:choose>
                    <c:when test="${not empty members}">
                        <table class="members-table">
                            <thead>
                                <tr>
                                    <th style="width: 80px;">아이디</th>
                                    <th style="width: 100px;">이름</th>
                                    <th style="width: 150px;">이메일</th>
                                    <th style="width: 100px;">가입일</th>
                                    <th style="width: 80px;">상태</th>
                                    <th style="width: 120px;">관리</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="member" items="${members}">
                                    <tr>
                                        <td>${member.mem_id}</td>
                                        <td>${member.mem_name}</td>
                                        <td>${member.mem_email}</td>
                                        <td>
                                            <fmt:formatDate value="${member.mem_date}" pattern="yyyy-MM-dd"/>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${member.mem_status == 'active'}">
                                                    <span class="status-badge status-active">활성</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="status-badge status-inactive">비활성</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <div class="action-buttons">
                                                <button class="btn-small btn-edit" onclick="editMember('${member.mem_id}')">수정</button>
                                                <button class="btn-small btn-delete" onclick="deleteMember('${member.mem_id}')">삭제</button>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                        <!-- 페이지네이션 -->
                        <div class="pagination">
                            <a href="#" onclick="previousPage(); return false;">&lt;</a>
                            <a href="#" class="active">1</a>
                            <a href="#">2</a>
                            <a href="#">3</a>
                            <a href="#" onclick="nextPage(); return false;">&gt;</a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div style="text-align: center; padding: 60px 20px; color: #999;">
                            <p style="font-size: 16px; margin-bottom: 20px;">등록된 회원이 없습니다.</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </main>
        </div>
    </div>

    <script>
        function searchMembers() {
            const keyword = document.getElementById('searchKeyword').value;
            const type = document.getElementById('searchType').value;
            const status = document.getElementById('searchStatus').value;
            
            // 검색 로직 구현
            console.log('Search:', { keyword, type, status });
        }

        function editMember(memberId) {
            // 수정 페이지로 이동
            window.location.href = '/admin/member/edit?mem_id=' + memberId;
        }

        function deleteMember(memberId) {
            if (confirm('정말 삭제하시겠습니까?')) {
                // 삭제 로직 구현
                console.log('Delete:', memberId);
            }
        }

        function previousPage() {
            console.log('Previous page');
        }

        function nextPage() {
            console.log('Next page');
        }
    </script>
</body>
</html>