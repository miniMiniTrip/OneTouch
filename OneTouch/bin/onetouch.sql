CREATE DATABASE IF NOT EXISTS onetouch CHARACTER SET utf8 
USE onetouch;

-- 1. 회원 관리


-- 회원 테이블
CREATE TABLE mem (
    mem_idx INT PRIMARY KEY AUTO_INCREMENT COMMENT '회원번호 (고유번호)',
    mem_id VARCHAR(50) NOT NULL UNIQUE COMMENT '아이디',
    mem_pw VARCHAR(255) NOT NULL COMMENT '비밀번호 (암호화 저장)',
    mem_name VARCHAR(50) NOT NULL COMMENT '이름',
    mem_addr VARCHAR(255) COMMENT '주소',
    mem_email VARCHAR(100) COMMENT '이메일',
    mem_roll ENUM('user', 'admin') NOT NULL DEFAULT 'user' COMMENT '권한',
    mem_birth DATE COMMENT '생년월일',
    mem_phone VARCHAR(20) NOT NULL COMMENT '전화번호',
    mem_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '회원가입일자',
    mem_update_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '회원정보수정일자',
    
    INDEX idx_mem_id (mem_id),
    INDEX idx_mem_email (mem_email),
    INDEX idx_mem_phone (mem_phone)
) COMMENT='회원';


-- 2. 카테고리 관리

-- 카테고리 테이블
CREATE TABLE category (
    category_idx INT PRIMARY KEY AUTO_INCREMENT COMMENT '카테고리 번호',
    category_name VARCHAR(50) NOT NULL COMMENT '카테고리명',
    
    INDEX idx_category_name (category_name)
) COMMENT='상품 카테고리';


-- 3. 상품 관리

-- 상품 테이블
CREATE TABLE product (
    product_idx INT PRIMARY KEY AUTO_INCREMENT COMMENT '상품번호',
    product_category_idx INT COMMENT '카테고리 참조',
    product_like INT DEFAULT 0 COMMENT '좋아요 수',
    product_price INT NOT NULL COMMENT '가격',
    product_name VARCHAR(100) NOT NULL COMMENT '상품이름',
    product_brand VARCHAR(100) COMMENT '브랜드',
    product_explain TEXT COMMENT '상품내용',
    product_category_name VARCHAR(50) COMMENT '카테고리명',
    product_cnt INT DEFAULT 0 COMMENT '상품수량',
    shipping_address VARCHAR(255) COMMENT '배송정보',
    product_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '주문 생성 일시',
    product_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '주문 수정 일시',
    
    FOREIGN KEY (product_category_idx) REFERENCES category(category_idx),
    INDEX idx_product_name (product_name),
    INDEX idx_product_category (product_category_idx),
    INDEX idx_product_price (product_price),
    INDEX idx_product_brand (product_brand)
) COMMENT='상품';

-- 상품 이미지 테이블
CREATE TABLE product_image (
    product_image_idx INT PRIMARY KEY AUTO_INCREMENT COMMENT '상품사진번호',
    product_idx INT NOT NULL COMMENT '상품번호',
    product_image_url VARCHAR(500) NOT NULL COMMENT '사진 URL',
    product_image_level INT DEFAULT 0 COMMENT '사진순서(0~2)',
    
    FOREIGN KEY (product_idx) REFERENCES product(product_idx) ON DELETE CASCADE,
    INDEX idx_product_id (product_idx),
    INDEX idx_image_order (product_idx, product_image_level)
) COMMENT='상품 이미지';

-- 4. 해시태그 시스템

-- 해시태그 테이블
CREATE TABLE hashtag (
    hashtag_idx INT PRIMARY KEY AUTO_INCREMENT COMMENT '해시태그 번호',
    hashtag_name VARCHAR(50) NOT NULL UNIQUE COMMENT '해시태그명',
    hashtag_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '해시태그 작성 시간',
    
    INDEX hashtag_idx_name (hashtag_name)
) COMMENT='해시태그';

