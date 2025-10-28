# OneTouch 프로젝트 - 메인 페이지 (index.jsp)

2030 남성 뷰티 쇼핑몰 **OneTouch**의 메인 페이지입니다.

## 📋 파일 정보

**파일명**: `index.jsp`  
**위치**: `WEB-INF/views/index.jsp`  
**접근 URL**: `/` (루트)

## 🎯 페이지 구성

### 1. 히어로 배너 섹션
- ✅ **메인 슬라이더** (좌측, 큰 배너)
  - 자동 슬라이드
  - 제목, 설명, 가격, 버튼
- ✅ **작은 배너** (우측, 2개)
  - 신상품/프로모션 강조

### 2. 인기 해시태그 섹션 ⭐ (OneTouch 특화)
- ✅ 해시태그별 인기 상품 미리보기
- ✅ 해시태그별 상품 목록 링크
- ✅ 4개 카테고리 표시

### 3. 베스트 상품 섹션
- ✅ 판매량 기준 인기 상품
- ✅ 8개 상품 그리드 표시
- ✅ 할인율, 별점, 해시태그 표시

### 4. 맞춤 추천 배너 ⭐ (OneTouch 특화)
- ✅ 로그인 사용자만 표시
- ✅ 나의 맞춤 추천 보기
- ✅ 리뷰 작성 유도

### 5. 신상품 섹션
- ✅ 최근 등록된 상품
- ✅ NEW 태그 표시
- ✅ 8개 상품 표시

### 6. 서비스 안내
- ✅ 무료배송 (50,000원 이상)
- ✅ 24/7 고객지원
- ✅ 안전한 결제 (토스페이먼츠)
- ✅ 간편 반품/교환

## 🗄️ Controller에서 전달해야 할 데이터

### HomeController.java

```java
@Controller
public class HomeController {
    
    @Autowired
    private ProductService productService;
    
    @Autowired
    private HashtagService hashtagService;
    
    @Autowired
    private BannerService bannerService;
    
    @GetMapping("/")
    public String home(HttpSession session, Model model) {
        // 1. 로그인 사용자 정보 (선택사항)
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId != null) {
            User user = userService.getUserById(userId);
            model.addAttribute("user", user);
        }
        
        // 2. 메인 배너 (큰 슬라이더, 2-3개)
        List<Banner> mainBanners = bannerService.getMainBanners(3);
        model.addAttribute("mainBanners", mainBanners);
        
        // 3. 작은 배너 (우측, 2개)
        List<Banner> smallBanners = bannerService.getSmallBanners(2);
        model.addAttribute("smallBanners", smallBanners);
        
        // 4. 인기 해시태그 (4개) - OneTouch 특화
        List<HashtagWithProducts> popularHashtags = hashtagService.getPopularHashtagsWithProducts(4, 5);
        model.addAttribute("popularHashtags", popularHashtags);
        
        // 5. 베스트 상품 (판매량 기준, 8개)
        List<Product> bestProducts = productService.getBestProducts(8);
        model.addAttribute("bestProducts", bestProducts);
        
        // 6. 신상품 (최신순, 8개)
        List<Product> newProducts = productService.getNewProducts(8);
        model.addAttribute("newProducts", newProducts);
        
        return "index";
    }
}
```

## 📦 DTO 구조

### 1. Banner DTO

```java
public class Banner {
    private int bannerId;
    private String title;           // 메인 제목
    private String subtitle;        // 부제목 (선택)
    private String description;     // 설명
    private String imageUrl;        // 배너 이미지
    private String linkUrl;         // 클릭 시 이동 URL
    private Integer salePrice;      // 표시 가격 (선택)
    private String bannerType;      // MAIN, SMALL
    private int displayOrder;       // 표시 순서
    private boolean isActive;
    private Date createdAt;
    
    // Getters and Setters
}
```

### 2. Product DTO (메인 페이지용)

