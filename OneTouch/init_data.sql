-- idx 초기화
-- ALTER TABLE posts AUTO_INCREMENT = 1;

-- ========================================
--  	category 테이블 더미 (상품 관련된 테이블)
-- ========================================
-- 카테고리 초기 데이터
INSERT INTO category (category_name) VALUES 
('스킨케어'),
('메이크업/선케어'),
('클렌징케어');


-- ========================================
-- 				mem 테이블 더미
-- ========================================
-- 관리자 계정 (비밀번호: 1234 - 실제로는 암호화 필요)
-- mem_idx = 1
INSERT INTO mem (mem_id, mem_pw, mem_name, mem_postal, mem_email, mem_roll, mem_phone, mem_addr, mem_addr_more) VALUES 
('admin', '1234', '관리자', '06945', 'admin@onetouch.com', 'admin', '010-8282-8282','서울 동작구 여의대방로 지하 218','101동 1001호');

-- mem_idx = 2
INSERT INTO mem (mem_id, mem_pw, mem_name, mem_postal, mem_email, mem_roll, mem_phone, mem_addr, mem_addr_more) VALUES 
('user1', '1234', '김유저', '36526', 'user1@onetouch.com', 'user', '010-6262-6262','경북 영양군 수비면 판사길 5','201동 1502호');

-- mem_idx = 3
INSERT INTO mem (mem_id, mem_pw, mem_name, mem_postal, mem_email, mem_roll, mem_phone, mem_addr, mem_addr_more) VALUES 
('a1234', '123', '서경원', '54628', 'suh0007@naver.com', 'admin', '010-7171-7171','전북특별자치도 익산시 고봉로 156','501동 701호');

-- mem_idx = 4
INSERT INTO mem (mem_id, mem_pw, mem_name, mem_postal, mem_email, mem_roll, mem_phone, mem_addr, mem_addr_more) VALUES 
('ha1234', '1234', '하민지', '02118', 'ha1234@onetouch.com', 'admin', '010-0101-0101','서울 중랑구 망우로 166-11','103동 2001호');

-- mem_idx = 5
INSERT INTO mem (mem_id, mem_pw, mem_name, mem_postal, mem_email, mem_roll, mem_phone, mem_addr, mem_addr_more) VALUES 
('admin91', '1234', '고유빈', '06035', 'admin91@onetouch.com', 'admin', '010-6666-5555','서울 강남구 가로수길 9','107동 1301호');

-- mem_idx = 6
INSERT INTO mem (mem_id, mem_pw, mem_name, mem_postal, mem_email, mem_roll, mem_phone, mem_addr, mem_addr_more) VALUES 
('sw5080', '1234', '이시원', '06035', 'sw5080@onetouch.com', 'admin', '010-2211-5775','서울 강남구 가로수길 13','106동 1101호');

-- mem_idx = 7~25
-- 좋아요를 위한 무의미한 유저 더미추가
INSERT INTO mem (mem_id,mem_pw,mem_name,mem_email,mem_roll,mem_phone)VALUES
 ('u1231','123','유저01','user0@onetouch.com','user','010-1111-1110')
,('u1232','123','유저02','user2@onetouch.com','user','010-1111-1112')
,('u1233','123','유저03','user3@onetouch.com','user','010-1111-1113')
,('u1234','123','유저04','user4@onetouch.com','user','010-1111-1114')
,('u1235','123','유저05','user5@onetouch.com','user','010-1111-1115')
,('u1236','123','유저06','user6@onetouch.com','user','010-1111-1116')
,('u1237','123','유저07','user7@onetouch.com','user','010-1111-1117')
,('u1238','123','유저08','user8@onetouch.com','user','010-1111-1118')
,('u1239','123','유저09','user9@onetouch.com','user','010-1111-1119')
,('u1221','123','유저10','user01@onetouch.com','user','010-1111-1110')
,('u1222','123','유저11','user02@onetouch.com','user','010-1111-1120')
,('u1223','123','유저12','user03@onetouch.com','user','010-1111-1130')
,('u1224','123','유저13','user04@onetouch.com','user','010-1111-1140')
,('u1225','123','유저14','user05@onetouch.com','user','010-1111-1150')
,('u1226','123','유저15','user06@onetouch.com','user','010-1111-1160')
,('u1227','123','유저16','user07@onetouch.com','user','010-1111-1170')
,('u1228','123','유저17','user08@onetouch.com','user','010-1111-1180')
,('u1229','123','유저18','user09@onetouch.com','user','010-1111-1190')
,('u1220','123','유저19','user00@onetouch.com','user','010-1111-1100');


