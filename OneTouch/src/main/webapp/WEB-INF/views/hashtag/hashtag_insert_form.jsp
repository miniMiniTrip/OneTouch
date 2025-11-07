<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/LineIcons.3.0.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/tiny-slider.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/glightbox.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<meta charset="UTF-8">
<title>hashtag insert for admin test</title>
<script type="text/javascript">
	const hashtag_regular = /^[^\s#]+$/;
	
	function send(f){
		
		let hashtag_name = f.hashtag_name.value.trim();
		if(hashtag_name === ""){
	        alert("해시태그 이름을 입력해주세요.");
	        return;
	    }
		if(hashtag_regular.test(hashtag_name)==false){
			alert("#, 띄어쓰기를 제외한 문자를 입력해주세요."); 
			return;}
		console.log(hashtag_name);
		f.action="${pageContext.request.contextPath}/hashtag/insert.do";
		f.submit();
	}

</script>
</head>
<body>
<%-- <c:if test="${ mem.roll eq admin }"> --%>
<div>
	<form method="post">
		<div>
			<br>
			<br>
			<br>
			<h5>해시태그 등록하기</h5>
			<input name="hashtag_name" type="text" class="form-inline">
			<input type="button" value="등록하기" onclick="send(this.form);">
		</div> 
	</form>
	<br>
	<br>
</div>
<%-- </c:if> --%>
</body>
</html>