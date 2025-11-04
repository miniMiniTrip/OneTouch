<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
    /* 푸터 스타일 */
    .footer {
        background: #2c3e50;
        color: #ecf0f1;
        padding: 30px 0;
        margin-top: 80px;
    }

    .footer-container {
        max-width: 1400px;
        margin: 0 auto;
        padding: 0 40px;
    }

    .footer-top {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding-bottom: 25px;
    }

    .footer-left {
        display: flex;
        align-items: center;
        gap: 40px;
    }

    .footer-logo {
        font-size: 24px;
        font-weight: bold;
        color: white;
    }

    .footer-logo span {
        color: #3949ab;
    }

    .footer-links {
        display: flex;
        gap: 30px;
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .footer-links a {
        color: #ecf0f1;
        text-decoration: none;
        font-size: 14px;
        transition: color 0.3s;
    }

    .footer-links a:hover {
        color: #3949ab;
    }

    .footer-social {
        display: flex;
        gap: 12px;
    }

    .social-icon {
        width: 36px;
        height: 36px;
        background: #34495e;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
        text-decoration: none;
        font-size: 18px;
        transition: all 0.3s;
    }

    .social-icon:hover {
        background: #3949ab;
        transform: translateY(-3px);
    }

    .footer-divider {
        height: 1px;
        background: rgba(255, 255, 255, 0.1);
        margin: 0;
    }

    .footer-bottom {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding-top: 25px;
    }

    .footer-email {
        font-size: 14px;
        color: #95a5a6;
    }

    .footer-email a {
        color: #ecf0f1;
        text-decoration: none;
        transition: color 0.3s;
    }

    .footer-email a:hover {
        color: #3949ab;
    }

    .footer-copyright {
        font-size: 14px;
        color: #95a5a6;
    }

    /* 반응형 */
    @media (max-width: 768px) {
        .footer-container {
            padding: 0 20px;
        }

        .footer-top {
            flex-direction: column;
            gap: 25px;
            text-align: center;
        }

        .footer-left {
            flex-direction: column;
            gap: 20px;
        }

        .footer-links {
            flex-direction: column;
            gap: 15px;
        }

        .footer-bottom {
            flex-direction: column;
            gap: 15px;
            text-align: center;
        }
    }
</style>

<footer class="footer">
    <div class="footer-container">
        <!-- 상단: 로고 + 링크 + 소셜 -->
        <div class="footer-top">
            <div class="footer-left">
                <div class="footer-logo">One<span>Touch</span></div>
                
                <ul class="footer-links">
                    <li><a href="company.jsp">회사소개</a></li>
                    <li><a href="guide.jsp?tab=terms">이용약관</a></li>
                    <li><a href="guide.jsp?tab=privacy">개인정보취급방침</a></li>
                    <li><a href="customer.jsp?tab=faq">고객센터(FAQ게시판)</a></li>
                </ul>
            </div>

            <div class="footer-social">
                <a href="https://www.facebook.com" target="_blank" class="social-icon" title="Facebook">
                    <svg width="18" height="18" fill="currentColor" viewBox="0 0 24 24">
                        <path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z"/>
                    </svg>
                </a>
                <a href="https://www.instagram.com" target="_blank" class="social-icon" title="Instagram">
                    <svg width="18" height="18" fill="currentColor" viewBox="0 0 24 24">
                        <path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zm0-2.163c-3.259 0-3.667.014-4.947.072-4.358.2-6.78 2.618-6.98 6.98-.059 1.281-.073 1.689-.073 4.948 0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98-1.281-.059-1.69-.073-4.949-.073zm0 5.838c-3.403 0-6.162 2.759-6.162 6.162s2.759 6.163 6.162 6.163 6.162-2.759 6.162-6.163c0-3.403-2.759-6.162-6.162-6.162zm0 10.162c-2.209 0-4-1.79-4-4 0-2.209 1.791-4 4-4s4 1.791 4 4c0 2.21-1.791 4-4 4zm6.406-11.845c-.796 0-1.441.645-1.441 1.44s.645 1.44 1.441 1.44c.795 0 1.439-.645 1.439-1.44s-.644-1.44-1.439-1.44z"/>
                    </svg>
                </a>
                <a href="https://pf.kakao.com" target="_blank" class="social-icon" title="KakaoTalk">
                    <svg width="18" height="18" fill="currentColor" viewBox="0 0 24 24">
                        <path d="M12 3c5.799 0 10.5 3.664 10.5 8.185 0 4.52-4.701 8.184-10.5 8.184a13.5 13.5 0 0 1-1.727-.11l-4.408 2.883c-.501.265-.678.236-.472-.413l.892-3.678c-2.88-1.46-4.785-3.99-4.785-6.866C1.5 6.665 6.201 3 12 3zm5.907 8.06l1.47-1.424a.472.472 0 0 0-.656-.678l-1.928 1.866V9.282a.472.472 0 0 0-.944 0v2.557a.471.471 0 0 0 0 .222V13.5a.472.472 0 0 0 .944 0v-1.363l.427-.413 1.428 2.033a.472.472 0 1 0 .773-.543l-1.514-2.155zm-2.958 1.924h-1.46V9.297a.472.472 0 0 0-.943 0v4.159c0 .26.21.472.471.472h1.932a.472.472 0 1 0 0-.944zm-5.857-1.092l.696-1.707.638 1.707h-1.334zm2.523.488l-1.31-3.516a.527.527 0 0 0-.988 0l-1.311 3.516a.472.472 0 1 0 .886.33l.331-.886h1.607l.331.886a.472.472 0 1 0 .887-.33h-.433zm-5.828-1.416h-1.32v-1.201h1.32a.601.601 0 0 1 0 1.201zm.281 1.416h-.281v-.471a.472.472 0 0 0-.472-.472h-1.32v-.943h1.792a1.545 1.545 0 1 0 0-3.089H4.136a.472.472 0 0 0-.471.472v4.159c0 .26.21.472.471.472h1.932a.472.472 0 1 0 0-.944z"/>
                    </svg>
                </a>
            </div>
        </div>

        <!-- 구분선 -->
        <hr class="footer-divider">

        <!-- 하단: 이메일 + 저작권 -->
        <div class="footer-bottom">
            <div class="footer-email">
                <a href="mailto:support@onetouch.com">support@onetouch.com</a>
            </div>
            <div class="footer-copyright">
                © 2025 OneTouch - All Rights Reserved
            </div>
        </div>
    </div>
</footer>