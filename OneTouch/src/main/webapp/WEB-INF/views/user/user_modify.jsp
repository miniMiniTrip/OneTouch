<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>회원정보 수정 - OneTouch</title>
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
/* ==================== 기본 레이아웃 ==================== */
.member-section {
    padding: 0;
    background-color: #fff;
    min-height: calc(100vh - 400px);
}

.member-container {
    display: flex;
    max-width: 100%;
    margin: 0;
    background: transparent;
    border-radius: 0;
    overflow: visible;
    box-shadow: none;
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
    color: #1A237E;
    font-weight: 600;
}

.member-detail {
    max-width: 700px;
    margin-left: 150px;
}

.section-title {
    font-size: 16px;
    font-weight: 600;
    color: #333;
    margin-bottom: 20px;
    margin-top: 30px;
}

.section-title:first-of-type {
    margin-top: 0;
}

/* ==================== 폼 스타일 ==================== */
.form-group {
    margin-bottom: 20px;
}

.form-label {
    display: block;
    margin-bottom: 8px;
    color: #333;
    font-size: 14px;
    font-weight: 600;
}

.form-input {
    width: 100%;
    padding: 12px 15px;
    border: 1px solid #e0e0e0;
    border-radius: 4px;
    font-size: 14px;
    font-family: inherit;
}

.form-input:focus {
    outline: none;
    border-color: #5c6bc0;
    box-shadow: 0 0 0 3px rgba(92, 107, 192, 0.1);
}

.form-input:disabled {
    background-color: #f5f5f5;
    cursor: not-allowed;
}

.zipcode-container {
    display: flex;
    gap: 10px;
    align-items: center;
}

.zipcode-input {
    flex: 1;
}

.section-divider {
    margin: 30px 0;
    border-top: 1px solid #e0e0e0;
    padding-top: 20px;
}

/* ==================== 버튼 ==================== */
.btn-group {
    display: flex;
    gap: 10px;
    justify-content: flex-end;
    margin-top: 40px;
}

.btn {
    padding: 12px 30px;
    border: none;
    border-radius: 4px;
    font-size: 14px;
    cursor: pointer;
    transition: all 0.3s;
    font-weight: 600;
    min-width: 120px;
}

.btn-cancel {
    background: #dc3545 !important;
    color: white !important;
}

.btn-cancel:hover {
    background: #c82333 !important;
}

.btn-submit {
    background: #1A237E !important;
    color: white !important;
}

.btn-submit:hover {
    background: #4a5aaf !important;
}

.withdraw-btn {
    display: inline-block;
    margin-top: 50px;
    color: #dc3545;
    text-decoration: none;
    font-size: 14px;
    cursor: pointer;
    transition: color 0.3s;
}

.withdraw-btn:hover {
    color: #c82333;
    text-decoration: underline;
}

.search-btn2 {
    background: #1A237E;
    color: white;
    padding: 12px 30px;
    border: none;
    border-radius: 4px;
    font-size: 14px;
    cursor: pointer;
    transition: all 0.3s;
    font-weight: 600;
    min-width: 120px;
}

.search-btn2:hover {
    background: #4a5aaf !important;
}

/* ==================== 메시지 ==================== */
.error-message {
    color: #dc3545;
    font-size: 13px;
    margin-top: 5px;
    display: none;
}

.success-message {
    background-color: #d4edda;
    color: #155724;
    padding: 12px;
    border-radius: 4px;
    margin-bottom: 20px;
    display: none;
}

/* ==================== 프로필 사진 ==================== */
.profile-photo-section {
    margin-bottom: 40px;
    padding-bottom: 30px;
    border-bottom: 1px solid #e0e0e0;
}

.profile-photo-container {
    display: flex;
    align-items: center;
    gap: 30px;
}

.profile-photo-preview {
    position: relative;
    width: 120px;
    height: 120px;
}

