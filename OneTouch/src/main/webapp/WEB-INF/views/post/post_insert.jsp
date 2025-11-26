<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>커뮤니티</title>
<meta name="description" content="해시태그 기반 맞춤 추천으로 나에게 딱 맞는 뷰티 제품을 찾아보세요" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/assets/images/favicon.svg" />

<!-- ========================= CSS here ========================= -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/LineIcons.3.0.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/tiny-slider.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/glightbox.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />




<!-- =======================================CSS============================================ -->
<style>
/* 기본 스타일 초기화 */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Apple SD Gothic Neo', 'Noto Sans KR', sans-serif;
}

body {
	background-color: #fff;
	color: #333;
	line-height: 1.6;
}

a {
	text-decoration: none;
	color: inherit;
}

/* 헤더 스타일 */
header {
	padding: 30px 0;
	margin-bottom: 30px;
	text-align: center;
}

.logo {
	font-size: 28px;
	font-weight: bold;
	color: #4751c9;
}

/* 메인 컨테이너 */
.container {
	max-width: 800px;
	margin: 0 auto;
	padding: 0 20px 40px;
}

/* 글쓰기 폼 스타일 */
.write-form {
	background-color: #fff;
	border-radius: 8px;
	padding: 20px;
}

.form-group {
	margin-bottom: 20px;
}

.form-group label {
	display: block;
	font-size: 14px;
	font-weight: 500;
	margin-bottom: 8px;
	color: #555;
}

.form-control {
	width: 100%;
	padding: 12px 15px;
	border: 1px solid #eee;
	border-radius: 6px;
	font-size: 16px;
	transition: border-color 0.2s;
	background-color: #fafafa;
}

.form-control:focus {
	outline: none;
	border-color: #4751c9;
	background-color: #fff;
}

select.form-control {
	appearance: none;
	background-image:
		url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='%23999' viewBox='0 0 16 16'%3E%3Cpath d='M8 10.5l4-4H4z'/%3E%3C/svg%3E");
	background-repeat: no-repeat;
	background-position: right 15px center;
	padding-right: 40px;
}
.form-control-hashtag {
	width : 200px;
	padding: 12px 15px;
	border: 1px solid #eee;
	border-radius: 6px;
	font-size: 16px;
	transition: border-color 0.2s;
}

.form-control-hashtag:focus {
	outline: none;
	border-color: #4751c9;
	background-color: #fff;
}
.editor-area {
	border: 1px solid #eee;
	border-radius: 6px;
	margin-bottom: 20px;
	background-color: #fafafa;
}

.editor-content {
	min-height: 300px;
	padding: 15px;
	outline: none;
	font-size: 14px;
}

.editor-content[contenteditable=true]:empty:before {
	content: attr(placeholder);
	color: #aaa;
	font-style: italic;
}

/* 특수 필드 스타일 */
.skin-fields, .review-fields {
	/* display: none;  */
	padding-top: 15px;
	margin-top: 15px;
	border-top: 1px solid #eee;
}

.skin-preview {
	border: 1px solid #eee;
	border-radius: 6px;
	padding: 15px;
	margin-bottom: 15px;
	background-color: #fafafa;
	color: #777;
	font-size: 13px;
}

.skin-code-editor {
	font-family: monospace;
	width: 100%;
	height: 150px;
	padding: 12px;
	border: 1px solid #eee;
	border-radius: 6px;
	font-size: 13px;
	background-color: #fafafa;
	resize: vertical;
}

/* 평점 스타일 */
.rating {
	display: inline-flex;
	flex-direction: row-reverse;
	margin-top: 5px;
}

.rating input {
	display: none;
}

.rating label {
	font-size: 24px;
	color: #ddd;
	cursor: pointer;
	margin-right: 5px;
}

.rating input:checked ~ label {
	color: #ffcc00;
}

.rating label:hover, .rating label:hover ~ label {
	color: #ffcc00;
}

/* 파일 업로드 스타일 */
.file-upload {
	margin-bottom: 20px;
}

.file-upload-btn {
	display: inline-block;
	padding: 10px 15px;
	border-radius: 6px;
	background-color: #f5f5f5;
	border: 1px solid #ddd;
	color: #555;
	font-size: 13px;
	cursor: pointer;
	transition: all 0.2s;
}

