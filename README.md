<hr>

# <파이널 프로젝트>

<hr>

### [주제]
<br> 
<br>
초기 기획
<br>
<img width="500" height="600" alt="image" src="https://github.com/user-attachments/assets/d61c92d5-37a8-4f45-8a33-76e5d480d73d" /><br>
<img width="500" height="600" alt="image" src="https://github.com/user-attachments/assets/c20d38c8-a4f7-451f-b3f7-37db1795a72d" />
<br>
<hr>

### [팀 정보]

슬로건 : “오늘부터 1일, 당신의 뷰티 파트너”

사이트 이름 : 원터치 (One Touch)

조이름 : NewStream (서경원, 이시원, 고유빈, 하민지)

### [환경]

- 환경설정정보
    - 이클립스 2024-06 (4.34)
    - JAVA 17
    - 스프링부트 3.5.7
        - Type : Maven 17
        - Packaging : jar
        - Group : com.onetouch
        - Package : com.onetouch
        - Lombok 1.18.42
        - MyBatis 3.0.5
        - MySql 8.0.42
    - Bootstrap 5 

[로고]

- 이미지
    
<img width="300" height="300" alt="image" src="https://github.com/user-attachments/assets/9e0f0aaa-3a86-4830-9d6a-9efe5611fdb1" />

# [기능구현 정의서]

