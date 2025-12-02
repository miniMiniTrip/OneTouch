<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>상품Q&A - OneTouch</title>
	<meta name="description" content="2030 남성 뷰티 쇼핑몰 OneTouch">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" type="image/x-icon"
		href="${pageContext.request.contextPath}/assets/images/favicon.svg">
	
	<!-- ========================= CSS here ========================= -->
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/assets/css/LineIcons.3.0.css">
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/assets/css/tiny-slider.css">
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/assets/css/glightbox.min.css">
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/assets/css/main.css">

	
	<style>
	.qna-section {
		padding: 0;
		background-color: #fff;
		min-height: calc(100vh - 400px);
	}
	
	.qna-container {
		display: flex;
		max-width: 100%;
		margin: 0;
		background: transparent;
		border-radius: 0;
		overflow: visible;
		box-shadow: none;
	}


/* 컨텐츠 부분.  */
.content {
	flex: 1;
	padding: 40px;
}

.content-header {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 30px;
	padding-bottom: 15px;
	border-bottom: 2px solid #5c6bc0;
}

.content-header h2 {
	font-size: 18px;
	color: #1A237E;
	font-weight: 600;
	margin: 0;
}

.empty-state {
	text-align: center;
	padding: 80px 20px;
}

.empty-state-message {
	color: #666;
	margin-bottom: 30px;
	font-size: 14px;
}

.btn-write {
	background: #1A237E;
	color: white;
	padding: 10px 24px;
	border: none;
	border-radius: 4px;
	font-size: 14px;
	cursor: pointer;
	display: inline-flex;
	align-items: center;
	justify-content: center;
	gap: 6px;
	transition: background 0.3s;
	white-space: nowrap;
	height: 40px;
}

.btn-write:hover {
	background: #4a5aaf;
	color: white;
}

.btn-write::before {
	content: '✎';
	font-size: 16px;
}

/* 게시판 테이블 스타일 */
.qna-table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

.qna-table thead {
	background: #f8f9fa;
	border-top: 2px solid #5c6bc0;
	border-bottom: 1px solid #dee2e6;
}

.qna-table th {
	padding: 15px 10px;
	font-size: 14px;
	font-weight: 600;
	color: #333;
	text-align: center;
}

.qna-table tbody tr {
	border-bottom: 1px solid #dee2e6;
	transition: background 0.2s;
}

.qna-table tbody tr:hover {
	background: #f8f9fa;
}

.qna-table td {
	padding: 15px 10px;
	font-size: 14px;
	color: #666;
	text-align: center;
}

.qna-table td.title {
	text-align: left;
	cursor: pointer;
}

.qna-table td.title:hover {
	color: #5c6bc0;
	text-decoration: underline;
}

.status-badge {
	display: inline-block;
	padding: 4px 12px;
	border-radius: 12px;
	font-size: 12px;
	font-weight: 600;
}

.status-waiting {
	background: #fff3e0;
	color: #f57c00;
}

.status-completed {
	background: #e8f5e9;
	color: #388e3c;
}

.qna-table td.title {
	text-align: center; /* 중앙 정렬 */
	vertical-align: middle; /* 세로 중앙 정렬 */
}







	/* 반응형 추가 */
	
	
	/* ========================= 반응형 ========================= */

/* 태블릿 (max 992px) */
@media (max-width: 992px) {
    /* 전체 레이아웃 세로 배치 */
    .qna-container {
        flex-direction: column;
        align-items: center;
    }

    /* 사이드바 너비 전체 */
    .sidebar {
        width: 100% !important;
        position: relative !important;
        margin-bottom: 20px;
    }

    /* 컨텐츠 */
    .content {
        width: 100% !important;
        padding: 20px !important;
    }

    /* 글쓰기 버튼 중앙 */
    .btn-write {
        display: inline-flex !important;
        justify-content: center !important;
        margin: 0 auto 20px auto !important;
        width: 40% !important;
        min-width: 120px;
    }

    /* 테이블 중앙 맞춤 */
    .qna-table {
        font-size: 13px !important;
    }
}

/* 모바일 (max 768px) */
@media (max-width: 768px) {
    .btn-write {
        width: 50% !important;
        min-width: 100px !important;
        font-size: 13px !important;
        padding: 8px 15px !important;
    }

    .qna-table th,
    .qna-table td {
        padding: 10px 5px !important;
        font-size: 12px !important;
    }
}

