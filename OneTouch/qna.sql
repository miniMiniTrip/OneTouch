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




 --2.qna 테이블
 /*
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