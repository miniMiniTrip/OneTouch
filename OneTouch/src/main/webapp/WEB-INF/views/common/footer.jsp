

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                                <img src="${pageContext.request.contextPath}/assets/images/logo/white-logo.svg" alt="OneTouch">
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-9 col-md-8 col-12">
                        <div class="footer-newsletter">
                            <h4 class="title">
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
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Footer Top -->
    
    <!-- Start Footer Middle -->
    <div class="footer-middle">
        <div class="container">
            <div class="bottom-inner">
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-12">
                        <!-- Single Widget -->
                        <div class="single-footer f-contact">
                            <h3>OneTouch 소개</h3>
                            <p class="phone">고객센터: 1588-0000</p>
                            <ul>
                                <li><span>평일:</span> 오전 9:00 - 오후 6:00</li>
                                <li><span>이메일:</span> support@onetouch.com</li>
                            </ul>
                        </div>
                        <!-- End Single Widget -->
                    </div>
                    <div class="col-lg-3 col-md-6 col-12">
                        <!-- Single Widget -->
                        <div class="single-footer our-app">
                            <h3>쇼핑 정보</h3>
                            <ul class="app-btn">
                                <li><a href="${pageContext.request.contextPath}/product/list">전체 상품</a></li>
                                <li><a href="${pageContext.request.contextPath}/post/list">커뮤니티</a></li>
                                <li><a href="${pageContext.request.contextPath}/skintest">피부 진단</a></li>
                                <li><a href="${pageContext.request.contextPath}/reviews">리뷰</a></li>
                            </ul>
                        </div>
                        <!-- End Single Widget -->
                    </div>
                    <div class="col-lg-3 col-md-6 col-12">
                        <!-- Single Widget -->
                        <div class="single-footer f-link">
                            <h3>고객 서비스</h3>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/mypage">마이페이지</a></li>
                                <li><a href="${pageContext.request.contextPath}/orders">주문 내역</a></li>
                                <li><a href="${pageContext.request.contextPath}/cart/list.do">장바구니</a></li>
                                <li><a href="${pageContext.request.contextPath}/wishlist/list.do">찜한 상품</a></li>
                            </ul>
                        </div>
                        <!-- End Single Widget -->
                    </div>
                    <div class="col-lg-3 col-md-6 col-12">
                        <!-- Single Widget -->
                        <div class="single-footer f-link">
                            <h3>회사 정보</h3>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/about">회사 소개</a></li>
                                <li><a href="${pageContext.request.contextPath}/mypage/qna_list">문의하기</a></li>
                                <li><a href="${pageContext.request.contextPath}/terms">이용약관</a></li>
                                <li><a href="${pageContext.request.contextPath}/privacy">개인정보처리방침</a></li>
                            </ul>
                        </div>
                        <!-- End Single Widget -->
                    </div>
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
                        <div class="payment-gateway">
                            <span>결제 수단:</span>
                            <img src="${pageContext.request.contextPath}/assets/images/footer/credit-cards-footer.png" alt="Payment Methods">
                        </div>
                    </div>
                    <div class="col-lg-4 col-12">
                        <div class="copyright">
                            <p>© 2025 <a href="${pageContext.request.contextPath}/" rel="nofollow">OneTouch</a> - All Rights Reserved</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-12">
                        <ul class="socila">
                            <li>
                                <span>팔로우:</span>
                            </li>
                            <li><a href="javascript:void(0)"><i class="lni lni-facebook-filled"></i></a></li>
                            <li><a href="javascript:void(0)"><i class="lni lni-twitter-original"></i></a></li>
                            <li><a href="javascript:void(0)"><i class="lni lni-instagram"></i></a></li>
                            <li><a href="javascript:void(0)"><i class="lni lni-youtube"></i></a></li>
                        </ul>
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