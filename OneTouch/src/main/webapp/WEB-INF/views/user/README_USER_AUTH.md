# OneTouch 프로젝트 - 회원 인증 페이지

2030 남성 뷰티 쇼핑몰 **OneTouch**의 회원 인증 관련 JSP 페이지입니다.

## 📋 프로젝트 개요

- **대상**: 2030 남성
- **컨셉**: 해시태그 기반 맞춤 추천 뷰티 쇼핑몰
- **기술 스택**: Spring Boot + MyBatis + JSP + MySQL + Bootstrap 5
- **템플릿**: ShopGrids (무료 템플릿)

## 📁 파일 구성

```
WEB-INF/views/user/
├── login.jsp              # 로그인
├── register.jsp           # 회원가입
├── findPassword.jsp       # 비밀번호 찾기
└── resetPassword.jsp      # 비밀번호 재설정
```

## 🎯 주요 기능

### 1. login.jsp - 로그인
- ✅ 이메일/비밀번호 로그인
- ✅ "로그인 상태 유지" 체크박스
- ✅ 소셜 로그인 (Google, Kakao) - 선택사항
- ✅ 에러/성공 메시지 표시
- ✅ 회원가입/비밀번호 찾기 링크

**필요한 Controller 메서드:**
```java
@PostMapping("/user/login")
public String login(@RequestParam String email, 
                   @RequestParam String password,
                   @RequestParam(required = false) String rememberMe,
                   HttpSession session, RedirectAttributes ra)
```

### 2. register.jsp - 회원가입
- ✅ 기본 정보 입력 (이메일, 비밀번호, 이름, 전화번호, 생년월일)
- ✅ 이메일 중복 확인 (AJAX)
- ✅ 비밀번호 강도 검증
- ✅ 기본 배송지 입력 (Daum 우편번호 API)
- ✅ 약관 동의 (필수/선택)
- ✅ 전체 동의 체크박스
- ✅ 실시간 유효성 검증

**필요한 Controller 메서드:**
```java
@PostMapping("/user/register")
public String register(@ModelAttribute User user, RedirectAttributes ra)

@GetMapping("/user/checkEmail")
@ResponseBody
public Map<String, Boolean> checkEmail(@RequestParam String email)
```

**users 테이블 매핑:**
- email, password, name, phone, birth_date
- zip_code, address, address_detail (기본 배송지)
- agree_marketing

### 3. findPassword.jsp - 비밀번호 찾기
- ✅ 이메일 입력
- ✅ 비밀번호 재설정 메일 발송
- ✅ 메일 발송 완료 안내
- ✅ 재전송 기능

**필요한 Controller 메서드:**
```java
@PostMapping("/user/sendResetLink")
public String sendResetLink(@RequestParam String email, RedirectAttributes ra)
```

**구현 방법:**
1. 랜덤 토큰 생성 (UUID)
2. DB에 토큰 저장 (password_reset_tokens 테이블 또는 users 테이블에 컬럼 추가)
3. 메일 발송 (Spring Mail 사용)
4. 토큰은 24시간 유효

### 4. resetPassword.jsp - 비밀번호 재설정
- ✅ 새 비밀번호 입력
- ✅ 비밀번호 강도 표시 (실시간)
- ✅ 비밀번호 확인
- ✅ 비밀번호 보기/숨기기 토글
- ✅ 토큰 검증

**필요한 Controller 메서드:**
```java
@GetMapping("/user/resetPassword")
public String showResetPasswordForm(@RequestParam String token, Model model)

@PostMapping("/user/resetPassword")
public String resetPassword(@RequestParam String token,
                           @RequestParam String password,
                           RedirectAttributes ra)
```

## 🗄️ DB 테이블 구조

### users 테이블 (회원가입 관련)
```sql
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(50) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    birth_date DATE,
    
    -- 기본 배송지 (1개만 저장)
    zip_code VARCHAR(10),
    address VARCHAR(255),
    address_detail VARCHAR(255),
    
    -- 소셜 로그인
    oauth_provider VARCHAR(20),
    oauth_id VARCHAR(100),
    
    -- 약관 동의
    agree_marketing BOOLEAN DEFAULT FALSE,
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    INDEX idx_email (email)
);
```

