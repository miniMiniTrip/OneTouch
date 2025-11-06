<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품리스트</title>
</head>
<body>


<%@include file="/WEB-INF/views/common/header.jsp" %>


<%-- <jsp:include page="/WEB-INF/views/common/header.jsp"/> --%>
<table align="center" width="600" border="1"
 style="border-collapse:collapse;font-size:8pt"
 bordercolor="navy" cellpadding="4" cellspacing="0">
	<tr bgcolor="#dedede">
		<th width="10%">상품번호</th>
		<th width="10%">카테고리번호</th>
		<th width="10%">찜수</th>
		<th width="10%">제품가격</th>
		<th width="10%">상품명</th>
		<th width="10%">브랜드</th>
		<th width="10%">상품설명</th>
		<th width="10%">재고수량</th>
		<th width="10%">등록시간</th>
		<th width="10%">수정시간</th>
		<th width="10%">테스트</th>
	</tr>

    <!-- 데이터가 없는경우 -->
    <c:if test="${ empty product_list }">
      <tr>
         <td colspan="5" align="center">
            <font color="red">등록된 상품이 없습니다</font>
         </td>
      </tr>
    </c:if>
<%-- 
    <!-- for(ProductVo vo : product_list) -->
    <c:forEach var="vo"  items="${ product_list }">
		<tr align="center">
			<td>${ vo.p_model_num }</td>
			<td><img src="../images/${ vo.p_image_s }" 
				width="100" height="90"></td>
			<td>
			  <a href="view.do?p_idx=${ vo.p_idx }">${ vo.p_name }</a>
			</td>
			<td>
				할인가:<fmt:formatNumber value="${ vo.p_saleprice }"/>원<br>
				<font color="red">
					(${ vo.getDiscountRate() }% DC)
				</font>
			</td>
			<td>
				단가:<fmt:formatNumber value="${ vo.p_price }"/>원
			</td>
		</tr>
	</c:forEach>

</table>
</body>
</html>








--%>
</table>
<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html> 