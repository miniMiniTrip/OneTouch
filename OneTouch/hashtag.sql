-- post 기준 해시태그 카운트 
select ph.hashtag_idx,count(*)as hashtag_count from post_hashtag as ph
GROUP BY hashtag_idx
ORDER BY hashtag_count DESC;

-- post 기준 해시태그 카운트 랭킹
SELECT
    hashtag_idx,
    cnt,
    RANK() OVER (ORDER BY cnt DESC) AS rank_num
FROM (
    SELECT 
        hashtag_idx,
        COUNT(*) AS cnt
    FROM post_hashtag
    GROUP BY hashtag_idx
) AS t
ORDER BY rank_num;

-- product 기준 해시태그 카운트
select prh.hashtag_idx,count(*)as hashtag_count from product_hashtag as prh
GROUP BY hashtag_idx
ORDER BY hashtag_count DESC;

-- product 기준 해시태그 카운트 랭킹
SELECT
    hashtag_idx,
    cnt,
    RANK() OVER (ORDER BY cnt DESC) AS rank_num
FROM (
    SELECT 
        hashtag_idx,
        COUNT(*) AS cnt
    FROM product_hashtag
    GROUP BY hashtag_idx
) AS t
ORDER BY rank_num;