### password_reset_tokens 테이블 (옵션)
```sql
CREATE TABLE password_reset_tokens (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    token VARCHAR(255) NOT NULL UNIQUE,
    expires_at TIMESTAMP NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    INDEX idx_token (token)
);
```

또는 users 테이블에 추가:
```sql
ALTER TABLE users ADD COLUMN reset_token VARCHAR(255);
ALTER TABLE users ADD COLUMN reset_token_expires_at TIMESTAMP;
```

## 🔧 Backend 구현 가이드

### 1. 이메일 중복 확인 (AJAX)

**UserController.java**
```java
@GetMapping("/user/checkEmail")
@ResponseBody
public Map<String, Boolean> checkEmail(@RequestParam String email) {
    boolean available = userService.isEmailAvailable(email);
    return Map.of("available", available);
}
```

**UserService.java**
```java
public boolean isEmailAvailable(String email) {
    return userMapper.findByEmail(email) == null;
}
```

### 2. 비밀번호 암호화

**BCryptPasswordEncoder 사용**
```java
@Bean
public PasswordEncoder passwordEncoder() {
    return new BCryptPasswordEncoder();
}

// 회원가입 시
String encodedPassword = passwordEncoder.encode(password);
user.setPassword(encodedPassword);

// 로그인 시
boolean matches = passwordEncoder.matches(rawPassword, encodedPassword);
```

### 3. 세션 관리

**로그인 성공 시**
```java
session.setAttribute("userId", user.getUserId());
session.setAttribute("userName", user.getName());
session.setAttribute("userEmail", user.getEmail());
```

**로그아웃**
```java
@GetMapping("/user/logout")
public String logout(HttpSession session) {
    session.invalidate();
    return "redirect:/";
}
```

### 4. 메일 발송 (비밀번호 찾기)

**application.properties**
```properties
spring.mail.host=smtp.gmail.com
spring.mail.port=587
spring.mail.username=your-email@gmail.com
spring.mail.password=your-app-password
spring.mail.properties.mail.smtp.auth=true
spring.mail.properties.mail.smtp.starttls.enable=true
```

**EmailService.java**
```java
@Service
public class EmailService {
    @Autowired
    private JavaMailSender mailSender;
    
    @Value("${app.base-url}")
    private String baseUrl;
    
    public void sendPasswordResetEmail(String to, String token) {
        String resetLink = baseUrl + "/user/resetPassword?token=" + token;
        
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(to);
        message.setSubject("[OneTouch] 비밀번호 재설정");
        message.setText("안녕하세요.\n\n" +
                       "비밀번호 재설정을 요청하셨습니다.\n" +
                       "아래 링크를 클릭하여 비밀번호를 재설정해주세요.\n\n" +
                       resetLink + "\n\n" +
                       "이 링크는 24시간 동안 유효합니다.\n" +
                       "요청하지 않으셨다면 이 메일을 무시하세요.");
        
        mailSender.send(message);
    }
}
```

### 5. 토큰 생성 및 검증

**비밀번호 재설정 토큰 생성**
```java
public String createPasswordResetToken(int userId) {
    String token = UUID.randomUUID().toString();
    Timestamp expiresAt = new Timestamp(System.currentTimeMillis() + 24 * 60 * 60 * 1000); // 24시간
    
    userMapper.savePasswordResetToken(userId, token, expiresAt);
    return token;
}
```

**토큰 검증**
```java
public boolean validatePasswordResetToken(String token) {
    PasswordResetToken resetToken = userMapper.findByToken(token);
    
    if (resetToken == null) {
        return false;
    }
    
    if (resetToken.getExpiresAt().before(new Date())) {
        return false; // 토큰 만료
    }
    
    return true;
}
```

## 🔐 보안 고려사항

### 1. CSRF 방지
Spring Security 사용 시 자동 적용, 수동 구현 시:
```jsp
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
```