```java
public class Product {
    private int productId;
    private String name;
    private int price;
    private int salePrice;
    private int discountRate;
    private String imageUrl;
    private String categoryName;
    private double avgRating;
    private int reviewCount;
    private int totalSales;         // 판매량
    private boolean isNew;          // 신상품 여부
    private List<String> hashtags;  // 해시태그 목록 (최대 3개)
    
    // Getters and Setters
}
```

### 3. HashtagWithProducts DTO (OneTouch 특화)

```java
public class HashtagWithProducts {
    private int hashtagId;
    private String name;            // 해시태그명 (예: "민감성")
    private List<SimpleProduct> topProducts; // 상위 5개 상품
    
    @Data
    public static class SimpleProduct {
        private int productId;
        private String name;
    }
    
    // Getters and Setters
}
```

## 📊 SQL 쿼리 예시

### 1. 메인 배너 조회

```sql
SELECT 
    banner_id,
    title,
    subtitle,
    description,
    image_url,
    link_url,
    sale_price,
    banner_type,
    display_order
FROM banners
WHERE banner_type = 'MAIN'
  AND is_active = 1
ORDER BY display_order ASC
LIMIT 3
```

### 2. 인기 해시태그 + 상위 상품 (OneTouch 특화)

```sql
-- 인기 해시태그 조회
SELECT 
    h.hashtag_id,
    h.name,
    COUNT(ph.product_id) as product_count
FROM hashtags h
INNER JOIN product_hashtags ph ON h.hashtag_id = ph.hashtag_id
GROUP BY h.hashtag_id, h.name
ORDER BY product_count DESC
LIMIT 4;

-- 각 해시태그별 상위 상품 5개
SELECT 
    p.product_id,
    p.name
FROM products p
INNER JOIN product_hashtags ph ON p.product_id = ph.product_id
WHERE ph.hashtag_id = #{hashtagId}
ORDER BY p.total_sales DESC, p.avg_rating DESC
LIMIT 5;
```

### 3. 베스트 상품 조회 (판매량 기준)

```sql
SELECT 
    p.product_id,
    p.name,
    p.price,
    p.sale_price,
    ROUND((p.price - p.sale_price) / p.price * 100) as discount_rate,
    pi.image_url,
    c.name as category_name,
    COALESCE(p.avg_rating, 0) as avg_rating,
    COALESCE(p.review_count, 0) as review_count,
    COALESCE(p.total_sales, 0) as total_sales,
    CASE WHEN DATEDIFF(NOW(), p.created_at) <= 30 THEN 1 ELSE 0 END as is_new,
    GROUP_CONCAT(h.name ORDER BY h.name LIMIT 3 SEPARATOR ',') as hashtags
FROM products p
LEFT JOIN categories c ON p.category_id = c.category_id
LEFT JOIN product_images pi ON p.product_id = pi.product_id AND pi.is_main = 1
LEFT JOIN product_hashtags ph ON p.product_id = ph.product_id
LEFT JOIN hashtags h ON ph.hashtag_id = h.hashtag_id
GROUP BY p.product_id, pi.image_url, c.name
ORDER BY p.total_sales DESC, p.avg_rating DESC
LIMIT 8
```

### 4. 신상품 조회 (최신순)

```sql
SELECT 
    p.product_id,
    p.name,
    p.price,
    p.sale_price,
    ROUND((p.price - p.sale_price) / p.price * 100) as discount_rate,
    pi.image_url,
    c.name as category_name,
    COALESCE(p.avg_rating, 0) as avg_rating,
    COALESCE(p.review_count, 0) as review_count,
    1 as is_new,
    GROUP_CONCAT(h.name ORDER BY h.name LIMIT 3 SEPARATOR ',') as hashtags
FROM products p
LEFT JOIN categories c ON p.category_id = c.category_id
LEFT JOIN product_images pi ON p.product_id = pi.product_id AND pi.is_main = 1
LEFT JOIN product_hashtags ph ON p.product_id = ph.product_id
LEFT JOIN hashtags h ON ph.hashtag_id = h.hashtag_id
WHERE DATEDIFF(NOW(), p.created_at) <= 30
GROUP BY p.product_id, pi.image_url, c.name
ORDER BY p.created_at DESC
LIMIT 8
```

