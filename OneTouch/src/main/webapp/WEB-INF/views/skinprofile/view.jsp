<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<h4> 피부 진단 결과... </h4>
당신의 피부는 
<c:forEach var="vo" items="${ hash_list }">
	#${ vo.hashtag_name }
</c:forEach>
입니다.
</div>
</body>
</html>