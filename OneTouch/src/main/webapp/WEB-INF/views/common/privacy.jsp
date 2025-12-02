<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>개인정보처리방침 - 원터치(OneTouch)</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Noto Sans KR', Arial, sans-serif;
            line-height: 1.7;
            color: #333;
            background: #f8f9ff;
        }
        
        .header {
            background: linear-gradient(135deg, #1e3c72, #213997);
            color: white;
            padding: 30px 0;
            text-align: center;
            box-shadow: 0 3px 15px rgba(0,0,0,0.2);
        }
        
        .header h1 {
            font-size: 36px;
            text-shadow: 0 0 20px rgba(255, 255, 255, 0.3);
            margin-bottom: 10px;
        }
        
        .container {
            max-width: 1000px;
            margin: 40px auto;
            padding: 0 20px;
        }
        
        .btn-back {
            display: inline-block;
            background: linear-gradient(135deg, #1e3c72, #213997);
            color: white;
            padding: 12px 25px;
            text-decoration: none;
            border-radius: 25px;
            margin-bottom: 30px;
            transition: all 0.3s ease;
            font-weight: bold;
        }
        
        .btn-back:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(33, 57, 151, 0.4);
        }
        
        .content-box {
            background: white;
            padding: 50px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            border-top: 5px solid #213997;
        }
        
        .content-box h2 {
            color: #213997;
            font-size: 28px;
            margin: 40px 0 25px 0;
            padding-bottom: 15px;
            border-bottom: 3px solid #213997;
        }
        
        .content-box h3 {
            color: #213997;
            font-size: 20px;
            margin: 30px 0 15px 0;
            padding: 15px 20px;
            background: linear-gradient(135deg, #f0f4ff, #e8f0ff);
            border-radius: 10px;
            border-left: 5px solid #213997;
        }
        
        .content-box p {
            margin: 15px 0;
            font-size: 16px;
            line-height: 1.8;
        }
        
        .content-box ul {
            margin: 20px 0;
            padding: 25px;
            background: #fafbff;
            border-radius: 10px;
            border-left: 4px solid #213997;
        }
        
        .content-box li {
            margin-bottom: 12px;
            padding-left: 10px;
            font-size: 15px;
            line-height: 1.7;
        }
        
        .company-info {
            background: linear-gradient(135deg, #e8f4fd, #f0f9ff);
            padding: 30px;
            border-radius: 15px;
            border: 2px solid #213997;
            margin: 30px 0;
        }
        
        .contact-box {
            background: linear-gradient(135deg, #e8f4fd, #f0f9ff);
            padding: 30px;
            border-radius: 15px;
            border: 2px solid #213997;
            margin: 30px 0;
            text-align: center;
        }
        
        .date-info {
            text-align: center;
            padding: 25px;
            background: #f8f9fa;
            border-radius: 10px;
            border: 2px solid #dee2e6;
            margin-top: 40px;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }
        
        th {
            background: #213997;
            color: white;
        }
        
        @media (max-width: 768px) {
            .content-box {
                padding: 30px 20px;
            }
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>🔒 개인정보처리방침</h1>
        <p>원터치(OneTouch)는 고객의 개인정보를 안전하게 보호합니다</p>
    </div>

    <div class="container">
        <a href="${pageContext.request.contextPath}/" class="btn-back">← 홈으로 돌아가기</a>
        
        <div class="content-box">
            <!-- 회사 정보 -->
            <div class="company-info">
                <h3>📋 사업자 정보</h3>
                <p><strong>상호명:</strong> 주식회사 원터치 (OneTouch Co., Ltd.)</p>
                <p><strong>대표이사:</strong> 원터치</p>
                <p><strong>사업자등록번호:</strong> 123-45-67890</p>
                <p><strong>주소:</strong> 서울특별시 관악구 남부순환로 1820, 원터치빌딩 7층</p>
                <p><strong>연락처:</strong> 1588-1234 / support@onetouch.co.kr</p>
                <p><strong>통신판매업신고번호:</strong> 제2025-서울관악-12345호</p>
            </div>

            <h2>원터치(OneTouch) 개인정보처리방침</h2>
            
            <p>원터치 주식회사(이하 "회사")는 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 개인정보보호법 등 관련 법령상의 개인정보보호 규정을 준수하며, 관련 법령에 의거한 개인정보처리방침을 정하여 이용자 권익 보호에 최선을 다하고 있습니다.</p>
            
            <h3>제1조 (개인정보의 처리 목적)</h3>
            <p>회사는 개인정보를 다음의 목적을 위해 처리합니다. 처리한 개인정보는 다음의 목적 이외의 용도로는 사용되지 않으며, 이용 목적이 변경될 시에는 사전동의를 구할 예정입니다.</p>
            <ul>
                <li><strong>회원가입 및 관리:</strong> 회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리, 서비스 부정이용 방지, 만14세 미만 아동 개인정보 수집 시 법정대리인 동의여부 확인, 각종 고지·통지, 고충처리 목적</li>
                <li><strong>재화 또는 서비스 제공:</strong> 물품배송, 서비스 제공, 계약서·청구서 발송, 콘텐츠 제공, 맞춤서비스 제공, 본인인증, 연령인증, 요금결제·정산, 채권추심</li>
                <li><strong>고충처리:</strong> 민원인의 신원 확인, 민원사항 확인, 사실조사를 위한 연락·통지, 처리결과 통보</li>
                <li><strong>마케팅 및 광고에의 활용:</strong> 신상품이나 서비스의 정보 및 고지사항 전달, 이벤트 및 광고성 정보 제공 및 참여기회 제공, 인구통계학적 특성에 따른 서비스 제공 및 광고 게재, 서비스의 유효성 확인, 접속빈도 파악 또는 회원의 서비스 이용에 대한 통계</li>
            </ul>

            <h3>제2조 (개인정보의 처리 및 보유기간)</h3>
            <p>회사는 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의받은 개인정보 보유·이용기간 내에서 개인정보를 처리·보유합니다.</p>
            
            <table>
                <thead>
                    <tr>
                        <th>처리 목적</th>
                        <th>개인정보 항목</th>
                        <th>보유기간</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>회원 가입 및 관리</td>
                        <td>이름, 생년월일, 성별, 로그인ID, 비밀번호, 휴대전화번호, 이메일, 14세미만 아동의 경우 법정대리인정보</td>
                        <td>회원 탈퇴 시까지</td>
                    </tr>
                    <tr>
                        <td>재화 또는 서비스 제공</td>
                        <td>이름, 생년월일, 성별, 로그인ID, 비밀번호, 휴대전화번호, 이메일, 주소, 결제정보</td>
                        <td>재화·서비스 공급완료 및 요금결제·정산 완료시까지</td>
                    </tr>
                    <tr>
                        <td>전자상거래법 의무보관</td>
                        <td>계약 또는 청약철회 등에 관한 기록, 대금결제 및 재화 등의 공급에 관한 기록, 소비자의 불만 또는 분쟁처리에 관한 기록</td>
                        <td>5년</td>
                    </tr>
                    <tr>
                        <td>통신비밀보호법</td>
                        <td>로그인기록, 접속지 추적자료</td>
                        <td>3개월</td>
                    </tr>
                </tbody>
            </table>

            <h3>제3조 (개인정보의 제3자 제공)</h3>
            <p>회사는 개인정보를 제1조(개인정보의 처리 목적)에서 명시한 범위 내에서만 처리하며, 정보주체의 동의, 법률의 특별한 규정 등 개인정보보호법 제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.</p>
            
            <p><strong>현재 회사는 개인정보를 제3자에게 제공하고 있지 않습니다.</strong> 향후 제3자 제공이 필요한 경우, 제공받는 자, 제공목적, 제공하는 개인정보 항목, 제공받는 자의 보유·이용기간을 명확히 하여 사전에 동의를 받겠습니다.</p>

            <h3>제4조 (개인정보처리의 위탁)</h3>
            <p>회사는 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.</p>
            
            <table>
                <thead>
                    <tr>
                        <th>위탁업체</th>
                        <th>위탁업무 내용</th>
                        <th>개인정보 보유기간</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>CJ대한통운, 한진택배, 우체국택배</td>
                        <td>상품 배송업무</td>
                        <td>배송 완료 시까지</td>
                    </tr>
                    <tr>
                        <td>이니시스, KG모빌리언스</td>
                        <td>결제대행 서비스</td>
                        <td>결제 완료 후 5년</td>
                    </tr>
                    <tr>
                        <td>네이버 클라우드 플랫폼</td>
                        <td>클라우드 서버 운영</td>
                        <td>위탁계약 종료시까지</td>
                    </tr>
                </tbody>
            </table>

            <h3>제5조 (정보주체와 법정대리인의 권리·의무 및 그 행사방법)</h3>
            <p>정보주체는 원터치에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다.</p>
            <ul>
                <li>개인정보 처리정지 요구</li>
                <li>개인정보 열람요구</li>
                <li>개인정보 정정·삭제요구</li>
                <li>개인정보 처리정지 요구</li>
            </ul>
            <p>위의 권리 행사는 개인정보보호법 시행령 제41조제1항에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 회사는 이에 대해 지체없이 조치하겠습니다.</p>

            <h3>제6조 (처리하는 개인정보의 항목 작성)</h3>
            <p>회사는 다음의 개인정보 항목을 처리하고 있습니다.</p>
            <ul>
                <li><strong>필수항목:</strong> 이름, 생년월일, 성별, 휴대전화번호, 이메일, 주소</li>
                <li><strong>선택항목:</strong> 관심분야, 마케팅 수신동의</li>
                <li><strong>자동수집 항목:</strong> IP주소, 쿠키, MAC주소, 서비스 이용기록, 방문기록, 불량 이용기록 등</li>
            </ul>

            <h3>제7조 (개인정보의 파기)</h3>
            <p>회사는 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.</p>
            <ul>
                <li><strong>파기절차:</strong> 이용자가 입력한 정보는 목적 달성 후 별도의 DB에 옮겨져(종이의 경우 별도의 서류) 내부 방침 및 기타 관련 법령에 따라 일정기간 저장된 후 혹은 즉시 파기됩니다.</li>
                <li><strong>파기방법:</strong> 
                    <br>- 전자적 파일 형태의 정보는 기록을 재생할 수 없는 기술적 방법을 사용합니다.
                    <br>- 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.
                </li>
            </ul>

            <h3>제8조 (개인정보의 안전성 확보 조치)</h3>
            <p>회사는 개인정보보호법 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.</p>
            <ul>
                <li><strong>개인정보 취급 직원의 최소화 및 교육:</strong> 개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화하여 개인정보를 관리하는 대책을 시행하고 있습니다.</li>
                <li><strong>정기적인 자체 감사 실시:</strong> 개인정보 취급 관련 안정성 확보를 위해 정기적으로 자체 감사를 실시하고 있습니다.</li>
                <li><strong>내부관리계획의 수립 및 시행:</strong> 개인정보의 안전한 처리를 위하여 내부관리계획을 수립하고 시행하고 있습니다.</li>
                <li><strong>개인정보의 암호화:</strong> 이용자의 개인정보는 비밀번호는 암호화되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일 및 전송 데이터를 암호화하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다.</li>
                <li><strong>해킹 등에 대비한 기술적 대책:</strong> 해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고 주기적인 갱신·점검을 하며 외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적/물리적으로 감시 및 차단하고 있습니다.</li>
                <li><strong>개인정보에 대한 접근 제한:</strong> 개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여,변경,말소를 통하여 개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.</li>
            </ul>

            <!-- 연락처 정보 -->
            <div class="contact-box">
                <h3>📞 개인정보 보호책임자 및 담당자 안내</h3>
                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px; text-align: left;">
                    <div>
                        <h4 style="color: #213997; margin-bottom: 10px;">개인정보 보호책임자</h4>
                        <p><strong>성명:</strong> 김길동</p>
                        <p><strong>직책:</strong> 개인정보보호팀장</p>
                        <p><strong>연락처:</strong> 1588-0000 (내선 101)</p>
                        <p><strong>이메일:</strong> privacy@onetouch.co.kr</p>
                    </div>
                    <div>
                        <h4 style="color: #213997; margin-bottom: 10px;">개인정보 보호담당자</h4>
                        <p><strong>성명:</strong> 이길동</p>
                        <p><strong>직책:</strong> 개인정보보호팀 팀장</p>
                        <p><strong>연락처:</strong> 1588-0000 (내선 102)</p>
                        <p><strong>이메일:</strong> privacy@onetouch.co.kr</p>
                    </div>
                </div>
                <p style="margin-top: 20px; color: #666; font-size: 14px;">
                    개인정보 관련 문의, 불만처리, 피해구제 등에 관한 사항은 위의 담당자에게 문의하시기 바랍니다.
                </p>
            </div>

            <h3>제9조 (개인정보 처리방침 변경)</h3>
            <p>이 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.</p>

            <!-- 날짜 정보 -->
            <div class="date-info">
                <p><strong>개인정보처리방침 시행일자:</strong> 2025년 12월 1일</p>
                <p><strong>개인정보처리방침 최종 수정일:</strong> 2025년 12월 2일</p>
            </div>
        </div>
    </div>
</body>
</html>