-- ========================================
-- 			hashtag 테이블 더미
-- ========================================
-- 해시태그 초기데이터
INSERT INTO hashtag (hashtag_name) VALUES
('지성'),('복합성'),('건성'),('민감성'),('저항성'),('색소성'),('비색소성'),('주름성'),('탄력성'),('밝은톤'),('중간톤'),('어두운톤');

-----------------------------------------------------------------------------------------------------
--해시 추가데이터 11/26 추가
-----------------------------------------------------------------------------------------------------
INSERT INTO hashtag (hashtag_name) VALUES

('무기자차'), ('순한선크림'), ('민감선케어'),
('수분선크림'), ('백탁없는선크림'), ('자작나무'),
('미세먼지차단'), ('산뜻한선크림'), ('안티폴루션'),
('남자순한선크림'), ('마일드선크림'), ('저자극선케어'),
('남자톤업'), ('티안나는메이크업'), ('톤업로션'),
('남자비비'), ('비비로션'), ('간편커버'),
('남자파데'), ('스틱파운데이션'), ('커버력좋은'),
('남자쿠션'), ('남성파데'), ('빠른화장'),
('보송한쿠션'), ('헤라옴므'), ('남성쿠션'),
('진정선크림'),('쿨링선케어'),('남자데일리선크림'),


('딥클렌징 '),('쫀쫀거품'),('피지제거'),
('촉촉한클렌징'), ('그린티'), ('데일리클렌징'),
('클렌징오일'), ('블랙헤드제거'), ('남자딥클렌징'),
('클렌징워터'), ('노워시클렌징'), ('순한세안'),
('여드름클렌징'), ('트러블케어'), ('폼워시'),
('클렌징젤'), ('피지조절'), ('지성피부'),
('탄산수클렌징'), ('모공클렌징'), ('딥클렌징폼'),
('남자각질제거'), ('필링젤'), ('마일드필링'),
('클렌징폼'), ('건성클렌징'), ('남자보습세안'),
('모공흡착'), ('화산송이'), ('강력세정');


-- select * from hashtag


INSERT INTO hashtag (hashtag_name) VALUES
SELECT LAST_INSERT_ID();
-- product_hashtag sample data
INSERT INTO product_hashtag (product_idx, hashtag_idx) VALUES
(1, 1), (1, 4), (1, 6);
INSERT INTO product_hashtag (product_idx, hashtag_idx) VALUES
(2, 3), (2, 7), (2, 9); 
-- 25.11.18 추가
INSERT INTO product_hashtag (product_idx, hashtag_idx) VALUES
(3, 1), (3, 2), (3, 7);
INSERT INTO product_hashtag (product_idx, hashtag_idx) VALUES
(4, 3), (4, 8), (4, 9);
INSERT INTO product_hashtag (product_idx, hashtag_idx) VALUES
(5, 1), (5, 5), (5, 6);
INSERT INTO product_hashtag (product_idx, hashtag_idx) VALUES
(6, 2), (6, 4), (6, 7);
INSERT INTO product_hashtag (product_idx, hashtag_idx) VALUES
(7, 3), (7, 2), (7, 7);
INSERT INTO product_hashtag (product_idx, hashtag_idx) VALUES
(8, 4), (8, 5), (8, 7);
INSERT INTO product_hashtag (product_idx, hashtag_idx) VALUES
(9, 1), (9, 2), (9, 9);
INSERT INTO product_hashtag (product_idx, hashtag_idx) VALUES
(10, 3), (10, 8), (10, 9);

