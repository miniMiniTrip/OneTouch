<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    // 통계 데이터 (실제로는 DAO에서 가져와야 함)
    request.setAttribute("totalSales", 12500000);
    request.setAttribute("newMembers", 342);
    request.setAttribute("orderCount", 1234);
    request.setAttribute("avgRating", 4.8);
%>

<!-- 대시보드 -->
<div class="stats-grid">
    <div class="stat-card">
        <div class="stat-label">총 매출</div>
        <div class="stat-value">
            <fmt:formatNumber value="${totalSales / 10000}" pattern="#,###"/>만원
        </div>
        <div class="stat-change">↑ 15.3% 전월 대비</div>
    </div>
    <div class="stat-card">
        <div class="stat-label">신규 회원</div>
        <div class="stat-value">${newMembers}명</div>
        <div class="stat-change">↑ 8.2% 전월 대비</div>
    </div>
    <div class="stat-card">
        <div class="stat-label">주문 건수</div>
        <div class="stat-value">
            <fmt:formatNumber value="${orderCount}" pattern="#,###"/>건
        </div>
        <div class="stat-change">↑ 12.5% 전월 대비</div>
    </div>
    <div class="stat-card">
        <div class="stat-label">평균 평점</div>
        <div class="stat-value">${avgRating}점</div>
        <div class="stat-change">↑ 0.2 전월 대비</div>
    </div>
</div>

<!-- 매출 차트 -->
<div class="chart-container">
    <h3 class="chart-title">📈 월별 매출 추이 (최근 6개월)</h3>
    <table class="sales-chart-table">
        <thead>
            <tr>
                <th>월</th>
                <th>매출</th>
                <th style="width: 60%;">그래프</th>
                <th>증감률</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><strong>8월</strong></td>
                <td>850만원</td>
                <td>
                    <div class="graph-bar-container">
                        <div class="graph-bar" style="width: 60%; background: linear-gradient(90deg, #5c6bc0 0%, #3949ab 100%);"></div>
                    </div>
                </td>
                <td><span class="change-rate">-</span></td>
            </tr>
            <tr>
                <td><strong>9월</strong></td>
                <td>980만원</td>
                <td>
                    <div class="graph-bar-container">
                        <div class="graph-bar" style="width: 70%; background: linear-gradient(90deg, #5c6bc0 0%, #3949ab 100%);"></div>
                    </div>
                </td>
                <td><span class="change-rate positive">↑ 15.3%</span></td>
            </tr>
            <tr>
                <td><strong>10월</strong></td>
                <td>1,050만원</td>
                <td>
                    <div class="graph-bar-container">
                        <div class="graph-bar" style="width: 75%; background: linear-gradient(90deg, #5c6bc0 0%, #3949ab 100%);"></div>
                    </div>
                </td>
                <td><span class="change-rate positive">↑ 7.1%</span></td>
            </tr>
            <tr>
                <td><strong>11월</strong></td>
                <td>1,190만원</td>
                <td>
                    <div class="graph-bar-container">
                        <div class="graph-bar" style="width: 85%; background: linear-gradient(90deg, #5c6bc0 0%, #3949ab 100%);"></div>
                    </div>
                </td>
                <td><span class="change-rate positive">↑ 13.3%</span></td>
            </tr>
            <tr>
                <td><strong>12월</strong></td>
                <td>1,260만원</td>
                <td>
                    <div class="graph-bar-container">
                        <div class="graph-bar" style="width: 90%; background: linear-gradient(90deg, #5c6bc0 0%, #3949ab 100%);"></div>
                    </div>
                </td>
                <td><span class="change-rate positive">↑ 5.9%</span></td>
            </tr>
            <tr class="highlight-row">
                <td><strong>1월</strong></td>
                <td><strong>1,400만원</strong></td>
                <td>
                    <div class="graph-bar-container">
                        <div class="graph-bar" style="width: 100%; background: linear-gradient(90deg, #1a237e 0%, #0d47a1 100%);"></div>
                    </div>
                </td>
                <td><span class="change-rate positive">↑ 11.1%</span></td>
            </tr>
        </tbody>
    </table>
</div>

