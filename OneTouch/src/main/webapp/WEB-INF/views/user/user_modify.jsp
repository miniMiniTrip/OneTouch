<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OneTouch - 회원정보 수정</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Noto Sans KR', sans-serif;
        }
        
        body {
            background-color: #f5f6fa;
        }
        
        .header {
            display: flex;
            justify-content: center;
            padding: 20px;
            background-color: white;
            border-bottom: 1px solid #e0e0e0;
        }
        
        .logo {
            color: #2a2a8d;
            font-size: 24px;
            font-weight: bold;
        }
        
        .container {
            display: flex;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        
        .sidebar {
            width: 250px;
            background-color: white;
            border-radius: 8px;
            padding: 20px;
            margin-right: 20px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
        }
        
        .sidebar-title {
            color: #333;
            font-size: 24px;
            margin-bottom: 5px;
        }
        
        .sidebar-welcome {
            color: #666;
            font-size: 14px;
            margin-bottom: 30px;
        }
        
        .sidebar-menu {
            list-style-type: none;
        }
        
        .sidebar-menu li {
            margin-bottom: 15px;
            padding: 10px 0;
            display: flex;
            align-items: center;
        }
        
        .sidebar-menu li:last-child {
            margin-bottom: 0;
        }
        
        .sidebar-menu-icon {
            margin-right: 10px;
            color: #6c757d;
        }
        
        .sidebar-menu-text {
            color: #333;
            font-size: 14px;
        }
        
        .sidebar-divider {
            height: 1px;
            background-color: #e0e0e0;
            margin: 20px 0;
        }
        
        .sidebar-menu-active {
            border-left: 3px solid #2a2a8d;
            background-color: #f5f6fa;
            padding-left: 10px !important;
        }
        
        .main-content {
            flex: 1;
            background-color: white;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
        }
        
        .content-title {
            color: #2a2a8d;
            font-size: 20px;
            margin-bottom: 30px;
            padding-bottom: 10px;
            border-bottom: 1px solid #e0e0e0;
            display: flex;
            align-items: center;
        }
        
        .content-title-icon {
            margin-right: 10px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-label {
            display: block;
            margin-bottom: 5px;
            color: #333;
            font-size: 14px;
        }
        
        .form-input {
            width: 100%;
            padding: 10px;
            border: 1px solid #e0e0e0;
            border-radius: 4px;
            font-size: 14px;
        }
        
        .form-row {
            display: flex;
            margin-bottom: 20px;
            gap: 15px;
        }
        
        .form-column {
            flex: 1;
        }
        
        .button-group {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
        }
        
        .btn {
            padding: 12px 20px;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
            width: 49%;
            text-align: center;
            border: none;
        }
        
        .btn-cancel {
            background-color: white;
            color: #2a2a8d;
            border: 1px solid #2a2a8d;
        }
        
        .btn-submit {
            background-color: #2a2a8d;
            color: white;
        }
        
        .withdraw-btn {
            display: inline-block;
            margin-top: 50px;
            color: #dc3545;
            padding: 8px 15px;
            border: 1px solid #dc3545;
            border-radius: 4px;
            font-size: 14px;
            text-decoration: none;
            cursor: pointer;
        }

        .search-btn {
            background-color: #2a2a8d;
            color: white;
            border: none;
            border-radius: 4px;
            padding: 10px 15px;
            font-size: 14px;
            cursor: pointer;
            margin-left: 10px;
        }

        .zipcode-container {
            display: flex;
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
    </style>
</head>
<body>
    <div class="header">
        <div class="logo">OneTouch</div>
    </div>
    
    <div class="container">
        <div class="sidebar">
            <h2 class="sidebar-title">마이페이지</h2>
            <p class="sidebar-welcome">${member.name}님, 환영합니다!</p>
            
            <ul class="sidebar-menu">
                <li onclick="location.href='shopping';" style="cursor:pointer;">
                    <span class="sidebar-menu-icon">🔍</span>
                    <span class="sidebar-menu-text">쇼핑</span>
                </li>
                <li onclick="location.href='cart';" style="cursor:pointer;">
                    <span class="sidebar-menu-icon">📦</span>
                    <span class="sidebar-menu-text">장바구니</span>
                </li>
                <li onclick="location.href='wishlist';" style="cursor:pointer;">
                    <span class="sidebar-menu-icon">❤</span>
                    <span class="sidebar-menu-text">찜</span>
                </li>
                <li onclick="location.href='order';" style="cursor:pointer;">
                    <span class="sidebar-menu-icon">🔖</span>
                    <span class="sidebar-menu-text">주문/배송 조회</span>
                </li>
            </ul>
            
            <div class="sidebar-divider"></div>
            
            <ul class="sidebar-menu">
                <li onclick="location.href='activity';" style="cursor:pointer;">
                    <span class="sidebar-menu-icon">🔊</span>
                    <span class="sidebar-menu-text">나의 활동</span>
                </li>
                <li onclick="location.href='qna';" style="cursor:pointer;">
                    <span class="sidebar-menu-icon">💬</span>
                    <span class="sidebar-menu-text">상품 Q&A</span>
                </li>
            </ul>
            
            <div class="sidebar-divider"></div>
            
            <ul class="sidebar-menu">
                <li onclick="location.href='memberInfo';" style="cursor:pointer;">
                    <span class="sidebar-menu-text">회원 정보</span>
                </li>
                <li class="sidebar-menu-active" onclick="location.href='editMember';" style="cursor:pointer;">
                    <span class="sidebar-menu-icon">👤</span>
                    <span class="sidebar-menu-text">회원정보 수정</span>
                </li>
                <li onclick="location.href='addressManage';" style="cursor:pointer;">
                    <span class="sidebar-menu-icon">🏠</span>
                    <span class="sidebar-menu-text">배송지 관리</span>
                </li>
                <li onclick="location.href='paymentManage';" style="cursor:pointer;">
                    <span class="sidebar-menu-icon">💳</span>
                    <span class="sidebar-menu-text">결제정보 관리</span>
                </li>
                <li onclick="location.href='logout';" style="cursor:pointer;">
                    <span class="sidebar-menu-icon">📝</span>
                    <span class="sidebar-menu-text">로그아웃</span>
                </li>
            </ul>
        </div>
        
        <div class="main-content">
            <h2 class="content-title">
                <span class="content-title-icon">👤</span>
                회원정보 수정
            </h2>
            
            <form action="updateMember" method="post" id="memberForm">
                <h3>기본 정보</h3>
                
                <div class="form-group">
                    <label class="form-label">아이디</label>
                    <input type="text" class="form-input" value="${member.userId}" readonly>
                </div>
                
                <div class="form-group">
                    <label class="form-label">이름</label>
                    <input type="text" class="form-input" name="name" value="${member.name}">
                </div>

                <div class="form-group">
                    <label class="form-label">이메일</label>
                    <input type="email" class="form-input" name="email" value="${member.email}">
                </div>
                
                <div class="form-group">
                    <label class="form-label">휴대폰번호</label>
                    <input type="tel" class="form-input" name="phone" value="${member.phone}">
                </div>

                <div class="form-group">
                    <label class="form-label">생년월일</label>
                    <input type="date" class="form-input" name="birthDate" value="${member.birthDate}">
                </div>
                
                <div class="form-group">
                    <label class="form-label">새 비밀번호 (변경 시에만 입력)</label>
                    <input type="password" class="form-input" name="newPassword" placeholder="8자 이상">
                </div>
                
                <div class="form-group">
                    <label class="form-label">새 비밀번호 확인</label>
                    <input type="password" class="form-input" name="confirmPassword" placeholder="비밀번호 재입력">
                </div>

                <div class="section-divider"></div>

                <h3>배송지 정보</h3>
                
                <div class="form-group">
                    <label class="form-label">우편번호</label>
                    <div class="zipcode-container">
                        <input type="text" class="form-input zipcode-input" name="zipCode" value="${member.zipCode}">
                        <button type="button" class="search-btn">검색</button>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label">기본배송지</label>
                    <input type="text" class="form-input" name="address" value="${member.address}">
                </div>
                
                <div class="form-group">
                    <label class="form-label">상세주소</label>
                    <input type="text" class="form-input" name="detailAddress" value="${member.detailAddress}">
                </div>
                
                <div class="button-group">
                    <button type="button" class="btn btn-cancel" onclick="resetForm();">취소</button>
                    <button type="submit" class="btn btn-submit" onclick="return validateForm();">저장</button>
                </div>
            </form>
            
            <a href="withdrawMember" class="withdraw-btn" onclick="return confirmWithdraw();">회원탈퇴</a>
        </div>
    </div>

    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/u/13.4.2/postcode.js"></script>
    <script>
        // 폼 검증
        function validateForm() {
            const name = document.querySelector('input[name="name"]').value.trim();
            const email = document.querySelector('input[name="email"]').value.trim();
            const phone = document.querySelector('input[name="phone"]').value.trim();
            const birthDate = document.querySelector('input[name="birthDate"]').value;
            const newPassword = document.querySelector('input[name="newPassword"]').value;
            const confirmPassword = document.querySelector('input[name="confirmPassword"]').value;
            const address = document.querySelector('input[name="address"]').value.trim();
            const detailAddress = document.querySelector('input[name="detailAddress"]').value.trim();
            
            // 이름 확인
            if (name === '') {
                alert('이름을 입력해주세요.');
                document.querySelector('input[name="name"]').focus();
                return false;
            }
            
            if (name.length < 2) {
                alert('이름은 2자 이상이어야 합니다.');
                document.querySelector('input[name="name"]').focus();
                return false;
            }
            
            // 이메일 확인
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (email === '' || !emailRegex.test(email)) {
                alert('올바른 이메일을 입력해주세요.');
                document.querySelector('input[name="email"]').focus();
                return false;
            }
            
            // 휴대폰번호 확인
            const phoneRegex = /^01[0-9]-\d{3,4}-\d{4}$/;
            if (phone === '' || !phoneRegex.test(phone)) {
                alert('올바른 휴대폰번호를 입력해주세요. (예: 010-1234-5678)');
                document.querySelector('input[name="phone"]').focus();
                return false;
            }
            
            // 생년월일 확인
            if (birthDate === '') {
                alert('생년월일을 입력해주세요.');
                document.querySelector('input[name="birthDate"]').focus();
                return false;
            }
            
            // 비밀번호 변경 시 확인
            if (newPassword !== '' || confirmPassword !== '') {
                if (newPassword === '') {
                    alert('새 비밀번호를 입력해주세요.');
                    document.querySelector('input[name="newPassword"]').focus();
                    return false;
                }
                
                if (newPassword.length < 8) {
                    alert('비밀번호는 8자 이상이어야 합니다.');
                    document.querySelector('input[name="newPassword"]').focus();
                    return false;
                }
                
                if (confirmPassword === '') {
                    alert('비밀번호 확인을 입력해주세요.');
                    document.querySelector('input[name="confirmPassword"]').focus();
                    return false;
                }
                
                if (newPassword !== confirmPassword) {
                    alert('비밀번호가 일치하지 않습니다.');
                    document.querySelector('input[name="confirmPassword"]').focus();
                    return false;
                }
            }
            
            // 배송지 확인
            if (address === '') {
                alert('배송지를 검색해주세요.');
                return false;
            }
            
            if (detailAddress === '') {
                alert('상세주소를 입력해주세요.');
                document.querySelector('input[name="detailAddress"]').focus();
                return false;
            }
            
            return true;
        }
        
        // 폼 초기화 (취소 버튼)
        function resetForm() {
            if (confirm('변경사항이 저장되지 않습니다. 정말 취소하시겠습니까?')) {
                document.getElementById('memberForm').reset();
                location.reload();
            }
        }
        
        // 회원탈퇴 확인
        function confirmWithdraw() {
            if (confirm('정말 회원탈퇴 하시겠습니까?\n탈퇴 후 복구가 불가능합니다.')) {
                return true;
            }
            return false;
        }
        
        // 우편번호 검색
        document.querySelector('.search-btn').addEventListener('click', function(e) {
            e.preventDefault();
            
            new daum.Postcode({
                oncomplete: function(data) {
                    var addr = '';
                    var extraAddr = '';
                    
                    if (data.userSelectedType === 'R') {
                        addr = data.roadAddress;
                    } else {
                        addr = data.jibunAddress;
                    }
                    
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    
                    document.querySelector('input[name="zipCode"]').value = data.zonecode;
                    document.querySelector('input[name="address"]').value = addr + extraAddr;
                    document.querySelector('input[name="detailAddress"]').focus();
                },
                onreopen: function(component){
                    component.refresh();
                },
                width : '100%',
                height : '100%'
            }).open();
        });
    </script>
</body>
</html>