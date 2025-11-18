<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Account Sidebar -->
<div class="sidebar">
	<div class="sidebar-header">마이페이지</div>
	<div class="sidebar-subtitle">user01님 환영합니다</div>
                    
	<div class="menu-section">
		<div class="menu-item">📋 쇼핑</div>
		<div class="menu-item">👤 장바구니</div>
		<div class="menu-item">💝 찜</div>
		<div class="menu-item">🎯 주문/배송 조회</div>
	</div>
                    
	<div class="menu-section">
		<div class="menu-title">나의 활동</div>
		<div class="menu-item active">💬 상품 Q&A</div>
	</div>
                    
	<div class="menu-section">
		<div class="menu-title">문의 정보</div>
		<div class="menu-item">👥 회원정보 수정</div>
		<div class="menu-item">🔒 배송지 관리</div>
		<div class="menu-item">📧 알림톡신청 관리</div>
	</div>
                    
	<div class="menu-section">
		<div class="menu-item">📝 로그아웃</div>
	</div>
</div>
<%-- <div class="account-sidebar">
    <div class="author-image">
        <img src="${pageContext.request.contextPath}/resources/assets/images/account/author.png" alt="#">
    </div>
    <div class="author-detail">
        <h5 class="name">${sessionScope.mem_name}님</h5>
        <p class="email">${sessionScope.mem_email}</p>
    </div>
    <ul class="sidebar-menu">
        <li>
            <a href="${pageContext.request.contextPath}/mypage/dashboard.do">
                <i class="lni lni-dashboard"></i> 대시보드
            </a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/order/list.do">
                <i class="lni lni-package"></i> 주문/배송 조회
            </a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/cart/list.do">
                <i class="lni lni-cart"></i> 장바구니
            </a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/wishlist/list.do">
                <i class="lni lni-heart"></i> 찜 목록
            </a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/mypage/profile.do">
                <i class="lni lni-user"></i> 회원정보 수정
            </a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/qna/my_list.do">
                <i class="lni lni-comments-reply"></i> 나의 문의
            </a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/member/logout.do">
                <i class="lni lni-exit"></i> 로그아웃
            </a>
        </li>
    </ul>
</div> --%>
<!-- End Account Sidebar -->