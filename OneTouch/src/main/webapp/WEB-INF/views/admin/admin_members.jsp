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

        .container {
            max-width: 1600px;
            margin: 40px auto;
            padding: 0 40px;
        }

        .admin-layout {
            display: grid;
            grid-template-columns: 250px 1fr;
            gap: 30px;
        }

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

        .roll-select {
            padding: 6px 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 13px;
            cursor: pointer;
            background: white;
        }

        .pagination {
            display: flex;
            justify-content: center;
            gap: 5px;
            margin-top: 30px;
        }

        .pagination a {
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 13px;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
            color: #333;
        }

        .pagination a:hover {
            background: #1a237e;
            color: white;
            border-color: #1a237e;
        }

        .pagination a.active {
            background: #1a237e;
            color: white;
            border-color: #1a237e;
        }

        .pagination a.disabled {
            color: #999;
            cursor: not-allowed;
            pointer-events: none;
        }

        .total-count {
            text-align: right;
            margin-bottom: 10px;
            color: #666;
            font-size: 14px;
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
		
		.btn-delete {
		    background: white;
		    color: #d32f2f;
		    border: 1px solid #d32f2f;
		}
		
		.btn-delete:hover {
		    background: #d32f2f;
		    color: white;
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
        }
    </style>
</head>
<body>
    <%@ include file="admin_header.jsp" %>

    <div class="container">
        <div class="admin-layout">
            <%@ include file="admin_side.jsp"%>

            <main class="main-content">
                <div class="section-header">
                    <h2 class="section-title">👥 회원관리</h2>
                </div>

                <div class="search-area">
                    <input type="text" class="search-input" placeholder="이름, 아이디, 이메일 검색" 
                           id="searchKeyword" value="${keyword}">
                    <select class="search-select" id="searchType">
                        <option value="">전체</option>
                        <option value="name" ${searchType == 'name' ? 'selected' : ''}>이름</option>
                        <option value="id" ${searchType == 'id' ? 'selected' : ''}>아이디</option>
                        <option value="email" ${searchType == 'email' ? 'selected' : ''}>이메일</option>
                    </select>
                    
                    <select class="search-select" id="searchRoll">
                        <option value="">권한</option>
                        <option value="admin" ${roll == 'admin' ? 'selected' : ''}>관리자</option>
                        <option value="user" ${roll == 'user' ? 'selected' : ''}>일반회원</option>
                    </select>
                    <button class="btn-search" onclick="searchMembers()">검색</button>
                </div>

                <c:choose>
                    <c:when test="${not empty members}">
                        <div class="total-count">
                            전체 ${totalCount}명
                        </div>
                        
                        <table class="members-table">
                            <thead>
							    <tr>
							        <th style="width: 80px;">아이디</th>
							        <th style="width: 100px;">이름</th>
							        <th style="width: 150px;">이메일</th>
							        <th style="width: 100px;">가입일</th>
							        <th style="width: 100px;">권한</th>
							        <th style="width: 80px;">관리</th>  <!-- 추가 -->
							    </tr>
						  </thead>
                            <tbody>
								    <c:forEach var="member" items="${members}">
								        <tr>
								            <td>${member.mem_id}</td>
								            <td>${member.mem_name}</td>
								            <td>${member.mem_email}</td>
								            <td>${member.mem_time}</td>
								            <td>
								                <select class="roll-select" 
								                        onchange="updateMemberRoll('${member.mem_id}', this.value)">
								                    <option value="user" ${member.mem_roll == 'user' ? 'selected' : ''}>일반회원</option>
								                    <option value="admin" ${member.mem_roll == 'admin' ? 'selected' : ''}>관리자</option>
								                </select>
								            </td>
								            <td>
								                <button class="btn-small btn-delete" onclick="deleteMember('${member.mem_id}')">삭제</button>
								            </td>
								        </tr>
								    </c:forEach>
							</tbody>
                        </table>

                        <!-- 페이지네이션 -->
                        <div class="pagination">
                            <c:if test="${currentPage > 1}">
                                <a href="?page=${currentPage - 1}&keyword=${keyword}&searchType=${searchType}&roll=${roll}">&lt;</a>
                            </c:if>
                            <c:if test="${currentPage == 1}">
                                <a class="disabled">&lt;</a>
                            </c:if>
                            
                            <c:forEach begin="1" end="${totalPages}" var="i">
                                <a href="?page=${i}&keyword=${keyword}&searchType=${searchType}&roll=${roll}" 
                                   class="${i == currentPage ? 'active' : ''}">${i}</a>
                            </c:forEach>
                            
                            <c:if test="${currentPage < totalPages}">
                                <a href="?page=${currentPage + 1}&keyword=${keyword}&searchType=${searchType}&roll=${roll}">&gt;</a>
                            </c:if>
                            <c:if test="${currentPage == totalPages}">
                                <a class="disabled">&gt;</a>
                            </c:if>
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
            const roll = document.getElementById('searchRoll').value;
            
            let url = '/admin/admin_members?page=1';
            if (keyword) url += '&keyword=' + encodeURIComponent(keyword);
            if (type) url += '&searchType=' + type;
            if (roll) url += '&roll=' + roll;
            
            window.location.href = url;
        }

        function updateMemberRoll(memId, newRoll) {
            if (confirm('권한을 변경하시겠습니까?')) {
                fetch('/admin/updateMemberRoll', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: 'mem_id=' + memId + '&mem_roll=' + newRoll
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        alert(data.message);
                        location.reload();
                    } else {
                        alert(data.message);
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('오류가 발생했습니다.');
                });
            } else {
                location.reload(); // 취소시 원래대로
            }
        }
        
        function deleteMember(memberId) {
            if (confirm('정말 삭제하시겠습니까?')) {
                fetch('/admin/deleteMember', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: 'mem_id=' + memberId
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        alert(data.message);
                        location.reload();
                    } else {
                        alert(data.message);
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('오류가 발생했습니다.');
                });
            }
        }
    </script>
</body>
</html>