-----------------------------------------------------------------------------------------------------
--해시 추가데이터 11/26 추가  위에꺼 삽입하고 해야 실행됨
-----------------------------------------------------------------------------------------------------
INSERT INTO product_hashtag (product_idx, hashtag_idx) VALUES

(11, 13), (11, 14), (11, 15),

(12, 16), (12, 17), (12, 18),

(13, 19), (13, 20), (13, 21),

(14, 22), (14, 23), (14, 24),

(15, 25), (15, 26), (15, 27),

(16, 28), (16, 29), (16, 30),

(17, 31), (17, 32), (17, 33),

(18, 34), (18, 35), (18, 36),

(19, 37), (19, 38), (19, 39),

(20, 40), (20, 41), (20, 42),

(21, 43), (21, 44), (21, 45),

(22, 46), (22, 47), (22, 48),

(23, 49), (23, 50), (23, 51),

(24, 52), (24, 53), (24, 54),

(25, 55), (25, 56), (25, 57),

(26, 58), (26, 59), (26, 60),

(27, 61), (27, 62), (27, 63),

(28, 64), (28, 65), (28, 66),

(29, 67), (29, 68), (29, 69),

(30, 70), (30, 71), (30, 72);
-----------------------------------------------------------------------------------------------------
--해시 추가데이터 11/26 추가
-----------------------------------------------------------------------------------------------------


--=============================================================================================================
-- 상품(product) 초기 더미 데이터
--=============================================================================================================


-- 30개 상품 INSERT
DROP TABLE IF EXISTS product_image;

--product dummy_file

INSERT INTO product
(category_idx, product_wishlist, product_price, product_name, product_brand, product_comment, product_cnt, product_time, product_update)
VALUES
(1, 0, 14900, '스네일92 베리어 크림', 'COSRX', NULL, 52, NOW(), NOW()),
(1, 0, 12000, '인삼 수분 영양 토너', '조선미녀', NULL, 65, NOW(), NOW()),
(1, 0, 18900, '비피다 톤업 미백 크림', 'APLB', NULL, 38, NOW(), NOW()),
(1, 0, 15500, '올인원 데일리 모이스처라이저', '우르오스', NULL, 70, NOW(), NOW()),
(1, 0, 33000, '아쿠아파워 수분 폭탄 젤', '비오템', NULL, 41, NOW(), NOW()),
(1, 0, 21000, '저속노화 올인원 크림', '포엘리에', NULL, 29, NOW(), NOW()),
(1, 0, 27000, '블루에너지 수분 에센스', '라네즈옴므', NULL, 75, NOW(), NOW()),
(1, 0, 16000, '시카 진정 토너', '라로슈포제', NULL, 48, NOW(), NOW()),
(1, 0, 14000, '당근 진정 쿨링 패드', '스킨푸드', NULL, 85, NOW(), NOW()),
(1, 0, 11500, '데일리 바디&페이스 로션', '더마비', NULL, 91, NOW(), NOW()),

(2, 0, 17000, '그린마일드 무기자차', '닥터지', NULL, 60, NOW(), NOW()),
(2, 0, 15000, '자작나무 수분 선크림', '라운드랩', NULL, 80, NOW(), NOW()),
(2, 0, 18000, '안티폴루션 미세먼지 차단 선', '듀이트리', NULL, 45, NOW(), NOW()),
(2, 0, 16000, '레미디 마일드 무기자차', '유이크', NULL, 30, NOW(), NOW()),
(2, 0, 22000, '베러톤 톤업 크림', '아이디얼포맨', NULL, 52, NOW(), NOW()),
(2, 0, 19000, '아쿠아 비비 로션', '다슈', NULL, 88, NOW(), NOW()),
(2, 0, 25000, '커버 스틱 파운데이션', '오브제', NULL, 34, NOW(), NOW()),
(2, 0, 28000, '블루쿠션 톤 보정', '비레디', NULL, 76, NOW(), NOW()),
(2, 0, 33000, '옴므 블랙 쿠션', '헤라옴므', NULL, 50, NOW(), NOW()),
(2, 0, 17000, '카밍 진정 선크림', '메이크프렘', NULL, 92, NOW(), NOW()),

