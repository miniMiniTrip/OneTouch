# OneTouch 프로젝트 - 상품 목록 페이지

2030 남성 뷰티 쇼핑몰 **OneTouch**의 상품 목록 JSP 페이지입니다.

## 📋 파일 정보

**파일명**: `productList.jsp`  
**위치**: `WEB-INF/views/product/productList.jsp`  
**접근 URL**: `/product/list`

## 🎯 주요 기능

### 1. 상품 표시 방식
- ✅ **그리드 뷰** (기본): 3열 카드 레이아웃
- ✅ **리스트 뷰**: 1열 상세 레이아웃
- ✅ 탭으로 뷰 전환 가능

### 2. 필터링 (사이드바)
- ✅ **상품 검색**: 키워드 검색
- ✅ **카테고리**: 전체 카테고리 목록 + 상품 수
- ✅ **해시태그**: OneTouch 특화 - 인기 해시태그 배지
- ✅ **가격 범위**: 슬라이더로 최대 가격 설정
- ✅ **가격대별**: 체크박스 (3만원 이하, 3~5만원 등)
- ✅ **피부 타입**: 건성/지성/복합성/민감성

### 3. 정렬 기능
- 인기순 (기본)
- 판매량순 (OneTouch 특화)
- 낮은/높은 가격순
- 평점순
- 최신순

### 4. 페이징
- 이전/다음 페이지
- 페이지 번호 표시
- 현재 페이지 강조

### 5. 상품 카드 정보
- 상품 이미지
- 할인율 태그 (-25%)
- 신상품 태그 (NEW)
- 카테고리명
- 상품명
- 별점 + 리뷰 수
- 가격 (할인가/정가)
- 해시태그 (최대 3개)

## 🗄️ Controller에서 전달해야 할 데이터

### 필수 Model Attributes

```java
@GetMapping("/product/list")
public String productList(
    @RequestParam(defaultValue = "1") int page,
    @RequestParam(defaultValue = "popularity") String sort,
    @RequestParam(required = false) Integer categoryId,
    @RequestParam(required = false) Integer hashtagId,
    @RequestParam(required = false) String keyword,
    Model model
) {
    // 1. 상품 목록
    List<Product> products = productService.getProducts(page, sort, categoryId, hashtagId, keyword);
    model.addAttribute("products", products);
    
    // 2. 페이징 정보
    int pageSize = 12; // 페이지당 12개
    int totalCount = productService.getTotalCount(categoryId, hashtagId, keyword);
    int totalPages = (int) Math.ceil((double) totalCount / pageSize);
    int startNum = (page - 1) * pageSize + 1;
    int endNum = Math.min(page * pageSize, totalCount);
    
    model.addAttribute("currentPage", page);
    model.addAttribute("totalPages", totalPages);
    model.addAttribute("totalCount", totalCount);
    model.addAttribute("startNum", startNum);
    model.addAttribute("endNum", endNum);
    
    // 페이징 블록 (10개씩)
    int startPage = ((page - 1) / 10) * 10 + 1;
    int endPage = Math.min(startPage + 9, totalPages);
    model.addAttribute("startPage", startPage);
    model.addAttribute("endPage", endPage);
    
    // 3. 카테고리 목록
    List<Category> categories = categoryService.getAllCategories();
    model.addAttribute("categories", categories);
    
    // 4. 인기 해시태그 (상위 10개)
    List<Hashtag> popularHashtags = hashtagService.getPopularHashtags(10);
    model.addAttribute("popularHashtags", popularHashtags);
    
    // 5. 현재 필터 정보
    model.addAttribute("sort", sort);
    model.addAttribute("categoryId", categoryId);
    model.addAttribute("hashtagId", hashtagId);
    model.addAttribute("searchKeyword", keyword);
    
    // 6. 카테고리명 (breadcrumb용)
    if (categoryId != null) {
        Category category = categoryService.getCategoryById(categoryId);
        model.addAttribute("categoryName", category.getName());
    }
    
    return "product/productList";
}
```

## 📦 Product DTO 구조