.file-upload-btn:hover {
	background-color: #eee;
}

.file-upload input[type="file"] {
	display: none;
}

.file-name {
	display: inline-block;
	margin-left: 10px;
	font-size: 13px;
	color: #777;
}

/* 버튼 스타일 */
.button-group {
	display: flex;
	justify-content: center;
	gap: 15px;
}

.btn {
	padding: 10px 25px;
	border: none;
	border-radius: 6px;
	font-size: 14px;
	font-weight: 500;
	cursor: pointer;
	transition: all 0.2s;
}

.btn-primary {
	background-color: #4751c9;
	color: #fff;
}

.btn-primary:hover {
	background-color: #3a43b3;
}

.btn-secondary {
	background-color: #f1f1f1;
	color: #555;
}

.btn-secondary:hover {
	background-color: #e5e5e5;
}

/* 반응형 스타일 */
@media ( max-width : 576px) {
	.button-group {
		flex-direction: column;
	}
	.btn {
		width: 100%;
	}
}
</style>
<!-- =======================================/CSS============================================ -->

<!-- =======================================js : post등록============================================ -->
<script type="text/javascript">

function postInsert(f) {
	let post_category= f.post_category.value;
    let post_title = f.post_title.value.trim();
    let post_content = f.post_content.value.trim();
    let post_images = f.post_images.value.trim();
    
    // 상품 선택 검증
    let product_idx_array = [];
    let allSelected = true;  // 모든 상품이 선택되었는지 여부를 체크할 변수

    // product_idx_array 배열에 상품 선택된 값을 추가
    $('#product-form-container .form-group select').each(function() {
        let selected_value = $(this).val().trim();
        
        if (selected_value === "") {
            allSelected = false; // 빈 값이 있으면 allSelected를 false로 설정
        } else {
            product_idx_array.push(selected_value);  // 비어있지 않으면 배열에 추가
        }
    });

    // 상품 선택 검증
    if (!allSelected) {
        alert("모든 상품을 선택해주세요.");
        return; // 함수 종료
    }
    // 해시 선택 검증
    let post_hashtag_array = [];
    let hashtagAllSelected = true;  // 모든 상품이 선택되었는지 여부를 체크할 변수

    // product_idx_array 배열에 상품 선택된 값을 추가
    $('#hashtag-form-container .form-group input').each(function() {
        let input_value = $(this).val().trim();
        
        if (input_value === "") {
        	hashtagAllSelected = false; // 빈 값이 있으면 allSelected를 false로 설정
        } else {
        	post_hashtag_array.push(input_value);  // 비어있지 않으면 배열에 추가
        }
    });

    // 해시 선택 검증
    if (!hashtagAllSelected) {
        alert("모든 해시태그를 작성해주세요.");
        return; // 함수 종료
    }

    // 제목 검증
    if (post_title == "") {
        alert("제목을 입력해주세요");
        f.post_title.value = "";
        f.post_title.focus();
        return; // 함수 종료
    }

    // 내용 검증
    if (post_content == "") {
        alert("내용을 입력해주세요");
        f.post_content.value = "";
        f.post_content.focus();
        return; // 함수 종료
    }



    // 별점 선택 검증
    let post_rating = f.post_rating.value; // 선택된 별점 값

    if (post_category=='review'&&!post_rating) {
        alert("별점을 선택해주세요");
        // 별점 영역으로 포커스를 이동하거나 스크롤을 부드럽게 할 수 있음
        $('html, body').animate({
            scrollTop: $("#review-fields").offset().top
        }, 500);
        return; // 함수 종료
    }
    
    // 사진 검증 (file input은 값이 없으면 빈 문자열)
    if (post_images == "") {
        alert("사진을 선택해주세요");
        f.post_images.value = "";
        f.post_images.focus();
        return; // 함수 종료
    }
    
    // 폼 제출
    f.method = "post";
    f.action = "/post/insert";
    f.enctype = "multipart/form-data";
    f.submit();
}
</script>
<!-- =======================================/js : post등록============================================ -->
</head>
<body>
	<!-- =======================================커뮤니티============================================ -->

	<!-- Start Header Area -->
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<!-- End Header Area -->

	<header>
		<div class="logo">OneTouch</div>
	</header>

	<div class="container">
		<form class="write-form">
			<div class="form-group">
				<label for="board-type">게시판 선택</label> 
				<select id="post_category" name="post_category"
					class="form-control">
					<option value="skin">스킨에디터</option>
					<option value="review">구매자리뷰</option>
					<option value="free">자유게시판</option>
				</select>
			</div>

			<div class="form-group">
				<label for="post_title">제목</label> <input type="text"
					id="post_title" name="post_title" class="form-control" placeholder="제목을 입력해주세요">
			</div>

			<!-- 스킨 에디터 전용 필드 -->
			<div id="skin-fields" class="skin-fields">
				<div class="form-group">
					<label for="post_content">내용</label>
					<textarea id="post_content" name="post_content" class="form-control" rows="3"
						placeholder="내용을 입력해주세요"></textarea>
				</div>
				
				
			<!-- 상품 추가 하는 영역 -->			
			<div id="product-add">
			    <div class="form-group">
			        <label for="skin-category">상품추가</label>
			        <%--  
			            <select id="skin-category" name="product_idx" class="form-control">
			                <option value="">상품을 선택해주세요</option>
			                <c:forEach var="productVo" items="${product_list_array }">
			                    <option value="${productVo.product_idx }">${productVo.product_name }</option>
			                </c:forEach>
			            </select>
			        --%>
			    </div>
			
			    <div class="container mt-4">
			        <!-- 상품 선택 폼을 추가하는 버튼 -->
			        <button type="button" class="btn btn-primary" id="add-product-btn">+</button>
			
			        <!-- 상품 폼을 담을 영역 -->
			        <div id="product-form-container" class="mt-4">
			            <!-- 동적으로 추가된 상품 폼이 여기에 들어갑니다. -->
			        </div>
			    </div>
			    
			    <div class="form-group">
			        <label for="skin-category">해시태그</label>
			        <%--  
			            <select id="skin-category" name="product_idx" class="form-control">
			                <option value="">상품을 선택해주세요</option>
			                <c:forEach var="productVo" items="${product_list_array }">
			                    <option value="${productVo.product_idx }">${productVo.product_name }</option>
			                </c:forEach>
			            </select>
			        --%>
			    </div>
			    <div class="container mt-4">
			        <!-- 상품 선택 폼을 추가하는 버튼 -->
			        <button type="button" class="btn btn-primary" id="add-hashtag-btn">+</button>
			
			        <!-- 상품 폼을 담을 영역 -->
			        <div id="hashtag-form-container" class="mt-4">
			            <!-- 동적으로 추가된 상품 폼이 여기에 들어갑니다. -->
			        </div>
			    </div>
			</div>
			
			<script>
			    $(document).ready(function() {
			<!-- ----------------- 상품 추가 js ------------------ -->
			        $('#add-product-btn').click(function() {
			            // 새로운 상품 선택 폼을 생성할 HTML 코드
			            let newFormGroup = `
			                <div class="form-group product-form">
			                    <div class="d-flex align-items-center">
			                        <select name="product_idx_array" class="form-control">
			                            <option value="">상품을 선택해주세요</option>
			                            <c:forEach var="productVo" items="${product_list_array}">
			                                <option value="${productVo.product_idx}">${productVo.product_name}</option>
			                            </c:forEach>
			                        </select>
			                        <!-- 상품 삭제 버튼 추가 (select 오른쪽) -->
			                        <button type="button" class="btn btn-danger btn-sm remove-product-btn ms-2">-</button>
			                    </div>
			                </div>
			            `;
			
			            // 생성된 폼을 화면에 추가
			            $('#product-form-container').append(newFormGroup);
			        });
			
			        // 상품 삭제 버튼 클릭 시 해당 폼 삭제
			        $(document).on('click', '.remove-product-btn', function() {
			            // 클릭된 삭제 버튼의 부모 div.product-form을 찾고 삭제
			            let formGroup = $(this).closest('.product-form');
			            console.log(formGroup); // 콘솔에서 삭제될 요소 확인
			            formGroup.remove(); // 해당 폼을 삭제
			        });
			        
			<!-- ----------------- end/상품 추가 js ------------------ -->
			        
			<!-- ----------------- 해시태그 추가 js ------------------ -->
			        $('#add-hashtag-btn').click(function() {
			            // 새로운 해시태그 폼을 생성할 HTML 코드
			            let newFormGroup = `
			                <div class="form-group hashtag-form">
			                    <div class="d-flex align-items-center">
			                    	<input type="text" class="form-control-hashtag" name="post_hashtag_array" placeholder="해시태그를 입력하세요">
			                      
			                        <!-- 해시태그 삭제 버튼 추가 (select 오른쪽) -->
			                        <button type="button" class="btn btn-danger btn-sm remove-hashtag-btn ms-2">-</button>
			                    </div>
			                </div>
			            `;
			
			            // 생성된 폼을 화면에 추가
			            $('#hashtag-form-container').append(newFormGroup);
			        });
			
			        // 해시태그 삭제 버튼 클릭 시 해당 폼 삭제
			        $(document).on('click', '.remove-hashtag-btn', function() {
			            // 클릭된 삭제 버튼의 부모 div.hashtag-form을 찾고 삭제
			            let formGroup = $(this).closest('.hashtag-form');
			            console.log(formGroup); // 콘솔에서 삭제될 요소 확인
			            formGroup.remove(); // 해당 폼을 삭제
			        });
			<!-- ----------------- end/해시태그 추가 js ------------------ -->
			        

			    });
			</script>
			
			

				<!--      <div class="form-group">
                    <label>스킨 미리보기</label>
                    <div class="skin-preview">
                        <p>스킨 미리보기 영역입니다.</p>
                        <p>CSS와 HTML 코드가 적용된 모습이 여기에 표시됩니다.</p>
                    </div>
                </div> -->

				<!--    <div class="form-group">
                    <label for="skin-html">HTML 코드</label>
                    <textarea id="skin-html" class="skin-code-editor" placeholder="HTML 코드를 입력해주세요"></textarea>
                </div>
                
                <div class="form-group">
                    <label for="skin-css">CSS 코드</label>
                    <textarea id="skin-css" class="skin-code-editor" placeholder="CSS 코드를 입력해주세요"></textarea>
                </div>
                
                <div class="form-group">
                    <label for="skin-js">JavaScript 코드 (선택사항)</label>
                    <textarea id="skin-js" class="skin-code-editor" placeholder="JavaScript 코드를 입력해주세요"></textarea>
                </div> -->
			</div>

			<!-- 구매자리뷰 전용 필드 -->
			<div id="review-fields" class="review-fields" style="display: none;">
				<div class="form-group">
					<label>평점</label>
					<div class="rating">
						<input type="radio" id="star5" name="post_rating" value="5">
						<label for="star5">★</label> 
						<input type="radio" id="star4" name="post_rating" value="4">
						<label for="star4">★</label> 
						<input type="radio" id="star3" name="post_rating" value="3">
						<label for="star3">★</label>
					 	<input type="radio" id="star2" name="post_rating" value="2">
						<label for="star2">★</label> 
						<input type="radio" id="star1" name="post_rating" value="1">
						<label for="star1">★</label>
					</div>
				</div>
			</div>


			<div class="file-upload">
				<label for="file-input" class="file-upload-btn" id="post_photo_insert">파일 첨부</label> 
				<input type="file" id="post_images" name="post_images" multiple> <span
					class="file-name">선택된 파일 없음</span>
			</div>
			
			<!-- 선택한 이미지 미리보기 영역 -->
			<div id="image-preview" class="row mt-3"></div>

			<div class="button-group">
				<button type="button" class="btn btn-secondary" onclick="location.href='/post/list'">목록보기</button>
				<button type="button" class="btn btn-primary"
					onclick="postInsert(this.form);">등록하기</button>
			</div>
		</form>
	</div>

	<script>
	
	/* 선택한 이미지 미리보기 ------------------------ */
	document.getElementById('post_images').addEventListener('change', function(event) {
	    const files = event.target.files;
	    const previewContainer = document.getElementById('image-preview');
	    
	    // 이전 미리보기 초기화
	    previewContainer.innerHTML = "";

	    // 파일 이름 표시
	    const fileNameDisplay = document.querySelector('.file-name');
	    if (files.length === 1) {
	        fileNameDisplay.textContent = files[0].name;
	    } else if (files.length > 1) {
	        fileNameDisplay.textContent = files.length + "개의 파일 선택됨";
	    } else {
	        fileNameDisplay.textContent = "선택된 파일 없음";
	    }

	    // 이미지 미리보기 생성
	    Array.from(files).forEach(file => {
	        if (!file.type.startsWith("image/")) return; // 이미지 파일만

	        const reader = new FileReader();
	        reader.onload = function(e) {
	            const col = document.createElement("div");
	            col.className = "col-4 mb-3 text-center"; // text-center 추가

	            // 이미지 감싸는 div (정사각형 유지)
	            const wrapper = document.createElement("div");
	            wrapper.style.width = "100%";
	            wrapper.style.paddingTop = "100%"; // 높이 비율 1:1
	            wrapper.style.position = "relative";
	            wrapper.style.borderRadius = "6px";
	            wrapper.style.overflow = "hidden";
	            wrapper.style.border = "1px solid #ddd";

	            // 이미지
	            const img = document.createElement("img");
	            img.src = e.target.result;
	            img.style.position = "absolute";
	            img.style.top = "0";
	            img.style.left = "0";
	            img.style.width = "100%";
	            img.style.height = "100%";
	            img.style.objectFit = "cover"; // 이미지 비율 유지

	            wrapper.appendChild(img);
	            col.appendChild(wrapper);
	            previewContainer.appendChild(col);
	        };
	        reader.readAsDataURL(file);
	    });
	});

		/* end : 선택한 이미지 미리보기 ------------------------ */
		
        // 게시판 유형에 따른 필드 표시/숨김
        document.getElementById('post_category').addEventListener('change', function() {
            const boardType = this.value;
            const reviewFields = document.getElementById('review-fields');
            const skinFields = document.getElementById('skin-fields');
            const productAddFields = document.getElementById('product-add');
            
            // 모든 필드 숨기기
            reviewFields.style.display = 'none';
            skinFields.style.display = 'none';
            
            //평점 초기화
            document.querySelectorAll('input[name="post_rating"]').forEach(input => input.checked = false);
            
            // 2. 상품 선택 폼 초기화
            const productContainer = document.getElementById('product-form-container');
            productContainer.innerHTML = ""; // 기존에 추가된 상품 폼 삭제
            
            // 선택된 게시판 유형에 따라 필드 표시
            if (boardType === 'review') {
                reviewFields.style.display = 'block';
                skinFields.style.display = 'block';
            	productAddFields.style.display='none';
            } else if (boardType === 'skin') {
            	productAddFields.style.display='block';
                skinFields.style.display = 'block';
            } else if (boardType ==='free'){
            	productAddFields.style.display='none';
                skinFields.style.display = 'block';
            }
        });
        
        // 파일 업로드 표시
        document.getElementById('post_images').addEventListener('change', function() {
            const fileCount = this.files.length;
            const fileNameDisplay = document.querySelector('.file-name');
            
            if (fileCount > 0) {
                if (fileCount === 1) {
                    fileNameDisplay.textContent = this.files[0].name;
                } else {
                    fileNameDisplay.textContent = `${fileCount}개의 파일이 선택됨`;
                }
            } else {
                fileNameDisplay.textContent = '선택된 파일 없음';
            }
        });
        
        document.getElementById('post_photo_insert').addEventListener('click',function(){
        	document.getElementById('post_images').click();
        })
        
        
        // 페이지 로드 시 초기 상태 설정
        window.addEventListener('load', function() {
            document.getElementById('review-fields').style.display = 'none';
           // document.getElementById('skin-fields').style.display = 'none';
        });
    </script>


	<!-- =======================================/커뮤니티============================================ -->







	<!-- Start Footer Area -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<!-- End Footer Area -->

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