/* 작은 모바일 (max 480px) */
@media (max-width: 480px) {
    .content-header h2 {
        font-size: 16px !important;
    }

    .btn-write {
        width: 70% !important;
        min-width: 80px !important;
        font-size: 12px !important;
        padding: 6px 10px !important;
    }

    .qna-table th,
    .qna-table td {
        font-size: 11px !important;
        padding: 8px 5px !important;
    }
}
</style>

</head>

<body>



	<!-- Preloader -->
	<div class="preloader">
		<div class="preloader-inner">
			<div class="preloader-icon">
				<span></span> <span></span>
			</div>
		</div>
	</div>
	<!-- /End Preloader -->

	<!-- 헤더부분-->

	<c:import url="../common/header.jsp" />
	<!-- End Header Area -->

	<!-- Start Breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6 col-md-6 col-12">
					<div class="breadcrumbs-content">
						<h1 class="page-title">상품 Q&A</h1>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-12">
					<ul class="breadcrumb-nav">
						<li><a href="${pageContext.request.contextPath}/"><i
								class="lni lni-home"></i> 홈</a></li>
						<li>마이페이지</li>
						<li>상품 Q&A</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- End Breadcrumbs -->

	<!-- Start Q&A Section -->
	<section class="qna-section">
		<div class="container">
			<div class="qna-container">
				<!-- <div class="sidebar">
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
                </div> -->


				<!-- 사이드바 인크루드 -->
				<%@include file="/WEB-INF/views/common/mypage_side_bar.jsp"%>
				<div class="content">
					<div class="content-header">
						<h2>💬 상품 Q&A</h2>

						<!-- 로그인한 사용자만 Q&A 쓰기 버튼 표시 -->
						<!-- 로그인 여부에 따라 버튼 하나만 출력 -->

						<!-- 글이 있을 때만 버튼 표시 -->
						<c:if test="${not empty qna_list}">
							<button class="btn-write"
								onclick="location.href='${pageContext.request.contextPath}/mypage/qna_write'">
								Q&A 쓰기</button>
						</c:if>
					</div>

					<!-- 글이 있는 경우 -->
					<c:if test="${not empty qna_list}">
						<table class="qna-table">
							<thead>
								<tr>
									<th style="width: 80px;">번호</th>
									<th>제목</th>
									<th style="width: 100px;">작성자</th>
									<th style="width: 120px;">작성일</th>
									<th style="width: 100px;">답변상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="qna" items="${qna_list}" varStatus="status">
									<tr>
										<td>${qna.qna_idx}</td>


										<!-- 상세보기로 가는 버튼 -->
										<td class="title"><a
											href="${pageContext.request.contextPath}/mypage/detail?qna_idx=${qna.qna_idx}">${qna.qna_title}</a>
										</td>

										<!-- 멤버id -->
										<td>${qna.mem_name}</td>

										<!-- 답변시간 -->
										<td>
    										<fmt:formatDate value="${qna.qna_time}" pattern="yyyy-MM-dd HH:mm"/>
										</td>


										<!-- 답변완료 / 대기상태 -->

										<!-- ------------------------------------------------------------------------ -------------->
										<td><c:choose>
												<c:when test="${qna.qna_answered}">
													<span class="status-badge status-completed">답변완료</span>
												</c:when>

												<c:otherwise>
													<span class="status-badge status-waiting">답변대기</span>
												</c:otherwise>
											</c:choose></td>
										<!-- ------------------------------------------------------------------------ -------------->

									</tr>
								</c:forEach>
							</tbody>
						</table>


					</c:if>

					<!-- 글이 없는 경우 -->
					<c:if test="${empty qna_list}">
						<div class="empty-state">
							<div class="empty-state-message">작성하신 상품 문의 내역을 확인하실 수
								있습니다.</div>
							<button class="btn-write"
								onclick="location.href='${pageContext.request.contextPath}/mypage/qna_write'">
								Q&A 쓰기</button>

						</div>
					</c:if>

				</div>
			</div>
		</div>
	</section>
	<!-- End Q&A Section -->
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
	<!-- ========================= scroll-top ========================= -->
	<a href="#" class="scroll-top"> <i class="lni lni-chevron-up"></i>
	</a>



	<!-- ========================= JS here ========================= -->
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/tiny-slider.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/glightbox.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>


	<script type="text/javascript">
    
    // 프리로더 제거
    window.addEventListener('load', function() {
        const preloader = document.querySelector('.preloader');
        if (preloader) {
            preloader.style.opacity = '0';
            setTimeout(() => preloader.style.display = 'none', 500);
        }
    });
    
    </script>

</body>
</html>