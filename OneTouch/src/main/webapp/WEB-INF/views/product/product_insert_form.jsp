<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OneTouch 쇼핑몰 - 상품 관리</title>
<style>
    body {
        font-family: 'Malgun Gothic', sans-serif;
        margin: 0;
        padding: 0;
    }
    
    .button {
        background-color: #1a237e;
        color: white;
        border: none;
        padding: 8px 16px;
        border-radius: 4px;
        cursor: pointer;
        font-size: 14px;
        margin-bottom: 10px;
    }
    
    .container {
        width: 900px;
        margin: 20px auto;
    }
    
    table {
        width: 100%;
        border-collapse: collapse;
        font-size: 9pt;
    }
    
    th {
        background-color: #dedede;
        padding: 8px;
        text-align: center;
    }
    
    td {
        padding: 8px;
        text-align: center;
        border: 1px solid navy;
    }
    
    a {
        text-decoration: none;
        color: #000;
    }
    
    a:hover {
        text-decoration: underline;
        color: #1a237e;
    }
    
    /* 모달 스타일 */
    .modal {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0,0,0,0.7);
    }
    
    .modal-content {
        background-color: white;
        margin: 10% auto;
        padding: 20px;
        width: 60%;
        max-width: 600px;
        border-radius: 5px;
    }
    
    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
        cursor: pointer;
    }
    
    .close:hover {
        color: black;
    }
    
    .form-group {
        margin-bottom: 15px;
    }
    
    .form-group label {
        display: inline-block;
        width: 120px;
        font-weight: bold;
    }
    
    .form-group input, .form-group textarea {
        width: 70%;
        padding: 5px;
    }
    
    .form-buttons {
        text-align: center;
        margin-top: 15px;
    }
</style>
</head>
<body>
<!--헤더추가-->
<%@include file="/WEB-INF/views/common/header.jsp" %>

<div class="container">
    <div style="text-align: right; margin-bottom: 10px;">
        <button id="openModal" class="button">상품등록</button>
    </div>

    <table border="1" bordercolor="navy" cellpadding="4" cellspacing="0">
        <tr bgcolor="#dedede">
            <th width="10%">상품번호</th>
            <th width="10%">이미지</th>
            <th width="10%">카테고리번호</th>
            <th width="20%">상품명</th>
            <th width="10%">브랜드</th>
            <th width="10%">가격</th>
            <th width="10%">재고수량</th>
            <th width="10%">찜수</th>
            <th width="10%">관리</th>
        </tr>

        <!-- 데이터가 없는경우 -->
        <c:if test="${ empty product_list }">
            <tr>
                <td colspan="9" align="center">
                    <font color="red">등록된 상품이 없습니다</font>
                </td>
            </tr>
        </c:if>

        <!-- for(ProductVo __vo__ : product_list) -->
        <c:forEach var="vo" items="${ product_list }">
            <tr align="center">
                <td>${ vo.product_idx }</td>
                <td>
                    <img src="../images/${ vo.product_image_url }" width="60" height="50">
                </td>
                <td>${ vo.category_idx }</td>
                <td>
                    <a href="view.do?product_idx=${ vo.product_idx }">${ vo.product_name }</a>
                </td>
                <td>${ vo.product_brand }</td>
                <td><fmt:formatNumber value="${ vo.product_price }"/>원</td>
                <td>${ vo.product_cnt }개</td>
                <td>${ vo.product_wishlist }</td>
                <td>
                    <button class="button" style="padding: 3px 8px; font-size: 8pt;" 
                            onclick="location.href='modify.do?product_idx=${ vo.product_idx }'">수정</button>
                    <button class="button" style="padding: 3px 8px; font-size: 8pt; background-color: #e53935;" 
                            onclick="if(confirm('정말 삭제하시겠습니까?')) location.href='delete.do?product_idx=${ vo.product_idx }'">삭제</button>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

<!-- 상품등록 모달 -->
<div id="productModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>상품 등록</h2>
        <form action="insert.do" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label>상품번호:</label>
                <input type="text" name="product_idx" required>
            </div>
            <div class="form-group">
                <label>카테고리번호:</label>
                <input type="text" name="category_idx" required>
            </div>
            <div class="form-group">
                <label>상품명:</label>
                <input type="text" name="product_name" required>
            </div>
            <div class="form-group">
                <label>브랜드:</label>
                <input type="text" name="product_brand">
            </div>
            <div class="form-group">
                <label>가격:</label>
                <input type="number" name="product_price" required>
            </div>
            <div class="form-group">
                <label>상품설명:</label>
                <textarea name="product_comment" rows="3"></textarea>
            </div>
            <div class="form-group">
                <label>재고수량:</label>
                <input type="number" name="product_cnt" value="0">
            </div>
            <div class="form-group">
                <label>찜수:</label>
                <input type="number" name="product_wishlist" value="0">
            </div>
            <div class="form-group">
                <label>등록시간:</label>
                <input type="time" name="product_time">
            </div>
            <div class="form-group">
                <label>수정시간:</label>
                <input type="time" name="product_update">
            </div>
            <div class="form-group">
                <label>상품 이미지:</label>
                <input type="file" name="product_image">
            </div>
            <div class="form-buttons">
                <button type="submit" class="button">등록하기</button>
                <button type="button" class="button" style="background-color: #9e9e9e;" onclick="closeModal()">취소</button>
            </div>
        </form>
    </div>
</div>

<script>
    // 모달 관련 스크립트
    var modal = document.getElementById("productModal");
    var btn = document.getElementById("openModal");
    var span = document.getElementsByClassName("close")[0];
    
    // 버튼 클릭시 모달 열기
    btn.onclick = function() {
        modal.style.display = "block";
    }
    
    // x 클릭시 모달 닫기
    span.onclick = function() {
        modal.style.display = "none";
    }
    
    // 모달 외부 클릭시 닫기
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
    
    // 취소 버튼 클릭시 모달 닫기
    function closeModal() {
        modal.style.display = "none";
    }
</script>

</body>
</html>
