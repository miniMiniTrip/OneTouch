# OneTouch 프로젝트 - 결제 페이지 (토스페이먼츠 연동)

2030 남성 뷰티 쇼핑몰 **OneTouch**의 결제 관련 JSP 페이지입니다.

## 📋 파일 구성

```
WEB-INF/views/order/
├── checkout.jsp           # 주문/결제 페이지
├── orderSuccess.jsp       # 결제 성공 페이지
└── orderFail.jsp          # 결제 실패 페이지
```

## 🎯 주요 기능

### 1. checkout.jsp - 주문/결제
- ✅ **3단계 Accordion 방식**
  - Step 1: 주문자 정보
  - Step 2: 배송지 정보
  - Step 3: 결제 수단 (토스페이먼츠)
- ✅ Daum 우편번호 API 연동
- ✅ "주문자 정보와 동일" 체크박스
- ✅ 주문 상품 목록 및 가격 요약
- ✅ 실시간 유효성 검사
- ✅ 페이지 이탈 방지

### 2. orderSuccess.jsp - 결제 성공
- ✅ 주문번호, 결제금액 표시
- ✅ 결제수단, 주문일시 표시
- ✅ 주문 내역 보기 링크
- ✅ 깔끔한 성공 UI

### 3. orderFail.jsp - 결제 실패
- ✅ 실패 사유 표시
- ✅ 오류 코드/메시지 표시
- ✅ 다시 결제하기 버튼
- ✅ 고객센터 안내

## 🔐 토스페이먼츠 연동

### 1. SDK 로드
```html
<!-- checkout.jsp -->
<script src="https://js.tosspayments.com/v1/payment-widget"></script>
```

### 2. 결제 위젯 초기화
```javascript
const clientKey = '${tossClientKey}'; // 서버에서 전달
const customerKey = 'customer_${user.userId}';
const paymentWidget = PaymentWidget(clientKey, customerKey);
```

### 3. 결제 UI 렌더링
```javascript
// 결제 수단 선택 UI
paymentWidget.renderPaymentMethods('#payment-widget', totalAmount, {
    currency: 'KRW'
});

// 이용약관 UI
paymentWidget.renderAgreement('#agreement');
```

### 4. 결제 요청
```javascript
await paymentWidget.requestPayment({
    orderId: orderId,
    orderName: '상품명 외 2건',
    customerName: '홍길동',
    customerEmail: 'customer@example.com',
    customerMobilePhone: '01012345678',
    successUrl: '/order/success',
    failUrl: '/order/fail',
});
```

## 🗄️ Controller 구현

### 1. 결제 페이지 표시

```java
@GetMapping("/order/checkout")
public String showCheckout(HttpSession session, Model model) {
    // 세션에서 사용자 정보 가져오기
    Integer userId = (Integer) session.getAttribute("userId");
    if (userId == null) {
        return "redirect:/user/login";
    }
    
    User user = userService.getUserById(userId);
    model.addAttribute("user", user);
    
    // 장바구니에서 주문할 상품 가져오기
    List<CartItem> cartItems = cartService.getCartItems(userId);
    if (cartItems.isEmpty()) {
        return "redirect:/cart/list";
    }
    
    // 주문 상품 목록
    List<OrderItemDTO> orderItems = new ArrayList<>();
    int totalProductPrice = 0;
    
    for (CartItem item : cartItems) {
        OrderItemDTO orderItem = new OrderItemDTO();
        orderItem.setProductId(item.getProductId());
        orderItem.setProductName(item.getProductName());
        orderItem.setProductImage(item.getImageUrl());
        orderItem.setQuantity(item.getQuantity());
        orderItem.setPrice(item.getSalePrice());
        
        orderItems.add(orderItem);
        totalProductPrice += item.getSalePrice() * item.getQuantity();
    }
    
    // 배송비 계산 (50,000원 이상 무료)
    int shippingFee = totalProductPrice >= 50000 ? 0 : 3000;
    
    // 총 결제금액
    int totalAmount = totalProductPrice + shippingFee;
    
    // 주문 ID 생성
    String orderId = "ORD" + System.currentTimeMillis();
    
    // 주문명 생성 (첫 번째 상품명 + 외 N건)
    String orderName = orderItems.get(0).getProductName();
    if (orderItems.size() > 1) {
        orderName += " 외 " + (orderItems.size() - 1) + "건";
    }
    
    model.addAttribute("orderItems", orderItems);
    model.addAttribute("totalProductPrice", totalProductPrice);
    model.addAttribute("shippingFee", shippingFee);
    model.addAttribute("discountAmount", 0);
    model.addAttribute("totalAmount", totalAmount);
    model.addAttribute("orderId", orderId);
    model.addAttribute("orderName", orderName);
    
    // 토스페이먼츠 클라이언트 키
    model.addAttribute("tossClientKey", tossPaymentsProperties.getClientKey());
    
    // 세션에 임시 주문 정보 저장
    session.setAttribute("tempOrder", Map.of(
        "orderId", orderId,
        "orderName", orderName,
        "totalAmount", totalAmount,
        "orderItems", orderItems
    ));
    
    return "order/checkout";
}
```

