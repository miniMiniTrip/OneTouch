<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 주문관리 -->
<div class="section-card">
    <div class="section-header">
        <h2 class="section-title">🚚 주문관리</h2>
    </div>

    <div class="search-bar">
        <form action="admin.jsp" method="get">
            <input type="hidden" name="section" value="orders">
            <input type="text" class="search-input" name="search" placeholder="주문번호, 주문자명으로 검색" value="${param.search}">
            <select class="search-select" name="status">
                <option value="all">전체 상태</option>
                <option value="pending" ${param.status == 'pending' ? 'selected' : ''}>배송 준비중</option>
                <option value="shipping" ${param.status == 'shipping' ? 'selected' : ''}>배송중</option>
                <option value="completed" ${param.status == 'completed' ? 'selected' : ''}>배송완료</option>
            </select>
            <button type="submit" class="btn btn-primary">검색</button>
        </form>
    </div>

    <table class="data-table">
        <thead>
            <tr>
                <th>주문번호</th>
                <th>주문자</th>
                <th>상품명</th>
                <th>금액</th>
                <th>주문일</th>
                <th>배송상태</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>ORDER_001</td>
                <td>김철수</td>
                <td>히아루론산 세럼</td>
                <td>63,000원</td>
                <td>2025-01-15</td>
                <td>
                    <form action="updateOrderStatus.jsp" method="post" style="display: inline;">
                        <input type="hidden" name="orderId" value="ORDER_001">
                        <select class="dropdown-select" name="status" onchange="this.form.submit()">
                            <option value="pending" selected>배송 준비중</option>
                            <option value="shipping">배송중</option>
                            <option value="completed">배송완료</option>
                        </select>
                    </form>
                </td>
            </tr>
            <tr>
                <td>ORDER_002</td>
                <td>이영희</td>
                <td>비타민C 세럼</td>
                <td>28,000원</td>
                <td>2025-01-14</td>
                <td>
                    <form action="updateOrderStatus.jsp" method="post" style="display: inline;">
                        <input type="hidden" name="orderId" value="ORDER_002">
                        <select class="dropdown-select" name="status" onchange="this.form.submit()">
                            <option value="pending">배송 준비중</option>
                            <option value="shipping" selected>배송중</option>
                            <option value="completed">배송완료</option>
                        </select>
                    </form>
                </td>
            </tr>
            <tr>
                <td>ORDER_003</td>
                <td>박민수</td>
                <td>레티놀 크림</td>
                <td>42,000원</td>
                <td>2025-01-13</td>
                <td>
                    <form action="updateOrderStatus.jsp" method="post" style="display: inline;">
                        <input type="hidden" name="orderId" value="ORDER_003">
                        <select class="dropdown-select" name="status" onchange="this.form.submit()">
                            <option value="pending">배송 준비중</option>
                            <option value="shipping">배송중</option>
                            <option value="completed" selected>배송완료</option>
                        </select>
                    </form>
                </td>
            </tr>
        </tbody>
    </table>
</div>

<script>
// 배송 상태 변경 시 확인
document.querySelectorAll('.dropdown-select').forEach(select => {
    select.addEventListener('change', function(e) {
        const statusNames = {
            'pending': '배송 준비중',
            'shipping': '배송중',
            'completed': '배송완료'
        };
        
        if (!confirm('배송 상태를 "' + statusNames[this.value] + '"(으)로 변경하시겠습니까?')) {
            e.preventDefault();
            // 원래 값으로 되돌리기
            this.value = this.defaultValue;
        }
    });
});
</script>