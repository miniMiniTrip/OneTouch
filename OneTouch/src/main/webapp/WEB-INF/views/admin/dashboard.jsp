<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OneTouch - 관리자페이지</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Malgun Gothic', 'Apple SD Gothic Neo', sans-serif;
            background: #f5f7fa;
            color: #333;
        }

        /* 컨테이너 */
        .container {
            max-width: 1600px;
            margin: 40px auto;
            padding: 0 40px;
        }

        /* 레이아웃 */
        .admin-layout {
            display: grid;
            grid-template-columns: 250px 1fr;
            gap: 30px;
        }

        /* 메인 컨텐츠 */
        .main-content {
            min-height: 600px;
        }

        .content-section {
            display: none;
        }

        .content-section.active {
            display: block;
        }

        .section-card {
            background: white;
            border-radius: 12px;
            padding: 30px;
            margin-bottom: 20px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 24px;
            padding-bottom: 16px;
            border-bottom: 2px solid #1a237e;
        }

        .section-title {
            font-size: 24px;
            font-weight: bold;
            color: #1a237e;
        }

        /* 대시보드 통계 */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-bottom: 30px;
        }

        .stat-card {
            background: white;
            border-radius: 12px;
            padding: 24px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
            border-left: 4px solid #1a237e;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        .stat-label {
            font-size: 14px;
            color: #666;
            margin-bottom: 8px;
        }

        .stat-value {
            font-size: 32px;
            font-weight: bold;
            color: #1a237e;
            margin-bottom: 8px;
        }

        .stat-change {
            font-size: 13px;
            color: #4caf50;
        }

        /* 버튼 */
        .btn {
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-block;
        }

        .btn-primary {
            background: #1a237e;
            color: white;
        }

        .btn-primary:hover {
            background: #0d47a1;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(26, 35, 126, 0.3);
        }

        .btn-secondary {
            background: white;
            color: #1a237e;
            border: 2px solid #1a237e;
        }

        .btn-secondary:hover {
            background: #1a237e;
            color: white;
        }

        .quick-access-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 15px;
        }

        /* 반응형 */
        @media (max-width: 1200px) {
            .stats-grid {
                grid-template-columns: repeat(2, 1fr);
            }

            .quick-access-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 768px) {
            .container {
                padding: 0 20px;
            }

            .admin-layout {
                grid-template-columns: 1fr;
            }

            .stats-grid {
                grid-template-columns: 1fr;
            }

            .quick-access-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <!-- 헤더 -->
    <%@ include file="admin_header.jsp" %>

    <!-- 메인 컨테이너 -->
    <div class="container">
        <div class="admin-layout">
            <!-- 사이드바 -->
            <%@ include file="admin_side.jsp"%>

            <!-- 메인 컨텐츠 -->
            <main class="main-content">
                <!-- 대시보드 -->
                <section id="dashboardSection" class="content-section active">
                    <div class="stats-grid">
                        <div class="stat-card">
                            <div class="stat-label">총 매출</div>
                            <div class="stat-value">1,250만원</div>
                            <div class="stat-change">↑ 15.3% 전월 대비</div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-label">신규 회원</div>
                            <div class="stat-value">342명</div>
                            <div class="stat-change">↑ 8.2% 전월 대비</div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-label">주문 건수</div>
                            <div class="stat-value">1,234건</div>
                            <div class="stat-change">↑ 12.5% 전월 대비</div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-label">평균 평점</div>
                            <div class="stat-value">4.8점</div>
                            <div class="stat-change">↑ 0.2 전월 대비</div>
                        </div>
                    </div>

                    <!-- 빠른 액세스 -->
                    <div class="section-card">
                        <div class="section-header">
                            <h2 class="section-title">🚀 빠른 액세스</h2>
                        </div>
                        <div class="quick-access-grid">
                            <a href="#" onclick="showSection('members'); return false;" class="btn btn-secondary">👥 회원관리</a>
                            <a href="/adminpage/product" class="btn btn-primary">📦 상품관리</a>
                            <a href="/order/management" class="btn btn-secondary">🚚 주문관리</a>
                            <a href="/admin/qna_list" class="btn btn-secondary">💬 Q&A 관리</a>
                        </div>
                    </div>
                </section>

                <!-- 회원관리 -->
                <section id="membersSection" class="content-section">
                    <div class="section-card">
                        <div class="section-header">
                            <h2 class="section-title">👥 회원관리</h2>
                        </div>
                        <p style="color: #666; line-height: 1.6;">회원관리 기능이 곧 추가될 예정입니다.</p>
                    </div>
                </section>

                <!-- 게시판 관리 -->
                <section id="boardSection" class="content-section">
                    <div class="section-card">
                        <div class="section-header">
                            <h2 class="section-title">📋 게시판 관리</h2>
                        </div>
                        <p style="color: #666; line-height: 1.6;">게시판 관리 기능이 곧 추가될 예정입니다.</p>
                    </div>
                </section>
            </main>
        </div>
    </div>

    <script>
        // 섹션 표시
        function showSection(sectionName) {
            // 모든 섹션 숨기기
            document.querySelectorAll('.content-section').forEach(section => {
                section.classList.remove('active');
            });
            
            // 모든 메뉴 active 제거
            document.querySelectorAll('.sidebar-menu a').forEach(link => {
                link.classList.remove('active');
            });

            // 섹션 매핑
            const sections = {
                'dashboard': 'dashboardSection',
                'members': 'membersSection',
                'board': 'boardSection'
            };

            // 선택된 섹션 표시
            const targetSection = document.getElementById(sections[sectionName]);
            if (targetSection) {
                targetSection.classList.add('active');
            }
            
            // 클릭된 메뉴 active 추가
            if (event && event.target) {
                event.target.classList.add('active');
            }
        }

        function goToHome() {
            window.location.href = '/';
        }

        function handleLogout() {
            if (confirm('로그아웃 하시겠습니까?')) {
                alert('로그아웃되었습니다.');
                window.location.href = '/';
            }
        }
    </script>
</body>
</html>