(3, 0, 9000, '퍼펙트휩 딥클렌징 폼', '센카', NULL, 90, NOW(), NOW()),
(3, 0, 8500, '그린티 촉촉 약산성 폼', '이니스프리', NULL, 73, NOW(), NOW()),
(3, 0, 7500, '블랙헤드 클렌징 폼', '해피바스', NULL, 65, NOW(), NOW()),
(3, 0, 15500, '센시비오 순한 클렌징워터', '바이오더마', NULL, 58, NOW(), NOW()),
(3, 0, 9800, '여드름 포밍 워시', '아크네스', NULL, 44, NOW(), NOW()),
(3, 0, 16000, '에빠끌라 피지조절 폼', '라로슈포제', NULL, 37, NOW(), NOW()),
(3, 0, 7000, '탄산수 모공 폼클렌저', '식물나라', NULL, 82, NOW(), NOW()),
(3, 0, 19000, '마일드 필링 젤', '프리메라', NULL, 29, NOW(), NOW()),
(3, 0, 21000, '건성 보습 클렌징폼', '아벤느', NULL, 33, NOW(), NOW()),
(3, 0, 9500, '화산송이 모공 흡착 폼', '이니스프리', NULL, 99, NOW(), NOW());

-- product_image_dummy

INSERT INTO product_image (product_idx, product_image_url, product_image_level) VALUES
(1, 'C1_P1_COSRX_스네일92_보습장벽.jpg', 1),
(2, 'C1_P2_조선미녀_인삼토너_수분영양.jpg', 1),
(3, 'C1_P3_APLB_비피다크림_톤업미백.jpg', 1),
(4, 'C1_P4_우르오스_올인원_간편데일리.jpg', 1),
(5, 'C1_P5_비오템_아쿠아파워_수분폭탄.jpg', 1),
(6, 'C1_P6_포엘리에_저속노화_올인원_향기보습.jpg', 1),
(7, 'C1_P7_라네즈옴므 블루에너지_수분폭탄_생기.jpg', 1),
(8, 'C1_P8_라로슈포제_시카토너_진정민감.jpg', 1),
(9, 'C1_P9_스킨푸드_당근패드_진정쿨링.jpg', 1),
(10, 'C1_P10_더마비_데일리로션_바디페이스.jpg', 1),

(11, 'C2_P1_닥터지_그린마일드_무기자차.jpg', 1),
(12, 'C2_P2_라운드랩_자작나무_수분선크림.jpg', 1),
(13, 'C2_P3_듀이트리_안티폴루션_미세먼지차단.jpg', 1),
(14, 'C2_P4_유이크_레미디_마일드무기자차.jpg', 1),
(15, 'C2_P5_아이디얼포맨_베러톤_자연스러운톤업.jpg', 1),
(16, 'C2_P6_다슈_아쿠아_비비로션_수분생기.jpg', 1),
(17, 'C2_P7_오브제_커버파데_스틱간편.jpg', 1),
(18, 'C2_P8_비레디_블루쿠션_피부톤수정.jpg', 1),
(19, 'C2_P9_헤라옴므_블랙쿠션_보송밀착.jpg', 1),
(20, 'C2_P10_메이크프렘_카밍선크림_진정쿨링.jpg', 1),

(21, 'C3_P1_센카_퍼펙트휩_딥클렌징.jpg', 1),
(22, 'C3_P2_이니스프리_그린티폼_촉촉약산성.jpg', 1),
(23, 'C3_P3_해피바스_클렌징폼_블랙헤드.jpg', 1),
(24, 'C3_P4_바이오더마_클렌징워터_순한세정.jpg', 1),
(25, 'C3_P5_아크네스_포밍워시_여드름케어.jpg', 1),
(26, 'C3_P6_라로슈포제_에빠끌라_피지조절.jpg', 1),
(27, 'C3_P7_식물나라_탄산수_모공노폐물.jpg', 1),
(28, 'C3_P8_프리메라_마일드필링_각질제거.jpg', 1),
(29, 'C3_P9_아벤느_클렌징폼_건성보습.jpg', 1),
(30, 'C3_P10_이니스프리_화산송이_모공흡착.jpg', 1);