### 2. 결제 성공 처리

```java
@GetMapping("/order/success")
public String orderSuccess(
    @RequestParam String paymentKey,
    @RequestParam String orderId,
    @RequestParam Integer amount,
    HttpSession session,
    Model model
) {
    try {
        // 1. 토스페이먼츠 결제 승인 API 호출
        PaymentApprovalResponse approval = tossPaymentsService.approvePayment(
            paymentKey, orderId, amount
        );
        
        // 2. 주문 정보 저장
        Integer userId = (Integer) session.getAttribute("userId");
        Map<String, Object> tempOrder = (Map) session.getAttribute("tempOrder");
        
        Order order = new Order();
        order.setUserId(userId);
        order.setOrderId(orderId);
        order.setTotalAmount(amount);
        order.setOrderStatus("PAID"); // 결제완료
        order.setPaymentMethod(approval.getMethod()); // 카드, 계좌이체 등
        order.setPaymentKey(paymentKey);
        
        orderService.createOrder(order, (List<OrderItemDTO>) tempOrder.get("orderItems"));
        
        // 3. 장바구니 비우기
        cartService.clearCart(userId);
        
        // 4. 세션에서 임시 주문 정보 제거
        session.removeAttribute("tempOrder");
        
        // 5. 성공 페이지에 정보 전달
        model.addAttribute("orderId", orderId);
        model.addAttribute("amount", amount);
        model.addAttribute("paymentMethod", getPaymentMethodName(approval.getMethod()));
        model.addAttribute("orderDate", new Date());
        
        return "order/orderSuccess";
        
    } catch (Exception e) {
        log.error("결제 승인 실패", e);
        return "redirect:/order/fail?message=" + e.getMessage();
    }
}
```

### 3. 결제 실패 처리

```java
@GetMapping("/order/fail")
public String orderFail(
    @RequestParam(required = false) String code,
    @RequestParam(required = false) String message,
    Model model
) {
    model.addAttribute("errorMessage", "결제 처리 중 오류가 발생했습니다.");
    model.addAttribute("failureCode", code);
    model.addAttribute("failureMessage", message);
    
    return "order/orderFail";
}
```

## 💳 토스페이먼츠 결제 승인 API

### TossPaymentsService.java

```java
@Service
public class TossPaymentsService {
    
    @Value("${toss.payments.secret-key}")
    private String secretKey;
    
    @Value("${toss.payments.api.url}")
    private String apiUrl;
    
    private final RestTemplate restTemplate;
    
    public PaymentApprovalResponse approvePayment(
        String paymentKey, 
        String orderId, 
        Integer amount
    ) {
        String url = apiUrl + "/v1/payments/confirm";
        
        // Basic Auth 헤더
        String auth = secretKey + ":";
        String encodedAuth = Base64.getEncoder().encodeToString(auth.getBytes());
        
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Basic " + encodedAuth);
        headers.setContentType(MediaType.APPLICATION_JSON);
        
        // 요청 바디
        Map<String, Object> body = new HashMap<>();
        body.put("paymentKey", paymentKey);
        body.put("orderId", orderId);
        body.put("amount", amount);
        
        HttpEntity<Map<String, Object>> request = new HttpEntity<>(body, headers);
        
        try {
            ResponseEntity<PaymentApprovalResponse> response = restTemplate.postForEntity(
                url, 
                request, 
                PaymentApprovalResponse.class
            );
            
            return response.getBody();
            
        } catch (HttpClientErrorException e) {
            throw new PaymentException("결제 승인 실패: " + e.getResponseBodyAsString());
        }
    }
}
```