### 2. SQL Injection 방지
MyBatis를 사용하여 PreparedStatement 자동 적용:
```xml
<select id="findByEmail" parameterType="String" resultType="User">
    SELECT * FROM users WHERE email = #{email}
</select>
```

### 3. XSS 방지
JSTL의 `<c:out>` 사용:
```jsp
<p>${errorMessage}</p>  <!-- 위험 -->
<p><c:out value="${errorMessage}"/></p>  <!-- 안전 -->
```

### 4. 비밀번호 정책
- 최소 8자 이상
- 영문, 숫자, 특수문자 포함
- 프론트엔드/백엔드 양쪽 검증

### 5. Rate Limiting
로그인 시도 제한 (5회 실패 시 5분 잠금 등)

## 📋 include 파일 필요 사항

### header.jsp에 필요한 내용
```jsp
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 로그인 상태 표시 -->
<c:choose>
    <c:when test="${not empty sessionScope.userId}">
        <div class="user">
            <i class="lni lni-user"></i>
            ${sessionScope.userName}님
        </div>
        <ul class="user-login">
            <li><a href="${pageContext.request.contextPath}/user/mypage">마이페이지</a></li>
            <li><a href="${pageContext.request.contextPath}/user/logout">로그아웃</a></li>
        </ul>
    </c:when>
    <c:otherwise>
        <div class="user">
            <i class="lni lni-user"></i>
            환영합니다
        </div>
        <ul class="user-login">
            <li><a href="${pageContext.request.contextPath}/user/login">로그인</a></li>
            <li><a href="${pageContext.request.contextPath}/user/register">회원가입</a></li>
        </ul>
    </c:otherwise>
</c:choose>
```

## 🧪 테스트 체크리스트

### 로그인 (login.jsp)
- [ ] 올바른 이메일/비밀번호로 로그인 성공
- [ ] 잘못된 비밀번호로 로그인 실패
- [ ] 존재하지 않는 이메일로 로그인 실패
- [ ] "로그인 상태 유지" 체크 시 쿠키 생성
- [ ] 에러 메시지 표시
- [ ] 로그인 후 원래 페이지로 리다이렉트

### 회원가입 (register.jsp)
- [ ] 모든 필수 항목 입력 시 회원가입 성공
- [ ] 이메일 중복 확인 동작
- [ ] 비밀번호 일치 확인
- [ ] 비밀번호 강도 검증
- [ ] 전화번호 형식 검증
- [ ] 우편번호 검색 동작
- [ ] 필수 약관 미동의 시 제출 불가
- [ ] 회원가입 후 로그인 페이지로 리다이렉트

### 비밀번호 찾기 (findPassword.jsp)
- [ ] 가입된 이메일로 메일 발송
- [ ] 가입되지 않은 이메일 처리
- [ ] 메일 발송 완료 메시지 표시
- [ ] 재전송 기능 동작

### 비밀번호 재설정 (resetPassword.jsp)
- [ ] 유효한 토큰으로 접근 시 폼 표시
- [ ] 만료된 토큰 처리
- [ ] 비밀번호 강도 표시
- [ ] 비밀번호 일치 확인
- [ ] 재설정 후 로그인 페이지로 리다이렉트

## 🚀 다음 단계

이 페이지들을 완성한 후:

1. **문진 시스템** (`/user/survey.jsp`) - 5개 질문으로 해시태그 생성
2. **마이페이지** (`/user/mypage.jsp`) - 프로필, 주문내역, 문진 재진단
3. **장바구니** (`/cart/list.jsp`) - 찜하기 통합
4. **주문/결제** (`/order/checkout.jsp`)
5. **커뮤니티** (`/post/list.jsp`) - Instagram 그리드 스타일

## 📞 문의사항

프로젝트 관련 문의나 버그 리포트는 팀 내 협의를 통해 진행해주세요.

---

**OneTouch** - 해시태그 기반 2030 남성 맞춤 뷰티 추천 쇼핑몰
