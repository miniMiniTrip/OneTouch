<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
						<a href="?sort=rating"
							class="tab-btn ${param.sort == 'rating' || empty param.sort ? 'active' : ''}">베스트순</a>
						<a href="?sort=date"
							class="tab-btn ${param.sort == 'date' ? 'active' : ''}">최신순</a>
					</div>
					<!--불필요해보여서 뷰에 나타내지 않음 -->
					
					<div class="reviews">
					 <button onclick="location.href='/post/insert?category=review&product_idx=${product.product_idx}';">✎ 리뷰쓰기</button>
					 </div>
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

					<!-- 개별 리뷰 아이템 -->
					<div class="review-item">
						<div class="reviewer-info">
							<div class="reviewer-avatar">
								<span>뷰</span>
							</div>
							<div class="reviewer-details">
								<div class="reviewer-name">뷰티리뷰어</div>
								<div class="review-rating">★★★★★</div>
								<div class="review-date">2025.11.28</div>
								<div class="reviewer-type">구매상품 : ${product.product_name}</div>
							</div>
						</div>

						<div class="review-content">


							<!--  커뮤니티에 있는 사진 연결해 주세여 --> <!--  커뮤니티에 있는 사진 연결해 주세여 -->
							<div class="review-images">
								<img src="review-img1.jpg" alt="리뷰이미지"> 
								<img src="review-img2.jpg" alt="리뷰이미지"> 
							    <img src="review-img3.jpg" alt="리뷰이미지"> 
								<img src="review-img4.jpg" alt="리뷰이미지"> 
								<img src="review-img5.jpg" alt="리뷰이미지"> 
								<img src="review-img6.jpg" alt="리뷰이미지"> 
								<img src="review-img7.jpg" alt="리뷰이미지">
							</div>

							<div class="review-text">
								<p>데일리 수분 세럼 사용 리뷰</p>
								<p>[구매 동기 및 제품 특징]</p>
								<p>요즘 환절기라 피부가 푸석해져서 수분감을 채워줄 세럼을 찾던 중, 성분이 순하고 보습력이 좋다는 후기를
									보고 선택했습니다. 실제로 발림성이 매우 부드럽고 끈적임 없이 빠르게 흡수됩니다. 메이크업 전에 사용해도 밀림
									없이 잘 올라가요.</p>
							</div>
						</div>
					</div>

				

					<div class="review-item">
						<div class="reviewer-info">
							<div class="reviewer-avatar">
								<span>김</span>
							</div>
							<div class="reviewer-details">
								<div class="reviewer-name">김**님</div>
								<div class="review-rating">★★★★★</div>
								<div class="review-date">2024.11.15</div>
							</div>
						</div>
						<div class="review-content">
							<div class="review-text">
								<p>촉촉한데 끈적이지 않아서 정말 좋아요! 세럼인데도 가볍고 흡수력도 빨라서 데일리로 쓰기 딱 좋습니다.
									향도 은은해서 계속 손이 가네요.</p>
							</div>
						</div>
					</div>

					<div class="review-item">
						<div class="reviewer-info">
							<div class="reviewer-avatar">
								<span>박</span>
							</div>
							<div class="reviewer-details">
								<div class="reviewer-name">박**님</div>
								<div class="review-rating">★★★★☆</div>
								<div class="review-date">2024.11.10</div>
							</div>
						</div>
						<div class="review-content">
							<div class="review-text">
								<p>민감성 피부인데도 트러블 없이 잘 맞아요. 바르자마자 피부가 편안해지는 느낌이에요. 보습도 꽤
									오래갑니다.</p>
							</div>
						</div>
					</div>

					<div class="review-item">
						<div class="reviewer-info">
							<div class="reviewer-avatar">
								<span>이</span>
							</div>
							<div class="reviewer-details">
								<div class="reviewer-name">이**님</div>
								<div class="review-rating">★★★★★</div>
								<div class="review-date">2024.11.05</div>
							</div>
						</div>
						<div class="review-content">
							<div class="review-text">
								<p>배송도 빠르고 제품 상태도 완벽했어요. 사용감도 너무 좋고 수분감이 오래 지속되네요. 재구매 의사
									100%입니다.</p>
							</div>
						</div>
					</div>

				</div>

			</div>
		</div>
</body>
</html>