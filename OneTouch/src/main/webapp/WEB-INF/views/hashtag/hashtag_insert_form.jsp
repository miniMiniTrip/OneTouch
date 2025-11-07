<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>커뮤니티 글쓰기 - OneTouch</title>
    
    <!-- ShopGrids CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/LineIcons.3.0.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
</head>
<body>

    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">게시글 작성</h1>
                    </div>
                </div>+
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="${pageContext.request.contextPath}/"><i class="lni lni-home"></i> Home</a></li>
                        <li><a href="${pageContext.request.contextPath}/community">커뮤니티</a></li>
                        <li>글쓰기</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    <!-- Start Post Form Section -->
    <section class="post-form section">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 offset-lg-2 col-12">
                    <div class="card">
                        <div class="card-body">
                            <form action="${pageContext.request.contextPath}/community/insert" method="post" 
                                  enctype="multipart/form-data" id="postForm">
                                
                                <!-- 카테고리 선택 -->
                                <div class="form-group mb-4">
                                    <label class="form-label">카테고리 <span class="text-danger">*</span></label>
                                    <select name="post_category" class="form-select" required>
                                        <option value="">선택하세요</option>
                                        <option value="0">리뷰 (구매자 전용)</option>
                                        <option value="1">자유</option>
                                        <option value="2">상품추천</option>
                                    </select>
                                </div>

                                <!-- 내용 -->
                                <div class="form-group mb-4">
                                    <label class="form-label">내용 <span class="text-danger">*</span></label>
                                    <textarea name="post_content" 
                                              class="form-control" 
                                              rows="10" 
                                              placeholder="게시글 내용을 입력하세요..."
                                              required></textarea>
                                </div>

                                <!-- 이미지 업로드 -->
                                <div class="form-group mb-4">
                                    <label class="form-label">
                                        <i class="lni lni-image"></i> 이미지 
                                        <span class="text-muted">(선택사항, 최대 5개)</span>
                                    </label>
                                    <input type="file" 
                                           name="post_images" 
                                           class="form-control" 
                                           accept="image/*" 
                                           multiple
                                           onchange="previewImages(this)">
                                    <div id="imagePreview" class="mt-3 d-flex flex-wrap gap-2"></div>
                                </div>

                                <!-- 해시태그 컴포넌트 include -->
                                <%@ include file="hashtag-input-component.jsp" %>

                                <!-- 상품 태그 (선택사항) -->
                                <div class="form-group mb-4">
                                    <label class="form-label">
                                        <i class="lni lni-tag"></i> 상품 태그 
                                        <span class="text-muted">(선택사항, 최대 3개)</span>
                                    </label>
                                    <input type="text" 
                                           id="productSearch" 
                                           class="form-control" 
                                           placeholder="상품 검색..."
                                           autocomplete="off">
                                    <div id="productSuggestions" class="mt-2"></div>
                                    <div id="selectedProducts" class="mt-2"></div>
                                    <input type="hidden" name="products" id="productsValue">
                                </div>

                                <!-- 버튼 -->
                                <div class="d-flex justify-content-end gap-2">
                                    <a href="${pageContext.request.contextPath}/community" 
                                       class="btn btn-secondary">
                                        <i class="lni lni-arrow-left"></i> 취소
                                    </a>
                                    <button type="submit" class="btn btn-primary">
                                        <i class="lni lni-checkmark"></i> 등록하기
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>

                    <!-- 작성 가이드 -->
                    <div class="card mt-4">
                        <div class="card-header">
                            <h6 class="mb-0"><i class="lni lni-information"></i> 작성 가이드</h6>
                        </div>
                        <div class="card-body">
                            <ul class="mb-0">
                                <li>해시태그는 게시글을 분류하고 검색하는데 도움이 됩니다</li>
                                <li>상품 태그를 추가하면 해당 상품 페이지에서도 글이 노출됩니다</li>
                                <li>리뷰 카테고리는 구매 이력이 있는 회원만 작성 가능합니다</li>
                                <li>부적절한 내용은 관리자에 의해 삭제될 수 있습니다</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Post Form Section -->

    <!-- ShopGrids JS -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

    <script>
        // 이미지 미리보기
        function previewImages(input) {
            const preview = document.getElementById('imagePreview');
            preview.innerHTML = '';
            
            if (input.files) {
                if (input.files.length > 5) {
                    alert('이미지는 최대 5개까지만 업로드 가능합니다.');
                    input.value = '';
                    return;
                }
                
                Array.from(input.files).forEach((file, index) => {
                    const reader = new FileReader();
                    reader.onload = function(e) {
                        const div = document.createElement('div');
                        div.style.position = 'relative';
                        div.innerHTML = `
                            <img src="${e.target.result}" 
                                 style="width: 100px; height: 100px; object-fit: cover; border-radius: 8px;">
                            <button type="button" 
                                    class="btn btn-sm btn-danger" 
                                    style="position: absolute; top: -5px; right: -5px; width: 25px; height: 25px; padding: 0; border-radius: 50%;"
                                    onclick="removeImage(${index})">×</button>
                        `;
                        preview.appendChild(div);
                    };
                    reader.readAsDataURL(file);
                });
            }
        }
        
        // 이미지 제거 (재구현 필요)
        function removeImage(index) {
            // 파일 input 재설정 로직
            alert('이미지를 제거하려면 다시 선택해주세요.');
        }

        // 상품 검색 (간단 버전)
        const selectedProducts = [];
        const productSearch = document.getElementById('productSearch');
        const productSuggestions = document.getElementById('productSuggestions');
        const selectedProductsBox = document.getElementById('selectedProducts');
        const productsValue = document.getElementById('productsValue');

        let searchTimeout;
        productSearch.addEventListener('input', function(e) {
            clearTimeout(searchTimeout);
            const query = e.target.value.trim();
            
            if (query.length < 2) {
                productSuggestions.innerHTML = '';
                return;
            }
            
            searchTimeout = setTimeout(() => {
                fetch(`${pageContext.request.contextPath}/api/product/search?q=${encodeURIComponent(query)}`)
                    .then(response => response.json())
                    .then(data => {
                        productSuggestions.innerHTML = data.slice(0, 5).map(product => 
                            `<div class="card mb-2" style="cursor: pointer;" onclick="addProduct(${product.product_idx}, '${product.product_name}')">
                                <div class="card-body p-2">
                                    <small><strong>${product.product_name}</strong></small><br>
                                    <small class="text-muted">${product.product_brand}</small>
                                </div>
                            </div>`
                        ).join('');
                    })
                    .catch(error => console.error('상품 검색 실패:', error));
            }, 300);
        });

        function addProduct(idx, name) {
            if (selectedProducts.length >= 3) {
                alert('상품은 최대 3개까지만 태그할 수 있습니다.');
                return;
            }
            
            if (selectedProducts.find(p => p.idx === idx)) {
                alert('이미 추가된 상품입니다.');
                return;
            }
            
            selectedProducts.push({ idx, name });
            renderProducts();
            productSearch.value = '';
            productSuggestions.innerHTML = '';
        }

        function removeProduct(idx) {
            const index = selectedProducts.findIndex(p => p.idx === idx);
            if (index > -1) {
                selectedProducts.splice(index, 1);
                renderProducts();
            }
        }

        function renderProducts() {
            if (selectedProducts.length === 0) {
                selectedProductsBox.innerHTML = '';
            } else {
                selectedProductsBox.innerHTML = selectedProducts.map(product => 
                    `<span class="badge bg-primary me-2 mb-2" style="font-size: 14px; padding: 8px 12px;">
                        ${product.name}
                        <span style="cursor: pointer; margin-left: 5px;" onclick="removeProduct(${product.idx})">×</span>
                    </span>`
                ).join('');
            }
            
            productsValue.value = selectedProducts.map(p => p.idx).join(',');
        }

        // 폼 제출 전 검증
        document.getElementById('postForm').addEventListener('submit', function(e) {
            const hashtags = document.getElementById('hashtagsValue').value;
            
            if (!hashtags) {
                if (!confirm('해시태그를 추가하지 않으셨습니다. 계속하시겠습니까?')) {
                    e.preventDefault();
                    return false;
                }
            }
        });
    </script>

</body>
</html>
