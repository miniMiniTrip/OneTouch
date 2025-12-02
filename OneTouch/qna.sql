-- 1. 회원 테이블
-- ========================================

CREATE TABLE mem (
    mem_idx INT AUTO_INCREMENT PRIMARY KEY COMMENT '회원번호',
    mem_id VARCHAR(50) NOT NULL UNIQUE COMMENT '아이디',
    mem_pw VARCHAR(255) NOT NULL COMMENT '비밀번호(암호화)',
    mem_name VARCHAR(50) NOT NULL COMMENT '이름',
    mem_addr VARCHAR(255) COMMENT '주소',
    mem_addr_more VARCHAR(255) COMMENT '상세주소',
    mem_email VARCHAR(100) NOT NULL UNIQUE COMMENT '이메일',
    mem_roll ENUM('user', 'admin') NOT NULL DEFAULT 'user' COMMENT '권한',
    mem_birth DATE COMMENT '생년월일',
    mem_phone VARCHAR(20) NOT NULL COMMENT '전화번호',
    mem_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '가입일',
    mem_update_time TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일'
    
--	 조건문 확인해보세요 --    
--   CONSTRAINT chk_mem_email CHECK (mem_email LIKE '%@%'),
--   CONSTRAINT chk_mem_phone CHECK (mem_phone REGEXP '^[0-9-]+$'),
--   CONSTRAINT chk_mem_id_length CHECK (CHAR_LENGTH(mem_id) >= 4)

) COMMENT '회원';


-- CREATE INDEX idx_mem_email ON mem(mem_email);
-- CREATE INDEX idx_mem_phone ON mem(mem_phone);




 --  2.qna 테이블
 
CREATE TABLE qna (
    qna_idx INT AUTO_INCREMENT PRIMARY KEY COMMENT '게시판번호',
    mem_idx INT NOT NULL COMMENT '회원FK',
    qna_title VARCHAR(100) NOT NULL COMMENT '제목',
    qna_content TEXT NOT NULL COMMENT '내용',
    qna_category INT NOT NULL DEFAULT 0 COMMENT '카테고리(0~5)', -- 0: 상품, 1: 배송 2: 교환,환불 3: 기타문의 4 : FAQ 5 : 공지사항. 상위 노출
    qna_private BOOLEAN NOT NULL DEFAULT FALSE COMMENT '비밀글여부',
    qna_answered BOOLEAN NOT NULL DEFAULT FALSE COMMENT '답변여부',
    qna_answer_content TEXT COMMENT '답변내용',
    qna_delete INT NOT NULL DEFAULT 0 COMMENT '삭제여부', -- 0 정상, 1 유저 삭제, 2 관리자 삭제
    qna_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '작성시간',
    qna_update TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '수정시간',
    qna_answer_time TIMESTAMP NULL COMMENT '답변시간',
    
    FOREIGN KEY (mem_idx) REFERENCES mem(mem_idx) 
        ON DELETE RESTRICT ON UPDATE CASCADE
    
--    ,CONSTRAINT chk_qna_category CHECK (qna_category BETWEEN 0 AND 5)
) COMMENT '고객센터';


INSERT INTO `otdb`.`qna` 
(
`mem_idx`
, `qna_title`
, `qna_content`
, `qna_category`
-- , `qna_private`
, `qna_answered`
, `qna_delete`
, `qna_time`
, `qna_update`
) 
VALUES 
(
'1'
, '어떤상품문제'
, '빨리해결해줘요'
, '0'
-- , false
, false, '0', now(), now());

ALTER TABLE qna
drop COLUMN product_name VARCHAR(100) NOT NULL COMMENT '상품명'
AFTER qna_idx;

ALTER TABLE qna
DROP COLUMN product_name;


