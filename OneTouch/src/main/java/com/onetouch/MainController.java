package com.onetouch;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.onetouch.common.MyConstant;
import com.onetouch.dao.PostDao;
import com.onetouch.dao.ProductDao;
import com.onetouch.service.HashtagService;
import com.onetouch.vo.HashtagVo;
import com.onetouch.vo.PostVo;
import com.onetouch.vo.ProductVo;

@Controller
public class MainController {
	
	@Autowired
	HashtagService hashtagService;
	
	@Autowired
	ProductDao product_dao;
	
	@Autowired
	PostDao post_dao;
	
	
	@RequestMapping("/")
	public String oneTouchIndex() {
		System.out.println("	[oneTouchMain] oneTouchIndex()");
		
		System.out.println("	[oneTouchMain] return : index.html ");
		return "index";
	}
	
	@RequestMapping("main")
	public String oneTouchMain(Model model) {
		System.out.println("	[oneTouchMain] oneTouchMain()");
		
		List<HashtagVo> hashtagRank=hashtagService.updatePostProductHashtagTotalConut();
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("orderBy","product_cnt DESC, product_idx DESC");
		map.put("startRow", 0);
		map.put("pageSize", 3);
		List<ProductVo> ProductVoList = product_dao.selectList(map);
		System.out.printf("		뉴상품 3개 => %s\n",ProductVoList);
		model.addAttribute("hashtagRank", hashtagRank);
		model.addAttribute("ProductVoList", ProductVoList);
		System.out.println("	[oneTouchMain] return : main.jsp ");
		return "main";
	}
	
	@RequestMapping("/cart/cart")
	public String cart() {
		System.out.println("	[oneTouchMain] cart() ");
		
		System.out.println("	[oneTouchMain] return : cart.jsp ");
		return "cart/cart";
	}
	
	//search
	
    @RequestMapping("/search")
    public String search(
            @RequestParam(name = "keyword", required = false) String keyword,
            @RequestParam(name = "productPage", defaultValue = "1") int productPage,
            @RequestParam(name = "postPage", defaultValue = "1") int postPage,
            @RequestParam(name = "productPageSize", defaultValue = "9") int productPageSize, // MyConstant.Product.BLOCK_LIST = 9
            @RequestParam(name = "postPageSize", defaultValue = "5") int postPageSize,      // MyConstant.Post.BLOCK_LIST = 5
            Model model) {
		
        System.out.println("============= [MainController] 통합 검색 =============");
        System.out.println("입력된 keyword: [" + keyword + "]");
        System.out.printf("productPage: %d, postPage: %d, productPageSize: %d, postPageSize: %d\n", 
                         productPage, postPage, productPageSize, postPageSize);
		
		if(keyword == null || keyword.trim().isEmpty()) {
			return "redirect:/";
		}
		
		//======상품 페이징======
		Map<String, Object> productMap = new HashMap<>();
		productMap.put("keyword", keyword.trim());
		
		int productStartRow = (productPage - 1) * productPageSize;
		productMap.put("startRow", productStartRow);
		productMap.put("pageSize", productPageSize);
		productMap.put("orderBy", "product_cnt DESC"); //인기순
		
		int productTotalCount = product_dao.selectCount(productMap);
		List<ProductVo> productList = product_dao.selectList(productMap);
		
		//페이징 정보 계산
		int productTotalPage = (int)Math.ceil((double) productTotalCount / productPageSize);
		int productPageBlock = MyConstant.Product.BLOCK_PAGE;
		int productStartPage = ((productPage - 1)/ productPageBlock) * productPageBlock * 1;
		int productEndPage	 = Math.min(productStartPage + productPageBlock -1, productTotalPage); 
		
        System.out.printf("[상품] 검색 결과: %d개 (전체: %d개), 총 페이지: %d\n", 
                productList.size(), productTotalCount, productTotalPage);
		
        //======포스트 페이징======
        Map<String, Object> postMap = new HashMap<>();
		postMap.put("keyword", keyword.trim());
        
		int postStartRow = (postPage - 1) * postPageSize;
		postMap.put("startRow", postStartRow);
		postMap.put("pageSize", postPageSize);
		
		int postTotalCount = post_dao.searchCount(postMap);
		List<PostVo> postList = post_dao.searchByKeyword(postMap);
		
		 // 페이징 정보 계산
        int postTotalPage = (int) Math.ceil((double) postTotalCount / postPageSize);
        int postPageBlock = MyConstant.Post.BLOCK_PAGE; // 10
        int postStartPage = ((postPage - 1) / postPageBlock) * postPageBlock + 1;
        int postEndPage = Math.min(postStartPage + postPageBlock - 1, postTotalPage);
        
        System.out.printf("[포스트] 검색 결과: %d개 (전체: %d개), 총 페이지: %d\n", 
                         postList.size(), postTotalCount, postTotalPage);
        
        // ==================== 모델에 데이터 추가 ====================
        model.addAttribute("keyword", keyword);
        
        // 상품 관련
        model.addAttribute("product_list", productList);
        model.addAttribute("productTotalCount", productTotalCount);
        model.addAttribute("productPage", productPage);
        model.addAttribute("productPageSize", productPageSize);
        model.addAttribute("productTotalPage", productTotalPage);
        model.addAttribute("productStartPage", productStartPage);
        model.addAttribute("productEndPage", productEndPage);
        
        // 포스트 관련
        model.addAttribute("post_list", postList);
        model.addAttribute("postTotalCount", postTotalCount);
        model.addAttribute("postPage", postPage);
        model.addAttribute("postPageSize", postPageSize);
        model.addAttribute("postTotalPage", postTotalPage);
        model.addAttribute("postStartPage", postStartPage);
        model.addAttribute("postEndPage", postEndPage);
        
        System.out.println("============= [MainController] return: search_result =============");
        return "search_result";
    }// end search
}
	
	/*
	 * //==========결제
	 * 
	 * @RequestMapping("/order/checkout") public String checkout() {
	 * System.out.println("	[oneTouchMain] order() ");
	 * 
	 * System.out.println("	[oneTouchMain] return : checkout.jsp "); return
	 * "order/checkout"; }
	 * 
	 * @RequestMapping("/order/order_fail") public String orderFail() {
	 * System.out.println("	[oneTouchMain] order() ");
	 * 
	 * System.out.println("	[oneTouchMain] return : orderFail.jsp "); return
	 * "order/order_fail"; }
	 * 
	 * @RequestMapping("/order/order_success") public String orderSuccess() {
	 * System.out.println("	[oneTouchMain] order() ");
	 * 
	 * System.out.println("	[oneTouchMain] return : orderSuccess.jsp "); return
	 * "order/order_success"; }
	 * 
	 * //==========상품
	 * 
	 * @RequestMapping("/product/product_list") public String productList() {
	 * System.out.println("	[oneTouchMain] product() ");
	 * 
	 * System.out.println("	[oneTouchMain] return : product_list.jsp "); return
	 * "product/product_list"; }
	 * 
	 * @RequestMapping("/test/mypage") public String myPage() { return
	 * "test/mypage_template"; }
	 * 
	 * @RequestMapping("/test/order_list") public String orderList() { return
	 * "test/order_list_example"; }
	 */

