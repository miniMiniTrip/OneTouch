<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Q&A 작성 - OneTouch</title>
    <meta name="description" content="2030 남성 뷰티 쇼핑몰 OneTouch">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/images/favicon.svg">

    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/LineIcons.3.0.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/tiny-slider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/glightbox.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
    
    <style>
        .qna-section {
            padding: 60px 0;
            background-color: #f5f5f5;
        }
        
        .qna-container {
            display: flex;
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        
        .sidebar {
            width: 200px;
            background: #fafafa;
            border-right: 1px solid #e0e0e0;
            padding: 20px 0;
        }
        
        .sidebar-header {
            padding: 15px 20px;
            font-size: 16px;
            font-weight: 600;
            color: #333;
        }
        
        .sidebar-subtitle {
            padding: 5px 20px 15px;
            font-size: 12px;
            color: #999;
        }
        
        .menu-section {
            margin: 20px 0;
        }
        
        .menu-title {
            padding: 10px 20px;
            font-size: 13px;
            color: #666;
            font-weight: 600;
        }
        
        .menu-item {
            padding: 12px 20px;
            font-size: 14px;
            color: #333;
            cursor: pointer;
            transition: background 0.2s;
        }
        
        .menu-item:hover {
            background: #f0f0f0;
        }
        
        .menu-item.active {
            background: #e8eaf6;
            color: #5c6bc0;
            font-weight: 600;
            border-left: 3px solid #5c6bc0;
        }
        
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
            color: #5c6bc0;
            font-weight: 600;
        }
        
        .btn-list {
            background: #666;
            color: white;
            padding: 8px 20px;
            border: none;
            border-radius: 4px;
            font-size: 13px;
            cursor: pointer;
            transition: background 0.3s;
        }
        
        .btn-list:hover {
            background: #555;
        }
        
        .write-form {
            background: white;
        }
        
        .form-group {
            margin-bottom: 25px;
        }
        
        .form-label {
            display: block;
            font-size: 14px;
            font-weight: 600;
            color: #333;
            margin-bottom: 10px;
        }
        
        .form-label .required {
            color: #dc3545;
            margin-left: 3px;
        }
        
        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            font-family: 'Malgun Gothic', sans-serif;
            transition: border-color 0.3s;
        }
        
        .form-control:focus {
            outline: none;
            border-color: #5c6bc0;
        }
        
        .form-control.textarea {
            min-height: 200px;
            resize: vertical;
        }
        
        .form-select {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            background: white;
            cursor: pointer;
            transition: border-color 0.3s;
        }
        
        .form-select:focus {
            outline: none;
            border-color: #5c6bc0;
        }
        
        .product-search {
            display: flex;
            gap: 10px;
        }
        
        .product-search .form-control {
            flex: 1;
        }
        
        .btn-search {
            background: #5c6bc0;
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            cursor: pointer;
            transition: background 0.3s;
            white-space: nowrap;
        }
        
        .btn-search:hover {
            background: #4a5aaf;
        }
        
        .selected-product {
            margin-top: 15px;
            padding: 15px;
            background: #f8f9fa;
            border-radius: 6px;
            display: none;
        }
        
        .selected-product.show {
            display: flex;
            align-items: center;
            gap: 15px;
        }
        
        .product-image {
            width: 80px;
            height: 80px;
            background: #ddd;
            border-radius: 4px;
        }
        
        .product-info {
            flex: 1;
        }
        
        .product-name {
            font-size: 14px;
            font-weight: 600;
            color: #333;
            margin-bottom: 5px;
        }
        
        .product-price {
            font-size: 13px;
            color: #666;
        }
        
        .btn-remove {
            background: #dc3545;
            color: white;
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            font-size: 12px;
            cursor: pointer;
            transition: background 0.3s;
        }
        
        .btn-remove:hover {
            background: #c82333;
        }
        
        .form-notice {
            background: #fff3cd;
            border: 1px solid #ffc107;
            border-radius: 4px;
            padding: 15px;
            margin-bottom: 25px;
        }
        
        .form-notice-title {
            font-size: 14px;
            font-weight: 600;
            color: #856404;
            margin-bottom: 8px;
        }
        
        .form-notice-text {
            font-size: 13px;
            color: #856404;
            line-height: 1.6;
        }
        
        .btn-group {
            display: flex;
            gap: 10px;
            justify-content: center;
            margin-top: 30px;
            padding-top: 30px;
            border-top: 1px solid #e0e0e0;
        }
        
        .btn {
            padding: 12px 40px;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .btn-submit {
            background: #5c6bc0;
            color: white;
        }
        
        .btn-submit:hover {
            background: #4a5aaf;
        }
        
        .btn-cancel {
            background: #6c757d;
            color: white;
        }
        
        .btn-cancel:hover {
            background: #5a6268;
        }
        
        .char-count {
            text-align: right;
            font-size: 12px;
            color: #999;
            margin-top: 5px;
        }
    </style>
</head>

<body>
    <!-- Preloader -->
    <div class="preloader">
        <div class="preloader-inner">
            <div class="preloader-icon">
                <span></span>
                <span></span>
            </div>
        </div>
    </div>
    <!-- /End Preloader -->

    <!-- Start Header Area -->
    <c:import url="../common/header.jsp" />
    <!-- End Header Area -->

    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">Q&A 작성</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="${pageContext.request.contextPath}/"><i class="lni lni-home"></i> 홈</a></li>
                        <li>마이페이지</li>
                        <li>Q&A 작성</li>
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
                <div class="sidebar">
                    <div class="sidebar-header">마이페이지</div>
                    <div class="sidebar-subtitle">user01님 환영합니다</div>
                    
                    <div class="menu-section">
                        <div class="menu-item">📋 쇼핑</div>
                        <div class="menu-item">👤 정보/구니</div>
                        <div class="menu-item">💝 팀</div>
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
                
                <div class="content">
                    <div class="content-header">
                        <h2>✎ Q&A 작성하기</h2>
                        <button class="btn-list" onclick="location.href='${pageContext.request.contextPath}/qna/list'">목록으로</button>
                    </div>
                    
                    <div class="form-notice">
                        <div class="form-notice-title">📢 문의 전 확인해주세요</div>
                        <div class="form-notice-text">
                            • 상품에 대한 문의사항을 작성해주세요.<br>
                            • 답변은 영업일 기준 1~2일 내에 등록됩니다.<br>
                            • 욕설, 비방 등 부적절한 내용은 관리자에 의해 삭제될 수 있습니다.
                        </div>
                    </div>
                    
                    <form class="write-form" method="post" action="${pageContext.request.contextPath}/qna/write">
    <!-- 카테고리 -->
    <div class="form-group">
        <label class="form-label">문의 유형<span class="required">*</span></label>
        <select class="form-select" name="qna_category" required>
            <option value="">선택하세요</option>
            <option value="0">상품 문의</option>
            <option value="1">배송 문의</option>
            <option value="2">교환/반품</option>
            <option value="3">재입고 문의</option>
            <option value="4">기타</option>
        </select>
    </div>

    <!-- 제목 -->
    <div class="form-group">
        <label class="form-label">제목<span class="required">*</span></label>
        <input type="text" class="form-control" name="qna_title" placeholder="제목을 입력하세요" required maxlength="100">
    </div>

    <!-- 내용 -->
    <div class="form-group">
        <label class="form-label">문의 내용<span class="required">*</span></label>
        <textarea class="form-control textarea" name="qna_content"
                  placeholder="문의 내용을 작성해주세요" required maxlength="1000"
                  oninput="updateCharCount(this)"></textarea>
        <div class="char-count">
            <span id="charCount">0</span> / 1000
        </div>
    </div>

    <!-- 공개 여부 -->
    <div class="form-group">
        <label class="form-label">공개 여부</label>
        <select class="form-select" name="qna_private">
            <option value="false">공개</option>
            <option value="true" selected>비공개</option>
        </select>
    </div>

    <!-- 임시 회원번호 -->
    <input type="hidden" name="mem_idx" value="1">

    <div class="btn-group">
        <button type="submit" class="btn btn-submit">등록하기</button>
        <button type="button" class="btn btn-cancel" onclick="location.href='${pageContext.request.contextPath}/qna/list'">취소</button>
    </div>
</form>

                </div>
            </div>
        </div>
    </section>
    <!-- End Q&A Section -->

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top">
        <i class="lni lni-chevron-up"></i>
    </a>

    <!-- ========================= JS here ========================= -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/tiny-slider.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/glightbox.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
    
    <script>
        function updateCharCount(textarea) {
            const count = textarea.value.length;
            document.getElementById('charCount').textContent = count;
        }
        
        function searchProduct() {
            const searchValue = document.getElementById('productSearch').value;
            if(searchValue) {
                document.getElementById('productId').value = '1';
                document.getElementById('selectedProductName').textContent = '무선 블루투스 이어폰 Pro 3세대';
                document.getElementById('selectedProductPrice').textContent = '₩ 159,000';
                document.getElementById('selectedProduct').classList.add('show');
            } else {
                alert('상품명을 입력해주세요.');
            }
        }
        
        function removeProduct() {
            document.getElementById('productId').value = '';
            document.getElementById('productSearch').value = '';
            document.getElementById('selectedProduct').classList.remove('show');
        }
        
        function validateForm() {
            if(!document.getElementById('productId').value) {
                alert('상품을 선택해주세요.');
                return false;
            }
            return true;
        }
    </script>

    <!-- Start Footer Area -->
    <c:import url="../common/footer.jsp" />
    <!-- End Footer Area -->
</body>
</html>