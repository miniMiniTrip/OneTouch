# 마이페이지 사이드바 링크 경로 가이드

## 📋 전체 메뉴 구조 및 경로

### 🛒 쇼핑 메뉴

#### 1. 장바구니
```jsp
<a href="${pageContext.request.contextPath}/cart/list.do?mem_idx=${sessionScope.mem_idx}" 
   class="menu-item">
    🛒 장바구니
</a>
```
- **경로**: `/cart/list.do`
- **파라미터**: `mem_idx` (필수)
- **Controller**: `CartController.list()`
- **View**: `cart/cart_list.jsp`

#### 2. 찜 목록
```jsp
<a href="${pageContext.request.contextPath}/wishlist/list.do?mem_idx=${sessionScope.mem_idx}" 
   class="menu-item">
    💝 찜
</a>
```
- **경로**: `/wishlist/list.do`
- **파라미터**: `mem_idx` (필수)
- **Controller**: `WishlistController.list()`
- **View**: `wishlist/wishlist_list.jsp`

#### 3. 주문/배송 조회
```jsp
<a href="${pageContext.request.contextPath}/order/list.do?mem_idx=${sessionScope.mem_idx}" 
   class="menu-item">
    🎯 주문/배송 조회
</a>
```
- **경로**: `/order/list.do`
- **파라미터**: `mem_idx` (필수)
- **Controller**: `OrderController.list()`
- **View**: `order/order_list.jsp`

---

### 💬 나의 활동

#### 4. 상품 Q&A
```jsp
<a href="${pageContext.request.contextPath}/qna/list.do?mem_idx=${sessionScope.mem_idx}" 
   class="menu-item">
    💬 상품 Q&A
</a>
```
- **경로**: `/qna/list.do`
- **파라미터**: `mem_idx` (필수)
- **Controller**: `QnaController.list()`
- **View**: `qna/qna_list.jsp`

#### 5. 상품 리뷰 (선택사항)
```jsp
<a href="${pageContext.request.contextPath}/review/list.do?mem_idx=${sessionScope.mem_idx}" 
   class="menu-item">
    ⭐ 상품 리뷰
</a>
```
- **경로**: `/review/list.do`
- **파라미터**: `mem_idx` (필수)
- **Controller**: `ReviewController.list()`
- **View**: `review/review_list.jsp`

---

### 👥 회원 정보

#### 6. 회원정보 수정
```jsp
<a href="${pageContext.request.contextPath}/member/modify.do" 
   class="menu-item">
    👥 회원정보 수정
</a>
```
- **경로**: `/member/modify.do`
- **파라미터**: 세션에서 자동으로 mem_idx 가져옴
- **Controller**: `MemberController.modifyForm()`
- **View**: `member/member_modify.jsp`

#### 7. 배송지 관리
```jsp
<a href="${pageContext.request.contextPath}/member/address.do" 
   class="menu-item">
    🔒 배송지 관리
</a>
```
- **경로**: `/member/address.do`
- **파라미터**: 세션에서 자동으로 mem_idx 가져옴
- **Controller**: `MemberController.addressList()`
- **View**: `member/address_list.jsp`

#### 8. 알림톡신청 관리
```jsp
<a href="${pageContext.request.contextPath}/member/notification.do" 
   class="menu-item">
    📧 알림톡신청 관리
</a>
```
- **경로**: `/member/notification.do`
- **파라미터**: 세션에서 자동으로 mem_idx 가져옴
- **Controller**: `MemberController.notificationSettings()`
- **View**: `member/notification_settings.jsp`

---

### 📝 시스템

#### 9. 로그아웃
```jsp
<a href="${pageContext.request.contextPath}/member/logout.do" 
   class="menu-item"
   onclick="return confirm('로그아웃 하시겠습니까?');">
    📝 로그아웃
</a>
```
- **경로**: `/member/logout.do`
- **파라미터**: 없음
- **Controller**: `MemberController.logout()`
- **동작**: 세션 삭제 후 메인 페이지로 리다이렉트

---

## 🎯 Active 클래스 설정 방법

현재 페이지에 해당하는 메뉴에 `active` 클래스를 추가합니다.

### 방법 1: 수동으로 설정 (권장)
각 페이지에서 해당 메뉴에만 `active` 추가:

```jsp
<!-- 장바구니 페이지인 경우 -->
<a href="${pageContext.request.contextPath}/cart/list.do?mem_idx=${sessionScope.mem_idx}" 
   class="menu-item active">  <!-- active 클래스 추가 -->
    🛒 장바구니
</a>
```

### 방법 2: JavaScript로 자동 설정
템플릿에 이미 포함된 스크립트 사용:

```javascript
// 현재 페이지 URL 기반으로 자동 활성화
$(document).ready(function() {
    var currentPath = window.location.pathname;
    $('.menu-item').each(function() {
        var href = $(this).attr('href');
        if (href && currentPath.indexOf(href) !== -1) {
            $(this).addClass('active');
        }
    });
});
```

---

## 📝 Controller 예시

### CartController.java
```java
@Controller
@RequestMapping("/cart")
public class CartController {
    
    @Autowired
    CartDao cart_dao;
    
    @Autowired
    HttpSession session;
    
    @RequestMapping("/list.do")
    public String list(@RequestParam(required = false) Integer mem_idx, Model model) {
        // 파라미터로 안 넘어오면 세션에서 가져오기
        if (mem_idx == null) {
            mem_idx = (Integer) session.getAttribute("mem_idx");
        }
        
        // 로그인 체크
        if (mem_idx == null) {
            return "redirect:/member/login.do";
        }
        
        List<CartVo> cart_list = cart_dao.selectList(mem_idx);
        int total_amount = cart_dao.selectCartTotalAmount(mem_idx);
        
        model.addAttribute("cart_list", cart_list);
        model.addAttribute("total_amount", total_amount);
        
        return "cart/cart_list";
    }
}
```

