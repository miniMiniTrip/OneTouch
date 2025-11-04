<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.json.simple.JSONObject" %>
<%
/*
 * 회원 정보 조회 (JSON 반환)
 * 실제 환경에서는 DAO 패턴 사용 권장
 */

response.setContentType("application/json");
response.setCharacterEncoding("UTF-8");

String memberId = request.getParameter("id");

JSONObject json = new JSONObject();

try {
    // DB 조회 (샘플 데이터)
    if ("user01".equals(memberId)) {
        json.put("id", "user01");
        json.put("name", "김철수");
        json.put("email", "user01@email.com");
        json.put("phone", "010-1234-5678");
        json.put("status", "active");
    } else if ("user02".equals(memberId)) {
        json.put("id", "user02");
        json.put("name", "이영희");
        json.put("email", "user02@email.com");
        json.put("phone", "010-2345-6789");
        json.put("status", "active");
    } else {
        json.put("error", "Member not found");
    }
    
} catch (Exception e) {
    json.put("error", e.getMessage());
}

out.print(json.toJSONString());
%>

<%--
============================================
상품 정보 조회 JSP (getProduct.jsp)
============================================
--%>
<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.json.simple.JSONObject" %>
<%
response.setContentType("application/json");
response.setCharacterEncoding("UTF-8");

String productCode = request.getParameter("code");

JSONObject json = new JSONObject();

try {
    // DB 조회 (샘플 데이터)
    if ("P001".equals(productCode)) {
        json.put("code", "P001");
        json.put("name", "히아루론산 수분 보습 세럼");
        json.put("category", "skincare");
        json.put("price", 31500);
        json.put("stock", 150);
        json.put("description", "순수 히아루론산을 고농축으로 담아 피부 깊숙이 수분을 공급합니다.");
    } else if ("P002".equals(productCode)) {
        json.put("code", "P002");
        json.put("name", "비타민C 브라이트닝 세럼");
        json.put("category", "skincare");
        json.put("price", 28000);
        json.put("stock", 80);
        json.put("description", "순수 비타민C로 맑고 투명한 피부톤을 만들어줍니다.");
    } else {
        json.put("error", "Product not found");
    }
    
} catch (Exception e) {
    json.put("error", e.getMessage());
}

out.print(json.toJSONString());
%>

<%--
============================================
상품 저장 처리 JSP (saveProduct.jsp)
============================================
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.io.*" %>
<%
String uploadPath = application.getRealPath("/uploads");
int maxSize = 10 * 1024 * 1024; // 10MB

try {
    MultipartRequest multi = new MultipartRequest(
        request,
        uploadPath,
        maxSize,
        "UTF-8",
        new DefaultFileRenamePolicy()
    );
    
    String productCode = multi.getParameter("productCode");
    String name = multi.getParameter("name");
    String category = multi.getParameter("category");
    int price = Integer.parseInt(multi.getParameter("price"));
    int stock = Integer.parseInt(multi.getParameter("stock"));
    String description = multi.getParameter("description");
    String image = multi.getFilesystemName("image");
    
    // DB 저장 로직
    // productDAO.save(product);
    
    response.sendRedirect("admin.jsp?section=products&message=saved");
    
} catch (Exception e) {
    e.printStackTrace();
    response.sendRedirect("admin.jsp?section=products&error=save_failed");
}
%>

<%--
============================================
주문 상태 업데이트 JSP (updateOrderStatus.jsp)
============================================
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String orderId = request.getParameter("orderId");
String status = request.getParameter("status");

try {
    // DB 업데이트
    // orderDAO.updateStatus(orderId, status);
    
    response.sendRedirect("admin.jsp?section=orders&message=status_updated");
    
} catch (Exception e) {
    e.printStackTrace();
    response.sendRedirect("admin.jsp?section=orders&error=update_failed");
}
%>