-- 상품 리스트 더미데이터 파일이름 --

-- C1_P1_COSRX_스네일92_보습장벽.jpg
-- C1_P2_조선미녀_인삼토너_수분영양.jpg
-- C1_P3_APLB_비피다크림_톤업미백.jpg
-- C1_P4_우르오스_올인원_간편데일리.jpg
-- C1_P5_비오템_아쿠아파워_수분폭탄.jpg
-- C1_P6_포엘리에_저속노화_올인원_향기보습.jpg
-- C1_P7_라네즈옴므 블루에너지_수분폭탄_생기.jpg
-- C1_P8_라로슈포제_시카토너_진정민감.jpg
-- C1_P9_스킨푸드_당근패드_진정쿨링.jpg
-- C1_P10_더마비_데일리로션_바디페이스.jpg
-- C2_P1_닥터지_그린마일드_무기자차.jpg
-- C2_P2_라운드랩_자작나무_수분선크림.jpg
-- C2_P3_듀이트리_안티폴루션_미세먼지차단.jpg
-- C2_P4_유이크_레미디_마일드무기자차.jpg
-- C2_P5_아이디얼포맨_베러톤_자연스러운톤업.jpg
-- C2_P6_다슈_아쿠아_비비로션_수분생기.jpg
-- C2_P7_오브제_커버파데_스틱간편.jpg
-- C2_P8_비레디_블루쿠션_피부톤수정.jpg
-- C2_P9_헤라옴므_블랙쿠션_보송밀착.jpg
-- C2_P10_메이크프렘_카밍선크림_진정쿨링.jpg
-- C3_P1_센카_퍼펙트휩_딥클렌징.jpg
-- C3_P2_이니스프리_그린티폼_촉촉약산성.jpg
-- C3_P3_해피바스_클렌징폼_블랙헤드.jpg
-- C3_P4_바이오더마_클렌징워터_순한세정.jpg
-- C3_P5_아크네스_포밍워시_여드름케어.jpg
-- C3_P6_라로슈포제_에빠끌라_피지조절.jpg
-- C3_P7_식물나라_탄산수_모공노폐물.jpg
-- C3_P8_프리메라_마일드필링_각질제거.jpg
-- C3_P9_아벤느_클렌징폼_건성보습.jpg
-- C3_P10_이니스프리_화산송이_모공흡착.jpg


--==상세페이지 dummy data ==

INSERT INTO product_image (product_idx, product_image_url, product_image_level) VALUES
-- C1 상세 이미지
(1, '01_C1_COSRX_detail_1.jpg', 2),
(2, '02_C1_조선미녀_detail_1.jpg', 2),
(3, '03_C1_APLB_detail_01.jpg', 2),
(4, '04_C1_우르오스_detail_1.jpg', 2),
(5, '05_C1_비오템_detail_1.jpg', 2),
(5, '05_C1_비오템_detail_2.jpg', 3),
(6, '06_C1_포엘리에_detail_01.jpg', 2),
(7, '07_C1_라네즈옴므_detail_1.jpg', 2),
(8, '08_C1_라로슈포제_detail_1.jpg', 2),
(9, '09_C1_스킨푸드_detail_1.jpg', 2),
(10, '10_C1_더마비_detail_1.jpg', 2),
(10, '10_C1_더마비_detail_2.jpg', 3),

