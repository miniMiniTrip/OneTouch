-- ========================================
-- 초기 데이터
-- ========================================

-- 카테고리 초기 데이터
INSERT INTO category (category_name) VALUES 
('스킨케어'),
('메이크업/선케어'),
('클렌징케어');

-- 관리자 계정 (비밀번호: 1234 - 실제로는 암호화 필요)
INSERT INTO mem (mem_id, mem_pw, mem_name, mem_postal, mem_email, mem_roll, mem_phone) VALUES 
('admin', '1234', '관리자', '12423', 'admin@onetouch.com', 'admin', '010-1234-1123');

INSERT INTO mem (mem_id, mem_pw, mem_name, mem_postal, mem_email, mem_roll, mem_phone) VALUES 
('user1', '1234', '김유저', '12423', 'user1@onetouch.com', 'user', '010-1234-1123');

-- 해시태그 초기데이터
INSERT INTO hashtag (hashtag_name) VALUES
('지성'),('복합성'),('건성'),('민감성'),('저항성'),('색소성'),('비색소성'),('주름성'),('탄력성'),('밝은톤'),('중간톤'),('어두운톤');

-- 상품 테이블 sample data

INSERT INTO product 
(category_idx, product_wishlist, product_price, product_name, product_brand, product_comment, product_cnt)
VALUES
(1, 0, 18000, '맨즈 딥클렌징 폼', 'Nivea Men', '피지 제거에 탁월한 남성 전용 딥클렌징 폼', 50),

(1, 0, 32000, '남성 올인원 로션', 'Hera Homme', '스킨·로션·에센스를 한 번에 해결하는 올인원 로션', 40),

(1, 0, 25000, '맨즈 아쿠아 스킨', 'Innisfree For Men', '수분감을 오래 유지해주는 쿨링 스킨', 60),

(1, 0, 29000, '옴므 안티에이징 크림', 'Laneige Homme', '주름 개선 및 탄력 강화 기능성 남성 크림', 30),

(1, 0, 15000, '블랙헤드 클리어 스크럽', 'The Face Shop', '남성 피부 맞춤 딥 스크럽 클렌저', 70),

(1, 0, 38000, '옴므 UV 프로텍션 선크림', 'IOPE Men', '끈적임 없이 빠르게 흡수되는 남성 선크림', 35),

(1, 0, 23000, '맨즈 수분 에센스', 'Nivea Men', '가볍게 발리는 고보습 남성 에센스', 55),

(1, 0, 17000, '옴므 아프터쉐이브 로션', 'Hera Homme', '면도 후 자극을 완화해주는 진정 로션', 45),

(1, 0, 28000, '맨즈 포어 타이트닝 토너', 'Innisfree For Men', '모공 축소 기능의 프레시 타입 토너', 50),

(1, 0, 42000, '옴므 리프팅 세럼', 'Laneige Homme', '탄력 증진 남성 전용 리프팅 세럼', 20);


-- product_hashtag sample data
INSERT INTO product_hashtag (product_idx, hashtag_idx) VALUES
(1, 1), (1, 4), (1, 6);
INSERT INTO product_hashtag (product_idx, hashtag_idx) VALUES
(2, 3), (2, 7), (2, 9); 


-- 상품 리스트 더미데이터 파일이름 --

C1_P1_COSRX_스네일92_보습장벽.jpg
C1_P2_조선미녀_인삼토너_수분영양.jpg
C1_P3_APLB_비피다크림_톤업미백.jpg
C1_P4_우르오스_올인원_간편데일리.jpg
C1_P5_비오템_아쿠아파워_수분폭탄.jpg
C1_P6_포엘리에_저속노화_올인원_향기보습.jpg
C1_P7_라네즈옴므 블루에너지_수분폭탄_생기.jpg
C1_P8_라로슈포제_시카토너_진정민감.jpg
C1_P9_스킨푸드_당근패드_진정쿨링.jpg
C1_P10_더마비_데일리로션_바디페이스.jpg
C2_P1_닥터지_그린마일드_무기자차.jpg
C2_P2_라운드랩_자작나무_수분선크림.jpg
C2_P3_듀이트리_안티폴루션_미세먼지차단.jpg
C2_P4_유이크_레미디_마일드무기자차.jpg
C2_P5_아이디얼포맨_베러톤_자연스러운톤업.jpg
C2_P6_다슈_아쿠아_비비로션_수분생기.jpg
C2_P7_오브제_커버파데_스틱간편.jpg
C2_P8_비레디_블루쿠션_피부톤수정.jpg
C2_P9_헤라옴므_블랙쿠션_보송밀착.jpg
C2_P10_메이크프렘_카밍선크림_진정쿨링.jpg
C3_P1_센카_퍼펙트휩_딥클렌징.jpg
C3_P2_이니스프리_그린티폼_촉촉약산성.jpg
C3_P3_해피바스_클렌징폼_블랙헤드.jpg
C3_P4_바이오더마_클렌징워터_순한세정.jpg
C3_P5_아크네스_포밍워시_여드름케어.jpg
C3_P6_라로슈포제_에빠끌라_피지조절.jpg
C3_P7_식물나라_탄산수_모공노폐물.jpg
C3_P8_프리메라_마일드필링_각질제거.jpg
C3_P9_아벤느_클렌징폼_건성보습.jpg
C3_P10_이니스프리_화산송이_모공흡착.jpg