```java
public class Product {
    private int productId;
    private String name;
    private String description;
    private int price;              // 정가
    private int salePrice;          // 판매가 (할인가)
    private int discountRate;       // 할인율 (%)
    private String imageUrl;        // 대표 이미지
    private int categoryId;
    private String categoryName;
    private double avgRating;       // 평균 별점 (0.0 ~ 5.0)
    private int reviewCount;        // 리뷰 수
    private int totalSales;         // 총 판매량 (OneTouch 특화)
    private boolean isNew;          // 신상품 여부
    private List<String> hashtags;  // 해시태그 목록 (OneTouch 특화)
    private Date createdAt;
    
    // Getters and Setters
}
```

## 📊 SQL 쿼리 예시

### 1. 상품 목록 조회 (해시태그 기반 추천 포함)

```sql
-- 기본 상품 목록 + 해시태그
SELECT 
    p.product_id,
    p.name,
    p.description,
    p.price,
    p.sale_price,
    ROUND((p.price - p.sale_price) / p.price * 100) as discount_rate,
    pi.image_url,
    c.category_id,
    c.name as category_name,
    COALESCE(p.avg_rating, 0) as avg_rating,
    COALESCE(p.review_count, 0) as review_count,
    COALESCE(p.total_sales, 0) as total_sales,
    CASE WHEN DATEDIFF(NOW(), p.created_at) <= 30 THEN 1 ELSE 0 END as is_new,
    GROUP_CONCAT(h.name SEPARATOR ',') as hashtags
FROM products p
LEFT JOIN categories c ON p.category_id = c.category_id
LEFT JOIN product_images pi ON p.product_id = pi.product_id AND pi.is_main = 1
LEFT JOIN product_hashtags ph ON p.product_id = ph.product_id
LEFT JOIN hashtags h ON ph.hashtag_id = h.hashtag_id
WHERE 1=1
  AND (#{categoryId} IS NULL OR p.category_id = #{categoryId})
  AND (#{keyword} IS NULL OR p.name LIKE CONCAT('%', #{keyword}, '%'))
  <if test="hashtagId != null">
  AND p.product_id IN (
      SELECT product_id 
      FROM product_hashtags 
      WHERE hashtag_id = #{hashtagId}
  )
  </if>
GROUP BY p.product_id, pi.image_url, c.category_id, c.name
ORDER BY
  <choose>
    <when test="sort == 'sales'">p.total_sales DESC</when>
    <when test="sort == 'price_asc'">p.sale_price ASC</when>
    <when test="sort == 'price_desc'">p.sale_price DESC</when>
    <when test="sort == 'rating'">p.avg_rating DESC, p.review_count DESC</when>
    <when test="sort == 'newest'">p.created_at DESC</when>
    <otherwise>p.total_sales DESC, p.avg_rating DESC</otherwise> -- popularity
  </choose>
LIMIT #{offset}, #{pageSize}
```

### 2. 전체 상품 수 조회

```sql
SELECT COUNT(DISTINCT p.product_id)
FROM products p
WHERE 1=1
  AND (#{categoryId} IS NULL OR p.category_id = #{categoryId})
  AND (#{keyword} IS NULL OR p.name LIKE CONCAT('%', #{keyword}, '%'))
  <if test="hashtagId != null">
  AND p.product_id IN (
      SELECT product_id 
      FROM product_hashtags 
      WHERE hashtag_id = #{hashtagId}
  )
  </if>
```

### 3. 카테고리별 상품 수

```sql
SELECT 
    c.category_id,
    c.name,
    COUNT(p.product_id) as product_count
FROM categories c
LEFT JOIN products p ON c.category_id = p.category_id
GROUP BY c.category_id, c.name
ORDER BY c.name
```

### 4. 인기 해시태그 조회 (상위 10개)

```sql
SELECT 
    h.hashtag_id,
    h.name,
    COUNT(ph.product_id) as product_count
FROM hashtags h
INNER JOIN product_hashtags ph ON h.hashtag_id = ph.hashtag_id
GROUP BY h.hashtag_id, h.name
ORDER BY product_count DESC
LIMIT 10
```

## 🔧 MyBatis Mapper 예시