- 내용
    
    ## [헤더] ⇒ 모두 1단계
    
    - 예시 이미지 (메인버튼)
        
        ![image.png](attachment:386731e0-a873-4273-bfdf-02193788ba52:image.png)
        
    
    ㄴ회원가입 버튼 (비로그인)
    
    ㄴ로그인 버튼 (비로그인)
    
    ㄴ로그아웃 버튼 (로그인중)
    
    ㄴ장바구니 버튼 (로그인처리)
    
    ---
    
    ### [헤더메뉴] ⇒작을때 햄버거 ,클땐 나열
    
    ㄴ카테고리 버튼 ⇒1단계
    
    ㄴ메인카테고리(대분류,햄버거형)
    
    - 스킨/케어
        
        -스킨토너
        
        -에센스/세럼/앰플
        
        -크림
        
        -로션
        
        -미스트/오일
        
        -스킨케어세트
        
        -스킨케어 디바이스
        
    - 마스크팩
        
        -시트팩
        
        -패드
        
        -코팩
        
    - 클렌징
        
        -클렌징폼 / 젤
        
        -오일 / 밤
        
    - 선케어
        
        -선크림
        
        -선스틱
        
        -선쿠션
        
        -선스프레이/선패치
        
    - 헤어
        
        -샴푸/린스
        
        -오일/컬크림
        
    
    ㄴ오늘의 특가 버튼 ⇒3단계
    
    ㄴ랭킹 버튼 ⇒3단계
    
    ㄴ기프트카드 버튼 ⇒3단계
    
    ㄴ이벤트(ex마일리지 2배적립 이벤트) 버튼 ⇒3단계
    
    - [피부 진단 서비스 페이지] ⇒ 1단계 (회원가입시 컨펌 ,로그인시 작성가능)
        
        1.메인헤더-서비스제목,로고등
        
        2.진단시작버튼
        
        3.나의피부 타입 선택하기(문진타입)
        
        ㄴ기본정보 입력:나이,성별,피부타입등
        
        4.진단 결과 표시영역
        
        ㄴ결과항목:(피부상태,문제점,개선제안)
        
        ㄴ내게필요한 cosmetics 둘러보기
        
        ![image.png](attachment:952b62c4-6968-4814-905e-7cf5b8abb555:image.png)
        
    
    ---
    
    ### [로그인 페이지] ⇒ 1단계
    
    ㄴ로그인
    
    ㄴ로그아웃
    
    ㄴ회원가입
    
    ---
    
    ### [메인 페이지]
    
    - 공지사항 (시스템 관련, 점검 관련) ⇒2단계
        
        ![image.png](attachment:170bfef1-fb09-4b2b-be18-f2a9154ed5b6:image.png)
        
    - 이벤트, 기획 배너(슬라이드) 구간 ⇒1단계
        
        ![image.png](attachment:635762f3-1ca6-4148-96a4-6c692c8a39b1:image.png)
        
        ⇒ 배너에 진단넣기
        
        ![image.png](attachment:5169bdfa-ca45-4e9a-ae10-6e61a95e93fe:image.png)
        
    - 숏츠폼 구간 ⇒2~3단계
        
        ![image.png](attachment:f252d338-fcce-4482-bb59-6b8794dd621b:image.png)
        
        ⇒ 
        
    - 커뮤니티(세트) ⇒ 1단계
        
        ![image.png](attachment:d1e3108c-ed5f-4e42-9cab-558de6df8875:image.png)
        
    - 랭킹 구간 ⇒ 2단계
        
        ![image.png](attachment:b7dde380-0a94-4967-a2de-2a3b75d337e5:image.png)
        
    - 나이별 ⇒3단계
        
        ![image.png](attachment:7870db66-ced2-44c5-9df9-15ec087148a5:image.png)
        
    
    ---
    
    ### [검색기능]
    
    - 검색 예시 이미지2030 남성 소셜 기반 뷰티 큐레이션 오픈 마켓 플레이스 쇼핑몰
        
        ![image.png](attachment:242126a4-c191-4262-8a45-a2200f91df50:image.png)
        
        ⇒ 최근검색어 10개정도까지만 노출 ( 2단계 )
        
        ⇒ 연관검색어 (3단계)
        
        ![image.png](attachment:721a6742-53cd-4d02-abd0-73b103defc89:image.png)
        
        ⇒ 가격검색 (3단계)
        
    
    ### [커뮤니티]
    
    ㄴ 커뮤니티 목록
    
    - 예시이미지
        
        ![image.png](attachment:b57501eb-d3f6-422f-97d5-49912a206de0:image.png)
        
    
    ㄴ커뮤니티 CRUD
    
    - 예시이미지
        
        ![image.png](attachment:ca2de6bd-2236-4159-8b5a-b872dfa83d6d:image.png)
        
    
    ### [상품 리스트 페이지]
    
    ㄴ상품 리스트 목록 보기 기능 (1단계)
    
    - 예시 이미지
        
        예시1
        
        ![image.png](attachment:f7e80474-ddba-4d7b-b05b-faf7bb31949f:image.png)
        
        - 예시2 (기준)
            
            ![image.png](attachment:4068ff64-b290-4a71-a2d6-4f60de5cf857:image.png)
            
            ⇒ 베스트(왕관모양), 찜, 리뷰별점
            
        
    
    ㄴ페이지처리(1단계)
    
    - 예시 이미지
        
        ![image.png](attachment:e1af91e1-141d-4797-bde9-a1ac44a1733d:image.png)
        
    
    ### [상품 상세 페이지]
    
    - 상품상세보기 기능
        
        ![image.png](attachment:137ebdaa-d77e-434e-bc5b-ca03c224aa81:image.png)
        
        ![image.png](attachment:99b6d345-8e23-4f3c-b708-d0e234d3bde7:image.png)
        
        ⇒내용(이미지도)
        
    
    ㄴ장바구니담기 버튼 ⇒1단계
    
    ㄴ상품 수량 선택 및 종류,타입? ⇒1단계
    
    ㄴ구매 기능 (로그인⇒1단계) or(비회원⇒100단계)
    
    ㄴ공유 기능(3단계)
    
    ㄴ찜기능⇒1단계
    
    ### [상품 구매 페이지]
    
    - 결제 시스템
        
        ![image.png](attachment:fa0dc305-a6bc-48a1-8ac6-c3a2d0355b19:image.png)
        
    
    ㄴ배송지 변경 ⇒1단계
    
    ㄴ배송 요청사항 변경 ⇒ 드랍다운 항목 4가지 , 직접입력은(3단계)
    
    ㄴ포인트 사용⇒2단계 
    
    ㄴ결제수단⇒1단계 (결제금액과 쿠폰금액 필요)
    
    ㄴ결제하기버튼⇒1단계
    
    ### [주문완료페이지] ⇒1단계
    
    ㄴ장바구니 버튼
    
    ㄴ메인화면 버튼
    
    ### 마이페이지(장바구니)
    
    ㄴ장바구니
    
    - 장바구니 예시
        
        ![image.png](attachment:3dbe83bb-3754-4c15-a2a6-69238c5fa91d:image.png)
        
    
    ㄴ상품
    
    ㄴ주문/배송조회
    
    - 주문/배송조회 예시
        
        ![image.png](attachment:8342549a-256a-41ff-890d-e2ae89cc1d62:image.png)
        
    
    ㄴ취소/반품/교환내역
    
    - 취소/반품/교환내역
        
        ![image.png](attachment:395b3953-8e19-4c81-b31b-befc9e4795d3:image.png)
        
    
    ㄴ찜목록 ⇒ 1단계
    
    ㄴ재입고 알림 ⇒3단계
    
    ㄴ쿠폰 / 기프트카드(ex: 카카오톡 쿠폰) ⇒3단계
    
    ## 마이페이지(나의정보)
    
    ㄴ1:1 문의 내역
    
    ㄴ리뷰(0)
    
    ㄴ상품Q&A
    
    ㄴ회원이 본 상품정보 (배열)-최근 본 상품목록
    
    ㄴ회원정보 수정
    
    - 수정 전 비밀번호 입력 폼
        
        ![image.png](attachment:2b1580fd-2e75-4909-a99f-0f8ac5d67a63:image.png)
        
    
    ㄴ배송지,환불계좌
    
    ㄴ회원탈퇴
    
    ㄴ등급
    
    ㄴ마일리지/쿠폰 ⇒3단계
    
    ㄴ알림기능 (주문. 리뷰 알림 받기) ⇒ 2단계
    
    ## [판매자 기능] ⇒ 보류
    
    [회원부분]
    
    ㄴ판매자 회원가입,로그인/로그아웃,비밀번호 찾기/ 변경, 프로필 수정
    
    [상품 관리] ⇒ 1단계
    
    ㄴ상품 등록,상품 수정,상품 삭제
    
    [재고관리] ⇒ 1단계
    
    ㄴ상품 상태 표시,상품 미리보기
    
    [주문관리부분] ⇒ 3단계
    
    ㄴ주문 / 배송 관리,주문내역 조회,정산내역 조회,매출 /정산 분석,고객관리
    
    [리뷰 부분]- 리뷰 / 고객 피드백 관리 ⇒ 1단계
    
    ㄴ리뷰 조회,리뷰 답글 작성,신고된 리뷰 확인
    
    [이벤트/ 프로모션 관리] ⇒ 2단계
    
    ㄴ쿠폰 등록,타임 세일 설정,프로모션 배너 등록
    
    [대시보드,통계표]  ⇒ 2단계
    
    ㄴ매출 현황 그래프,오늘의 주문건수,인기상품 랭킹,리뷰평점 평점
    
    - 예시이미지
        
        ![image.png](attachment:c6c307a6-6639-4176-9ae2-188f58270ee2:image.png)
        
    
    [시스템/ 운영 편의 기능] 
    
    ㄴ알림기능 (주문. 리뷰 알림 받기) ⇒ 2단계
    
    ㄴ문의내역 확인 (고객 1:1 답변) ⇒ 1단계
    
    ㄴ로그 기록 (상품 수정 / 삭제 이력 추적) ⇒ 3단계
    
    ## [관리자 기능] ⇒ 보류
    
    ㄴ관리자 로그인 ⇒ 1단계
    
    ㄴ카테고리 관리 ⇒ 3단계
    
    ㄴ회원관리= 1단계
    
    - 방문자수⇒ 3단계
        
        ![image.png](attachment:c6c307a6-6639-4176-9ae2-188f58270ee2:image.png)
        
    
    ㄴ판매자관리(승인/거부/영업정지/경고기능)
    
    ㄴ리뷰 관리 
    
    ㄴ알림 및 공지 기능(쪽지) =2단계
    
    ### [푸터]
    
    ㄴ회사소개 ⇒ 1단계
    
    ㄴ이용약관 ⇒ 1단계
    
    ㄴ개인정보취급방침 ⇒1단계
    
    ㄴ고객센터 버튼(비로그인,로그인) ⇒ 1단계
