<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>OneTouch - 주문관리</title>
    <style>
        /* OneTouch 격리된 스타일 시트 - ot- 접두사 사용 */
        .ot-container *, .ot-container *::before, .ot-container *::after {
            margin: 0 !important;
            padding: 0 !important;
            box-sizing: border-box !important;
            font-family: 'Apple SD Gothic Neo', 'Noto Sans KR', sans-serif !important;
            line-height: 1.6 !important;
        }
        
        .ot-container {
            background-color: #f5f7fb !important;
            color: #333 !important;
            width: 100% !important;
            min-height: 100vh !important;
            position: relative !important;
            z-index: 1 !important;
        }
        
        .ot-container a {
            text-decoration: none !important;
            color: inherit !important;
            transition: color 0.2s !important;
        }
        
        .ot-container ul, .ot-container li {
            list-style: none !important;
            margin: 0 !important;
            padding: 0 !important;
        }
        
        /* 헤더 스타일 */
        .ot-header {
            background-color: #fff !important;
            border-bottom: 1px solid #e8e9ec !important;
            padding: 15px 0 !important;
            width: 100% !important;
            position: relative !important;
            z-index: 10 !important;
        }
        
        .ot-header-container {
            max-width: 1200px !important;
            margin: 0 auto !important;
            display: flex !important;
            justify-content: space-between !important;
            align-items: center !important;
            padding: 0 20px !important;
        }
        
        .ot-logo {
            display: flex !important;
            align-items: center !important;
        }
        
        .ot-logo-text {
            font-size: 24px !important;
            font-weight: bold !important;
            color: #3f51b5 !important;
        }
        
        .ot-admin-badge {
            display: inline-block !important;
            background-color: #e53935 !important;
            color: white !important;
            font-size: 12px !important;
            padding: 3px 10px !important;
            border-radius: 4px !important;
            margin-left: 10px !important;
        }
        
        .ot-user-menu {
            display: flex !important;
            align-items: center !important;
        }
        
        .ot-user-menu-item {
            margin-left: 20px !important;
            font-size: 14px !important;
            color: #666 !important;
            cursor: pointer !important;
        }
        
        .ot-user-menu-item:hover {
            color: #3f51b5 !important;
        }
        
        /* 메인 컨테이너 */
        .ot-main-container {
            display: flex !important;
            max-width: 1200px !important;
            margin: 20px auto !important;
            min-height: calc(100vh - 80px) !important;
            padding: 0 20px !important;
        }
        
        /* 사이드바 스타일 */
        .ot-sidebar {
            width: 220px !important;
            background-color: #fff !important;
            border-radius: 8px !important;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05) !important;
            padding: 20px 0 !important;
            margin-right: 20px !important;
            flex-shrink: 0 !important;
            overflow: hidden !important;
        }
        
        .ot-sidebar-section {
            margin-bottom: 25px !important;
        }
        
        .ot-sidebar-title {
            font-size: 15px !important;
            color: #757575 !important;
            padding: 0 20px !important;
            margin-bottom: 10px !important;
            font-weight: normal !important;
        }
        
        .ot-sidebar-menu {
            padding: 0 !important;
            margin: 0 !important;
        }
        
        .ot-sidebar-menu-item {
            padding: 10px 20px !important;
            font-size: 14px !important;
            display: flex !important;
            align-items: center !important;
            color: #666 !important;
            cursor: pointer !important;
            border-left: 3px solid transparent !important;
            transition: all 0.2s !important;
        }
        
        .ot-sidebar-menu-item.ot-active {
            color: #3f51b5 !important;
            background-color: #f0f2ff !important;
            border-left-color: #3f51b5 !important;
        }
        
        .ot-sidebar-menu-item:hover {
            background-color: #f8f9ff !important;
            color: #3f51b5 !important;
        }
        
        .ot-sidebar-menu-item .ot-emoji {
            margin-right: 10px !important;
            width: 20px !important;
            text-align: center !important;
            font-size: 18px !important;
        }
        
        /* 메인 컨텐츠 스타일 */
        .ot-content {
            flex: 1 !important;
            background-color: #fff !important;
            border-radius: 8px !important;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05) !important;
            padding: 20px !important;
            overflow: hidden !important;
        }
        
        .ot-content-header {
            display: flex !important;
            align-items: center !important;
            margin-bottom: 20px !important;
            border-bottom: 1px solid #f0f0f0 !important;
            padding-bottom: 15px !important;
        }
        
        .ot-content-title {
            font-size: 20px !important;
            font-weight: bold !important;
            color: #333 !important;
            display: flex !important;
            align-items: center !important;
        }
        
        .ot-content-title .ot-emoji {
            margin-right: 10px !important;
            color: #333 !important;
            font-size: 22px !important;
        }
        
        /* 검색 필터 스타일 */
        .ot-search-filter {
            display: flex !important;
            margin-bottom: 20px !important;
            align-items: center !important;
            flex-wrap: wrap !important;
        }
        
        .ot-search-input {
            flex: 1 !important;
            padding: 10px 15px !important;
            border: 1px solid #ddd !important;
            border-radius: 4px !important;
            font-size: 14px !important;
            min-width: 200px !important;
            margin-right: 10px !important;
            margin-bottom: 10px !important;
            font-family: 'Apple SD Gothic Neo', 'Noto Sans KR', sans-serif !important;
        }
        
        .ot-search-input:focus {
            border-color: #3f51b5 !important;
            outline: none !important;
            box-shadow: 0 0 0 2px rgba(63, 81, 181, 0.2) !important;
        }
        
        /* 플레이스홀더 스타일 모든 브라우저 지원 */
        .ot-search-input::-webkit-input-placeholder {
            color: #999 !important;
            font-family: 'Apple SD Gothic Neo', 'Noto Sans KR', sans-serif !important;
        }
        .ot-search-input:-moz-placeholder {
            color: #999 !important;
            font-family: 'Apple SD Gothic Neo', 'Noto Sans KR', sans-serif !important;
        }
        .ot-search-input::-moz-placeholder {
            color: #999 !important;
            font-family: 'Apple SD Gothic Neo', 'Noto Sans KR', sans-serif !important;
        }
        .ot-search-input:-ms-input-placeholder {
            color: #999 !important;
            font-family: 'Apple SD Gothic Neo', 'Noto Sans KR', sans-serif !important;
        }
        
        .ot-search-select {
            padding: 10px !important;
            border: 1px solid #ddd !important;
            border-radius: 4px !important;
            font-size: 14px !important;
            min-width: 120px !important;
            margin-right: 10px !important;
            margin-bottom: 10px !important;
            background-color: #fff !important;
            font-family: 'Apple SD Gothic Neo', 'Noto Sans KR', sans-serif !important;
        }
        
        .ot-search-select:focus {
            border-color: #3f51b5 !important;
            outline: none !important;
            box-shadow: 0 0 0 2px rgba(63, 81, 181, 0.2) !important;
        }
        
        .ot-search-btn {
            padding: 10px 20px !important;
            background-color: #1a237e !important;
            color: #fff !important;
            border: none !important;
            border-radius: 4px !important;
            font-size: 14px !important;
            cursor: pointer !important;
            margin-bottom: 10px !important;
            font-family: 'Apple SD Gothic Neo', 'Noto Sans KR', sans-serif !important;
            transition: background-color 0.2s !important;
        }
        
        .ot-search-btn:hover {
            background-color: #3f51b5 !important;
        }
        
        /* 주문 테이블 스타일 */
        .ot-table-container {
            width: 100% !important;
            overflow-x: auto !important;
            margin-bottom: 20px !important;
        }
        
        .ot-order-table {
            width: 100% !important;
            border-collapse: collapse !important;
            margin: 0 !important;
            padding: 0 !important;
        }
        
        .ot-order-table th {
            padding: 12px 10px !important;
            background-color: #f5f7fb !important;
            color: #333 !important;
            font-weight: 500 !important;
            text-align: left !important;
            border-top: 1px solid #eee !important;
            border-bottom: 1px solid #eee !important;
            font-size: 14px !important;
            position: sticky !important;
            top: 0 !important;
            z-index: 1 !important;
        }
        
        .ot-order-table td {
            padding: 12px 10px !important;
            border-bottom: 1px solid #eee !important;
            font-size: 14px !important;
            color: #333 !important;
            vertical-align: middle !important;
        }
        
        .ot-order-table tr {
            transition: background-color 0.2s !important;
            cursor: pointer !important;
        }
        
        .ot-order-table tr:hover {
            background-color: #f8f9ff !important;
        }
        
        .ot-order-id {
            color: #3f51b5 !important;
            font-weight: 500 !important;
        }
        
        .ot-order-price {
            text-align: right !important;
            font-weight: 500 !important;
            color: #1a237e !important;
        }
        
        .ot-order-date {
            color: #666 !important;
        }
        
        /* 배송 상태 셀렉트 박스 */
        .ot-delivery-select {
            padding: 6px !important;
            border: 1px solid #ddd !important;
            border-radius: 4px !important;
            font-size: 13px !important;
            width: 100% !important;
            cursor: pointer !important;
            font-family: 'Apple SD Gothic Neo', 'Noto Sans KR', sans-serif !important;
            background-color: #fff !important;
        }
        
        .ot-delivery-select:focus {
            border-color: #3f51b5 !important;
            outline: none !important;
        }
        
        .ot-customer-avatar {
            width: 24px !important;
            height: 24px !important;
            border-radius: 50% !important;
            margin-right: 8px !important;
            vertical-align: middle !important;
        }
        
        /* 주문 상세 모달 스타일 */
        .ot-modal-backdrop {
            position: fixed !important;
            top: 0 !important;
            left: 0 !important;
            right: 0 !important;
            bottom: 0 !important;
            background-color: rgba(0, 0, 0, 0.5) !important;
            display: none !important;
            justify-content: center !important;
            align-items: center !important;
            z-index: 1000 !important;
        }
        
        .ot-modal {
            background-color: #fff !important;
            border-radius: 8px !important;
            width: 700px !important;
            max-width: 90% !important;
            max-height: 90vh !important;
            overflow-y: auto !important;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15) !important;
            position: relative !important;
        }
        
        .ot-modal-header {
            padding: 15px 20px !important;
            border-bottom: 1px solid #eee !important;
            display: flex !important;
            justify-content: space-between !important;
            align-items: center !important;
            position: sticky !important;
            top: 0 !important;
            background-color: #fff !important;
            z-index: 2 !important;
        }
        
        .ot-modal-title {
            font-size: 18px !important;
            font-weight: bold !important;
            color: #333 !important;
        }
        
        .ot-modal-close {
            font-size: 22px !important;
            color: #999 !important;
            background: none !important;
            border: none !important;
            cursor: pointer !important;
            padding: 0 !important;
            line-height: 1 !important;
        }
        
        .ot-modal-close:hover {
            color: #333 !important;
        }
        
        .ot-modal-body {
            padding: 20px !important;
        }
        
        .ot-order-details {
            margin-bottom: 30px !important;
        }
        
        .ot-detail-section {
            margin-bottom: 20px !important;
        }
        
        .ot-section-title {
            font-size: 16px !important;
            font-weight: 500 !important;
            margin-bottom: 10px !important;
            color: #333 !important;
            border-bottom: 1px solid #eee !important;
            padding-bottom: 10px !important;
        }
        
        .ot-info-grid {
            display: grid !important;
            grid-template-columns: repeat(2, 1fr) !important;
            gap: 15px !important;
        }
        
        .ot-info-item {
            display: flex !important;
            flex-direction: column !important;
        }
        
        .ot-info-label {
            font-size: 13px !important;
            color: #666 !important;
            margin-bottom: 5px !important;
        }
        
        .ot-info-value {
            font-size: 14px !important;
            color: #333 !important;
            word-break: break-all !important;
        }
        
        .ot-products-list {
            width: 100% !important;
            border-collapse: collapse !important;
            margin-top: 10px !important;
        }
        
        .ot-products-list th {
            padding: 10px !important;
            background-color: #f5f7fb !important;
            color: #333 !important;
            font-weight: 500 !important;
            text-align: left !important;
            font-size: 13px !important;
            border-bottom: 1px solid #eee !important;
        }
        
        .ot-products-list td {
            padding: 10px !important;
            border-bottom: 1px solid #eee !important;
            font-size: 13px !important;
        }
        
        .ot-modal-footer {
            padding: 15px 20px !important;
            border-top: 1px solid #eee !important;
            display: flex !important;
            justify-content: flex-end !important;
            position: sticky !important;
            bottom: 0 !important;
            background-color: #fff !important;
            z-index: 2 !important;
        }
        
        .ot-modal-btn {
            padding: 8px 16px !important;
            margin-left: 10px !important;
            border: none !important;
            border-radius: 4px !important;
            font-size: 14px !important;
            cursor: pointer !important;
            font-family: 'Apple SD Gothic Neo', 'Noto Sans KR', sans-serif !important;
            transition: background-color 0.2s !important;
        }
        
        .ot-modal-btn-secondary {
            background-color: #f1f1f1 !important;
            color: #333 !important;
        }
        
        .ot-modal-btn-secondary:hover {
            background-color: #e5e5e5 !important;
        }
        
        .ot-modal-btn-primary {
            background-color: #3f51b5 !important;
            color: #fff !important;
        }
        
        .ot-modal-btn-primary:hover {
            background-color: #1a237e !important;
        }
        
        /* 반응형 스타일 */
        @media (max-width: 992px) {
            .ot-main-container {
                flex-direction: column !important;
            }
            
            .ot-sidebar {
                width: 100% !important;
                margin-right: 0 !important;
                margin-bottom: 20px !important;
            }
            
            .ot-search-filter {
                flex-wrap: wrap !important;
            }
            
            .ot-search-input {
                width: 100% !important;
                margin-right: 0 !important;
            }
            
            .ot-info-grid {
                grid-template-columns: 1fr !important;
            }
        }
        
        @media (max-width: 768px) {
            .ot-modal {
                width: 95% !important;
                max-height: 85vh !important;
            }
            
            .ot-header-container {
                padding: 0 15px !important;
            }
            
            .ot-logo-text {
                font-size: 20px !important;
            }
            
            .ot-admin-badge {
                font-size: 10px !important;
                padding: 2px 8px !important;
            }
            
            .ot-user-menu-item {
                margin-left: 15px !important;
                font-size: 13px !important;
            }
            
            .ot-content {
                padding: 15px !important;
            }
            
            .ot-content-title {
                font-size: 18px !important;
            }
        }
        
        @media (max-width: 576px) {
            .ot-main-container {
                padding: 0 10px !important;
                margin: 10px auto !important;
            }
            
            .ot-content-header {
                margin-bottom: 15px !important;
            }
            
            .ot-user-menu-item:first-child {
                display: none !important;
            }
            
            .ot-modal-body {
                padding: 15px !important;
            }
            
            .ot-modal-footer {
                padding: 10px 15px !important;
            }
        }
    </style>
