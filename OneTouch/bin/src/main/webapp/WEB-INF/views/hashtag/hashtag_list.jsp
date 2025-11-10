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
<title>Insert title here</title>
<script type="text/javascript">
function deleteHash(hashtag_idx){
	if(confirm("정말 해시태그를 삭제하시겠습니까?")==false) return;
	
	location.href = "delete.do?hashtag_idx=" + hashtag_idx;
}
</script>
</head>
<body>
		
<c:forEach var="vo" items="${ hashtag_list }">
<button type="button" class="btn btn-primary btn-small" onclick="deleteHash(${ vo.hashtag_idx });">
#${ vo.hashtag_name }
</button>
</c:forEach>
		
</body>
</html>