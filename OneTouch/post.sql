
-- post 넣는 형식틀
INSERT INTO `otdb`.`post` 
(`post_idx`, `mem_idx`,`post_category`, `post_content`, `post_image`, `post_like`, `post_comment_count`, `order_id`, `post_review`, `post_rating`, `post_delete`, `post_time`, `post_update`) 
VALUES (null, '5', '내용', '0','dlalwlurl', '0', '0', null, '0', '0', '0', now(), now())

-- 더미 등록
INSERT INTO `otdb`.`post` 
(`post_idx`, `mem_idx`,`post_category`, `post_content`, `post_image`, `post_like`, `post_comment_count`, `order_id`, `post_review`, `post_rating`, `post_delete`, `post_time`, `post_update`) 
VALUES (null, '5', '스킨에디터', '0','dlalwlurl', '0', '0', null, '0', '0', '0', now(), now())


-- select post 테이블 