-- 상품-해시태그 매핑 테이블
CREATE TABLE product_hashtag (
    product_idx INT NOT NULL COMMENT '상품번호',
    hashtag_idx INT NOT NULL COMMENT '해시태그번호',
    
    PRIMARY KEY (product_idx, hashtag_idx),
    FOREIGN KEY (product_idx) REFERENCES product(product_idx) ON DELETE CASCADE,
    FOREIGN KEY (hashtag_idx) REFERENCES hashtag(hashtag_idx) ON DELETE CASCADE,
    INDEX idx_product_id (product_idx),
    INDEX idx_hashtag_id (hashtag_idx)
) COMMENT='상품-해시태그 매핑';

-- 게시글-해시태그 매핑 테이블
CREATE TABLE post_hashtag (
    post_idx INT NOT NULL COMMENT '커뮤니티 글 번호',
    hashtag_idx INT NOT NULL COMMENT '해시태그번호',
    
    PRIMARY KEY (post_idx, hashtag_idx),
    INDEX idx_post_id (post_idx),
    INDEX idx_hashtag_id (hashtag_idx)
) COMMENT='게시글-해시태그 매핑';

-- 5. 피부 프로필 (문진)

-- 피부 프로필 테이블
CREATE TABLE skin_profile (
    mem_idx INT PRIMARY KEY COMMENT '회원번호',
    sp_skin_type VARCHAR(20) COMMENT '피부타입',
    sp_trouble VARCHAR(20) COMMENT '피부트러블',
    sp_color_change VARCHAR(20) COMMENT '색소침착',
    sp_wrinkle VARCHAR(20) COMMENT '주름',
    hashtag_ids JSON COMMENT '해시태그 ID JSON화',
    sp_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '최초 문진 시각',
    sp_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '마지막 문진 시각',
    
    FOREIGN KEY (mem_idx) REFERENCES mem(mem_idx) ON DELETE CASCADE
) COMMENT='사용자 피부 프로필';

-- 6. 장바구니 & 찜

-- 장바구니 테이블
CREATE TABLE cart (
    cart_id INT PRIMARY KEY AUTO_INCREMENT COMMENT '장바구니 ID',
    mem_idx INT NOT NULL COMMENT '회원번호',
    product_idx INT NOT NULL COMMENT '상품번호',
    cart_cnt INT NOT NULL DEFAULT 1 COMMENT '수량',
    cart_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '담은 시각',
    
    FOREIGN KEY (mem_idx) REFERENCES mem(mem_idx) ON DELETE CASCADE,
    FOREIGN KEY (product_idx) REFERENCES product(product_idx) ON DELETE CASCADE,
    UNIQUE KEY unique_mem_product (mem_idx, product_idx),
    INDEX idx_mem_id (mem_idx),
    INDEX idx_product_id (product_idx)
) COMMENT='장바구니';

-- 찜 테이블
CREATE TABLE wishlist (
    wishlist_idx INT PRIMARY KEY AUTO_INCREMENT COMMENT '찜 ID',
    mem_idx INT NOT NULL COMMENT '회원번호',
    product_idx INT NOT NULL COMMENT '상품번호',
    wishlist_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '찜한 시각',
    
    FOREIGN KEY (mem_idx) REFERENCES mem(mem_idx) ON DELETE CASCADE,
    FOREIGN KEY (product_idx) REFERENCES product(product_idx) ON DELETE CASCADE,
    UNIQUE KEY unique_mem_product (mem_idx, product_idx),
    INDEX idx_mem_id (mem_idx),
    INDEX idx_product_id (product_idx)
) COMMENT='찜';


-- 7. 주문 관리


