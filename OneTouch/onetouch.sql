select * from hashtag

-- ================= 주의사항 ===================
-- 추가되는 조건, Column이 생기는 경우 각 테이블 아래에,
-- 추가되는 더미데이터는 first_data.sql 파일에 적어주세요.
-- ============================================

-- 데이터베이스 생성
CREATE DATABASE IF NOT EXISTS otdb DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE otdb;

-- ========================================
-- 1. 회원 테이블
-- ========================================

CREATE TABLE mem (
    mem_idx INT AUTO_INCREMENT PRIMARY KEY COMMENT '회원번호',
    mem_id VARCHAR(50) NOT NULL UNIQUE COMMENT '아이디',
    mem_pw VARCHAR(255) NOT NULL COMMENT '비밀번호(암호화)',
    mem_name VARCHAR(50) NOT NULL COMMENT '이름',
    mem_postal VARCHAR(10) NOT NULL COMMENT '우편번호',
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

-- !중요 mem에 mem_postal 컬럼 추가 하기
ALTER TABLE mem
ADD COLUMN mem_postal VARCHAR(10) NULL;
-- !중요합니다 mem_postal 컬럼이 추가하고 컬럼 위치 변경하는 명령어 
ALTER TABLE `otdb`.`mem` 
CHANGE COLUMN `mem_postal` `mem_postal` VARCHAR(10) NULL DEFAULT NULL AFTER `mem_name`;

-- 아잇 왜 또 녹화하려니 안됨
-- CREATE INDEX idx_mem_email ON mem(mem_email);
-- CREATE INDEX idx_mem_phone ON mem(mem_phone);

-- ========================================
-- 2. 카테고리 테이블
-- ========================================

CREATE TABLE category (
    category_idx INT AUTO_INCREMENT PRIMARY KEY COMMENT '카테고리번호',
    category_name VARCHAR(50) NOT NULL UNIQUE COMMENT '카테고리명'
    
--    ,CONSTRAINT chk_category_name_not_empty CHECK (CHAR_LENGTH(TRIM(category_name)) > 0)
) COMMENT '카테고리';

-- ========================================
-- 3. 상품 테이블
-- ========================================

CREATE TABLE product (
    product_idx INT AUTO_INCREMENT PRIMARY KEY COMMENT '상품번호',
    category_idx INT NOT NULL COMMENT '카테고리FK',
    product_wishlist INT NOT NULL DEFAULT 0 COMMENT '찜수',
    product_price INT NOT NULL COMMENT '가격',
    product_name VARCHAR(100) NOT NULL COMMENT '상품명',
    product_brand VARCHAR(100) NOT NULL COMMENT '브랜드',
    product_comment TEXT COMMENT '상품설명',
    product_cnt INT NOT NULL DEFAULT 0 COMMENT '재고수량',
    product_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록시간',
    product_update TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '수정시간',
    
    FOREIGN KEY (category_idx) REFERENCES category(category_idx) 
        ON DELETE RESTRICT ON UPDATE CASCADE
    
--    ,CONSTRAINT chk_product_price CHECK (product_price >= 0),
--    CONSTRAINT chk_product_cnt CHECK (product_cnt >= 0),
--    CONSTRAINT chk_product_wishlist CHECK (product_wishlist >= 0),
--    CONSTRAINT chk_product_name_not_empty CHECK (CHAR_LENGTH(TRIM(product_name)) > 0)
) COMMENT '상품';

-- CREATE INDEX idx_product_category ON product(category_idx);
-- CREATE INDEX idx_product_price ON product(product_price);
-- CREATE INDEX idx_product_wishlist ON product(product_wishlist);
-- CREATE INDEX idx_product_time ON product(product_time DESC);

-- ========================================
-- 4. 상품 이미지 테이블
-- ========================================

CREATE TABLE product_image (
    product_image_idx INT AUTO_INCREMENT PRIMARY KEY COMMENT '이미지번호',
    product_idx INT NOT NULL COMMENT '상품FK',
    product_image_url VARCHAR(500) NOT NULL COMMENT '이미지URL',
    product_image_level INT NOT NULL DEFAULT 1 COMMENT '순서(1=대표)',
    
    FOREIGN KEY (product_idx) REFERENCES product(product_idx) 
        ON DELETE CASCADE ON UPDATE CASCADE
    
--    ,CONSTRAINT chk_image_level CHECK (product_image_level > 0),
--    CONSTRAINT chk_image_url_not_empty CHECK (CHAR_LENGTH(TRIM(product_image_url)) > 0),
    
--    UNIQUE KEY uk_product_image_level (product_idx, product_image_level)
) COMMENT '상품이미지';

-- CREATE INDEX idx_product_image_product ON product_image(product_idx);

-- ========================================
-- 5. 해시태그 테이블
-- ========================================

CREATE TABLE hashtag (
    hashtag_idx INT AUTO_INCREMENT PRIMARY KEY COMMENT '해시태그번호',
    hashtag_name VARCHAR(50) NOT NULL COMMENT '해시태그명',
    hashtag_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성시간',
    
    UNIQUE KEY uk_hashtag_name (hashtag_name)
) COMMENT '해시태그';

-- !중요 hashtag에 use_count 컬럼 추가 하기
ALTER TABLE hashtag
ADD COLUMN use_count INT DEFAULT 0 COMMENT '사용횟수';

-- ========================================
-- 6. 상품-해시태그 매핑 테이블
-- ========================================

CREATE TABLE product_hashtag (
    product_idx INT NOT NULL COMMENT '상품FK',
    hashtag_idx INT NOT NULL COMMENT '해시태그FK',
    
    PRIMARY KEY (product_idx, hashtag_idx),
    
    FOREIGN KEY (product_idx) REFERENCES product(product_idx) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (hashtag_idx) REFERENCES hashtag(hashtag_idx) 
        ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT '상품-해시태그';

-- ========================================
-- 7. 피부 프로필 테이블
-- ========================================

CREATE TABLE skin_profile (
    mem_idx INT PRIMARY KEY COMMENT '회원FK',
    sp_skin_type VARCHAR(20) COMMENT '피부타입',
    sp_trouble VARCHAR(20) COMMENT '피부트러블',
    sp_color_change VARCHAR(20) COMMENT '피부변색',
    sp_wrinkle VARCHAR(20) COMMENT '피부주름',
    sp_skin_tone VARCHAR(20) COMMENT '피부톤',
    hashtag_ids JSON COMMENT '맞춤해시태그',
    sp_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '최초문진시간',
    sp_update TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '마지막문진시간',
    
    FOREIGN KEY (mem_idx) REFERENCES mem(mem_idx) 
        ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT '피부프로필';

-- ========================================
-- 8. 장바구니 테이블
-- ========================================

CREATE TABLE cart (
    cart_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '장바구니번호',
    mem_idx INT NOT NULL COMMENT '회원FK',
    product_idx INT NOT NULL COMMENT '상품FK',
    cart_cnt INT NOT NULL DEFAULT 1 COMMENT '수량',
    cart_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '담은시간',
    
    FOREIGN KEY (mem_idx) REFERENCES mem(mem_idx) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (product_idx) REFERENCES product(product_idx) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    
--    CONSTRAINT chk_cart_cnt CHECK (cart_cnt > 0),
    
    UNIQUE KEY uk_cart_member_product (mem_idx, product_idx)
) COMMENT '장바구니';

-- CREATE INDEX idx_cart_member ON cart(mem_idx);

-- ========================================
-- 9. 찜 테이블
-- ========================================

CREATE TABLE wishlist (
    wishlist_idx INT AUTO_INCREMENT PRIMARY KEY COMMENT '찜번호',
    mem_idx INT NOT NULL COMMENT '회원FK',
    product_idx INT NOT NULL COMMENT '상품FK',
    wishlist_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '찜한시간',
    
    FOREIGN KEY (mem_idx) REFERENCES mem(mem_idx) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (product_idx) REFERENCES product(product_idx) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    
    UNIQUE KEY uk_wishlist_member_product (mem_idx, product_idx)
) COMMENT '찜';

-- CREATE INDEX idx_wishlist_member ON wishlist(mem_idx);
-- CREATE INDEX idx_wishlist_product ON wishlist(product_idx);

-- ========================================
-- 10. 주문 테이블
-- ========================================

CREATE TABLE `order` (
    order_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '주문번호(내부)',
    mem_idx INT NOT NULL COMMENT '회원FK',
    order_no VARCHAR(50) NOT NULL UNIQUE COMMENT '주문번호(고객용)',
    order_status VARCHAR(20) NOT NULL DEFAULT '상품확인중' COMMENT '주문상태',
    total_amount INT NOT NULL COMMENT '총금액',
    order_name VARCHAR(100) NOT NULL COMMENT '주문명',
    order_mem_name VARCHAR(255) NOT NULL COMMENT '수령자명',
    order_phone VARCHAR(20) COMMENT '전화번호',
    order_postal VARCHAR(10) NOT NULL COMMENT '우편번호',
    order_address VARCHAR(255) NOT NULL COMMENT '배송주소',
    order_address_more VARCHAR(255) COMMENT '상세주소',
    order_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '주문시간',
    order_update TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '수정시간',
    
    FOREIGN KEY (mem_idx) REFERENCES mem(mem_idx) 
        ON DELETE RESTRICT ON UPDATE CASCADE
    
--    ,CONSTRAINT chk_order_total_amount CHECK (total_amount >= 0)
) COMMENT '주문';

-- CREATE INDEX idx_order_member ON `order`(mem_idx);
-- CREATE INDEX idx_order_status ON `order`(order_status);
-- CREATE INDEX idx_order_time ON `order`(order_time DESC);

-- ========================================
-- 11. 주문 상세 테이블
-- ========================================

CREATE TABLE order_item (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '주문상세번호',
    order_id INT NOT NULL COMMENT '주문FK',
    product_idx INT NOT NULL COMMENT '상품번호',
    product_name VARCHAR(100) NOT NULL COMMENT '상품명',
    product_cnt INT NOT NULL COMMENT '수량',
    product_amount INT NOT NULL COMMENT '상품가격',
    total_amount INT NOT NULL COMMENT '총가격',
    order_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '주문시간',
    
    FOREIGN KEY (order_id) REFERENCES `order`(order_id) 
        ON DELETE CASCADE ON UPDATE CASCADE
    
--    ,CONSTRAINT chk_order_item_cnt CHECK (product_cnt > 0),
--    CONSTRAINT chk_order_item_amount CHECK (product_amount >= 0),
--    CONSTRAINT chk_order_item_total CHECK (total_amount >= 0)
) COMMENT '주문상세';

-- CREATE INDEX idx_order_item_order ON order_item(order_id);

-- ========================================
-- 12. 결제 테이블
-- ========================================

CREATE TABLE payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '결제번호(내부)',
    payment_key VARCHAR(100) COMMENT '결제키(토스페이먼츠)',
    order_id INT NOT NULL UNIQUE COMMENT '주문FK',
    amount INT NOT NULL COMMENT '결제금액',
    method VARCHAR(20) COMMENT '결제수단',
    status VARCHAR(20) NOT NULL DEFAULT 'READY' COMMENT '결제상태',
    approved_at TIMESTAMP NULL COMMENT '승인일시',
    failed_reason VARCHAR(500) COMMENT '실패사유',
    cancel_reason VARCHAR(500) COMMENT '취소사유',
    receipt_url VARCHAR(500) COMMENT '영수증URL',
    order_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성시간',
    order_update TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '수정시간',
    
    FOREIGN KEY (order_id) REFERENCES `order`(order_id) 
        ON DELETE CASCADE ON UPDATE CASCADE
    
--    ,CONSTRAINT chk_payment_amount CHECK (amount >= 0)
) COMMENT '결제';

-- CREATE INDEX idx_payment_order ON payment(order_id);
-- CREATE INDEX idx_payment_status ON payment(status);

-- ========================================
-- 13. 게시글 테이블
-- ========================================

CREATE TABLE post (
    post_idx INT AUTO_INCREMENT PRIMARY KEY COMMENT '게시글번호',
    mem_idx INT NOT NULL COMMENT '회원FK',
    post_category VARCHAR(100) NOT NULL COMMENT '카테고리',
    post_content TEXT NOT NULL COMMENT '내용',
    post_image VARCHAR(200) COMMENT '이미지',
    post_like INT NOT NULL DEFAULT 0 COMMENT '좋아요수',
    post_comment_count INT NOT NULL DEFAULT 0 COMMENT '댓글수',
    order_id INT COMMENT '주문FK(리뷰)',
    post_review BOOLEAN NOT NULL DEFAULT FALSE COMMENT '리뷰여부',
    post_rating INT COMMENT '별점',
    post_delete INT NOT NULL DEFAULT 0 COMMENT '삭제여부', -- 0 정상, 1 유저 삭제, 2 관리자 삭제
    post_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '작성시간',
    post_update TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '수정시간',
    
    FOREIGN KEY (mem_idx) REFERENCES mem(mem_idx) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (order_id) REFERENCES `order`(order_id) 
        ON DELETE SET NULL ON UPDATE CASCADE
    
--    ,CONSTRAINT chk_post_like CHECK (post_like >= 0),
--    CONSTRAINT chk_post_comment_count CHECK (post_comment_count >= 0),
--    CONSTRAINT chk_post_rating CHECK (post_rating IS NULL OR (post_rating BETWEEN 1 AND 5))
) COMMENT '게시글';


-- post 카테고리 컬럼 1개 추가되었습니다
ALTER TABLE post ADD COLUMN post_category VARCHAR(100) NOT NULL;
-- post_category컬럼 위치 변경하는 sql
ALTER TABLE post 
CHANGE COLUMN `post_category` `post_category` VARCHAR(100) NOT NULL AFTER `mem_idx`;

-- CREATE INDEX idx_post_member ON post(mem_idx);
-- CREATE INDEX idx_post_time ON post(post_time DESC);
-- CREATE INDEX idx_post_review ON post(post_review);

-- ========================================
-- 14. 게시글-해시태그 매핑 테이블
-- ========================================

CREATE TABLE post_hashtag (
    post_idx INT NOT NULL COMMENT '게시글FK',
    hashtag_idx INT NOT NULL COMMENT '해시태그FK',
    
    PRIMARY KEY (post_idx, hashtag_idx),
    
    FOREIGN KEY (post_idx) REFERENCES post(post_idx) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (hashtag_idx) REFERENCES hashtag(hashtag_idx) 
        ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT '게시글-해시태그';

-- ========================================
-- 15. 게시글-상품 태그 테이블
-- ========================================

CREATE TABLE post_product (
    post_product_idx INT AUTO_INCREMENT PRIMARY KEY COMMENT '태그번호',
    post_idx INT NOT NULL COMMENT '게시글FK',
    product_idx INT NOT NULL COMMENT '상품FK',
    post_product_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '태그시간',
    
    FOREIGN KEY (post_idx) REFERENCES post(post_idx) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (product_idx) REFERENCES product(product_idx) 
        ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT '게시글-상품태그';

-- CREATE INDEX idx_post_product_post ON post_product(post_idx);
-- CREATE INDEX idx_post_product_product ON post_product(product_idx);

-- ========================================
-- 16. 댓글 테이블
-- ========================================

CREATE TABLE reply (
    reply_idx INT AUTO_INCREMENT PRIMARY KEY COMMENT '댓글번호',
    post_idx INT NOT NULL COMMENT '게시글FK',
    mem_idx INT NOT NULL COMMENT '회원FK',
    reply_content TEXT NOT NULL COMMENT '댓글내용',
    reply_delete INT NOT NULL DEFAULT 0 COMMENT '삭제여부', -- 0 정상, 1 유저 삭제, 2 관리자 삭제
    reply_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '작성시간',
    reply_update TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '수정시간',
    
    FOREIGN KEY (post_idx) REFERENCES post(post_idx) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (mem_idx) REFERENCES mem(mem_idx) 
        ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT '댓글';

-- CREATE INDEX idx_reply_post ON reply(post_idx);
-- CREATE INDEX idx_reply_member ON reply(mem_idx);

-- ========================================
-- 17. 좋아요 테이블
-- ========================================

CREATE TABLE `like` (
    like_idx INT AUTO_INCREMENT PRIMARY KEY COMMENT '좋아요번호',
    post_idx INT NOT NULL COMMENT '게시글FK',
    mem_idx INT NOT NULL COMMENT '회원FK',
    like_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '좋아요시간',
    
    FOREIGN KEY (post_idx) REFERENCES post(post_idx) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (mem_idx) REFERENCES mem(mem_idx) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    
    UNIQUE KEY uk_like_post_member (post_idx, mem_idx)
) COMMENT '좋아요';

-- CREATE INDEX idx_like_post ON `like`(post_idx);
-- CREATE INDEX idx_like_member ON `like`(mem_idx);

-- ========================================
-- 18. 고객센터 테이블
-- ========================================

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

-- CREATE INDEX idx_qna_member ON qna(mem_idx);
-- CREATE INDEX idx_qna_category ON qna(qna_category);
-- CREATE INDEX idx_qna_answered ON qna(qna_answered);

-- ========================================
-- 19. 입고 테이블
-- ========================================

CREATE TABLE product_in (
    in_idx INT AUTO_INCREMENT PRIMARY KEY COMMENT '입고번호',
    product_idx INT NOT NULL COMMENT '상품FK',
    in_name VARCHAR(100) NOT NULL COMMENT '담당자/업체',
    in_cnt INT NOT NULL COMMENT '입고수량',
    in_regdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '입고일시',
    
    FOREIGN KEY (product_idx) REFERENCES product(product_idx) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    
    CONSTRAINT chk_in_cnt CHECK (in_cnt > 0)
) COMMENT '입고이력';

-- CREATE INDEX idx_product_in_product ON product_in(product_idx);
-- CREATE INDEX idx_product_in_regdate ON product_in(in_regdate DESC);

-- ========================================
-- 20. 출고 테이블
-- ========================================

CREATE TABLE product_out (
    out_idx INT AUTO_INCREMENT PRIMARY KEY COMMENT '출고번호',
    product_idx INT NOT NULL COMMENT '상품FK',
    out_name VARCHAR(100) NOT NULL COMMENT '담당자/사유',
    out_cnt INT NOT NULL COMMENT '출고수량',
    out_regdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '출고일시',
    
    FOREIGN KEY (product_idx) REFERENCES product(product_idx) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    
    CONSTRAINT chk_out_cnt CHECK (out_cnt > 0)
) COMMENT '출고이력';

-- CREATE INDEX idx_product_out_product ON product_out(product_idx);
-- CREATE INDEX idx_product_out_regdate ON product_out(out_regdate DESC);

-- ========================================
-- 21. 재고 스냅샷 테이블
-- ========================================

CREATE TABLE product_remain (
    remain_idx INT AUTO_INCREMENT PRIMARY KEY COMMENT '재고번호',
    product_idx INT NOT NULL COMMENT '상품FK',
    remain_name VARCHAR(100) NOT NULL COMMENT '담당자/메모',
    remain_cnt INT NOT NULL COMMENT '재고수량',
    remain_regdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '기록일시',
    
    FOREIGN KEY (product_idx) REFERENCES product(product_idx) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    
    CONSTRAINT chk_remain_cnt CHECK (remain_cnt >= 0)
) COMMENT '재고스냅샷';

-- CREATE INDEX idx_product_remain_product ON product_remain(product_idx);
-- CREATE INDEX idx_product_remain_regdate ON product_remain(remain_regdate DESC);