-- C2 상세 이미지
(11, '01_C2_닥터지_detail_1.jpg', 2),
(11, '01_C2_닥터지_detail_2.jpg', 3),
(11, '01_C2_닥터지_detail_3.jpg', 4),
(11, '01_C2_닥터지_detail_4.jpg', 5),
(12, '02_C2_라운드랩_detail_1.jpg', 2),
(13, '03_C2_듀이트리_detail_1.jpg', 2),
(14, '04_C2_유이크_detail_1.jpg', 2),
(14, '04_C2_유이크_detail_2.jpg', 3),
(15, '05_C2_아이디얼포맨_detail_1.jpg', 2),
(15, '05_C2_아이디얼포맨_detail_2.jpg', 3),
(16, '06_C2_다슈_detail_1.jpg', 2),
(17, '07_C2_오브제_detail_1.jpg', 2),
(18, '08_C2_비레디_detail_1.jpg', 2),
(18, '08_C2_비레디_detail_2.jpg', 3),
(18, '08_C2_비레디_detail_3.jpg', 4),
(18, '08_C2_비레디_detail_4.jpg', 5),
(18, '08_C2_비레디_detail_5.jpg', 6),
(18, '08_C2_비레디_detail_6.jpg', 7),
(19, '09_C2_블랙쿠션_detail_1.jpg', 2),
(19, '09_C2_블랙쿠션_detail_2.jpg', 3),
(19, '09_C2_블랙쿠션_detail_3.jpg', 4),
(20, '10_C2_메이크프렘_detail_1.jpg', 2),
(20, '10_C2_메이크프렘_detail_2.jpg', 3),

-- C3 상세 이미지
(21, '01_C3_센카_detail_1.jpg', 2),
(21, '01_C3_센카_detail_2.jpg', 3),
(22, '02_C3_이니스프리_detail_1.jpg', 2),
(23, '03_C3_해피바스_detail_1.jpg', 2),
(24, '04_C3_바이오더마_detail_1.jpg', 2),
(25, '05_C3_아크네스_detail_1.jpg', 2),
(25, '05_C3_아크네스_detail_2.jpg', 3),
(26, '06_C3_라로슈포제_detail_1.jpg', 2),
(27, '07_C3_식물나라_detail_1.jpg', 2),
(28, '08_C3_프리메라_detail_1.jpg', 2),
(28, '08_C3_프리메라_detail_2.jpg', 3),
(28, '08_C3_프리메라_detail_3.jpg', 4),
(28, '08_C3_프리메라_detail_4.jpg', 5),
(28, '08_C3_프리메라_detail_5.jpg', 6),
(29, '09_C3_아벤느_detail_1.jpg', 2),
(30, '10_C3_이니스프리_detail_1.jpg', 2);



SET FOREIGN_KEY_CHECKS = 1;

SELECT * FROM product_image 
WHERE product_idx = #{id} 
ORDER BY product_image_level ASC;


SELECT * FROM product_image 
WHERE product_idx = 28
ORDER BY product_image_level ASC;




-- ========================================
-- 			커뮤니티(post) dummy data
-- ========================================
-- insert into post values(null, 회원_idx, skin, 제목, 내용, 이미지, 좋아요갯수,0,null,0,0,0,now(),null);

-- post_idx=1
INSERT INTO post 
VALUES (
    NULL,                      -- post_idx (자동 증가)
    1,                         -- mem_idx (회원 번호)
    'skin',                    -- post_category (스킨 게시글)
    '피부관리 꿀팁',              -- post_title (제목)
    '이 제품 써봤는데 좋아요!',     -- post_content (내용)
    '06_겨울피부관리.png*09_피부관리법.png*14_꿀피부치트.png',        -- post_image (이미지 파일명)
    19,                       -- post_like (좋아요 수)
    0,                        -- post_comment_count (댓글 수)
    NULL,                     -- order_id (리뷰 주문번호 아님 → NULL)
    0,                        -- post_review (리뷰글 아님 = 0)
    0,                        -- post_rating (별점 = 0)
    0,                        -- post_delete (삭제 여부)
    NOW(),                    -- post_time (작성일)
    NULL                      -- post_update (수정일)
);
-- post에 보이는 상품 더미
INSERT INTO post_product
(post_idx,product_idx,post_product_time)
VALUES 
(1,5,now())
,(1,9,now())
,(1,4,now())
,(1,1,now())
,(1,3,now())
,(1,6,now())
,(1,7,now())
,(1,10,now())
,(1,11,now())
,(1,20,now())
,(1,21,now())
,(1,1,now());