-- 주문 테이블
CREATE TABLE `order` (
    order_id INT PRIMARY KEY AUTO_INCREMENT COMMENT '주문번호(내부)',
    mem_idx INT NOT NULL COMMENT '회원번호',
    order_no VARCHAR(50) NOT NULL UNIQUE COMMENT '주문번호(고객용)',
    order_status VARCHAR(20) NOT NULL DEFAULT '상품확인중' COMMENT '주문상태',
    total_amount DECIMAL(10,2) NOT NULL COMMENT '총 주문금액',
    order_name VARCHAR(100) NOT NULL COMMENT '주문명(예: 에센스 외 2건)',
    order_mem_name VARCHAR(255) NOT NULL COMMENT '수령자명',
    order_phone VARCHAR(20) COMMENT '전화번호',
    order_postal VARCHAR(10) NOT NULL COMMENT '우편번호',
    order_address VARCHAR(255) NOT NULL COMMENT '배송 주소',
    order_address_more VARCHAR(255) COMMENT '상세 주소',
    order_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '주문 생성 일시',
    order_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '주문 수정 일시',
    
    FOREIGN KEY (mem_idx) REFERENCES mem(mem_idx),
    INDEX idx_mem_id (mem_idx),
    INDEX idx_order_no (order_no),
    INDEX idx_order_status (order_status),
    INDEX idx_order_time (order_time)
) COMMENT='주문';

-- 주문 상세 테이블
CREATE TABLE order_item (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT COMMENT '주문상세번호(내부)',
    order_id INT NOT NULL COMMENT '주문번호(내부)',
    product_idx INT NOT NULL COMMENT '상품번호',
    product_name VARCHAR(100) NOT NULL COMMENT '상품명',
    product_cnt INT NOT NULL COMMENT '상품개수',
    product_amount INT NOT NULL COMMENT '상품가격',
    total_amount INT NOT NULL COMMENT '총 가격',
    order_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '주문 생성 일시',
    
    FOREIGN KEY (order_id) REFERENCES `order`(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_idx) REFERENCES product(product_idx),
    INDEX idx_order_id (order_id),
    INDEX idx_product_id (product_idx)
) COMMENT='주문 상세';


-- 8. 결제 관리


-- 결제 테이블
CREATE TABLE payment (
    payment_id INT PRIMARY KEY AUTO_INCREMENT COMMENT '결제 번호(내부)',
    payment_key VARCHAR(100) UNIQUE COMMENT '결제 키(토스페이먼츠 고유값)',
    order_id INT NOT NULL UNIQUE COMMENT '주문번호',
    amount INT NOT NULL COMMENT '실제 결제금액',
    method VARCHAR(20) COMMENT '결제수단(토스페이먼츠 고유값)',
    status VARCHAR(20) NOT NULL DEFAULT 'READY' COMMENT 'READY(결제대기), DONE(완료), FAILED(실패), CANCELLED(취소)',
    approved_at TIMESTAMP NULL COMMENT '결제 승인 일시',
    failed_reason VARCHAR(500) COMMENT '결제거절사유(토스페이먼츠)',
    cancel_reason VARCHAR(500) COMMENT '결제취소사유(토스페이먼츠)',
    receipt_url VARCHAR(500) COMMENT '영수증 URL(토스페이먼츠)',
    order_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '주문 생성 일시',
    order_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '구매~결제배송확정',
    
    FOREIGN KEY (order_id) REFERENCES `order`(order_id) ON DELETE CASCADE,
    INDEX idx_payment_key (payment_key),
    INDEX idx_order_id (order_id),
    INDEX idx_status (status)
) COMMENT='결제';


-- 9. 커뮤니티 (리뷰 통합)


-- 게시글 테이블 (리뷰 통합)
CREATE TABLE post (
    post_idx INT PRIMARY KEY AUTO_INCREMENT COMMENT '커뮤니티 글 번호',
    mem_idx INT NOT NULL COMMENT '회원 번호(FK)',
    post_content TEXT NOT NULL COMMENT '글 내용',
    post_image VARCHAR(200) COMMENT '이미지 url',
    post_like INT DEFAULT 0 COMMENT '좋아요 갯수',
    post_comment_count INT DEFAULT 0 COMMENT '댓글 수',
    post_review BOOLEAN DEFAULT FALSE COMMENT '리뷰여부',
    post_rating INT COMMENT '(리뷰일 경우)별점',
    order_id INT COMMENT '(리뷰일 경우)구매번호(FK)',
    post_delete INT DEFAULT 0 COMMENT '삭제여부(0: 공개 1: 개인삭제 2: 관리자삭제)',
    post_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '작성시각',
    post_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '업데이트시각',
    
    FOREIGN KEY (mem_idx) REFERENCES mem(mem_idx),
    FOREIGN KEY (order_id) REFERENCES `order`(order_id),
    INDEX idx_mem_id (mem_idx),
    INDEX idx_post_review (post_review),
    INDEX idx_post_time (post_time),
    INDEX idx_post_delete (post_delete),
    
    -- 리뷰 제약조건
    CHECK (
        (post_review = FALSE)
        OR 
        (post_review = TRUE AND post_rating BETWEEN 1 AND 5 AND order_id IS NOT NULL)
    )
) COMMENT='커뮤니티 게시글 (리뷰 통합)';

