# 마이페이지 URL 매핑 빠른 참조

## 📌 전체 URL 목록

### 🛒 쇼핑 메뉴

| 메뉴명 | URL | 파라미터 |
|--------|-----|----------|
| 장바구니 | `/cart/list.do` | `?mem_idx=${sessionScope.mem_idx}` |
| 찜 목록 | `/wishlist/list.do` | `?mem_idx=${sessionScope.mem_idx}` |
| 주문/배송 조회 | `/order/list.do` | `?mem_idx=${sessionScope.mem_idx}` |

### 💬 나의 활동

| 메뉴명 | URL | 파라미터 |
|--------|-----|----------|
| 상품 Q&A | `/qna/list.do` | `?mem_idx=${sessionScope.mem_idx}` |
| 상품 리뷰 | `/review/list.do` | `?mem_idx=${sessionScope.mem_idx}` |

### 👥 회원 정보

| 메뉴명 | URL | 파라미터 |
|--------|-----|----------|
| 회원정보 수정 | `/member/modify.do` | 세션에서 자동 |
| 배송지 관리 | `/member/address.do` | 세션에서 자동 |
| 알림톡신청 관리 | `/member/notification.do` | 세션에서 자동 |

### 📝 시스템

| 메뉴명 | URL | 파라미터 |
|--------|-----|----------|
| 로그아웃 | `/member/logout.do` | 없음 |

---

## 🔗 JSP 코드 복사용

### 장바구니
```jsp
<a href="${pageContext.request.contextPath}/cart/list.do?mem_idx=${sessionScope.mem_idx}" 
   class="menu-item">
    🛒 장바구니
</a>
```

### 찜 목록
```jsp
<a href="${pageContext.request.contextPath}/wishlist/list.do?mem_idx=${sessionScope.mem_idx}" 
   class="menu-item">
    💝 찜
</a>
```

### 주문/배송 조회
```jsp
<a href="${pageContext.request.contextPath}/order/list.do?mem_idx=${sessionScope.mem_idx}" 
   class="menu-item">
    🎯 주문/배송 조회
</a>
```

### 상품 Q&A
```jsp
<a href="${pageContext.request.contextPath}/qna/list.do?mem_idx=${sessionScope.mem_idx}" 
   class="menu-item">
    💬 상품 Q&A
</a>
```

### 회원정보 수정
```jsp
<a href="${pageContext.request.contextPath}/member/modify.do" 
   class="menu-item">
    👥 회원정보 수정
</a>
```

### 배송지 관리
```jsp
<a href="${pageContext.request.contextPath}/member/address.do" 
   class="menu-item">
    🔒 배송지 관리
</a>
```

### 알림톡신청 관리
```jsp
<a href="${pageContext.request.contextPath}/member/notification.do" 
   class="menu-item">
    📧 알림톡신청 관리
</a>
```

### 로그아웃
```jsp
<a href="${pageContext.request.contextPath}/member/logout.do" 
   class="menu-item"
   onclick="return confirm('로그아웃 하시겠습니까?');">
    📝 로그아웃
</a>
```

---

## ⚙️ Controller 메서드 네이밍 규칙

| URL Pattern | Controller | Method |
|-------------|-----------|--------|
| `/xxx/list.do` | `XxxController` | `list()` |
| `/xxx/detail.do` | `XxxController` | `detail()` |
| `/xxx/insert.do` | `XxxController` | `insert()` |
| `/xxx/modify.do` | `XxxController` | `modifyForm()` / `modify()` |
| `/xxx/delete.do` | `XxxController` | `delete()` |

---

## 🎯 Active 클래스 설정 규칙

현재 페이지 = `class="menu-item active"`

| 페이지 | Active 메뉴 |
|--------|-------------|
| `cart_list.jsp` | 🛒 장바구니 |
| `wishlist_list.jsp` | 💝 찜 |
| `order_list.jsp` | 🎯 주문/배송 조회 |
| `qna_list.jsp` | 💬 상품 Q&A |
| `member_modify.jsp` | 👥 회원정보 수정 |
| `address_list.jsp` | 🔒 배송지 관리 |
| `notification_settings.jsp` | 📧 알림톡신청 관리 |

---

## 📋 전체 사이드바 코드 (복사용)

```jsp
<div class="sidebar">
    <div class="sidebar-header">마이페이지</div>
    <div class="sidebar-subtitle">${sessionScope.mem_name}님 환영합니다</div>
    
    <!-- 쇼핑 메뉴 -->
    <div class="menu-section">
        <a href="${pageContext.request.contextPath}/cart/list.do?mem_idx=${sessionScope.mem_idx}" 
           class="menu-item">
            🛒 장바구니
        </a>
        <a href="${pageContext.request.contextPath}/wishlist/list.do?mem_idx=${sessionScope.mem_idx}" 
           class="menu-item">
            💝 찜
        </a>
        <a href="${pageContext.request.contextPath}/order/list.do?mem_idx=${sessionScope.mem_idx}" 
           class="menu-item">
            🎯 주문/배송 조회
        </a>
    </div>
    
    <!-- 나의 활동 -->
    <div class="menu-section">
        <div class="menu-title">나의 활동</div>
        <a href="${pageContext.request.contextPath}/qna/list.do?mem_idx=${sessionScope.mem_idx}" 
           class="menu-item">
            💬 상품 Q&A
        </a>
    </div>
    
    <!-- 회원 정보 -->
    <div class="menu-section">
        <div class="menu-title">회원 정보</div>
        <a href="${pageContext.request.contextPath}/member/modify.do" 
           class="menu-item">
            👥 회원정보 수정
        </a>
        <a href="${pageContext.request.contextPath}/member/address.do" 
           class="menu-item">
            🔒 배송지 관리
        </a>
        <a href="${pageContext.request.contextPath}/member/notification.do" 
           class="menu-item">
            📧 알림톡신청 관리
        </a>
    </div>
    
    <!-- 로그아웃 -->
    <div class="menu-section">
        <a href="${pageContext.request.contextPath}/member/logout.do" 
           class="menu-item"
           onclick="return confirm('로그아웃 하시겠습니까?');">
            📝 로그아웃
        </a>
    </div>
</div>
```

---

## ⚠️ 주의사항 체크리스트

- [ ] `${pageContext.request.contextPath}` 사용 확인
- [ ] `${sessionScope.mem_idx}` 또는 `${sessionScope.mem_name}` 사용 확인
- [ ] 현재 페이지에 `active` 클래스 추가 확인
- [ ] 로그아웃 버튼에 `onclick` 확인 추가
- [ ] 모든 링크 `<a>` 태그 사용 (div 대신)
- [ ] `class="menu-item"` 클래스 확인

---

## 🚀 빠른 시작 가이드

1. **템플릿 복사**: `mypage_template.jsp` → 새 파일
2. **제목 변경**: 3곳 (title, breadcrumb, content-header)
3. **사이드바 active 설정**: 현재 페이지 메뉴에 `active` 추가
4. **컨텐츠 작성**: 주석 부분에 내용 추가
5. **Controller 구현**: 해당 URL 매핑 메서드 작성
6. **테스트**: 링크 클릭 → 페이지 이동 확인

완료! 🎉