## 🔧 MyBatis Mapper 예시

### HomeMapper.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" 
    "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.onetouch.mapper.HomeMapper">

    <!-- Banner ResultMap -->
    <resultMap id="bannerResultMap" type="Banner">
        <id property="bannerId" column="banner_id"/>
        <result property="title" column="title"/>
        <result property="subtitle" column="subtitle"/>
        <result property="description" column="description"/>
        <result property="imageUrl" column="image_url"/>
        <result property="linkUrl" column="link_url"/>
        <result property="salePrice" column="sale_price"/>
        <result property="bannerType" column="banner_type"/>
        <result property="displayOrder" column="display_order"/>
        <result property="isActive" column="is_active"/>
    </resultMap>

    <!-- Product ResultMap (메인용) -->
    <resultMap id="productResultMap" type="Product">
        <id property="productId" column="product_id"/>
        <result property="name" column="name"/>
        <result property="price" column="price"/>
        <result property="salePrice" column="sale_price"/>
        <result property="discountRate" column="discount_rate"/>
        <result property="imageUrl" column="image_url"/>
        <result property="categoryName" column="category_name"/>
        <result property="avgRating" column="avg_rating"/>
        <result property="reviewCount" column="review_count"/>
        <result property="totalSales" column="total_sales"/>
        <result property="isNew" column="is_new"/>
        <result property="hashtags" column="hashtags" 
                typeHandler="com.onetouch.handler.StringListTypeHandler"/>
    </resultMap>

    <!-- 메인 배너 조회 -->
    <select id="selectMainBanners" resultMap="bannerResultMap">
        SELECT 
            banner_id, title, subtitle, description, 
            image_url, link_url, sale_price, 
            banner_type, display_order
        FROM banners
        WHERE banner_type = 'MAIN'
          AND is_active = 1
        ORDER BY display_order ASC
        LIMIT #{limit}
    </select>

    <!-- 작은 배너 조회 -->
    <select id="selectSmallBanners" resultMap="bannerResultMap">
        SELECT 
            banner_id, title, subtitle, description, 
            image_url, link_url, sale_price, 
            banner_type, display_order
        FROM banners
        WHERE banner_type = 'SMALL'
          AND is_active = 1
        ORDER BY display_order ASC
        LIMIT #{limit}
    </select>

    <!-- 인기 해시태그 조회 -->
    <select id="selectPopularHashtags" resultType="Hashtag">
        SELECT 
            h.hashtag_id,
            h.name,
            COUNT(ph.product_id) as product_count
        FROM hashtags h
        INNER JOIN product_hashtags ph ON h.hashtag_id = ph.hashtag_id
        GROUP BY h.hashtag_id, h.name
        ORDER BY product_count DESC
        LIMIT #{limit}
    </select>

    <!-- 해시태그별 상위 상품 -->
    <select id="selectTopProductsByHashtag" resultType="SimpleProduct">
        SELECT 
            p.product_id,
            p.name
        FROM products p
        INNER JOIN product_hashtags ph ON p.product_id = ph.product_id
        WHERE ph.hashtag_id = #{hashtagId}
        ORDER BY p.total_sales DESC, p.avg_rating DESC
        LIMIT #{limit}
    </select>

    <!-- 베스트 상품 조회 -->
    <select id="selectBestProducts" resultMap="productResultMap">
        SELECT 
            p.product_id,
            p.name,
            p.price,
            p.sale_price,
            ROUND((p.price - p.sale_price) / p.price * 100) as discount_rate,
            pi.image_url,
            c.name as category_name,
            COALESCE(p.avg_rating, 0) as avg_rating,
            COALESCE(p.review_count, 0) as review_count,
            COALESCE(p.total_sales, 0) as total_sales,
            CASE WHEN DATEDIFF(NOW(), p.created_at) <= 30 THEN 1 ELSE 0 END as is_new,
            GROUP_CONCAT(h.name ORDER BY h.name LIMIT 3 SEPARATOR ',') as hashtags
        FROM products p
        LEFT JOIN categories c ON p.category_id = c.category_id
        LEFT JOIN product_images pi ON p.product_id = pi.product_id AND pi.is_main = 1
        LEFT JOIN product_hashtags ph ON p.product_id = ph.product_id
        LEFT JOIN hashtags h ON ph.hashtag_id = h.hashtag_id
        GROUP BY p.product_id, pi.image_url, c.name
        ORDER BY p.total_sales DESC, p.avg_rating DESC
        LIMIT #{limit}
    </select>

    <!-- 신상품 조회 -->
    <select id="selectNewProducts" resultMap="productResultMap">
        SELECT 
            p.product_id,
            p.name,
            p.price,
            p.sale_price,
            ROUND((p.price - p.sale_price) / p.price * 100) as discount_rate,
            pi.image_url,
            c.name as category_name,
            COALESCE(p.avg_rating, 0) as avg_rating,
            COALESCE(p.review_count, 0) as review_count,
            1 as is_new,
            GROUP_CONCAT(h.name ORDER BY h.name LIMIT 3 SEPARATOR ',') as hashtags
        FROM products p
        LEFT JOIN categories c ON p.category_id = c.category_id
        LEFT JOIN product_images pi ON p.product_id = pi.product_id AND pi.is_main = 1
        LEFT JOIN product_hashtags ph ON p.product_id = ph.product_id
        LEFT JOIN hashtags h ON ph.hashtag_id = h.hashtag_id
        WHERE DATEDIFF(NOW(), p.created_at) <= 30
        GROUP BY p.product_id, pi.image_url, c.name
        ORDER BY p.created_at DESC
        LIMIT #{limit}
    </select>