### PaymentApprovalResponse.java

```java
@Data
public class PaymentApprovalResponse {
    private String paymentKey;
    private String orderId;
    private String orderName;
    private String method; // 카드, 가상계좌, 계좌이체 등
    private Integer totalAmount;
    private String status;
    private String requestedAt;
    private String approvedAt;
    
    // 카드 결제인 경우
    private CardInfo card;
    
    @Data
    public static class CardInfo {
        private String company;
        private String number;
        private String installmentPlanMonths;
        private String approveNo;
        private String cardType;
        private String ownerType;
    }
}
```

## ⚙️ application.properties 설정

```properties
# 토스페이먼츠 설정
toss.payments.client-key=test_ck_Z1aOwX7K8mxOBNWQxYQRgLzN97Eo  # 클라이언트 키
toss.payments.secret-key=test_sk_zXLkKEypNArWmo50nX3lmeaxYG5R  # 시크릿 키 (서버용)
toss.payments.api.url=https://api.tosspayments.com

# 배송비 설정
order.shipping.free-threshold=50000
order.shipping.default-fee=3000
order.shipping.remote-area-fee=3000
```

## 🗄️ DB 테이블 구조

### orders 테이블

```sql
CREATE TABLE orders (
    order_id VARCHAR(50) PRIMARY KEY,
    user_id INT NOT NULL,
    total_amount INT NOT NULL,
    order_status VARCHAR(20) NOT NULL, -- PENDING, PAID, PREPARING, SHIPPED, DELIVERED, CANCELLED
    payment_method VARCHAR(20), -- CARD, TRANSFER, VIRTUAL_ACCOUNT
    payment_key VARCHAR(200),
    
    -- 주문자 정보
    orderer_name VARCHAR(50) NOT NULL,
    orderer_phone VARCHAR(20) NOT NULL,
    orderer_email VARCHAR(100) NOT NULL,
    
    -- 배송지 정보
    receiver_name VARCHAR(50) NOT NULL,
    receiver_phone VARCHAR(20) NOT NULL,
    zip_code VARCHAR(10) NOT NULL,
    address VARCHAR(255) NOT NULL,
    address_detail VARCHAR(255) NOT NULL,
    delivery_memo VARCHAR(200),
    
    -- 가격 정보
    product_price INT NOT NULL,
    shipping_fee INT NOT NULL,
    discount_amount INT DEFAULT 0,
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    INDEX idx_user_id (user_id),
    INDEX idx_order_status (order_status),
    INDEX idx_created_at (created_at)
);
```

### order_items 테이블

```sql
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id VARCHAR(50) NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price INT NOT NULL, -- 구매 당시 가격
    
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    INDEX idx_order_id (order_id)
);
```

### payments 테이블 (선택사항)

```sql
CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id VARCHAR(50) NOT NULL UNIQUE,
    payment_key VARCHAR(200) NOT NULL UNIQUE,
    payment_method VARCHAR(20) NOT NULL,
    amount INT NOT NULL,
    status VARCHAR(20) NOT NULL, -- READY, IN_PROGRESS, DONE, CANCELED, FAILED
    requested_at TIMESTAMP NOT NULL,
    approved_at TIMESTAMP,
    
    -- 카드 결제 정보
    card_company VARCHAR(50),
    card_number VARCHAR(20),
    installment_months INT,
    
    -- 환불 정보
    cancel_amount INT DEFAULT 0,
    cancel_reason VARCHAR(200),
    canceled_at TIMESTAMP,
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    INDEX idx_payment_key (payment_key)
);
```

## 🔧 MyBatis Mapper

