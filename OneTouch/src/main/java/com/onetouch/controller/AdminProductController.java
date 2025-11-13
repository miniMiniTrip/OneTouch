package com.onetouch.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.onetouch.dao.CategoryDao;
import com.onetouch.dao.ProductDao;
import com.onetouch.service.ProductService;
import com.onetouch.vo.CategoryVo;
import com.onetouch.vo.ProductVo;

import jakarta.servlet.ServletContext;

@Controller
@RequestMapping("/admin")
public class AdminProductController {

	@Autowired
	ProductDao product_dao;

	@Autowired
	CategoryDao category_dao;

	@Autowired
	ServletContext application;
	@Autowired
	ProductService productService;

//	@RequestMapping("/products") // 상품목록 조회
//	public String list_admin( // 관리자가 보는 리스트
//			@RequestParam(name = "category_idx", defaultValue = "0") int category_idx,
//			// 상품명 검색어를 받기 위해 추가
//			@RequestParam(name = "search_keyword", defaultValue = "") String keyword, Model model) {
//
//		// 상품 목록 조회 (category_idx와 keyword를 모두 전달)
//		// 기존 코드: List<ProductVo> product_list = product_dao.selectList(category_idx);
//		List<ProductVo> product_list = product_dao.selectList(category_idx, keyword);
//
//		// 검색 조건 유지: JSP의 검색 폼에 현재 필터 값을 유지하기 위해 모델에 추가
//		model.addAttribute("category_list", category_dao.selectList()); // 카테고리 목록
//		model.addAttribute("productList", product_list); // 상품 목록
//
//		// JSP의 검색 폼에 현재 검색 조건을 그대로 유지하기 위해 추가
//		model.addAttribute("current_category", category_idx);
//		model.addAttribute("current_keyword", keyword);
//		// -> 얘 카테고리 값 0 으로 넘어오는데 이거 맞나? yes 확인
//		System.out.println("[ProductController] product/product_list_admin.jsp - Category: " + category_idx
//				+ ", Keyword: " + keyword);
//
//		return "admin/product/product_list_admin";
//	}

	//  관리자 상품관리페이지(리스트 검색,등록,수정,삭제외)
		@RequestMapping("/products")
		public String list(@RequestParam(name = "search", defaultValue = "all") String category,
				@RequestParam(name = "keyword", required = false) String keyword,

				Model model) {

			// 검색조건 담을 Map
			Map<String, Object> map = new HashMap<>();

			// 카테고리 조건 분기
			if (!category.equals("all")) {
				map.put("category", category);

			}
			// 검색어가 있는경우 추가
			if (keyword != null && !keyword.trim().isEmpty()) {
				map.put("keyword", keyword);
			}

			// 호출해서 상품 목록 가져오기
			List<ProductVo> list = product_dao.selectList(map);
			List<CategoryVo> category_list = category_dao.selectList();
			System.out.println(list);
			model.addAttribute("list", list);
			model.addAttribute("category", category);
			model.addAttribute("keyword", keyword);
			model.addAttribute("category_list", category_list);

			return "admin/product/product_insert_form";

		}// end:list
	
	
	// 상품보기
	@RequestMapping("/product/view")
	public String view(int product_idx, Model model) {

		List<CategoryVo> category_list = category_dao.selectList();

		ProductVo vo = product_dao.selectOne(product_idx);

		// request binding
		model.addAttribute("vo", vo);
		model.addAttribute("category_list", category_list);
		System.out.println("	[ProductController] product/product_content.jsp ");

		return "admin/product/product_content";
	}


	//상품등록 기능
	@RequestMapping("/product/insert.do")
	public String insert(ProductVo productVo,@RequestParam(name = "photo") MultipartFile photo, RedirectAttributes ra)
			throws Exception, IOException {
		// 화일저장위치 구한다
		String saveDir = application.getRealPath("/images/");

		String product_image_url = "no_file";

		// 업로드화일이 있으면
		if (photo != null && !photo.isEmpty()) {
			String filename = photo.getOriginalFilename();
			File f = new File(saveDir, filename);
			// 동일파일명이 존재하는지?
			if (f.exists()) {
				long tm = System.currentTimeMillis();
				filename = String.format("%d_%s", tm, filename);
				f = new File(saveDir, filename);

				System.out.println("파일이름" + filename);
			}
			// 임시파일 f 경로로 복사해온다
			photo.transferTo(f);

			product_image_url = filename;
		}

		// 처리결과를 vo에 담는다
		productVo.setProduct_image_url(product_image_url);

		// product_comment : \n -> <br>
		String product_comment = productVo.getProduct_comment().replaceAll("\n", "<br>");
		productVo.setProduct_comment(product_comment);

		System.out.printf("		productVo::%s\n",productVo);
		// DB insert
		int res = productService.insert(productVo);

		ra.addAttribute("category_idx", productVo.getCategory_idx());
		return "redirect:../products"; // list.do 메서드가 없어서 갈곳이 없어 만들어야함

	}// end: insert

	

}// end:Productcontroller