</mapper>
```

## 🗄️ DB 테이블 구조

### banners 테이블

```sql
CREATE TABLE banners (
    banner_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    subtitle VARCHAR(100),
    description TEXT,
    image_url VARCHAR(255) NOT NULL,
    link_url VARCHAR(255) NOT NULL,
    sale_price INT,
    banner_type VARCHAR(20) NOT NULL, -- MAIN, SMALL
    display_order INT DEFAULT 0,
    is_active BOOLEAN DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    INDEX idx_banner_type (banner_type, is_active, display_order)
);
```

### 배너 샘플 데이터

```sql
INSERT INTO banners (title, subtitle, description, image_url, link_url, sale_price, banner_type, display_order) VALUES
('여름 맞이 스킨케어', '최대 30% 할인', '민감한 피부를 위한 순한 제품들을 만나보세요', 
 '/assets/images/hero/slider-bg1.jpg', '/product/list?categoryId=1', 29900, 'MAIN', 1),
 
('신상품 출시', 'NEW ARRIVAL', '2030 남성을 위한 프리미엄 라인', 
 '/assets/images/hero/slider-bg2.jpg', '/product/list?sort=newest', NULL, 'MAIN', 2),
 
('선물세트 특가', '지금만 이 가격', '소중한 사람에게 선물하세요', 
 '/assets/images/hero/slider-bnr.jpg', '/product/list?categoryId=5', 59000, 'SMALL', 1),
 
('문진하고 추천받기', '맞춤 추천 서비스', '나에게 딱 맞는 제품을 찾아드립니다', 
 '/assets/images/hero/slider-bnr2.jpg', '/user/survey', NULL, 'SMALL', 2);
