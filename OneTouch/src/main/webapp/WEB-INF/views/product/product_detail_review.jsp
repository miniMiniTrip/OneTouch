<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* 프로필 사진 */
.comment-profile-img {
    width: 50px;
    height: 50px;
    border-radius: 50%;
}

  /* 부모 div 스타일 */
  .reviews-container {
    display: flex;
    justify-content: center; /* 가로 가운데 */
    align-items: center;     /* 세로 가운데 */
    height: 200px;           /* 원하는 높이로 조정 */
    border: 1px solid #ddd;
    border-radius: 8px;
    background-color: #f9f9f9;
    font-family: 'Arial', sans-serif;
  }

  /* 메시지 스타일 */
  .no-review {
    text-align: center;
    color: #888;
    font-size: 16px;
  }


@media (max-width: 767px) {
    .reviewer-profile {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 70px;          /* 고정 너비 줘야 함! */
        height: 70px;         /* 고정 높이 필수!! */
        margin: 0 auto;       /* 이 div 자체를 가운데로 (부모가 flex 아니면) */
    }

    .comment-profile-img {
        width: 50px;
        height: 50px;
        border-radius: 50%;
        object-fit: cover;
    }
	.review-images{
		display: flex;
        justify-content: center;
        align-items: center
        }
	.review-text{
	    text-align: center;        /* 혹시 모를 안전장치 */
	}
	
}
</style>
</head>
<body>
<div class="review-container">
			<!-- 좌측: 리뷰 통계 -->
			<div class="review-stats">
				<div class="review-summary">
					<h3>상품 리뷰</h3>
					<div class="rating-summary">
						<div class="total-rating">
							<span class="stars">★★★★☆</span> <span class="rating-score">3,085</span>
						</div>
						<div class="rating-count">
							<span class="info-icon">ⓘ</span> 2,000명 이상 만족했어요
						</div>
					</div>

					<div class="rating-breakdown">
						<div class="rating-row">
							<span>최고</span>
							<div class="rating-bar">
								<div class="bar-fill" style="width: 82%"></div>
							</div>
							<span>82%</span>
						</div>
						<div class="rating-row">
							<span>좋음</span>
							<div class="rating-bar">
								<div class="bar-fill orange" style="width: 11%"></div>
							</div>
							<span>11%</span>
						</div>
						<div class="rating-row">
							<span>보통</span>
							<div class="rating-bar">
								<div class="bar-fill gray" style="width: 5%"></div>
							</div>
							<span>5%</span>
						</div>
						<div class="rating-row">
							<span>별로</span>
							<div class="rating-bar">
								<div class="bar-fill light-gray" style="width: 1%"></div>
							</div>
							<span>1%</span>
						</div>
						<div class="rating-row">
							<span>나쁨</span>
							<div class="rating-bar">
								<div class="bar-fill light-gray" style="width: 1%"></div>
							</div>
							<span>1%</span>
						</div>
					</div>

					<div class="taste-stats">
						<div class="taste-row">
							<span>발림성</span> <span>부드럽고 잘 발려요</span> <span>92%</span>
						</div>
						<div class="taste-row">
							<span>보습력</span> <span>촉촉해요</span> <span>88%</span>
						</div>
						<div class="taste-row">
							<span>지속력</span> <span>오래가요</span> <span>80%</span>
						</div>
						<div class="taste-row">
							<span>자극도</span> <span>자극 없어요</span> <span>95%</span>
						</div>
						<div class="taste-row">
							<span>향</span> <span>은은해요</span> <span>75%</span>
						</div>


					</div>

				</div>
			</div>

			<!-- 우측: 개별 리뷰 -->
			<div class="review-list">
				<div class="review-header-section">
					<div class="review-tabs">
					
						<!--회신순/ 베스트순/ 별점 연결해주세요! -->
						<%-- <a href="?sort=rating"
							class="tab-btn ${param.sort == 'rating' || empty param.sort ? 'active' : ''}">베스트순</a>
						<a href="?sort=date"
							class="tab-btn ${param.sort == 'date' ? 'active' : ''}">최신순</a> --%>
					</div>
					<!--불필요해보여서 뷰에 나타내지 않음 -->
					
					<%-- <div class="reviews">
					 <button onclick="location.href='/post/insert?category=review&product_idx=${product.product_idx}';">✎ 리뷰쓰기</button>
					 </div> --%>
			<%-- 		<div class="review-search"> 
						<input type="text" placeholder="검색어를 입력하세요" class="search-input">
						<select class="sort-select">
							<option value="all">모든별점⭐⭐⭐⭐⭐ (${totalReviews})</option>
							<c:forEach var="rating" items="${ratingCounts}">
								<option value="${rating.stars}">${rating.label}
									<c:forEach begin="1" end="${rating.stars}">⭐</c:forEach>
									(${rating.count})
								</option>
							</c:forEach>
						</select>
					</div> --%>
				</div>



				<div class="review-items">
					<c:if test="${ orderReviewPostVo ==null or empty orderReviewPostVo}">
							<div class="reviews-container">
							  <div class="no-review">등록된 리뷰가 없습니다.</div>
							</div>
					</c:if>					
					<!-- 개별 리뷰 아이템 -->
					<c:forEach var="postVo" items="${orderReviewPostVo }">
						<c:if test="${postVo.order_item_id !=0 }">
						<div class="review-item">
							<div class="reviewer-info">
								<div class="reviewer-profile">
									<img src="${pageContext.request.contextPath}/images/mem/${postVo.mem_image_url}" 
		                                  alt="프로필" class="comment-profile-img"> 
								</div>
								<div class="reviewer-details">
									<div class="reviewer-name">${postVo.mem_id }</div>
									
									<!-- 별점 -->
									<div class="review-rating">
									    <c:set var="rating" value="${postVo.post_rating}" />
									    
									    <!-- 정수 부분 -->
									    <c:set var="fullStars" value="${fn:split(rating, '.')[0]}" />
									    
									    <!-- 소수 부분 (0~1 사이 값) -->
									    <c:set var="decimal" value="${rating - fullStars}" />
									
									    <!-- 채워진 별 출력 -->
									    <c:forEach var="i" begin="1" end="${fullStars}">
									        ★
									    </c:forEach>
									
									    <!-- 반 별 출력 (소수점 0.5 이상일 경우) -->
									    <c:if test="${decimal >= 0.5}">
									        ⯨ <!-- 반 별 기호, 원하는 기호나 이미지로 변경 가능 -->
									    </c:if>
									
									    <!-- 빈 별 출력 -->
									    <c:forEach var="i" begin="1" end="${5 - fullStars - (decimal >= 0.5 ? 1 : 0)}">
									        ☆
									    </c:forEach>
									
									    (${rating})
									</div>
									<!-- /별점 -->


									<div class="review-date">${postVo.post_time }</div>
									<div class="reviewer-type">구매상품 : ${postVo.product_name}</div>
								</div>
							</div>
	
							<div class="review-content">
	
	
								<!--  커뮤니티에 있는 사진 연결해 주세여 --> <!--  커뮤니티에 있는 사진 연결해 주세여 -->
								<div class="review-images">
								    <c:if test="${not empty postVo.post_image}">
								        <c:set var="imgList" value="${fn:split(postVo.post_image, '*')}" />
								
								        <c:forEach var="img" items="${imgList}">
								            <img src="${pageContext.request.contextPath }/images/posts/reviews/${img}" alt="리뷰이미지">
								        </c:forEach>
								    </c:if>
								</div>
	
								<div class="review-text">
									<p>${postVo.product_name } 사용 리뷰</p>
									<p>[${postVo.post_title }]</p>
									<p>${postVo.post_content }</p>
								</div>
							</div>
						</div>
						</c:if>
					</c:forEach>

				</div>
				<br>
				<br>
				<br>
				<br>
				<br>




			</div>
		</div>
</body>
</html>