-- 게시글 상품 태그 테이블
CREATE TABLE post_product (
    post_product_idx INT PRIMARY KEY AUTO_INCREMENT COMMENT '상품 태그 번호',
    post_idx INT NOT NULL COMMENT '커뮤니티 글 번호',
    product_idx INT NOT NULL COMMENT '상품 번호',
    post_product_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '작성 시각',
    
    FOREIGN KEY (post_idx) REFERENCES post(post_idx) ON DELETE CASCADE,
    FOREIGN KEY (product_idx) REFERENCES product(product_idx),
    UNIQUE KEY unique_post_product (post_idx, product_idx),
    INDEX idx_post_id (post_idx),
    INDEX idx_product_id (product_idx)
) COMMENT='게시글 상품 태그';

-- 댓글 테이블
CREATE TABLE reply (
    reply_idx INT PRIMARY KEY AUTO_INCREMENT COMMENT '댓글 번호',
    post_idx INT NOT NULL COMMENT '글 번호',
    mem_idx INT NOT NULL COMMENT '회원 번호',
    mem_name VARCHAR(50) NOT NULL COMMENT '회원 이름',
    reply_content TEXT NOT NULL COMMENT '글 내용',
    reply_delete INT DEFAULT 0 COMMENT '삭제여부(0: 공개 1: 개인삭제 2: 관리자삭제)',
    reply_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '작성시각',
    reply_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정시각',
    
    FOREIGN KEY (post_idx) REFERENCES post(post_idx) ON DELETE CASCADE,
    FOREIGN KEY (mem_idx) REFERENCES mem(mem_idx),
    INDEX idx_post_id (post_idx),
    INDEX idx_mem_id (mem_idx),
    INDEX idx_reply_time (reply_time),
    INDEX idx_reply_delete (reply_delete)
) COMMENT='댓글';

-- 좋아요 테이블
CREATE TABLE `like` (
    like_idx INT PRIMARY KEY AUTO_INCREMENT COMMENT '좋아요 번호',
    post_idx INT NOT NULL COMMENT '글 번호',
    mem_idx INT NOT NULL COMMENT '회원 번호',
    like_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '좋아요 시각',
    
    FOREIGN KEY (post_idx) REFERENCES post(post_idx) ON DELETE CASCADE,
    FOREIGN KEY (mem_idx) REFERENCES mem(mem_idx) ON DELETE CASCADE,
    UNIQUE KEY unique_mem_post (mem_idx, post_idx),
    INDEX idx_post_id (post_idx),
    INDEX idx_mem_id (mem_idx)
) COMMENT='좋아요';


-- 10. 고객센터 (QnA, FAQ, 공지사항 통합)