-- CREATE INDEX idx_qna_member ON qna(mem_idx);
-- CREATE INDEX idx_qna_category ON qna(qna_category);
-- CREATE INDEX idx_qna_answered ON qna(qna_answered);



    SELECT 
    qna.qna_idx,
    qna.mem_idx,
    mem.mem_name,          -- 회원 이름
    qna.qna_title,
    qna.qna_content,
    qna.qna_category,
    qna.qna_private,
    qna.qna_answered,
    qna.qna_answer_content,
    qna.qna_delete,
    qna.qna_time,
    qna.qna_update,
    qna.qna_answer_time
	FROM qna
	JOIN mem ON qna.mem_idx = mem.mem_idx   -- 회원번호 기준으로 연결
	WHERE qna.qna_delete = 0                -- 삭제 안 된 글만
	ORDER BY qna.qna_idx DESC;              -- 최신 글이 위로



 SELECT 
        qna_idx,
        mem_idx,
        mem_name,          
        qna_title,
        qna_content,
        qna_category,
        qna_private,
        qna_answered,
        qna_answer_content,
        qna_delete,
        qna_time,
        qna_update,
        qna_answer_time
    FROM qna
    JOIN mem ON qna.mem_idx = mem.mem_idx   
    WHERE qna_delete = 0
    ORDER BY qna_idx DESC
    
    
    
    
    
    
    
-- ==================================
--			qna 더미
-- ==================================    
   
  -- 30번 화산송이 폼  
INSERT INTO qna (
    qna_idx, mem_idx, qna_title, qna_content, qna_category,
    qna_private, qna_answered, qna_answer_content, qna_delete,
    qna_time, qna_update, qna_answer_time, product_idx
) VALUES
(NULL, 3, '사용 방법 문의', '세안할 때 얼마나 짜야 하나요?', 1, 0, 1, '적당량(1cm 정도) 사용하시면 됩니다.', 0, NOW(), NOW(), NOW(), 30),
(NULL, 5, '지성 피부에 좋아요?', '지성피부인데 괜찮나요?', 1, 0, 0, '', 0, NOW(), NOW(), NULL, 30),
(NULL, 7, '건성인데 사용 가능?', '건성 피부도 사용해도 되나요?', 1, 0, 1, '건성은 주 2~3회 사용을 권장드립니다.', 0, NOW(), NOW(), NOW(), 30),
(NULL, 9, '트러블 진정되나요?', '요즘 트러블이 올라오는데 도움되나요?', 1, 0, 0, '', 0, NOW(), NOW(), NULL, 30),
(NULL, 12, '민감성도 괜찮나요?', '피부가 예민한 편인데 괜찮을까요?', 1, 1, 1, '민감성은 소량 테스트 후 사용 권장드립니다.', 0, NOW(), NOW(), NOW(), 30),
(NULL, 4, '향이 강한가요?', '향이 강한 편인지 궁금해요.', 3, 0, 0, '', 0, NOW(), NOW(), NULL, 30),
(NULL, 8, '사용감 문의', '거품 잘 나나요?', 1, 0, 1, '거품 풍성하게 잘 납니다!', 0, NOW(), NOW(), NOW(), 30),
(NULL, 10, '얼굴 당김?', '세안 후에 많이 당기나요?', 1, 0, 0, '', 0, NOW(), NOW(), NULL, 30),
(NULL, 2, '배송 문의', '배송 얼마나 걸리나요?', 2, 0, 1, '보통 1~2일 소요됩니다.', 0, NOW(), NOW(), NOW(), 30),
(NULL, 6, '유통기한 문의', '유통기한 넉넉한가요?', 3, 0, 0, '', 0, NOW(), NOW(), NULL, 30),
(NULL, 11, '재구매 의사 있음?', '재구매 많이 하는 제품인가요?', 1, 0, 1, '재구매율이 높은 인기 상품입니다.', 0, NOW(), NOW(), NOW(), 30),
(NULL, 13, '세정력 강한가요?', '메이크업도 지워지나요?', 1, 0, 1, '클렌징폼이라 메이크업 제거보단 2차 세안용입니다.', 0, NOW(), NOW(), NOW(), 30),
(NULL, 14, '피부 자극?', '자극감 있는 편인가요?', 1, 0, 0, '', 0, NOW(), NOW(), NULL, 30),
(NULL, 15, '여드름에 효과 있음?', '블랙헤드/화이트헤드 제거되나요?', 1, 0, 1, '모공 각질/피지 케어에 효과적입니다.', 0, NOW(), NOW(), NOW(), 30),
(NULL, 16, '얼마나 오래 쓰나요?', '하나 사면 얼마나 사용할 수 있나요?', 3, 0, 0, '', 0, NOW(), NOW(), NULL, 30);

    
   -- 29번 관련 더미 
    
 INSERT INTO qna (
    qna_idx, mem_idx, qna_title, qna_content, qna_category,
    qna_private, qna_answered, qna_answer_content, qna_delete,
    qna_time, qna_update, qna_answer_time, product_idx
) VALUES