.profile-photo-circle {
    width: 120px;
    height: 120px;
    border-radius: 50%;
    border: 1px solid #1A237E;
    overflow: hidden;
    background-color: #f5f5f5;
    display: flex;
    align-items: center;
    justify-content: center;
}

.profile-photo-circle img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.profile-photo-placeholder {
    font-size: 48px;
    color: #bdbdbd;
}

.profile-photo-info {
    flex: 1;
}

.profile-photo-buttons {
    display: flex;
    gap: 10px;
    margin-top: 15px;
}

/* .btn-photo-upload {
    background: #1A237E;
    color: white;
    padding: 8px 20px;
    border-radius: 4px;
    font-size: 13px;
    font-weight: 600;
} */

.btn-photo-upload:hover {
    background: #4a5aaf;
}

/* .btn-photo-delete {
    background: red;
    color: white;
    padding: 8px 20px;
    border-radius: 4px;
    font-size: 13px;
    font-weight: 600;
} */

.btn-photo-delete:hover {
    background: red;
}

#photoFileInput {
    display: none;
}

/* ==================== 반응형 ==================== */
@media (max-width: 992px) {
    .member-container {
        flex-direction: column;
        position: relative;
    }

    .content {
        padding: 20px;
        width: 100%;
    }

    .member-detail {
        margin-left: 0;
        max-width: 100%;
    }

    .profile-photo-container {
        flex-direction: column;
        text-align: center;
    }

    .profile-photo-buttons {
        justify-content: center;
    }
}

@media (max-width: 576px) {
    .btn-group {
        flex-direction: column;
    }

    .btn {
        width: 100%;
    }
}

    </style>
    
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
    
    <script type="text/javascript">
    function triggerFileInput() {
        document.getElementById('photoFileInput').click();
    }

    document.addEventListener('DOMContentLoaded', function() {
        const photoInput = document.getElementById('photoFileInput');
        if (photoInput) {
            photoInput.addEventListener('change', function(e) {
                const file = e.target.files[0];
                
                if (file) {
                    if (file.size > 5 * 1024 * 1024) {
                        alert('파일 크기는 5MB 이하여야 합니다.');
                        this.value = '';
                        return;
                    }
                    
                    if (!file.type.match('image/jpeg') && !file.type.match('image/png')) {
                        alert('JPG 또는 PNG 파일만 업로드 가능합니다.');
                        this.value = '';
                        return;
                    }
                    
                    const reader = new FileReader();
                    reader.onload = function(event) {
                        const photoPreview = document.getElementById('photoPreview');
                        photoPreview.innerHTML = '<img src="' + event.target.result + '" alt="프로필 사진">';
                    };
                    reader.readAsDataURL(file);
                }
            });
        }
    });

    function deletePhoto() {
        if (confirm('프로필 사진을 삭제하시겠습니까?')) {
            document.getElementById('photoFileInput').value = '';
            const photoPreview = document.getElementById('photoPreview');
            photoPreview.innerHTML = '<i class="lni lni-user profile-photo-placeholder"></i>';
        }
    }
    </script>
</head>

