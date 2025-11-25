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
            grid-template-columns: 250px 1fr;
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

        /* 배송 정보 입력 버튼 */
        .btn-delivery {
            padding: 6px 12px;
            background: #5c6bc0;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 13px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .btn-delivery:hover {
            background: #4a5aaf;
        }

        /* 모달 */
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.5);
        }

        .modal-content {
            background: white;
            margin: 10% auto;
            padding: 30px;
            border-radius: 12px;
            width: 500px;
            max-width: 90%;
        }

        .modal-header {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 2px solid #e0e0e0;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 8px;
            color: #333;
        }

        .form-input,
        .form-select {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #e0e0e0;
            border-radius: 6px;
            font-size: 14px;
        }

        .form-input:focus,
        .form-select:focus {
            outline: none;
            border-color: #1a237e;
        }

        .modal-buttons {
            display: flex;
            gap: 10px;
            justify-content: flex-end;
            margin-top: 25px;
        }

        .btn-modal {
            padding: 10px 24px;
            border: none;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
        }

        .btn-primary {
            background: #1a237e;
            color: white;
        }

        .btn-primary:hover {
            background: #0d47a1;
        }

        .btn-secondary {
            background: #e0e0e0;
            color: #333;
        }

        .btn-secondary:hover {
            background: #d0d0d0;
        }

        /* 빈 상태 */
        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: #999;
        }

        .empty-state i {
            font-size: 48px;
            margin-bottom: 15px;
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
                    <form action="${pageContext.request.contextPath}/admin/order/search" method="get">
                        <div class="search-area">
                            <input type="text" name="search_keyword" class="search-input" 
                                   placeholder="주문번호, 주문자명으로 검색"
                                   value="${search_keyword}">
                            <select name="order_status" class="search-select">
                                <option value="">전체 상태</option>
                                <option value="결제대기" ${order_status == '결제대기' ? 'selected' : ''}>결제대기</option>
                                <option value="상품확인중" ${order_status == '상품확인중' ? 'selected' : ''}>상품확인중</option>
                                <option value="배송준비중" ${order_status == '배송준비중' ? 'selected' : ''}>배송준비중</option>
                                <option value="배송중" ${order_status == '배송중' ? 'selected' : ''}>배송중</option>
                                <option value="배송완료" ${order_status == '배송완료' ? 'selected' : ''}>배송완료</option>
                                <option value="취소" ${order_status == '취소' ? 'selected' : ''}>취소</option>
                            </select>
                            <button type="submit" class="btn-search">검색</button>
                        </div>
                    </form>

                    <!-- 주문 테이블 -->
                    <c:choose>
                        <c:when test="${empty order_list}">
                            <div class="empty-state">
                                <i>📦</i>
                                <p>주문 내역이 없습니다.</p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <table class="order-table">
                                <thead>
                                    <tr>
                                        <th width="10%">주문번호</th>
                                        <th width="8%">주문자</th>
                                        <th width="12%">상품명</th>
                                        <th width="12%">전화번호</th>
                                        <th width="15%">주소</th>
                                        <th width="8%">금액</th>
                                        <th width="10%">주문일</th>
                                        <th width="10%">배송상태</th>
                                        <th width="10%">배송관리</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="order" items="${order_list}">
                                        <tr data-order-id="${order.order_id}">
                                            <td>${order.order_no}</td>
                                            <td>${order.order_mem_name}</td>
                                            <td class="text-left">${order.order_name}</td>
                                            <td>${order.order_phone}</td>
                                            <td class="text-left">${order.order_address}</td>
                                            <td><fmt:formatNumber value="${order.total_amount}" pattern="#,###"/>원</td>
                                            <td><fmt:formatDate value="${order.order_time}" pattern="yyyy-MM-dd"/></td>
                                            <td>
                                                <select class="status-select" data-order-id="${order.order_id}">
                                                    <option value="결제대기" ${order.order_status == '결제대기' ? 'selected' : ''}>결제대기</option>
                                                    <option value="상품확인중" ${order.order_status == '상품확인중' ? 'selected' : ''}>상품확인중</option>
                                                    <option value="배송준비중" ${order.order_status == '배송준비중' ? 'selected' : ''}>배송준비중</option>
                                                    <option value="배송중" ${order.order_status == '배송중' ? 'selected' : ''}>배송중</option>
                                                    <option value="배송완료" ${order.order_status == '배송완료' ? 'selected' : ''}>배송완료</option>
                                                    <option value="취소" ${order.order_status == '취소' ? 'selected' : ''}>취소</option>
                                                </select>
                                            </td>
                                            <td>
                                                <button class="btn-delivery" onclick="openDeliveryModal(${order.order_id}, '${order.order_tracking}', '${order.order_courier}')">
                                                    <c:choose>
                                                        <c:when test="${empty order.order_tracking}">송장등록</c:when>
                                                        <c:otherwise>송장수정</c:otherwise>
                                                    </c:choose>
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:otherwise>
                    </c:choose>
                </div>
            </main>
        </div>
    </div>

    <!-- 배송 정보 입력 모달 -->
    <div id="deliveryModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">배송 정보 등록</div>
            <form id="deliveryForm">
                <input type="hidden" id="modal_order_id" name="order_id">
                
                <div class="form-group">
                    <label class="form-label">택배사</label>
                    <select id="order_courier" name="order_courier" class="form-select" required>
                        <option value="">선택하세요</option>
                        <option value="CJ대한통운">CJ대한통운</option>
                        <option value="우체국택배">우체국택배</option>
                        <option value="한진택배">한진택배</option>
                        <option value="롯데택배">롯데택배</option>
                        <option value="로젠택배">로젠택배</option>
                        <option value="GS편의점택배">GS편의점택배</option>
                        <option value="CU편의점택배">CU편의점택배</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label class="form-label">송장번호</label>
                    <input type="text" id="order_tracking" name="order_tracking" 
                           class="form-input" placeholder="송장번호를 입력하세요" required>
                </div>
                
                <div class="form-group">
                    <label class="form-label">주문상태</label>
                    <select id="order_status" name="order_status" class="form-select" required>
                        <option value="배송준비중">배송준비중</option>
                        <option value="배송중" selected>배송중</option>
                        <option value="배송완료">배송완료</option>
                    </select>
                </div>
                
                <div class="modal-buttons">
                    <button type="button" class="btn-modal btn-secondary" onclick="closeDeliveryModal()">취소</button>
                    <button type="submit" class="btn-modal btn-primary">등록</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        // 배송상태 변경 이벤트
        document.querySelectorAll('.status-select').forEach(select => {
            // 원래 선택된 값 저장
            const originalValue = select.value;
            
            select.addEventListener('change', function() {
                const orderId = this.dataset.orderId;
                const newStatus = this.value;
                
                if (confirm('주문 상태를 "' + newStatus + '"(으)로 변경하시겠습니까?')) {
                    updateOrderStatus(orderId, newStatus, this);
                } else {
                    // 취소하면 원래 값으로 되돌림
                    this.value = originalValue;
                }
            });
        });

        // 주문 상태 변경 Ajax
        function updateOrderStatus(orderId, newStatus, selectElement) {
            fetch('${pageContext.request.contextPath}/admin/order/update_status', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: 'order_id=' + orderId + '&order_status=' + encodeURIComponent(newStatus)
            })
            .then(response => response.json())
            .then(data => {
                if (data.result === 'success') {
                    alert(data.message);
                    // 성공하면 원래 값을 새 값으로 업데이트
                    selectElement.querySelectorAll('option').forEach(opt => {
                        opt.removeAttribute('selected');
                    });
                    selectElement.querySelector('option[value="' + newStatus + '"]').setAttribute('selected', 'selected');
                } else {
                    alert(data.message);
                    location.reload();
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('주문 상태 변경 중 오류가 발생했습니다.');
                location.reload();
            });
        }

        // 배송 정보 모달 열기
        function openDeliveryModal(orderId, orderTracking, orderCourier) {
            document.getElementById('modal_order_id').value = orderId;
            document.getElementById('order_tracking').value = orderTracking || '';
            document.getElementById('order_courier').value = orderCourier || '';
            document.getElementById('deliveryModal').style.display = 'block';
        }

        // 배송 정보 모달 닫기
        function closeDeliveryModal() {
            document.getElementById('deliveryModal').style.display = 'none';
            document.getElementById('deliveryForm').reset();
        }

        // 모달 외부 클릭 시 닫기
        window.onclick = function(event) {
            const modal = document.getElementById('deliveryModal');
            if (event.target == modal) {
                closeDeliveryModal();
            }
        }

        // 배송 정보 등록 폼 제출
        document.getElementById('deliveryForm').addEventListener('submit', function(e) {
            e.preventDefault();
            
            const formData = new FormData(this);
            const params = new URLSearchParams(formData).toString();
            
            fetch('${pageContext.request.contextPath}/admin/order/update_delivery', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: params
            })
            .then(response => response.json())
            .then(data => {
                if (data.result === 'success') {
                    alert(data.message);
                    closeDeliveryModal();
                    location.reload();
                } else {
                    alert(data.message);
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('배송 정보 등록 중 오류가 발생했습니다.');
            });
        });
    </script>
</body>
</html>
