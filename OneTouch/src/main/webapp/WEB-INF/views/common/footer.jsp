
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
.app-btn {
    display: flex;
    list-style: none;
    padding: 0;
    margin: 0;
    flex-wrap: wrap; /* 화면이 좁으면 다음 줄로 넘어감 */
    gap: 4px; /* margin-right 대신 gap 사용 */
}

.app-btn li {
    /* margin-right 제거하고 gap 사용 */
}

.app-btn a {
    text-decoration: none;
    padding: 6px 6px;
    display: block;
    color: white;
    white-space: nowrap; /* 텍스트가 줄바꿈되지 않도록 */
    font-size: 14px; /* 기본 폰트 크기 */
}

/* 태블릿 크기 (768px 이하) */
@media (max-width: 768px) {
    .app-btn {
        justify-content: center; /* 중앙 정렬 */
        gap: 2px;
    }
    
    .app-btn a {
        padding: 4px 4px;
        font-size: 12px;
    }
    
    /* | 구분자와 공백을 줄임 */
    .app-btn li a:not(:last-child) {
        /* 마지막이 아닌 요소들의 | 구분자 공백 조정 */
    }
}

/* 모바일 크기 (480px 이하) */
@media (max-width: 480px) {
    .app-btn {
        flex-direction: column; /* 세로 배치로 변경 */
        align-items: center;
        gap: 5px;
    }
    
    .app-btn a {
        padding: 8px 12px;
        font-size: 14px;
        text-align: center;
        border-bottom: 1px solid rgba(255,255,255,0.2);
        width: 100%;
    }
    
    /* 모바일에서는 | 구분자 제거 */
    .app-btn li:not(:last-child) a::after {
        content: none;
    }
}

/* 매우 작은 화면 (360px 이하) */
@media (max-width: 360px) {
    .app-btn a {
        font-size: 13px;
        padding: 6px 8px;
    }
}

</style>

<!-- Start Footer Area -->
<footer class="footer">
    <!-- Start Footer Top -->
    <div class="footer-top">
        <div class="container">
            <div class="inner-content">
                <div class="row">
                    <div class="col-lg-3 col-md-4 col-12">
                        <div class="footer-logo">
                            <a href="${pageContext.request.contextPath}/">
                                <img src="${pageContext.request.contextPath}/assets/images/logo/onetouch_logo.png" alt="OneTouch"
                                style="width: 150px; height: auto;">
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-9 col-md-8 col-12">
                        <div class="footer-newsletter">
                           <%--  <h4 class="title">
                                뉴스레터 구독
                                <span>최신 정보와 특별 혜택을 받아보세요.</span>
                            </h4>
                            <div class="newsletter-form-head">
                                <form action="${pageContext.request.contextPath}/newsletter/subscribe" method="post" class="newsletter-form">
                                    <input name="email" placeholder="이메일 주소를 입력하세요" type="email" required>
                                    <div class="button">
                                        <button class="btn" type="submit">구독하기 <span class="dir-part"></span></button>
                                    </div>
                                </form>
                            </div> --%>
                             <ul class="app-btn">
                                <li><a href="${pageContext.request.contextPath}/product/list">전체 상품&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|</a></li>
                                <li><a href="${pageContext.request.contextPath}/post/list">커뮤니티&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|</a></li>
                                <li><a href="${pageContext.request.contextPath}/skintest">피부 진단&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|</a></li>
                                <li><a href="${pageContext.request.contextPath}/reviews">리뷰&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|</a></li>
          
                                <li><a href="${pageContext.request.contextPath}/mypage">마이페이지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|</a></li>
                                <li><a href="${pageContext.request.contextPath}/orders">주문 내역&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|</a></li>
                                <li><a href="${pageContext.request.contextPath}/cart/list.do">장바구니&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|</a></li>
                                <li><a href="${pageContext.request.contextPath}/wishlist/list.do">찜한 상품&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|</a></li>
                                <li><a href="${pageContext.request.contextPath}/mypage/qna_list">문의하기</a></li>
                               
                                <li><a href="${pageContext.request.contextPath}/privacy">개인정보처리방침</a></li>
                                <li><a href="${pageContext.request.contextPath}/terms">이용약관</a></li>
                              
                           		</ul>
                        		<ul>
                                <li>&nbsp;&nbsp;평일: 오전 9:00 - 오후 6:00 &nbsp;&nbsp;
                               서울특별시 관악구 남부순환로 1820&nbsp;&nbsp;이메일: support@onetouch.com<br>
                              &nbsp;&nbsp;365고객센터&nbsp;&nbsp;|&nbsp;&nbsp;전자금융거래분쟁처리담당&nbsp;&nbsp;1577-1234 
                                </li> </ul>
                                <ul>
                                <br>
                                <li>&nbsp;&nbsp;상호명 및 호스팅 서비스 제공 : 원터치(주)<br>
                                &nbsp;&nbsp;서울특별시 관악구 남부순환로 1820 7층<br>
                                &nbsp;&nbsp;사업자 등록번호:123-45-6789<br>
                                &nbsp;&nbsp;통신판매업신고:2025-서울관악-1234
                                </li>
                               
                                
                     			<li> &nbsp;&nbsp;채무지급보증 안내:당사는 고객님이 현금 결제한 금액에 대해