</head>
<body>

<div class="ot-container">
    <%@include file="/WEB-INF/views/common/header.jsp" %>
    <header class="ot-header">
        <div class="ot-header-container">
            <div class="ot-logo">
                <a href="#" class="ot-logo-text">OneTouch</a>
                <span class="ot-admin-badge">관리자</span>
            </div>
            <div class="ot-user-menu">
                <a href="#" class="ot-user-menu-item">관리자님</a>
                <a href="#" class="ot-user-menu-item">로그아웃</a>
            </div>
        </div>
    </header>
    
    <div class="ot-main-container">
        <div class="ot-sidebar">
            <div class="ot-sidebar-section">
                <h3 class="ot-sidebar-title">대시보드</h3>
                <ul class="ot-sidebar-menu">
                    <li class="ot-sidebar-menu-item">
                        <span class="ot-emoji">📊</span> 대시보드
                    </li>
                    <li class="ot-sidebar-menu-item">
                        <span class="ot-emoji">📈</span> 통계 대시보드
                    </li>
                </ul>
            </div>
            
            <div class="ot-sidebar-section">
                <h3 class="ot-sidebar-title">관리</h3>
                <ul class="ot-sidebar-menu">
                    <li class="ot-sidebar-menu-item">
                        <span class="ot-emoji">👥</span> 회원관리
                    </li>
                    <li class="ot-sidebar-menu-item">
                        <span class="ot-emoji">💰</span> 상품관리
                    </li>
                    <li class="ot-sidebar-menu-item ">
                        <span class="ot-emoji">📦</span> 재고관리
                    </li>
                    <li class="ot-sidebar-menu-item ot-active">
                        <span class="ot-emoji">🚚</span> 주문관리
                    </li>
                </ul>
            </div>
            
            <div class="ot-sidebar-section">
                <h3 class="ot-sidebar-title">시스템</h3>
                <ul class="ot-sidebar-menu">
                    <li class="ot-sidebar-menu-item">
                        <span class="ot-emoji">🔧</span> 게시판 관리
                    </li>
                </ul>
            </div>
        </div>
        
        <div class="ot-content">
            <div class="ot-content-header">
                <h2 class="ot-content-title">
                    <span class="ot-emoji">🚚</span> 주문관리
                </h2>
            </div>
            
            <div class="ot-search-filter">
                <input type="text" class="ot-search-input" placeholder="주문번호, 주문자명으로 검색">
                <select class="ot-search-select">
                    <option value="">전체 상태</option>
                    <option value="pending">배송 준비중</option>
                    <option value="shipping">배송중</option>
                    <option value="completed">배송완료</option>
                </select>
                <button class="ot-search-btn">검색</button>
            </div>
            
            <div class="ot-table-container">
                <table class="ot-order-table">
                    <thead>
                        <tr>
                            <th>주문번호</th>
                            <th>주문자</th>
                            <th>상품명</th>
                            <th>전화번호</th>
                            <th>주소</th>
                            <th>금액</th>
                            <th>주문일</th>
                            <th>배송상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="ot-order-id">ORDER_001</td>
                            <td>김철수</td>
                            <td>히어로쿠션 세럼</td>
                            <td>010-1234-5678</td>
                            <td>서울시 강남구 테헤란로 123</td>
                            <td class="ot-order-price">63,000원</td>
                            <td class="ot-order-date">2025-01-15</td>
                            <td>
                                <select class="ot-delivery-select">
                                    <option value="preparing" selected>배송 준비중</option>
                                    <option value="shipping">배송중</option>
                                    <option value="completed">배송완료</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="ot-order-id">ORDER_002</td>
                            <td>이영희</td>
                            <td>비타민C 세럼</td>
                            <td>010-9876-5432</td>
                            <td>경기도 성남시 분당구 판교로 456</td>
                            <td class="ot-order-price">28,000원</td>
                            <td class="ot-order-date">2025-01-14</td>
                            <td>
                                <select class="ot-delivery-select">
                                    <option value="preparing">배송 준비중</option>
                                    <option value="shipping" selected>배송중</option>
                                    <option value="completed">배송완료</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="ot-order-id">ORDER_003</td>
                            <td>박민수</td>
                            <td>레티놀 크림</td>
                            <td>010-2222-3333</td>
                            <td>부산시 해운대구 해운대로 789</td>
                            <td class="ot-order-price">42,000원</td>
                            <td class="ot-order-date">2025-01-13</td>
                            <td>
                                <select class="ot-delivery-select">
                                    <option value="preparing">배송 준비중</option>
                                    <option value="shipping">배송중</option>
                                    <option value="completed" selected>배송완료</option>
                                </select>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    
    <!-- 주문 상세 모달 -->
    <div class="ot-modal-backdrop" id="orderDetailModal">
        <div class="ot-modal">
            <div class="ot-modal-header">
                <h3 class="ot-modal-title">주문 상세 정보</h3>
                <button class="ot-modal-close" onclick="closeOrderDetail()">&times;</button>
            </div>
            <div class="ot-modal-body">
                <div class="ot-order-details">
                    <div class="ot-detail-section">
                        <h4 class="ot-section-title">주문 정보</h4>
                        <div class="ot-info-grid">
                            <div class="ot-info-item">
                                <span class="ot-info-label">주문번호</span>
                                <span class="ot-info-value" id="modal-order-id">ORDER_001</span>
                            </div>
                            <div class="ot-info-item">
                                <span class="ot-info-label">주문일시</span>
                                <span class="ot-info-value" id="modal-order-date">2025-01-15 14:30:22</span>
                            </div>
                            <div class="ot-info-item">
                                <span class="ot-info-label">결제방법</span>
                                <span class="ot-info-value" id="modal-payment-method">카드결제</span>
                            </div>
                            <div class="ot-info-item">
                                <span class="ot-info-label">주문상태</span>
                                <span class="ot-info-value" id="modal-order-status">배송 준비중</span>
                            </div>
                        </div>
                    </div>
                    
                    <div class="ot-detail-section">
                        <h4 class="ot-section-title">고객 정보</h4>
                        <div class="ot-info-grid">
                            <div class="ot-info-item">
                                <span class="ot-info-label">주문자</span>
                                <span class="ot-info-value" id="modal-customer-name">김철수</span>
                            </div>
                            <div class="ot-info-item">
                                <span class="ot-info-label">이메일</span>
                                <span class="ot-info-value" id="modal-customer-email">customer@example.com</span>
                            </div>
                            <div class="ot-info-item">
                                <span class="ot-info-label">전화번호</span>
                                <span class="ot-info-value" id="modal-customer-phone">010-1234-5678</span>
                            </div>
                            <div class="ot-info-item">
                                <span class="ot-info-label">회원 등급</span>
                                <span class="ot-info-value" id="modal-customer-level">일반회원</span>
                            </div>
                        </div>
                    </div>
                    
                    <div class="ot-detail-section">
                        <h4 class="ot-section-title">배송 정보</h4>
                        <div class="ot-info-grid">
                            <div class="ot-info-item">
                                <span class="ot-info-label">받는 사람</span>
                                <span class="ot-info-value" id="modal-recipient">김철수</span>
                            </div>
                            <div class="ot-info-item">
                                <span class="ot-info-label">연락처</span>
                                <span class="ot-info-value" id="modal-recipient-phone">010-1234-5678</span>
                            </div>
                            <div class="ot-info-item">
                                <span class="ot-info-label">주소</span>
                                <span class="ot-info-value" id="modal-address">서울시 강남구 테헤란로 123</span>
                            </div>
                            <div class="ot-info-item">
                                <span class="ot-info-label">배송 메모</span>
                                <span class="ot-info-value" id="modal-delivery-memo">부재시 경비실에 맡겨주세요.</span>
                            </div>
                        </div>
                    </div>
                    
                    <div class="ot-detail-section">
                        <h4 class="ot-section-title">주문 상품</h4>
                        <table class="ot-products-list">
                            <thead>
                                <tr>
                                    <th>상품명</th>
                                    <th>옵션</th>
                                    <th>수량</th>
                                    <th>가격</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>히어로쿠션 세럼</td>
                                    <td>기본</td>
                                    <td>1개</td>
                                    <td>63,000원</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    
                    <div class="ot-detail-section">
                        <h4 class="ot-section-title">결제 정보</h4>
                        <div class="ot-info-grid">
                            <div class="ot-info-item">
                                <span class="ot-info-label">상품 금액</span>
                                <span class="ot-info-value" id="modal-product-price">63,000원</span>
                            </div>
                            <div class="ot-info-item">
                                <span class="ot-info-label">배송비</span>
                                <span class="ot-info-value" id="modal-shipping-fee">0원</span>
                            </div>
                            <div class="ot-info-item">
                                <span class="ot-info-label">할인 금액</span>
                                <span class="ot-info-value" id="modal-discount">0원</span>
                            </div>
                            <div class="ot-info-item">
                                <span class="ot-info-label">총 결제 금액</span>
                                <span class="ot-info-value" id="modal-total-price">63,000원</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="ot-modal-footer">
                <button class="ot-modal-btn ot-modal-btn-secondary" onclick="closeOrderDetail()">닫기</button>
                <button class="ot-modal-btn ot-modal-btn-primary">상태 변경</button>
            </div>
        </div>
    </div>
