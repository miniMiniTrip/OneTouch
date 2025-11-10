-- ========================================
-- 초기 데이터
-- ========================================

-- 카테고리 초기 데이터
INSERT INTO category (category_name) VALUES 
('스킨케어'),
('메이크업/선케어'),
('클렌징케어');

-- 관리자 계정 (비밀번호: 1234 - 실제로는 암호화 필요)
INSERT INTO mem (mem_id, mem_pw, mem_name, mem_email, mem_roll, mem_phone) VALUES 
('admin', '1234', '관리자', 'admin@onetouch.com', 'admin', '010-1234-1123');

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