(NULL, 5, '지성 피부에 괜찮나요?', '지성인데 사용 적합한가요?', 1, 0, 1, '지성/복합성 피부에 잘 맞는 제품입니다.', 0, NOW(), NOW(), NOW(), 29),
(NULL, 11, '건성도 쓸 수 있음?', '건성인데 괜찮나요?', 1, 0, 1, '건성도 사용 가능하며 보습 병행 추천드립니다.', 0, NOW(), NOW(), NOW(), 29),
(NULL, 7, '패키지 변경?', '포장 디자인 바뀐 건가요?', 3, 0, 1, '최근 패키지 리뉴얼되었습니다.', 0, NOW(), NOW(), NOW(), 29),
(NULL, 9, '유통기한 문의', '유통기한 얼마나 남아있나요?', 3, 0, 1, '최소 1년 이상 남은 제품으로 발송됩니다.', 0, NOW(), NOW(), NOW(), 29),
(NULL, 13, '사용 중 트러블?', '사용 후 트러블 난 경우 있나요?', 1, 1, 1, '개인 피부 상태에 따라 다르며 소량 테스트 권장드립니다.', 0, NOW(), NOW(), NOW(), 29),
(NULL, 14, '용량 대비 가성비?', '오래 쓰는 편인가요?', 3, 0, 1, '일일 사용 기준 한 달 이상 사용 가능합니다.', 0, NOW(), NOW(), NOW(), 29),
(NULL, 15, '제품 차이?', '비슷한 제품이랑 뭐가 다른가요?', 3, 0, 1, '모공 케어에 최적화된 성분을 포함하고 있습니다.', 0, NOW(), NOW(), NOW(), 29),
(NULL, 16, '사용 후 느낌?', '세안 후 어떤 느낌인가요?', 1, 0, 1, '산뜻하면서도 건조하지 않은 마무리감입니다.', 0, NOW(), NOW(), NOW(), 29);
   
    
   
     
   -- 20번 관련 더미 카밍 진정 선크림
    
INSERT INTO qna (
    qna_idx, mem_idx, qna_title, qna_content, qna_category,
    qna_private, qna_answered, qna_answer_content, qna_delete,
    qna_time, qna_update, qna_answer_time, product_idx
) VALUES
(NULL, 4, '사용감 어떤가요?', '발림성 괜찮나요?', 1, 0, 1, '부드럽게 잘 발리고 끈적임이 적습니다.', 0, NOW(), NOW(), NOW(), 20),
(NULL, 6, '민감성도 사용 가능?', '피부가 예민해서 걱정돼요.', 1, 0, 1, '민감한 피부도 무난하게 사용할 수 있습니다.', 0, NOW(), NOW(), NOW(), 20),
(NULL, 8, '향이 강한 편인가요?', '향 민감한데 괜찮나요?', 3, 0, 0, '', 0, NOW(), NOW(), NULL, 20),
(NULL, 2, '배송 얼마나 걸림?', '지금 주문하면 언제 올까요?', 2, 0, 1, '보통 2~3일 내 배송됩니다.', 0, NOW(), NOW(), NOW(), 20),
(NULL, 10, '재구매 의사 있음?', '다들 재구매 하나요?', 1, 0, 0, '', 0, NOW(), NOW(), NULL, 20),
(NULL, 12, '얼굴 자극 있나요?', '사용 시 따가운 느낌이 있나요?', 1, 0, 1, '자극 없이 부드럽게 사용할 수 있습니다.', 0, NOW(), NOW(), NOW(), 20),
(NULL, 3, '사용 주기 문의', '하루에 몇 번 써도 되나요?', 1, 0, 0, '', 0, NOW(), NOW(), NULL, 20),
(NULL, 5, '여름철 사용 가능?', '땀 많이 나도 괜찮을까요?', 1, 0, 1, '여름철에도 산뜻하게 사용할 수 있습니다.', 0, NOW(), NOW(), NOW(), 20),
(NULL, 7, '아이와 같이 써도 되나요?', '아이에게 사용 가능한가요?', 1, 0, 0, '', 0, NOW(), NOW(), NULL, 20),
(NULL, 9, '끈적임 적나요?', '바른 후 번들거림 없나요?', 1, 0, 1, '산뜻하게 흡수되어 끈적임이 적습니다.', 0, NOW(), NOW(), NOW(), 20);

    
    
   -- 21번 센카 폼클렌징 
   
    