```

## 🧪 테스트 체크리스트

### 히어로 배너
- [ ] 메인 슬라이더 자동 재생
- [ ] 좌우 화살표 클릭 동작
- [ ] 배너 클릭 시 링크 이동
- [ ] 작은 배너 2개 표시

### 인기 해시태그 (OneTouch 특화)
- [ ] 4개 해시태그 표시
- [ ] 각 해시태그별 상위 5개 상품 표시
- [ ] "더보기" 클릭 시 해당 해시태그 상품 목록 이동

### 베스트 상품
- [ ] 8개 상품 그리드 표시
- [ ] 할인율 태그 (있는 경우)
- [ ] 별점 및 리뷰 수
- [ ] 해시태그 최대 3개 표시
- [ ] 상품 클릭 시 상세 페이지 이동

### 맞춤 추천 배너
- [ ] 비로그인 시 표시 안 됨
- [ ] 로그인 시 사용자 이름 표시
- [ ] 맞춤 추천 페이지 링크 동작

### 신상품
- [ ] NEW 태그 표시
- [ ] 최신순 정렬
- [ ] 8개 상품 표시

### 서비스 안내
- [ ] 4개 아이콘 및 설명 표시
- [ ] 반응형 동작 확인

## 💡 OneTouch 프로젝트 특화 기능

### 1. 해시태그 기반 카테고리 ⭐
```jsp
<!-- 일반 쇼핑몰: 제품 카테고리 -->
<div class="featured-categories">
    <h3>스킨케어</h3>
    <h3>클렌징</h3>
</div>

<!-- OneTouch: 해시태그 카테고리 -->
<div class="featured-categories">
    <h3>#민감성</h3>
    <h3>#지성</h3>
    <h3>#주름개선</h3>
</div>
```

### 2. 맞춤 추천 강조 ⭐
```jsp
<!-- 로그인 사용자에게만 표시되는 맞춤 배너 -->
<c:if test="${not empty user}">
    <div class="banner">
        <h2>${user.name}님을 위한 추천</h2>
        <a href="/user/mypage/recommendations">맞춤 추천 보기</a>
    </div>
</c:if>
```

### 3. 상품 카드에 해시태그 표시 ⭐
```jsp
<div class="product-hashtags">
    <c:forEach var="hashtag" items="${product.hashtags}" end="2">
        <small class="badge">#${hashtag}</small>
    </c:forEach>
</div>
```

## 🚀 다음 단계

메인 페이지 완성 후:

1. **문진 시스템** (`/user/survey`) - 해시태그 생성
2. **맞춤 추천 페이지** (`/user/mypage/recommendations`)
3. **배너 관리 시스템** (관리자)
4. **베스트/신상품 자동 업데이트** (스케줄러)

## 🎨 UI/UX 개선 아이디어

### 1. 개인화된 메인 페이지
```java
// 사용자의 해시태그 기반 추천 상품 표시
if (userId != null) {
    List<String> userHashtags = hashtagService.getUserHashtags(userId);
    List<Product> recommendedProducts = 
        productService.getRecommendedProducts(userHashtags, 8);
    model.addAttribute("recommendedProducts", recommendedProducts);
}
```

### 2. 최근 본 상품
```javascript
// 로컬 스토리지 활용
const recentProducts = JSON.parse(localStorage.getItem('recentProducts') || '[]');
```

### 3. 실시간 베스트 상품
```java
// Redis 캐싱으로 실시간 업데이트
@Cacheable(value = "bestProducts", key = "'main'")
public List<Product> getBestProducts(int limit) {
    // ...
}
```

## 📈 성능 최적화

### 1. 쿼리 최적화
- 상품 조회 시 JOIN 최소화
- 인덱스 활용 (total_sales, created_at)

### 2. 캐싱
```java
@Cacheable(value = "mainBanners", key = "'main'", unless = "#result.isEmpty()")
public List<Banner> getMainBanners(int limit) {
    return bannerMapper.selectMainBanners(limit);
}
```

### 3. 이미지 최적화
- WebP 포맷 사용
- Lazy Loading 적용
- CDN 활용

---

**OneTouch** - 해시태그 기반 2030 남성 맞춤 뷰티 추천 쇼핑몰
