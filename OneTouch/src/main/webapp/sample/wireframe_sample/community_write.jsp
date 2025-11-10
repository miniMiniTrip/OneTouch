<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OneTouch - 게시글 작성</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- Custom CSS -->
    <style>
        :root {
            --primary-color: #4263eb;
            --light-gray: #f8f9fa;
            --border-color: #e9ecef;
            --text-color: #343a40;
        }
        
        body {
            font-family: 'Noto Sans KR', sans-serif;
            color: var(--text-color);
            background-color: #f9f9f9;
            padding-top: 30px;
            padding-bottom: 50px;
        }
        
        .logo {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .logo a {
            color: var(--primary-color);
            font-size: 2rem;
            font-weight: 700;
            text-decoration: none;
        }
        
        .form-container {
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            padding: 30px;
        }
        
        .section-title {
            font-size: 1.1rem;
            font-weight: 600;
            margin-bottom: 15px;
        }
        
        .form-label {
            font-weight: 500;
            color: #495057;
        }
        
        .form-control {
            border-color: var(--border-color);
            padding: 10px 15px;
        }
        
        .form-control:focus {
            box-shadow: 0 0 0 3px rgba(66, 99, 235, 0.1);
            border-color: var(--primary-color);
        }
        
        .form-select {
            border-color: var(--border-color);
            padding: 10px 15px;
        }
        
        .form-select:focus {
            box-shadow: 0 0 0 3px rgba(66, 99, 235, 0.1);
            border-color: var(--primary-color);
        }
        
        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
            padding: 8px 24px;
            font-weight: 500;
        }
        
        .btn-primary:hover {
            background-color: #364fc7;
            border-color: #364fc7;
        }
        
        .btn-secondary {
            background-color: #adb5bd;
            border-color: #adb5bd;
            padding: 8px 24px;
            font-weight: 500;
        }
        
        .btn-secondary:hover {
            background-color: #868e96;
            border-color: #868e96;
        }
        
        textarea {
            min-height: 200px;
            resize: vertical;
        }
        
        .rating {
            display: inline-block;
            direction: rtl;
            unicode-bidi: bidi-override;
        }
        
        .rating input {
            display: none;
        }
        
        .rating label {
            display: inline-block;
            padding: 0;
            cursor: pointer;
            color: #dadada;
            font-size: 2rem;
            margin: 0;
        }
        
        .rating label:before {
            content: '★';
        }
        
        .rating input:checked ~ label {
            color: #FFD700;
        }
        
        .rating label:hover,
        .rating label:hover ~ label {
            color: #FFD700;
        }
        
        .rating input:checked + label:hover,
        .rating input:checked + label:hover ~ label,
        .rating input:checked ~ label:hover,
        .rating input:checked ~ label:hover ~ label,
        .rating label:hover ~ input:checked ~ label {
            color: #FFD700;
        }
        
        .file-upload-container {
            position: relative;
            overflow: hidden;
            display: inline-block;
        }
        
        .file-upload-container input[type=file] {
            position: absolute;
            top: 0;
            right: 0;
            min-width: 100%;
            min-height: 100%;
            font-size: 100px;
            text-align: right;
            filter: alpha(opacity=0);
            opacity: 0;
            outline: none;
            background: white;
            cursor: pointer;
            display: block;
        }
        
        .action-buttons {
            margin-top: 30px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- 로고 -->
        <div class="logo">
            <a href="${pageContext.request.contextPath}/main">OneTouch</a>
        </div>
        
        <!-- 폼 컨테이너 -->
        <div class="form-container">
            <form action="${pageContext.request.contextPath}/community/write" method="post" enctype="multipart/form-data">
                <!-- 게시판 선택 -->
                <div class="mb-4">
                    <label for="boardCategory" class="form-label">게시판 선택</label>
                    <select class="form-select" id="boardCategory" name="boardCategory" required>
                        <option value="" selected disabled>구매자리뷰</option>
                        <option value="review">구매자리뷰</option>
                        <option value="tips">스킨케어팁</option>
                        <option value="free">자유게시판</option>
                        <option value="qna">질문과 답변</option>
                    </select>
                </div>
                
                <!-- 제목 -->
                <div class="mb-4">
                    <label for="title" class="form-label">제목</label>
                    <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요" required>
                </div>
                
                <!-- 제품 선택 -->
                <div class="mb-4">
                    <label for="productSelect" class="form-label">리뷰할 제품을 선택해주세요</label>
                    <select class="form-select" id="productSelect" name="productId">
                        <option value="" selected disabled>리뷰할 제품을 선택해주세요</option>
                        <c:forEach var="product" items="${productList}">
                            <option value="${product.id}">${product.name}</option>
                        </c:forEach>
                        <!-- 샘플 옵션들 (실제로는 DB에서 가져온 제품 목록으로 대체) -->
                        <option value="1">맨즈 딥클렌징 폼</option>
                        <option value="2">남성 올인원 로션</option>
                        <option value="3">맨즈 아쿠아 스킨</option>
                        <option value="4">옴므 안티에이징 크림</option>
                        <option value="5">블랙헤드 클리어 스크럽</option>
                    </select>
                </div>
                
                <!-- 평점 -->
                <div class="mb-4">
                    <label class="form-label d-block">평점</label>
                    <div class="rating">
                        <input type="radio" id="star5" name="rating" value="5" />
                        <label for="star5" title="5점"></label>
                        
                        <input type="radio" id="star4" name="rating" value="4" />
                        <label for="star4" title="4점"></label>
                        
                        <input type="radio" id="star3" name="rating" value="3" />
                        <label for="star3" title="3점"></label>
                        
                        <input type="radio" id="star2" name="rating" value="2" />
                        <label for="star2" title="2점"></label>
                        
                        <input type="radio" id="star1" name="rating" value="1" />
                        <label for="star1" title="1점"></label>
                    </div>
                </div>
                
                <!-- 내용 -->
                <div class="mb-4">
                    <label for="content" class="form-label">내용</label>
                    <textarea class="form-control" id="content" name="content" placeholder="내용을 입력해주세요" required></textarea>
                </div>
                
                <!-- 파일 첨부 -->
                <div class="mb-4">
                    <label class="form-label">파일 첨부</label>
                    <div class="d-flex align-items-center">
                        <div class="btn btn-outline-secondary file-upload-container me-2">
                            파일 첨부
                            <input type="file" name="attachment" id="fileUpload">
                        </div>
                        <span id="selectedFileName" class="text-muted small">선택된 파일 없음</span>
                    </div>
                    <div class="mt-2">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="sensitiveOption" name="sensitiveOption">
                            <label class="form-check-label" for="sensitiveOption">선정적 파일 업로드</label>
                        </div>
                    </div>
                </div>
                
                <!-- 버튼 영역 -->
                <div class="action-buttons">
                    <a href="${pageContext.request.contextPath}/community" class="btn btn-secondary me-2">취소하기</a>
                    <button type="submit" class="btn btn-primary">등록하기</button>
                </div>
            </form>
        </div>
    </div>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // 파일 업로드 이름 표시
        document.getElementById('fileUpload').addEventListener('change', function() {
            const fileName = this.files[0] ? this.files[0].name : '선택된 파일 없음';
            document.getElementById('selectedFileName').textContent = fileName;
        });
    </script>
</body>
</html>