INSERT INTO qna (
    qna_idx, mem_idx, qna_title, qna_content, qna_category,
    qna_private, qna_answered, qna_answer_content, qna_delete,
    qna_time, qna_update, qna_answer_time, product_idx
) VALUES
(NULL, 5, '얼굴 트러블 괜찮을까요?', '피부가 민감한데 트러블 생길까 걱정돼요.', 1, 0, 1, '저자극 포뮬러라 트러블 걱정 적습니다.', 0, NOW(), NOW(), NOW(), 21),
(NULL, 7, '수분감 충분한가요?', '바르면 건조하지 않나요?', 1, 0, 0, '', 0, NOW(), NOW(), NULL, 21),
(NULL, 9, '향이 강한 편인가요?', '남자 향수와 섞이면 어떨까요?', 3, 0, 1, '은은한 향으로 다른 향수와 무난하게 섞입니다.', 0, NOW(), NOW(), NOW(), 21),
(NULL, 2, '아침저녁 사용 가능?', '몇 번 발라야 효과적일까요?', 1, 0, 0, '', 0, NOW(), NOW(), NULL, 21),
(NULL, 6, '배송 언제 오나요?', '지금 주문하면 몇 일 걸릴까요?', 2, 0, 1, '주문 후 1~2일 내 배송됩니다.', 0, NOW(), NOW(), NOW(), 21),
(NULL, 8, '재구매 의사 있나요?', '사용해본 분들 재구매 많이 하나요?', 1, 0, 0, '', 0, NOW(), NOW(), NULL, 21),
(NULL, 11, '피부 번들거림 없나요?', '유분감 많은가요?', 1, 0, 1, '가볍고 산뜻하게 흡수되어 번들거림 없습니다.', 0, NOW(), NOW(), NOW(), 21),
(NULL, 12, '거품 잘 나나요?', '거품 풍부한 편인가요?', 1, 0, 0, '', 0, NOW(), NOW(), NULL, 21),
(NULL, 13, '향수와 같이 써도 되나요?', '남자 향수와 조합이 자연스러울까요?', 3, 0, 1, '은은해서 다른 향수와도 무난하게 사용 가능합니다.', 0, NOW(), NOW(), NOW(), 21),
(NULL, 14, '사용감 가벼운가요?', '답답하지 않고 산뜻한가요?', 1, 0, 1, '가볍고 산뜻하게 흡수됩니다.', 0, NOW(), NOW(), NOW(), 21);

    
-- 18번 블루쿠션