### ProductMapper.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" 
    "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.onetouch.mapper.ProductMapper">

    <!-- Result Map -->
    <resultMap id="productResultMap" type="Product">
        <id property="productId" column="product_id"/>
        <result property="name" column="name"/>
        <result property="description" column="description"/>
        <result property="price" column="price"/>
        <result property="salePrice" column="sale_price"/>
        <result property="discountRate" column="discount_rate"/>
        <result property="imageUrl" column="image_url"/>
        <result property="categoryId" column="category_id"/>
        <result property="categoryName" column="category_name"/>
        <result property="avgRating" column="avg_rating"/>
        <result property="reviewCount" column="review_count"/>
        <result property="totalSales" column="total_sales"/>
        <result property="isNew" column="is_new"/>
        <result property="hashtags" column="hashtags" 
                typeHandler="com.onetouch.handler.StringListTypeHandler"/>
        <result property="createdAt" column="created_at"/>
    </resultMap>

    <!-- 상품 목록 조회 -->
    <select id="selectProducts" resultMap="productResultMap">
        SELECT 
            p.product_id,
            p.name,
            p.description,
            p.price,
            p.sale_price,
            ROUND((p.price - p.sale_price) / p.price * 100) as discount_rate,
            pi.image_url,
            c.category_id,
            c.name as category_name,
            COALESCE(p.avg_rating, 0) as avg_rating,
            COALESCE(p.review_count, 0) as review_count,
            COALESCE(p.total_sales, 0) as total_sales,
            CASE WHEN DATEDIFF(NOW(), p.created_at) <= 30 THEN 1 ELSE 0 END as is_new,
            GROUP_CONCAT(h.name SEPARATOR ',') as hashtags,
            p.created_at
        FROM products p
        LEFT JOIN categories c ON p.category_id = c.category_id
        LEFT JOIN product_images pi ON p.product_id = pi.product_id AND pi.is_main = 1
        LEFT JOIN product_hashtags ph ON p.product_id = ph.product_id
        LEFT JOIN hashtags h ON ph.hashtag_id = h.hashtag_id
        WHERE 1=1
          <if test="categoryId != null">
          AND p.category_id = #{categoryId}
          </if>
          <if test="keyword != null and keyword != ''">
          AND p.name LIKE CONCAT('%', #{keyword}, '%')
          </if>
          <if test="hashtagId != null">
          AND p.product_id IN (
              SELECT product_id 
              FROM product_hashtags 
              WHERE hashtag_id = #{hashtagId}
          )
          </if>
        GROUP BY p.product_id, pi.image_url, c.category_id, c.name, p.created_at
        ORDER BY
          <choose>
            <when test="sort == 'sales'">p.total_sales DESC</when>
            <when test="sort == 'price_asc'">p.sale_price ASC</when>
            <when test="sort == 'price_desc'">p.sale_price DESC</when>
            <when test="sort == 'rating'">p.avg_rating DESC, p.review_count DESC</when>
            <when test="sort == 'newest'">p.created_at DESC</when>
            <otherwise>p.total_sales DESC, p.avg_rating DESC</otherwise>
          </choose>
        LIMIT #{offset}, #{pageSize}
    </select>

    <!-- 상품 총 개수 -->
    <select id="countProducts" resultType="int">
        SELECT COUNT(DISTINCT p.product_id)
        FROM products p
        WHERE 1=1
          <if test="categoryId != null">
          AND p.category_id = #{categoryId}
          </if>
          <if test="keyword != null and keyword != ''">
          AND p.name LIKE CONCAT('%', #{keyword}, '%')
          </if>
          <if test="hashtagId != null">
          AND p.product_id IN (
              SELECT product_id 
              FROM product_hashtags 
              WHERE hashtag_id = #{hashtagId}
          )
          </if>
    </select>

</mapper>
```

## 🎨 커스텀 TypeHandler (해시태그 리스트 처리)

```java
package com.onetouch.handler;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import java.sql.*;
import java.util.Arrays;
import java.util.List;

public class StringListTypeHandler extends BaseTypeHandler<List<String>> {
    
    @Override
    public void setNonNullParameter(PreparedStatement ps, int i, 
                                   List<String> parameter, JdbcType jdbcType) 
            throws SQLException {
        ps.setString(i, String.join(",", parameter));
    }

    @Override
    public List<String> getNullableResult(ResultSet rs, String columnName) 
            throws SQLException {
        String value = rs.getString(columnName);
        return value == null ? null : Arrays.asList(value.split(","));
    }

    @Override
    public List<String> getNullableResult(ResultSet rs, int columnIndex) 
            throws SQLException {
        String value = rs.getString(columnIndex);
        return value == null ? null : Arrays.asList(value.split(","));
    }

    @Override
    public List<String> getNullableResult(CallableStatement cs, int columnIndex) 
            throws SQLException {
        String value = cs.getString(columnIndex);
        return value == null ? null : Arrays.asList(value.split(","));
    }
}
```

**MyBatis 설정에 등록:**
```xml
<!-- mybatis-config.xml -->
<typeHandlers>
    <typeHandler handler="com.onetouch.handler.StringListTypeHandler"/>
</typeHandlers>
```

## 🧪 테스트 체크리스트

### 필터링
- [ ] 카테고리 클릭 시 해당 카테고리 상품만 표시
- [ ] 해시태그 클릭 시 해당 해시태그 상품만 표시
- [ ] 검색어 입력 시 검색 결과 표시
- [ ] 여러 필터 조합 동작 확인

### 정렬
- [ ] 인기순 (판매량 + 평점)
- [ ] 판매량순
- [ ] 가격순 (오름차순/내림차순)
- [ ] 평점순
- [ ] 최신순

### 페이징
- [ ] 첫 페이지 이전 버튼 비활성화
- [ ] 마지막 페이지 다음 버튼 비활성화
- [ ] 페이지 번호 클릭 동작
- [ ] 현재 페이지 강조

### 레이아웃
- [ ] 그리드 뷰 / 리스트 뷰 전환
- [ ] 반응형 (모바일/태블릿/데스크톱)
- [ ] 상품이 없을 때 안내 메시지

### 상품 카드
- [ ] 할인율 표시 (할인 상품만)
- [ ] 신상품 태그 (30일 이내 등록)
- [ ] 별점 표시
- [ ] 해시태그 표시
- [ ] 장바구니 버튼 클릭 시 상세 페이지 이동

## 🎯 OneTouch 프로젝트 특화 기능

### 1. 해시태그 기반 추천
- 사용자의 문진 결과 해시태그와 일치하는 상품 우선 노출
- 인기 해시태그 배지로 빠른 필터링
- 상품 카드에 해시태그 표시 (최대 3개)

### 2. 판매량 기반 정렬
- `total_sales` 컬럼 활용
- 인기순 정렬 시 판매량 + 평점 조합

### 3. 피부 타입 필터
- 뷰티 쇼핑몰 특화
- 해시태그나 상품 속성으로 구현 가능

## 💡 개선 아이디어 (선택사항)

### 1. AJAX 무한 스크롤
현재는 페이징 방식이지만, 더 나은 UX를 위해:
```javascript
// 무한 스크롤 구현 예시
let page = 1;
let loading = false;

window.addEventListener('scroll', () => {
    if (loading) return;
    
    const scrollHeight = document.documentElement.scrollHeight;
    const scrollTop = document.documentElement.scrollTop;
    const clientHeight = document.documentElement.clientHeight;
    
    if (scrollTop + clientHeight >= scrollHeight - 100) {
        loading = true;
        page++;
        loadMoreProducts(page);
    }
});
```

### 2. 실시간 필터
체크박스 변경 시 AJAX로 즉시 필터링:
```javascript
// 현재는 주석처리되어 있음
// applyFilters() 함수 활성화
```

### 3. 빠른 미리보기
상품 카드 호버 시 퀵뷰 모달:
```javascript
$('.product-image').hover(function() {
    // 상품 간략 정보 모달 표시
});
```

## 🚀 다음 단계

상품 목록 페이지 완성 후:

1. **상품 상세 페이지** (`/product/detail/{productId}`)
2. **장바구니 페이지** (`/cart/list`)
3. **문진 시스템** (`/user/survey`) - 해시태그 생성
4. **마이페이지** (`/user/mypage`) - 추천 상품 표시

---

**OneTouch** - 해시태그 기반 2030 남성 맞춤 뷰티 추천 쇼핑몰
