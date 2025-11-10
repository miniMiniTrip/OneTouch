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
</head>
<body>
		
<c:forEach var="vo" items="${ hashtag_list }">
<input type="hidden" value="${ vo.hashtag_idx } }">
<button type="button" class="btn btn-primary btn-small" onclick="delete();">
#${ vo.hashtag_name }
</button>
</c:forEach>
		
</body>
<script type="text/javascript">
function delete(){
	if(confirm("정말 해시태그를 삭제하시겠습니까?")==false) return;
	
	action = "delete.do";
}
</script>
</html>