-- 1번 post_idx에 대한 `like` 테이블 정보 (좋아요)
INSERT INTO `like` (post_idx,mem_idx)
VALUES 
(1,7)
,(1,8)
,(1,9)
,(1,10)
,(1,11)
,(1,12)
,(1,13)
,(1,14)
,(1,15)
,(1,16)
,(1,17)
,(1,18)
,(1,19)
,(1,20)
,(1,21)
,(1,22)
,(1,23)
,(1,24)
,(1,25);

-- post_idx = 1 번 해시태그 등록
INSERT INTO post_hashtag (post_idx,hashtag_idx)
VALUES
(1,1)
,(1,8)
,(1,9)
,(1,10);


-- post_idx=2
INSERT INTO post 
VALUES (
    NULL,                     -- post_idx
    2,                        -- mem_idx
    'review',                 -- post_category (리뷰)
    '이 제품 솔직 후기',         -- post_title
    '일주일 써봤는데 촉촉해요',   -- post_content
    '09_피부관리법.png*13_솜스킨.png*07_내돈내산.png',          -- post_image
    10,                        -- post_like
    0,                        -- post_comment_count
    NULL,                     -- order_id (주문 번호: 샘플이므로 NULL)
    1,                        -- post_review (리뷰글 = 1)
    4,                        -- post_rating (별점)
    0,                        -- post_delete
    NOW(),                    -- post_time
    NULL                      -- post_update
);

-- 2번 post_idx에 대한 `like` 테이블 정보 (좋아요)
INSERT INTO `like` (post_idx,mem_idx)
VALUES 
(2,15)
,(2,16)
,(2,17)
,(2,18)
,(2,19)
,(2,20)
,(2,21)
,(2,22)
,(2,23)
,(2,24);

-- post_idx = 2 번 해시태그 등록
INSERT INTO post_hashtag (post_idx,hashtag_idx)
VALUES
(2,1)
,(2,8)
,(2,9)
,(2,10);


-- post_idx=3
INSERT INTO post 
VALUES (
    NULL,                         -- post_idx
    3,                            -- mem_idx
    'free',                       -- post_category (자유게시판)
    '요즘너무 춥네요',            				-- post_title
    '건조한 날씨 어떻게 피부관리들 하시나요? 올인원',    -- post_content
    '16_올인원.png',                -- post_image
    0,                            -- post_like
    0,                            -- post_comment_count
    NULL,                         -- order_id
    0,                            -- post_review
    0,                            -- post_rating
    0,                            -- post_delete
    NOW(),                        -- post_time
    NULL                          -- post_update
);


-- post_idx = 3 번 해시태그 등록
INSERT INTO post_hashtag (post_idx,hashtag_idx)
VALUES
(3,2)
,(3,4)
,(3,9)
,(3,10);


-- post_idx=4
INSERT INTO post 
VALUES (
    NULL,                         -- post_idx
	4    ,                            -- mem_idx
    'free',                       -- post_category (자유게시판)
    '피부관리 첫번쨰',            		-- post_title
    '요즘 같은 환절기 피부 당기시는 분 👋🏻 아토베이러 크림과 함깨 ',       -- post_content
    '17_크림01.png*18_크림02.png*19_크림03.png*20_크림04.png*21_크림05.png*22_크림06.png',                -- post_image
    0,                            -- post_like
    0,                            -- post_comment_count
    NULL,                         -- order_id
    0,                            -- post_review
    0,                            -- post_rating
    0,                            -- post_delete
    NOW(),                        -- post_time
    NULL                          -- post_update
);

-- post_idx = 4 번 해시태그 등록
INSERT INTO post_hashtag (post_idx,hashtag_idx)
VALUES
(4,2)
,(4,3)
,(4,8)
,(4,10);

