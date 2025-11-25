UPDATE mem
SET
    mem_id = 'user1233',            -- 아이디
    mem_pw = '1234',  -- 암호화된 비밀번호
    mem_name = '홍길동',               -- 이름
    mem_postal = '12345',              -- 우편번호
    mem_addr = '서울특별시 강남구',   -- 주소
    mem_addr_more = '역삼동 123-45',   -- 상세주소
    mem_email = 'hong@example.com',    -- 이메일
    mem_roll = 'user',                 -- 권한 ('user' 또는 'admin')
    mem_birth = '1990-01-01',          -- 생년월일
    mem_phone = '010-1234-5678',       -- 전화번호
   -- mem_time = CURRENT_TIMESTAMP,      -- 가입일 (자동 설정되므로 보통 변경 안 함)
    mem_update_time = CURRENT_TIMESTAMP -- 수정일 (자동 갱신되므로 보통 변경 안 함)
WHERE mem_idx = 1;                    -- 수정할 회원의 mem_idx






INSERT INTO mem (
    mem_id, 
    mem_pw, 
    mem_name, 
    mem_postal, 
    mem_addr, 
    mem_addr_more, 
    mem_email, 
    mem_roll, 
    mem_birth, 
    mem_phone
) 
VALUES (
    'user123', 
    '1234',    -- 실제 암호화된 비밀번호를 넣어야 함
    '홍길동', 
    '12345', 
    '서울특별시 강남구 역삼동', 
    '123-45번지', 
    'hong@example.com', 
    'user',   -- 기본값 'user'로 설정됨
    '1990-01-01', 
    '010-1234-5678'
);

-- 회원 이미지
CREATE TABLE `otdb`.`mem_image` (
  `mem_image_idx` INT NOT NULL AUTO_INCREMENT,
  `mem_idx` INT NOT NULL,
  `mem_image_url` VARCHAR(500) NULL,
  PRIMARY KEY (`mem_image_idx`));