### OrderMapper.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" 
    "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.onetouch.mapper.OrderMapper">

    <!-- 주문 생성 -->
    <insert id="insertOrder" parameterType="Order">
        INSERT INTO orders (
            order_id, user_id, total_amount, order_status, payment_method, payment_key,
            orderer_name, orderer_phone, orderer_email,
            receiver_name, receiver_phone, zip_code, address, address_detail, delivery_memo,
            product_price, shipping_fee, discount_amount
        ) VALUES (
            #{orderId}, #{userId}, #{totalAmount}, #{orderStatus}, #{paymentMethod}, #{paymentKey},
            #{ordererName}, #{ordererPhone}, #{ordererEmail},
            #{receiverName}, #{receiverPhone}, #{zipCode}, #{address}, #{addressDetail}, #{deliveryMemo},
            #{productPrice}, #{shippingFee}, #{discountAmount}
        )
    </insert>

    <!-- 주문 아이템 생성 -->
    <insert id="insertOrderItem" parameterType="OrderItem">
        INSERT INTO order_items (order_id, product_id, quantity, price)
        VALUES (#{orderId}, #{productId}, #{quantity}, #{price})
    </insert>

    <!-- 주문 상태 업데이트 -->
    <update id="updateOrderStatus">
        UPDATE orders
        SET order_status = #{orderStatus},
            updated_at = CURRENT_TIMESTAMP
        WHERE order_id = #{orderId}
    </update>

    <!-- 주문 조회 -->
    <select id="selectOrderById" resultType="Order">
        SELECT * FROM orders WHERE order_id = #{orderId}
    </select>

    <!-- 사용자별 주문 목록 -->
    <select id="selectOrdersByUserId" resultType="Order">
        SELECT * FROM orders
        WHERE user_id = #{userId}
        ORDER BY created_at DESC
        LIMIT #{offset}, #{pageSize}
    </select>

</mapper>
```

## 🧪 테스트 체크리스트

### 결제 페이지 (checkout.jsp)
- [ ] 주문자 정보 자동 입력 (로그인 사용자)
- [ ] "주문자 정보와 동일" 체크박스 동작
- [ ] Daum 주소 검색 동작
- [ ] 각 단계별 유효성 검사
- [ ] 주문 상품 목록 및 금액 표시
- [ ] 50,000원 이상 무료배송 적용
- [ ] 토스페이먼츠 위젯 렌더링
- [ ] 결제 버튼 클릭 시 결제 진행

### 결제 성공 (orderSuccess.jsp)
- [ ] 주문번호 표시
- [ ] 결제금액 표시
- [ ] 결제수단 표시
- [ ] 주문 내역 페이지 이동
- [ ] DB에 주문 정보 저장 확인

### 결제 실패 (orderFail.jsp)
- [ ] 에러 메시지 표시
- [ ] 실패 코드/메시지 표시
- [ ] 다시 결제하기 동작
- [ ] 장바구니 유지 확인

## 🔐 보안 고려사항

### 1. 결제 금액 검증
```java
// 서버에서 주문 금액 재계산하여 검증
int calculatedAmount = calculateOrderAmount(orderItems);
if (calculatedAmount != amount) {
    throw new PaymentException("결제 금액이 일치하지 않습니다");
}
```

### 2. 중복 결제 방지
```java
// orderId로 중복 체크
if (orderMapper.existsOrderId(orderId)) {
    throw new DuplicateOrderException("이미 처리된 주문입니다");
}
```

### 3. 시크릿 키 보호
- `application.properties`가 아닌 환경 변수로 관리
- Git에 커밋하지 않도록 `.gitignore` 추가

### 4. HTTPS 필수
- 프로덕션 환경에서는 반드시 HTTPS 사용

## 📚 토스페이먼츠 개발 가이드

공식 문서: https://docs.tosspayments.com/

### 테스트 카드 정보
- **카드번호**: 4000-0000-0000-0001
- **유효기간**: 임의 (미래 날짜)
- **CVC**: 임의 (3자리)

### API 키 발급
1. https://www.tosspayments.com/ 가입
2. 개발자센터 > API 키 발급
3. 테스트/실제 환경 키 구분 사용

## 🚀 다음 단계

결제 페이지 완성 후:

1. **마이페이지 - 주문 내역** (`/user/mypage/orders`)
2. **주문 상세 페이지** (`/order/detail/{orderId}`)
3. **주문 취소/환불** 기능
4. **배송 추적** 기능

---

**OneTouch** - 해시태그 기반 2030 남성 맞춤 뷰티 추천 쇼핑몰