<body>
    <div class="preloader">
        <div class="preloader-inner">
            <div class="preloader-icon">
                <span></span>
                <span></span>
            </div>
        </div>
    </div>

    <c:import url="../common/header.jsp" />

    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">회원정보 수정</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="${pageContext.request.contextPath}/"><i class="lni lni-home"></i> 홈</a></li>
                        <li>마이페이지</li>
                        <li>회원정보 수정</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <section class="member-section">
        <div class="container">
            <div class="member-container">
                <%@include file="../common/mypage_side_bar.jsp" %>
                
                <div class="content">
                    <div class="content-header">
                        <h2>회원정보 수정</h2>
                    </div>
                    
                    <div class="success-message" id="successMsg"></div>
                    
                    <div class="member-detail">
                        <form id="memberForm" action="${pageContext.request.contextPath}/user/updateMember" method="post" enctype="multipart/form-data">
                            
                            <div class="profile-photo-section">
                                <div class="profile-photo-container">
                                    <div class="profile-photo-preview">
                                        <div class="profile-photo-circle" id="photoPreview">
                                            <img alt="${memVo.mem_image_url}" src="${pageContext.request.contextPath }/images/mem/${memVo.mem_image_url}">
                                        </div>
                                    </div>
                                    <div class="profile-photo-info">
                                        <h4>프로필 사진</h4>
                                        <p>JPG, PNG 파일 (최대 5MB)</p>
                                        <p>권장 크기: 400x400px</p>
                                        <div class="profile-photo-buttons">
                                            <input type="file" id="photoFileInput" name="mem_image" accept="image/*">
                                            <input type="hidden" name="mem_image_url" value="${memVo.mem_image_url }">
                                            <button type="button" class="btn btn-submit" onclick="triggerFileInput();">사진 업로드</button>
                                            <button type="button" class="btn btn-cancel" onclick="deletePhoto();">삭제</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <h3 class="section-title">기본 정보</h3>
                            
                            <div class="form-group">
                                <label class="form-label">아이디</label>
                                <input type="text" class="form-input" value="${memVo.mem_id}" disabled>
                                <input type="hidden" class="form-input" name="mem_id" value="${memVo.mem_id}" >
                            </div>
                            
                            <div class="form-group">
                                <label class="form-label">이름</label>
                                <input type="text" class="form-input" name="mem_name" value="${memVo.mem_name}" required>
                                <div class="error-message" id="nameError"></div>
                            </div>
                            
                            <div class="form-group">
                                <label class="form-label">이메일</label>
                                <input type="email" class="form-input" name="mem_email" value="${memVo.mem_email}" required>
                                <div class="error-message" id="emailError"></div>
                            </div>
                            
                            <div class="form-group">
                                <label class="form-label">휴대폰번호</label>
                                <input type="tel" class="form-input" name="mem_phone" value="${memVo.mem_phone}" required>
                                <div class="error-message" id="phoneError"></div>
                            </div>
                            
                            <div class="form-group">
                                <label class="form-label">생년월일</label>
                                <input type="date" class="form-input" name="mem_birth" value="${memVo.mem_birth}">
                            </div>
                            
                            <div class="form-group">
                                <label class="form-label">새 비밀번호 (변경 시에만 입력)</label>
                                <input type="password" class="form-input" name="mem_new_pw" placeholder="8자 이상">
                                <div class="error-message" id="passwordError"></div>
                            </div>
                            
                            <div class="form-group">
                                <label class="form-label">새 비밀번호 확인</label>
                                <input type="password" class="form-input" name="mem_pw" placeholder="비밀번호 재입력">
                                <div class="error-message" id="confirmPasswordError"></div>
                            </div>
                            
                            <div class="section-divider"></div>
                            
                            <h3 class="section-title">배송지 정보</h3>
                            
                            <div class="form-group">
                                <label class="form-label">우편번호</label>
                                <div class="zipcode-container">
                                    <input type="text" class="form-input zipcode-input" name="mem_postal" value="${memVo.mem_postal}" readonly>
                                    <button type="button" class="btn btn-outline-primary" onclick="searchZipcode();">검색</button>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="form-label">기본배송지</label>
                                <input type="text" class="form-input" name="mem_addr" value="${memVo.mem_addr}" readonly>
                            </div>
                            
                            <div class="form-group">
                                <label class="form-label">상세주소</label>
                                <input type="text" class="form-input" name="mem_addr_more" value="${memVo.mem_addr_more}">
                            </div>
                            
                            <div class="btn-group">
                                <button type="button" class="btn btn-cancel" onclick="confirmCancel();">취소</button>
                                <button type="submit" class="btn btn-submit" onclick="return validateForm();">저장</button>
                            </div>
                        </form>
                        
                        <a href="javascript:void(0);" class="withdraw-btn" onclick="confirmWithdraw();">회원탈퇴</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <a href="#" class="scroll-top">
        <i class="lni lni-chevron-up"></i>
    </a>

    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/tiny-slider.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/glightbox.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
    
    <script>
        function validateForm() {
            let isValid = true;
            const form = document.getElementById('memberForm');
            
            document.querySelectorAll('.error-message').forEach(msg => msg.style.display = 'none');
            
            const name = form.querySelector('input[name="mem_name"]').value.trim();
            if (name === '') {
                document.getElementById('nameError').textContent = '이름을 입력해주세요.';
                document.getElementById('nameError').style.display = 'block';
                isValid = false;
            }
            
            const email = form.querySelector('input[name="mem_email"]').value.trim();
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (email === '' || !emailRegex.test(email)) {
                document.getElementById('emailError').textContent = '유효한 이메일을 입력해주세요.';
                document.getElementById('emailError').style.display = 'block';
                isValid = false;
            }
            
            const phone = form.querySelector('input[name="mem_phone"]').value.trim();
            const phoneRegex = /^\d{3}-\d{3,4}-\d{4}$/;
            if (phone === '' || !phoneRegex.test(phone)) {
                document.getElementById('phoneError').textContent = '휴대폰번호를 올바른 형식으로 입력해주세요. (예: 010-1234-5678)';
                document.getElementById('phoneError').style.display = 'block';
                isValid = false;
            }
            
            const newPassword = form.querySelector('input[name="mem_new_pw"]').value.trim();
            const confirmPassword = form.querySelector('input[name="mem_pw"]').value.trim();
            
            if (newPassword !== '' || confirmPassword !== '') {
                if (newPassword.length < 8) {
                    document.getElementById('passwordError').textContent = '비밀번호는 8자 이상이어야 합니다.';
                    document.getElementById('passwordError').style.display = 'block';
                    isValid = false;
                }
                
                if (newPassword !== confirmPassword) {
                    document.getElementById('confirmPasswordError').textContent = '비밀번호가 일치하지 않습니다.';
                    document.getElementById('confirmPasswordError').style.display = 'block';
                    isValid = false;
                }
            }
            
            return isValid;
        }
        
        function searchZipcode() {
          
            
            new daum.Postcode({
                oncomplete: function(data) {
                    let addr = (data.userSelectedType === 'R') ? data.roadAddress : data.jibunAddress;

                    document.querySelector('input[name="mem_postal"]').value = data.zonecode;
                    document.querySelector('input[name="mem_addr"]').value = addr;
                    document.querySelector('input[name="mem_addr_more"]').focus();
                }
            }).open();
            
        }
        
        function confirmCancel() {
            if (confirm('입력한 내용이 저장되지 않습니다. 계속하시겠습니까?')) {
                history.back();
            }
        }
        
        function confirmWithdraw() {
            if (confirm('정말로 회원을 탈퇴하시겠습니까?\n탈퇴 후 복구할 수 없습니다.')) {
                location.href = '${pageContext.request.contextPath}/user/delete?idx=${memVo.mem_idx}&image=${memVo.mem_image_url}';
                
            }
        }
        
        window.addEventListener('DOMContentLoaded', function() {
            const successMsg = '${param.success}';
            if (successMsg === 'true') {
                const msgElement = document.getElementById('successMsg');
                msgElement.textContent = '회원정보가 성공적으로 수정되었습니다.';
                msgElement.style.display = 'block';
                
                setTimeout(() => {
                    msgElement.style.display = 'none';
                }, 5000);
            }
        });
        
        window.addEventListener('load', function() {
            const preloader = document.querySelector('.preloader');
            if (preloader) {
                preloader.style.opacity = '0';
                setTimeout(() => preloader.style.display = 'none', 500);
            }
        });
    </script>

    <%@include file="../common/footer.jsp" %>
</body>
</html>