-- QnA 테이블
CREATE TABLE qna (
    qna_idx INT PRIMARY KEY AUTO_INCREMENT COMMENT 'qna 번호',
    mem_idx INT NOT NULL COMMENT '회원 번호',
    qna_title VARCHAR(100) NOT NULL COMMENT '글 제목',
    qna_content TEXT NOT NULL COMMENT '글 내용',
    qna_category INT NOT NULL DEFAULT 0 COMMENT '카테고리(0: 상품, 1: 배송 2: 교환,환불 3: 기타문의 4 : FAQ 5 : 공지사항)',
    qna_private BOOLEAN DEFAULT FALSE COMMENT '비밀글여부',
    qna_answered BOOLEAN DEFAULT FALSE COMMENT '답변여부',
    qna_answer_content TEXT COMMENT '답변내용',
    qna_delete INT DEFAULT 0 COMMENT '삭제(0:정상 1: 본인삭제 2: 관리자삭제)',
    qna_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '질문등록일',
    qna_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '질문수정일',
    qna_answer_time TIMESTAMP NULL COMMENT '답변등록일',
    
    FOREIGN KEY (mem_idx) REFERENCES mem(mem_idx),
    INDEX idx_mem_id (mem_idx),
    INDEX idx_qna_category (qna_category),
    INDEX idx_qna_answered (qna_answered),
    INDEX idx_qna_time (qna_time),
    INDEX idx_qna_delete (qna_delete)
) COMMENT='고객센터 (QnA, FAQ, 공지사항)';


-- 11. 재고 관리


-- 입고 테이블
CREATE TABLE product_in (
    in_idx INT PRIMARY KEY AUTO_INCREMENT COMMENT '입고번호',
    product_idx INT NOT NULL COMMENT '상품번호',
    in_name VARCHAR(100) NOT NULL COMMENT '상품명',
    in_cnt INT NOT NULL COMMENT '입고수량',
    in_regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '입고일자',
    
    FOREIGN KEY (product_idx) REFERENCES product(product_idx),
    INDEX idx_product_id (product_idx),
    INDEX idx_in_regdate (in_regdate)
) COMMENT='입고';

-- 출고 테이블
CREATE TABLE product_out (
    out_idx INT PRIMARY KEY AUTO_INCREMENT COMMENT '출고번호',
    product_idx INT NOT NULL COMMENT '상품번호',
    out_name VARCHAR(100) NOT NULL COMMENT '상품명',
    out_cnt INT NOT NULL COMMENT '출고수량',
    out_regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '출고일자',
    
    FOREIGN KEY (product_idx) REFERENCES product(product_idx),
    INDEX idx_product_id (product_idx),
    INDEX idx_out_regdate (out_regdate)
) COMMENT='출고';

-- 재고 테이블
CREATE TABLE product_remain (
    remain_idx INT PRIMARY KEY AUTO_INCREMENT COMMENT '재고번호',
    product_idx INT NOT NULL COMMENT '상품번호',
    remain_name VARCHAR(100) NOT NULL UNIQUE COMMENT '상품명',
    remain_cnt INT NOT NULL COMMENT '재고수량',
    remain_regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '재고갱신일자',
    
    FOREIGN KEY (product_idx) REFERENCES product(product_idx),
    INDEX idx_product_id (product_idx),
    INDEX idx_remain_regdate (remain_regdate)
) COMMENT='재고';


-- 외래키 추가 (순환 참조 방지를 위해 후처리)

-- post_hashtag 외래키 추가
ALTER TABLE post_hashtag
    ADD FOREIGN KEY (post_idx) REFERENCES post(post_idx) ON DELETE CASCADE,
    ADD FOREIGN KEY (hashtag_idx) REFERENCES hashtag(hashtag_idx) ON DELETE CASCADE;


-- 초기 데이터 삽입

-- 기본 카테고리 삽입
INSERT INTO category (category_name) VALUES 
('스킨케어'),
('메이크업/선케어'),
('클렌징케어');

-- 관리자 계정 삽입 (비밀번호: admin123)
INSERT INTO mem (mem_id, mem_pw, mem_name, mem_roll, mem_phone) VALUES 
('admin', '1234', '관리자', 'admin', '010-1234-1123');


-- 인덱스 최적화 (복합 인덱스)

-- 게시글 검색 최적화
CREATE INDEX idx_post_search ON post(post_delete, post_time DESC);
CREATE INDEX idx_post_review_search ON post(post_review, post_delete, post_rating DESC);

-- 주문 검색 최적화
CREATE INDEX idx_order_search ON `order`(mem_idx, order_time DESC);
CREATE INDEX idx_order_status_search ON `order`(order_status, order_time DESC);

-- 상품 검색 최적화
CREATE INDEX idx_product_search ON product(product_category_idx, product_price);

