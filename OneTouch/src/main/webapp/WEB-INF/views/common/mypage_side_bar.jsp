<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

/* ==================== 사이드바 스타일 ==================== */
.sidebar {
    width: 250px;
    background: #fafafa;
    border-right: 1px solid #e0e0e0;
    padding: 30px 0;
    min-height: calc(100vh - 400px);
}

.sidebar-header {
    padding: 15px 30px;
    font-size: 18px;
    font-weight: 700;
    color: #333;
}

.sidebar-subtitle {
    padding: 5px 30px 20px;
    font-size: 13px;
    color: #999;
}

.menu-section {
    margin: 25px 0;
}

.menu-title {
    padding: 10px 30px;
    font-size: 12px;
    color: #999;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

.menu-item {
    padding: 14px 30px;
    font-size: 14px;
    color: #333;
    cursor: pointer;
    display: flex;
    align-items: center;
    transition: all 0.3s;
    border-left: 3px solid transparent;
    text-decoration: none;
}

.menu-item:hover {
    background: #f0f0f0;
    padding-left: 35px;
    color: #333;
}

.menu-item.active {
    background: #e8eaf6;
    color: #5c6bc0;
    font-weight: 600;
    border-left: 3px solid #5c6bc0;
}


</style>

</head>
<body>
<!-- Sidebar -->
				<div class="sidebar">
				    
				    <div class="menu-section">
				        <div class="menu-item" onclick="location.href='${pageContext.request.contextPath}/cart/list.do'">
				        	<a href="${pageContext.request.contextPath}/cart/list.do">🛒 장바구니</a>
				        </div>
				        
				         <div class="menu-item" onclick="location.href='${pageContext.request.contextPath}/wishlist/list.do'"> 
				        	<a href="${pageContext.request.contextPath}/wishlist/list.do">💝 찜</a>
				        </div>
				       
				        <div class="menu-item">
				      	  <a href="${pageContext.request.contextPath}/order/list.do?mem_idx=${sessionScope.mem_idx}">🎯 주문/배송 조회</a>
                        </div>
                        
                        <div class="menu-item"> 
                          <a href="${pageContext.request.contextPath}/mypage/skinprofile.do"> 🔬 피부 프로필 </a>
                        </div>
                        
                        <div class="menu-item"> 
                          <a href="${pageContext.request.contextPath}/skin/form.do"> 🔬 피부 진단 </a>
                        </div>
				   	</div>
				    
				    <div class="menu-section">
				        <div class="menu-title">나의 활동</div>
				     
				     <!-- 상품QNA -->
				     
				     <div class="menu-item" onclick="location.href='${pageContext.request.contextPath}/mypage/qna_list'"> 
				        	<a href="${pageContext.request.contextPath}/mypage/qna_list">💝 상품 Q&A</a>
				        </div> 
				       
				       
				        <div class="menu-item">📝 내가 쓴 글</div>
				    </div>
				    
				    <div class="menu-section">
				        <div class="menu-title">회원 정보</div>
				        <div class="menu-item" onclick="location.href='${pageContext.request.contextPath}/user/check_password'">👥 회원정보 수정</div>
					</div>
	                    
					<div class="menu-section">
						<div class="menu-item active">📝 로그아웃</div>
	            	</div>
	            </div>
                
                
</body>
</html>