채무지급보증 계약을 체결하여
안전거래를 보장하고 있습니다.</li>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Footer Top -->
    
    <!-- Start Footer Middle -->
    <!-- <div class="footer-middle">
        <div class="container">
            <div class="bottom-inner">
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-12">
                        Single Widget
                        <div class="single-footer f-contact">
                            <h3>OneTouch 소개</h3>
                            <p class="phone">고객센터: 1588-0000</p>
                            <ul>
                                <li><span>평일:</span> 오전 9:00 - 오후 6:00</li>
                                <li><span>이메일:</span> support@onetouch.com</li>
                            </ul>
                        </div>
                        End Single Widget
                    </div> -->
                    <!-- <div class="col-lg-3 col-md-6 col-12"> -->
                        <!-- Single Widget -->
                        <!-- <div class="single-footer our-app">
                            <h3>쇼핑 정보</h3> -->
                         <%--    <ul class="app-btn">
                                <li><a href="${pageContext.request.contextPath}/product/list">전체 상품</a></li>
                                <li><a href="${pageContext.request.contextPath}/post/list">커뮤니티</a></li>
                                <li><a href="${pageContext.request.contextPath}/skintest">피부 진단</a></li>
                                <li><a href="${pageContext.request.contextPath}/reviews">리뷰</a></li>
                            </ul> --%>
                        <!-- </div> -->
                        <!-- End Single Widget -->
                    <!-- </div> -->
                    <!-- <div class="col-lg-3 col-md-6 col-12"> -->
                        <!-- Single Widget -->
                       <%--  <div class="single-footer f-link">
                            <h3>고객 서비스</h3>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/mypage">마이페이지</a></li>
                                <li><a href="${pageContext.request.contextPath}/orders">주문 내역</a></li>
                                <li><a href="${pageContext.request.contextPath}/cart/list.do">장바구니</a></li>
                                <li><a href="${pageContext.request.contextPath}/wishlist/list.do">찜한 상품</a></li>
                                <li><a href="${pageContext.request.contextPath}/mypage/qna_list">문의하기</a></li>
                            </ul>
                        </div> --%>
                        <!-- End Single Widget -->
                   <!--  </div> -->
                   <!--  <div class="col-lg-3 col-md-6 col-12"> -->
                        <!-- Single Widget -->
                      
                       <%--  <div class="single-footer f-link">
                            <h3>회사 정보</h3>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/about">회사 소개</a></li>
                               
                                <li><a href="${pageContext.request.contextPath}/terms">이용약관</a></li>
                                <li><a href="${pageContext.request.contextPath}/privacy">개인정보처리방침</a></li>
                            </ul>
                        </div> --%>
                        
                        <!-- End Single Widget -->
                   <!--  </div> -->
                </div>
            </div>
        </div>
    </div>
    <!-- End Footer Middle -->
    
    <!-- Start Footer Bottom -->
    <div class="footer-bottom">
        <div class="container">
            <div class="inner-content">
                <div class="row align-items-center">
                    <div class="col-lg-4 col-12">
                        <%-- <div class="payment-gateway">
                            <span>결제 수단:</span>
                            <img src="${pageContext.request.contextPath}/assets/images/footer/credit-cards-footer.png" alt="Payment Methods">
                        </div> --%>
                    </div>
                    <div class="col-lg-4 col-12">
                        <div class="copyright">
                            <p>© 2025 <a href="${pageContext.request.contextPath}/" rel="nofollow">OneTouch</a> - All Rights Reserved</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-12">
                        <!-- ul class="socila">
                            <li>
                                <span>팔로우:</span>
                            </li>
                            <li><a href="javascript:void(0)"><i class="lni lni-facebook-filled"></i></a></li>
                            <li><a href="javascript:void(0)"><i class="lni lni-twitter-original"></i></a></li>
                            <li><a href="javascript:void(0)"><i class="lni lni-instagram"></i></a></li>
                            <li><a href="javascript:void(0)"><i class="lni lni-youtube"></i></a></li>
                        </ul> -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Footer Bottom -->
</footer>
<!-- End Footer Area -->

<!-- Scroll to Top Button -->
<a href="#" class="scroll-top">
    <i class="lni lni-chevron-up"></i>
</a> 