-- post_idx=5
INSERT INTO post 
VALUES (
    NULL,                         -- post_idx
    3,                            -- mem_idx
    'skin',                       -- post_category (자유게시판)
    '스틱 파운데이션!',            		-- post_title
    '수분 에센스 + 자외선 차단 + 파운데이션 + 프라이머까지 담은 올인원 커버 스틱⊹ ',       -- post_content
    '23_파데.png*24_파데2.png*25_파데3.png*26_파데4.png',                -- post_image
    0,                            -- post_like
    0,                            -- post_comment_count
    NULL,                         -- order_id
    0,                            -- post_review
    0,                            -- post_rating
    0,                            -- post_delete
    NOW(),                        -- post_time
    NULL                          -- post_update
);

INSERT INTO post_product
(
post_idx, product_idx, post_product_time
)
VALUES 
(5,17,now())

-- post_idx=6
INSERT INTO post 
VALUES (
    NULL,                         -- post_idx
    2,                            -- mem_idx
    'free',                       -- post_category (자유게시판)
    '만능 세럼입니다~',            		-- post_title
    '피부에 가장 기본이 되는 보습, 미백, 주름개선, 진정, 피부장벽을 위한 
영양성분을 꾹꾹 눌러담아 사심채워 만든 만능 세럼이랍니다..! ',       -- post_content
    '34_세럼.png*35_세럼2.png*36_세럼3.png*37_세럼4.png',               -- post_image
    0,                            -- post_like
    0,                            -- post_comment_count
    NULL,                         -- order_id
    0,                            -- post_review
    0,                            -- post_rating
    0,                            -- post_delete
    NOW(),                        -- post_time
    NULL                          -- post_update
);

-- post_idx=7
INSERT INTO post 
VALUES (
    NULL,                         -- post_idx
    5,                            -- mem_idx
    'free',                       -- post_category (자유게시판)
    '우르오스 폼클렌징입니다',            		-- post_title
    '남자 화장품 브랜드로 굳건히 인기가 많은 !! 우르오스!!
	제 친구 남편들 남친들은 다 이 브랜드 쓴다해도 과언이 아닐
	정도로 정말 유명해요 ㅋ 저희 남편도 참 좋아하는 브랜드인데
	이번에 신상으로 출시된 페이스워시는 특히나 사용감이 편해서 ',       -- post_content
    '27_폼클렌징.png*28_폼클렌징2.png*29_폼클렌징3.png*30_폼클렌징4.png',                -- post_image
    0,                            -- post_like
    0,                            -- post_comment_count
    NULL,                         -- order_id
    0,                            -- post_review
    0,                            -- post_rating
    0,                            -- post_delete
    NOW(),                        -- post_time
    NULL                          -- post_update
);



-- post_idx=8
INSERT INTO post 
VALUES (
    NULL,                         -- post_idx
    4,                            -- mem_idx
    'free',                       -- post_category (자유게시판)
    '관리하는 남자 필수템!',            		-- post_title
    '원오브뎀 드 뗑 쿠션 / 1호 잡티, 모공 커버에 피부톤 정리까지!
	화장이 처음인 남자도 쉽게! ',       -- post_content
    '31_팩트.png*32_팩트2.png*33_팩트3.png',                -- post_image
    19,                            -- post_like
    0,                            -- post_comment_count
    NULL,                         -- order_id
    0,                            -- post_review
    0,                            -- post_rating
    0,                            -- post_delete
    NOW(),                        -- post_time
    NULL                          -- post_update
);

-- 8번 post_idx에 대한 `like` 테이블 정보 (좋아요)
INSERT INTO `like` (post_idx,mem_idx)
VALUES 
(8,7)
,(8,8)
,(8,9)
,(8,10)
,(8,11)
,(8,12)
,(8,13)
,(8,14)
,(8,15)
,(8,16)
,(8,17)
,(8,18)
,(8,19)
,(8,20)
,(8,21)
,(8,22)
,(8,23)
,(8,24)
,(8,25);


-- insert into post values(null, 회원_idx, free, 제목, 내용, 이미지, 좋아요갯수,0,null,0,0,0,now(),null);