### OrderController.java
```java
@Controller
@RequestMapping("/order")
public class OrderController {
    
    @Autowired
    OrderDao order_dao;
    
    @Autowired
    HttpSession session;
    
    @RequestMapping("/list.do")
    public String list(@RequestParam(required = false) Integer mem_idx, Model model) {
        if (mem_idx == null) {
            mem_idx = (Integer) session.getAttribute("mem_idx");
        }
        
        if (mem_idx == null) {
            return "redirect:/member/login.do";
        }
        
        List<OrderVo> order_list = order_dao.selectList(mem_idx);
        model.addAttribute("order_list", order_list);
        
        return "order/order_list";
    }
}
```

### MemberController.java
```java
@Controller
@RequestMapping("/member")
public class MemberController {
    
    @Autowired
    HttpSession session;
    
    @RequestMapping("/modify.do")
    public String modifyForm(Model model) {
        Integer mem_idx = (Integer) session.getAttribute("mem_idx");
        
        if (mem_idx == null) {
            return "redirect:/member/login.do";
        }
        
        // 회원 정보 조회
        MemberVo member = member_dao.selectOne(mem_idx);
        model.addAttribute("member", member);
        
        return "member/member_modify";
    }
    
    @RequestMapping("/address.do")
    public String addressList(Model model) {
        Integer mem_idx = (Integer) session.getAttribute("mem_idx");
        
        if (mem_idx == null) {
            return "redirect:/member/login.do";
        }
        
        List<AddressVo> address_list = address_dao.selectList(mem_idx);
        model.addAttribute("address_list", address_list);
        
        return "member/address_list";
    }
    
    @RequestMapping("/logout.do")
    public String logout() {
        session.invalidate();
        return "redirect:/";
    }
}
```

---

## 🔒 로그인 체크 공통 로직

모든 마이페이지는 로그인이 필요하므로 공통 체크 로직 사용:

### 방법 1: Controller에서 직접 체크
```java
@RequestMapping("/list.do")
public String list(Model model, HttpSession session) {
    Integer mem_idx = (Integer) session.getAttribute("mem_idx");
    
    if (mem_idx == null) {
        return "redirect:/member/login.do";
    }
    
    // 로직 계속...
}
```

### 방법 2: Interceptor 사용 (권장)
```java
@Component
public class LoginCheckInterceptor implements HandlerInterceptor {
    
    @Override
    public boolean preHandle(HttpServletRequest request, 
                           HttpServletResponse response, 
                           Object handler) throws Exception {
        
        HttpSession session = request.getSession();
        Integer mem_idx = (Integer) session.getAttribute("mem_idx");
        
        if (mem_idx == null) {
            response.sendRedirect("/member/login.do");
            return false;
        }
        
        return true;
    }
}
```

**WebMvcConfigurer 설정:**
```java
@Configuration
public class WebConfig implements WebMvcConfigurer {
    
    @Autowired
    LoginCheckInterceptor loginCheckInterceptor;
    
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(loginCheckInterceptor)
                .addPathPatterns("/cart/**", "/order/**", "/qna/**", 
                               "/wishlist/**", "/member/modify.do", 
                               "/member/address.do", "/member/notification.do")
                .excludePathPatterns("/member/login.do", "/member/join.do");
    }
}
```

---

## ⚠️ 주의사항

### 1. mem_idx 파라미터
- **쇼핑/활동 메뉴**: URL에 `?mem_idx=${sessionScope.mem_idx}` 필수
- **회원정보 메뉴**: 세션에서 자동으로 가져오므로 파라미터 불필요
- **일관성 유지**: 모든 페이지에서 동일한 방식 사용

### 2. 세션 변수명
프로젝트에서 사용하는 세션 변수명 확인:
- `mem_idx`: 회원 번호
- `mem_name`: 회원 이름
- `mem_id`: 회원 아이디 (로그인 ID)

### 3. contextPath
- 개발: `/` 또는 프로젝트명
- 배포: 서버 설정에 따라 다름
- **항상** `${pageContext.request.contextPath}` 사용 권장

---

## 📋 URL 매핑 전체 목록

| 메뉴명 | URL | 파라미터 | Controller 메서드 |
|--------|-----|----------|-------------------|
| 장바구니 | `/cart/list.do` | mem_idx | CartController.list() |
| 찜 | `/wishlist/list.do` | mem_idx | WishlistController.list() |
| 주문/배송 조회 | `/order/list.do` | mem_idx | OrderController.list() |
| 상품 Q&A | `/qna/list.do` | mem_idx | QnaController.list() |
| 상품 리뷰 | `/review/list.do` | mem_idx | ReviewController.list() |
| 회원정보 수정 | `/member/modify.do` | 세션 | MemberController.modifyForm() |
| 배송지 관리 | `/member/address.do` | 세션 | MemberController.addressList() |
| 알림톡신청 | `/member/notification.do` | 세션 | MemberController.notificationSettings() |
| 로그아웃 | `/member/logout.do` | - | MemberController.logout() |

---

## 🎉 완성 체크리스트

- [x] 모든 메뉴에 링크 설정
- [x] contextPath 사용
- [x] mem_idx 파라미터 전달
- [x] active 클래스 설정 방법 확인
- [x] Controller 메서드 구현
- [x] 로그인 체크 로직 적용
- [x] View 파일 생성

이제 모든 사이드바 메뉴가 연결되어 있습니다! 🚀