<!-- 상품별 판매량 -->
<div class="section-card">
    <div class="section-header">
        <h2 class="section-title">🏆 상품별 판매량 순위</h2>
    </div>
    <table class="data-table">
        <thead>
            <tr>
                <th>순위</th>
                <th>상품명</th>
                <th>판매량</th>
                <th>매출</th>
                <th>평점</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><strong>1</strong></td>
                <td>히아루론산 수분 보습 세럼</td>
                <td>1,234개</td>
                <td>38,871,000원</td>
                <td>⭐ 4.8</td>
            </tr>
            <tr>
                <td><strong>2</strong></td>
                <td>비타민C 브라이트닝 세럼</td>
                <td>987개</td>
                <td>27,636,000원</td>
                <td>⭐ 4.7</td>
            </tr>
            <tr>
                <td><strong>3</strong></td>
                <td>레티놀 안티에이징 크림</td>
                <td>756개</td>
                <td>31,752,000원</td>
                <td>⭐ 4.9</td>
            </tr>
            <tr>
                <td><strong>4</strong></td>
                <td>나이아신아마이드 토너</td>
                <td>654개</td>
                <td>15,696,000원</td>
                <td>⭐ 4.6</td>
            </tr>
            <tr>
                <td><strong>5</strong></td>
                <td>세라마이드 장벽 크림</td>
                <td>543개</td>
                <td>18,961,500원</td>
                <td>⭐ 4.8</td>
            </tr>
        </tbody>
    </table>
</div>

<!-- 신규 유입 수 -->
<div class="chart-container">
    <h3 class="chart-title">📊 신규 유입 수 (최근 6개월)</h3>
    <table class="sales-chart-table">
        <thead>
            <tr>
                <th>월</th>
                <th>신규 회원</th>
                <th style="width: 60%;">그래프</th>
                <th>증감률</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><strong>8월</strong></td>
                <td>245명</td>
                <td>
                    <div class="graph-bar-container">
                        <div class="graph-bar" style="width: 72%; background: linear-gradient(90deg, #7e57c2 0%, #5e35b1 100%);"></div>
                    </div>
                </td>
                <td><span class="change-rate">-</span></td>
            </tr>
            <tr>
                <td><strong>9월</strong></td>
                <td>267명</td>
                <td>
                    <div class="graph-bar-container">
                        <div class="graph-bar" style="width: 78%; background: linear-gradient(90deg, #7e57c2 0%, #5e35b1 100%);"></div>
                    </div>
                </td>
                <td><span class="change-rate positive">↑ 9.0%</span></td>
            </tr>
            <tr>
                <td><strong>10월</strong></td>
                <td>289명</td>
                <td>
                    <div class="graph-bar-container">
                        <div class="graph-bar" style="width: 84%; background: linear-gradient(90deg, #7e57c2 0%, #5e35b1 100%);"></div>
                    </div>
                </td>
                <td><span class="change-rate positive">↑ 8.2%</span></td>
            </tr>
            <tr>
                <td><strong>11월</strong></td>
                <td>276명</td>
                <td>
                    <div class="graph-bar-container">
                        <div class="graph-bar" style="width: 81%; background: linear-gradient(90deg, #7e57c2 0%, #5e35b1 100%);"></div>
                    </div>
                </td>
                <td><span class="change-rate negative">↓ 4.5%</span></td>
            </tr>
            <tr>
                <td><strong>12월</strong></td>
                <td>318명</td>
                <td>
                    <div class="graph-bar-container">
                        <div class="graph-bar" style="width: 93%; background: linear-gradient(90deg, #7e57c2 0%, #5e35b1 100%);"></div>
                    </div>
                </td>
                <td><span class="change-rate positive">↑ 15.2%</span></td>
            </tr>
            <tr class="highlight-row">
                <td><strong>1월</strong></td>
                <td><strong>342명</strong></td>
                <td>
                    <div class="graph-bar-container">
                        <div class="graph-bar" style="width: 100%; background: linear-gradient(90deg, #673ab7 0%, #4527a0 100%);"></div>
                    </div>
                </td>
                <td><span class="change-rate positive">↑ 7.5%</span></td>
            </tr>
        </tbody>
    </table>
</div>