INSERT INTO qna (
    qna_idx, mem_idx, qna_title, qna_content, qna_category,
    qna_private, qna_answered, qna_answer_content, qna_delete,
    qna_time, qna_update, qna_answer_time, product_idx
) VALUES
(NULL, 5, '커버력 괜찮나요?', '잡티나 홍조 커버 잘 되나요?', 1, 0, 1, '자연스럽게 커버되며 무거운 느낌 없습니다.', 0, NOW(), NOW(), NOW(), 18),
(NULL, 7, '발림성 부드러운가요?', '바를 때 뭉치거나 들뜨지 않나요?', 1, 0, 0, '', 0, NOW(), NOW(), NULL, 18),
(NULL, 9, '피부 자극 걱정되네요', '민감한 피부도 사용 가능한가요?', 1, 0, 1, '저자극 테스트 완료로 안전하게 사용 가능합니다.', 0, NOW(), NOW(), NOW(), 18),
(NULL, 2, '톤이 자연스러운가요?', '제 피부 톤과 잘 맞을까요?', 3, 0, 0, '', 0, NOW(), NOW(), NULL, 18),
(NULL, 6, '지속력 궁금', '하루 종일 번들거림 없이 유지되나요?', 1, 0, 1, '보송하게 유지되며 번들거림 최소화했습니다.', 0, NOW(), NOW(), NOW(), 18),
(NULL, 8, '재구매 의사 있나요?', '한 번 쓰면 계속 쓰게 되나요?', 1, 0, 0, '', 0, NOW(), NOW(), NULL, 18),
(NULL, 11, '사용감 문의', '무겁거나 답답하지 않나요?', 1, 0, 1, '가볍고 산뜻하게 흡수되어 편안한 사용감입니다.', 0, NOW(), NOW(), NOW(), 18),
(NULL, 12, '커버력 vs 촉촉함', '커버력 좋으면 건조하지 않을까요?', 1, 0, 0, '', 0, NOW(), NOW(), NULL, 18),
(NULL, 13, '휴대용 케이스 문의', '케이스가 튼튼한가요?', 2, 0, 1, '튼튼하게 제작되어 휴대 시 문제 없습니다.', 0, NOW(), NOW(), NOW(), 18),
(NULL, 14, '추천 톤', '피부 밝은 사람도 사용 가능한가요?', 3, 0, 1, '밝은 톤도 자연스럽게 표현됩니다.', 0, NOW(), NOW(), NOW(), 18);


-- 10번 닥터지 무기자 차 선크림

INSERT INTO qna (
    qna_idx, mem_idx, qna_title, qna_content, qna_category,
    qna_private, qna_answered, qna_answer_content, qna_delete,
    qna_time, qna_update, qna_answer_time, product_idx
) VALUES
(NULL, 2, '자외선 차단력?', 'SPF50+ 정도로 충분히 보호될까요?', 1, 0, 1, 'SPF50+로 강한 자외선에도 충분히 보호됩니다.', 0, NOW(), NOW(), NOW(), 11),
(NULL, 4, '트러블 걱정', '민감성 피부에도 사용할 수 있을까요?', 1, 0, 0, '', 0, NOW(), NOW(), NULL, 11),
(NULL, 5, '끈적임 없나요?', '바른 후 피부가 답답하지 않나요?', 2, 0, 1, '산뜻한 제형으로 끈적임 없이 사용 가능합니다.', 0, NOW(), NOW(), NOW(), 11),
(NULL, 3, '화장 전에 사용 가능?', '메이크업 전에 발라도 괜찮을까요?', 2, 0, 0, '', 0, NOW(), NOW(), NULL, 11),
(NULL, 6, '백탁 현상?', '흰 잔여물 없이 발리나요?', 3, 0, 1, '백탁 현상이 거의 없으며 자연스럽게 흡수됩니다.', 0, NOW(), NOW(), NOW(), 11),
(NULL, 1, '재구매 의사', '가격 대비 만족스러운 제품인가요?', 1, 0, 0, '', 0, NOW(), NOW(), NULL, 11),
(NULL, 7, '지속력', '야외 활동 시 오래 지속되나요?', 1, 0, 1, '지속력이 좋아 2~3시간 정도 외출에도 충분히 보호됩니다.', 0, NOW(), NOW(), NOW(), 11);


