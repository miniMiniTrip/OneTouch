<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OneTouch - 주문관리</title>
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
            grid-template-columns: 280px 1fr;
            gap: 30px;
        }

        /* 메인 컨텐츠 */
        .main-content {
            min-height: 600px;
        }

        .section-card {
            background: white;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }

        .section-header {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 24px;
            padding-bottom: 16px;
            border-bottom: 2px solid #e0e0e0;
        }

        .section-title {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        /* 검색 영역 */
        .search-area {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }

        .search-input {
            flex: 1;
            padding: 12px 15px;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            font-size: 14px;
        }

        .search-input:focus {
            outline: none;
            border-color: #1a237e;
        }

        .search-select {
            padding: 12px 15px;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            font-size: 14px;
            background: white;
            cursor: pointer;
        }

        .btn-search {
            padding: 12px 24px;
            background: #1a237e;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
        }

        .btn-search:hover {
            background: #0d47a1;
        }

        /* 테이블 */
        .order-table {
            width: 100%;
            border-collapse: collapse;
            background: white;
        }

        .order-table thead {
            background: #f8f9fa;
        }

        .order-table th {
            padding: 15px 12px;
            text-align: center;
            font-weight: 600;
            color: #666;
            border-bottom: 2px solid #e0e0e0;
            font-size: 14px;
        }

        .order-table td {
            padding: 15px 12px;
            text-align: center;
            border-bottom: 1px solid #f0f0f0;
            font-size: 14px;
            color: #333;
        }

        .order-table tbody tr:hover {
            background: #f5f7fa;
        }

        .order-table td.text-left {
            text-align: left;
        }

        /* 배송상태 선택박스 */
        .status-select {
            padding: 6px 10px;
            border: 1px solid #e0e0e0;
            border-radius: 6px;
            font-size: 13px;
            background: white;
            cursor: pointer;
        }

        .status-select:focus {
            outline: none;
            border-color: #1a237e;
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
                flex-direction: column;
            }

            .order-table {
                font-size: 12px;
            }

            .order-table th,
            .order-table td {
                padding: 10px 8px;
            }
        }
    </style>
</head>
<body>
    <!-- 헤더 include -->
    <%@ include file="admin_header.jsp"%>

    <!-- 메인 컨테이너 -->
    <div class="container">
        <div class="admin-layout">
            <!-- 사이드바 include -->
            <%@ include file="admin_side.jsp"%>

            <!-- 메인 컨텐츠 -->
            <main class="main-content">
                <div class="section-card">
                    <div class="section-header">
                        <h2 class="section-title">🚚 주문관리</h2>
                    </div>

                    <!-- 검색 영역 -->
                    <div class="search-area">
                        <input type="text" class="search-input" placeholder="주문번호, 주문자명으로 검색">
                        <select class="search-select">
                            <option value="">전체 상태</option>
                            <option value="pending">배송대기</option>
                            <option value="shipping">배송중</option>
                            <option value="completed">배송완료</option>
                        </select>
                        <button class="btn-search">검색</button>
                    </div>

                    <!-- 주문 테이블 -->
                    <table class="order-table">
                        <thead>
                            <tr>
                                <th width="10%">주문번호</th>
                                <th width="8%">주문자</th>
                                <th width="12%">상품명</th>
                                <th width="12%">전화번호</th>
                                <th width="20%">주소</th>
                                <th width="10%">금액</th>
                                <th width="10%">주문일</th>
                                <th width="12%">배송상태</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>ORDER_001</td>
                                <td>김철수</td>
                                <td class="text-left">아이구주선셋 화면</td>
                                <td>010-1234-5678</td>
                                <td class="text-left">서울시 강남구 테헤란로 123</td>
                                <td>63,000원</td>
                                <td>2025-01-15</td>
                                <td>
                                    <select class="status-select">
                                        <option value="pending">배송 준비중</option>
                                        <option value="shipping">배송중</option>
                                        <option value="completed">배송완료</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>ORDER_002</td>
                                <td>이영희</td>
                                <td class="text-left">바닐라딕 세럼</td>
                                <td>010-9876-5432</td>
                                <td class="text-left">경기도 성남시 분당구 판교로 456</td>
                                <td>28,000원</td>
                                <td>2025-01-14</td>
                                <td>
                                    <select class="status-select">
                                        <option value="pending">배송 준비중</option>
                                        <option value="shipping" selected>배송중</option>
                                        <option value="completed">배송완료</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>ORDER_003</td>
                                <td>박민수</td>
                                <td class="text-left">레티놀 크림</td>
                                <td>010-2222-3333</td>
                                <td class="text-left">부산시 해운대구 센텀대로 789</td>
                                <td>42,000원</td>
                                <td>2025-01-13</td>
                                <td>
                                    <select class="status-select">
                                        <option value="pending">배송 준비중</option>
                                        <option value="shipping">배송중</option>
                                        <option value="completed" selected>배송완료</option>
                                    </select>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </main>
        </div>
    </div>

    <script>
        // 배송상태 변경 이벤트
        document.querySelectorAll('.status-select').forEach(select => {
            select.addEventListener('change', function() {
                const orderId = this.closest('tr').querySelector('td:first-child').textContent;
                const newStatus = this.value;
                
                if (confirm(`${orderId}의 배송상태를 변경하시겠습니까?`)) {
                    // 여기에 Ajax 요청 추가
                    alert('배송상태가 변경되었습니다.');
                }
            });
        });

        // 검색 버튼 클릭 이벤트
        document.querySelector('.btn-search').addEventListener('click', function() {
            const searchText = document.querySelector('.search-input').value;
            const statusFilter = document.querySelector('.search-select').value;
            
            console.log('검색어:', searchText);
            console.log('상태 필터:', statusFilter);
            
            // 여기에 검색 로직 추가
        });
    </script>
</body>
</html>