</div>
    
    <script>
        // 주문 상세 모달 열기
        function openOrderDetail(orderId) {
            // 실제 구현에서는 서버에서 해당 주문 정보를 가져와 모달에 표시
            document.getElementById('orderDetailModal').style.display = 'flex';
            
            // 예시: 주문 ID에 따라 모달 내용 변경
            document.getElementById('modal-order-id').textContent = orderId;
        }
        
        // 주문 상세 모달 닫기
        function closeOrderDetail() {
            document.getElementById('orderDetailModal').style.display = 'none';
        }
        
        // 주문 행 클릭 시 상세 모달 열기
        document.addEventListener('DOMContentLoaded', function() {
            const orderRows = document.querySelectorAll('.ot-order-table tbody tr');
            
            orderRows.forEach(function(row) {
                row.addEventListener('click', function(event) {
                    // 배송 상태 셀렉트 박스 클릭 시 이벤트 전파 중지
                    if (event.target.tagName === 'SELECT' || event.target.tagName === 'OPTION') {
                        event.stopPropagation();
                        return;
                    }
                    
                    const orderId = this.querySelector('.ot-order-id').textContent;
                    openOrderDetail(orderId);
                });
            });
            
            // 모달 외부 클릭 시 닫기
            const modal = document.getElementById('orderDetailModal');
            modal.addEventListener('click', function(event) {
                if (event.target === this) {
                    closeOrderDetail();
                }
            });
        });
        
        // 좌측메뉴 클릭시 active여부
        document.addEventListener("DOMContentLoaded", () => {
          // 모든 메뉴 항목 선택
          const menuItems = document.querySelectorAll(".ot-sidebar-menu-item");
        
          menuItems.forEach(item => {
            item.addEventListener("click", () => {
              // 모든 항목에서 active 제거
              menuItems.forEach(i => i.classList.remove("ot-active"));
              // 클릭한 항목에 active 추가
              item.classList.add("ot-active");
            });
          });
        });
    </script>
</body>
</html>