-- 16아쿠아 비비로션
INSERT INTO qna (
    qna_idx, mem_idx, qna_title, qna_content, qna_category,
    qna_private, qna_answered, qna_answer_content, qna_delete,
    qna_time, qna_update, qna_answer_time, product_idx
) VALUES
(NULL, 4, '커버력 괜찮나요?', '잡티나 붉은기 잘 가려지나요?', 1, 0, 1, '자연스럽게 커버되며 두껍지 않게 표현됩니다.', 0, NOW(), NOW(), NOW(), 16),
(NULL, 6, '발림성 어떤가요?', '부드럽게 펴발리나요?', 1, 0, 0, '', 0, NOW(), NOW(), NOW(), 16),
(NULL, 8, '피부 촉촉한가요?', '건조하지 않나요?', 1, 0, 1, '수분감이 있어 하루 종일 촉촉함을 유지합니다.', 0, NOW(), NOW(), NOW(), 16),
(NULL, 2, '민감성 피부도 사용 가능?', '얼굴이 예민한데 괜찮을까요?', 1, 0, 0, '', 0, NOW(), NOW(), NOW(), 16),
(NULL, 10, '지속력 궁금', '하루 종일 들뜨지 않나요?', 1, 0, 1, '보송하게 마무리되어 지속력이 좋습니다.', 0, NOW(), NOW(), NOW(), 16),
(NULL, 12, '재구매 의사 있나요?', '한 번 써보면 계속 쓰게 되나요?', 1, 0, 0, '', 0, NOW(), NOW(), NOW(), 16),
(NULL, 3, '톤이 자연스러운가요?', '내 피부 톤에 맞을까요?', 3, 0, 1, '자연스러운 색감으로 다양한 피부 톤에 무난합니다.', 0, NOW(), NOW(), NOW(), 16);












INSERT INTO post (mem_idx, post_category, order_item_id, post_title, post_content, post_image, post_rating)
VALUES
(2,'review',1 ,'촉촉하면서도 산뜻한 남자 선크림!', '요즘 피부가 민감해져서 고민이었는데, 카밍진정 선크림 바르고 나니 붉은기도 줄고 촉촉함은 유지되네요. 여름에도 끈적임 없이 산뜻해요.', '13_카밍1.png*14_카밍2.png', 5),
(4,'review',2 ,'진정 효과 확실!', '얼굴 트러블이 잘 나는 편인데, 이 선크림 바른 뒤로 자극 없이 하루 종일 편안하네요. 남자 피부에도 딱 좋아요.', '15_카밍3.png*16_카밍4.png', 4),
(1,'review',3 ,'여름철 필수템', '햇빛 강한 날에도 피부가 당기지 않고 진정되는 느낌. SPF도 있어서 외출할 때 든든합니다.', '17_카밍5.png*18_카밍6.png', 5),
(6,'review',4 ,'무겁지 않은 마무리감', '무겁지 않고 산뜻하게 발리는 질감이 좋네요. 남자 피부용이라 그런지 부담 없고 흡수도 빨라요.', '19_카밍7.png*20_카밍8.png', 4),
(3,'review',5 ,'민감 피부 추천', '카밍진정 기능 덕분인지 얼굴 붉은기와 가려움이 줄었어요. 꾸준히 사용하면 피부가 안정될 것 같아요.', '21_카밍9.png*22_카밍10.png', 5),
(5,'review',6 ,'재구매 의사 100%', '가벼운 질감에 진정 효과까지 있어 정말 만족스럽습니다. 남자 피부에 딱 맞는 선크림!', '23_카밍11.png', 5),
(2,'review',7 ,'끈적임 없는 산뜻함', '평소 남자용 제품은 무겁거나 기름지기 쉬운데, 이건 하루 종일 산뜻하게 유지돼요. 여름철 강추!', '15_카밍3.png', 4),
(1,'review',8 ,'붉은기 완화 최고', '얼굴 붉은기가 고민이었는데, 바르고 나서 확실히 진정되는 느낌입니다. 피부가 편안해요.', '17_카밍5.png', 5),
(6,'review',9 ,'피부 자극 없이 촉촉', '무겁지 않은 질감인데 보습력도 있어요. 민감성 피부 남자분들에게 추천!', '18_카밍6.png', 4),
(3,'review',10 ,'데일리 선크림으로 딱', '매일 아침 바르는데 산뜻하게 흡수되고 진정 효과까지 있어 데일리용으로 만족합니다.', '19_카밍7.png', 5);




INSERT INTO `order`(order_id,mem_idx,order_no,order_status,total_amount)
VALUES
(1,7,'OT156498421','결제완료',)




