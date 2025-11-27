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

<style>
    /* ================== 컨테이너 ================== */
    .container {
        max-width: 1600px;
        margin: 40px auto;
        padding: 0 20px;
    }

    /* ================== 레이아웃 ================== */
    .admin-layout {
        display: grid;
        grid-template-columns: 250px 1fr;
        gap: 30px;
    }

    /* ================== Q&A 작성 섹션 ================== */
    .admin-qna-write-section {
        padding: 0;
    }

    .admin-qna-write-container {
        flex: 1;
        background: white;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    }

    .admin-qna-write-content {
        padding: 40px;
    }

    .admin-qna-write-content-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 30px;
        padding-bottom: 15px;
        border-bottom: 2px solid #5c6bc0;
    }

    .admin-qna-write-content-header h2 {
        font-size: 18px;
        color: #5c6bc0;
        font-weight: 600;
    }

    .admin-qna-write-btn-list {
        background: #666;
        color: white;
        padding: 8px 20px;
        border: none;
        border-radius: 4px;
        font-size: 13px;
        cursor: pointer;
        transition: background 0.3s;
    }

    .admin-qna-write-btn-list:hover {
        background: #555;
    }

    .admin-qna-write-form-group {
        margin-bottom: 25px;
    }

    .admin-qna-write-form-label {
        display: block;
        font-size: 14px;
        font-weight: 600;
        color: #333;
        margin-bottom: 10px;
    }

    .admin-qna-write-form-label .required {
        color: #dc3545;
        margin-left: 3px;
    }

    .admin-qna-write-form-control,
    .admin-qna-write-form-select {
        width: 100%;
        padding: 12px 15px;
        border: 1px solid #ddd;
        border-radius: 4px;
        font-size: 14px;
        font-family: 'Malgun Gothic', sans-serif;
        transition: border-color 0.3s;
    }

    .admin-qna-write-form-control:focus,
    .admin-qna-write-form-select:focus {
        outline: none;
        border-color: #5c6bc0;
    }

    .admin-qna-write-form-control.textarea {
        min-height: 200px;
        resize: vertical;
    }

    .admin-qna-write-form-notice {
        background: #fff3cd;
        border: 1px solid #ffc107;
        border-radius: 4px;
        padding: 15px;
        margin-bottom: 25px;
    }

    .admin-qna-write-form-notice-title {
        font-size: 14px;
        font-weight: 600;
        color: #856404;
        margin-bottom: 8px;
    }

    .admin-qna-write-form-notice-text {
        font-size: 13px;
        color: #856404;
        line-height: 1.6;
    }

    .admin-qna-write-btn-group {
        display: flex;
        gap: 10px;
        justify-content: center;
        margin-top: 30px;
        padding-top: 30px;
        border-top: 1px solid #e0e0e0;
    }

    .admin-qna-write-btn {
        padding: 12px 40px;
        border: none;
        border-radius: 4px;
        font-size: 14px;
        cursor: pointer;
        transition: all 0.3s;
    }

    .admin-qna-write-btn-submit {
        background: #5c6bc0 !important;
        color: white !important;
    }

    .admin-qna-write-btn-submit:hover {
        background: #4a5aaf !important;
    }

    .admin-qna-write-btn-cancel {
        background: #6c757d !important;
        color: white !important;
    }

    .admin-qna-write-btn-cancel:hover {
        background: #5a6268 !important;
    }

    .admin-qna-write-char-count {
        text-align: right;
        font-size: 12px;
        color: #999;
        margin-top: 5px;
    }

    /* ================== 반응형 ================== */
    @media (max-width: 1024px) {
        .admin-layout {
            grid-template-columns: 200px 1fr;
        }
    }

    @media (max-width: 768px) {
        .admin-layout {
            grid-template-columns: 1fr;
        }

        .admin-qna-write-content {
            padding: 20px;
        }

        .admin-qna-write-btn-group {
            flex-direction: column;
        }

        .admin-qna-write-btn {
            width: 100%;
        }
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

    <!-- Header -->
    <%@ include file="admin_header.jsp" %>

    <!-- Q&A Write Section -->
    <section class="admin-qna-write-section">
        <div class="container">
            <div class="admin-layout">
                <%@ include file="admin_side.jsp"%>

                <div class="admin-qna-write-container">
                    <div class="admin-qna-write-content">
                        <div class="admin-qna-write-content-header">
                            <h2>✎ Q&A 작성하기</h2>
                            <button class="admin-qna-write-btn-list" onclick="location.href='${pageContext.request.contextPath}/admin/qna_list'">목록으로</button>
                        </div>

                        <div class="admin-qna-write-form-notice">
                            <div class="admin-qna-write-form-notice-title">📢 문의 전 확인해주세요</div>
                            <div class="admin-qna-write-form-notice-text">
                                • 상품에 대한 문의사항을 작성해주세요.<br>
                                • 답변은 영업일 기준 1~2일 내에 등록됩니다.<br>
                                • 욕설, 비방 등 부적절한 내용은 관리자에 의해 삭제될 수 있습니다.
                            </div>
                        </div>

                        <form class="admin-qna-write-form" method="post" action="${pageContext.request.contextPath}/admin/qna_write">
                            <div class="admin-qna-write-form-group">
                                <label class="admin-qna-write-form-label">문의 유형<span class="required">*</span></label>
                                <select class="admin-qna-write-form-select" name="qna_category" required>
                                    <option value="">선택하세요</option>
                                    <option value="0">상품 문의</option>
                                    <option value="1">배송 문의</option>
                                    <option value="2">교환/반품</option>
                                    <option value="3">재입고 문의</option>
                                    <option value="4">기타</option>
                                </select>
                            </div>

                            <div class="admin-qna-write-form-group">
                                <label class="admin-qna-write-form-label">제목<span class="required">*</span></label>
                                <input type="text" class="admin-qna-write-form-control" name="qna_title" placeholder="제목을 입력하세요" required maxlength="100">
                            </div>

                            <div class="admin-qna-write-form-group">
                                <label class="admin-qna-write-form-label">문의 내용<span class="required">*</span></label>
                                <textarea class="admin-qna-write-form-control textarea" name="qna_content" placeholder="문의 내용을 작성해주세요" required maxlength="1000" oninput="updateCharCount(this)"></textarea>
                                <div class="admin-qna-write-char-count">
                                    <span id="charCount">0</span> / 1000
                                </div>
                            </div>

                            <div class="admin-qna-write-form-group">
                                <label class="admin-qna-write-form-label">공개 여부</label>
                                <select class="admin-qna-write-form-select" name="qna_private">
                                    <option value="false">공개</option>
                                    <option value="true" selected>비공개</option>
                                </select>
                            </div>

                            <input type="hidden" name="mem_idx" value="${user.mem_idx }">

                            <div class="admin-qna-write-btn-group">
                                <button type="submit" class="admin-qna-write-btn admin-qna-write-btn-submit">등록하기</button>
                                <button type="button" class="admin-qna-write-btn admin-qna-write-btn-cancel" onclick="location.href='${pageContext.request.contextPath}/admin/qna_list'">취소</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <a href="#" class="scroll-top">
        <i class="lni lni-chevron-up"></i>
    </a>

    <script>
        function updateCharCount(textarea) {
            document.getElementById('charCount').textContent = textarea.value.length;
        }

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
