package com.onetouch.controller;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.onetouch.common.MyConstant;
import com.onetouch.dao.CategoryDao;
import com.onetouch.dao.PostDao;
import com.onetouch.dao.ProductDao;
import com.onetouch.dao.QnaDao;
import com.onetouch.service.ProductService;
import com.onetouch.vo.MemVo;
import com.onetouch.vo.OrderReviewPostVo;
import com.onetouch.vo.ProductVo;
import com.onetouch.vo.QnaVo;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;

@Controller
public class ProductController {

    @Autowired
    ProductDao product_dao;

    @Autowired
    CategoryDao category_dao;

    @Autowired
    ServletContext application;
    
    @Autowired
    ProductService productService;
    
    @Autowired
    PostDao postDao;
    @Autowired
    HttpSession session;
    @Autowired
    QnaDao qnaDao;
    

    // 상품 리스트 페이지
    @RequestMapping("/product/list")
    public String productList(
            @RequestParam(name = "keyword", required = false) String keyword,
            @RequestParam(name = "category", required = false) String category,
            @RequestParam(name = "sort", required = false, defaultValue = "popular") String sort,
            @RequestParam(name = "page", defaultValue = "1") int currentPage,
            @RequestParam(name = "view", required=false, defaultValue="grid") String view,
            Model model) {
        
        System.out.println("=== [ProductController] productList() 시작 ===");
        System.out.printf("keyword: %s, category: %s, sort: %s, page: %d\n", 
                         keyword, category, sort, currentPage);
        
        Map<String, Object> map = new HashMap<>();
        
        int pageSize = MyConstant.Product.BLOCK_LIST;
        int startRow = (currentPage - 1) * pageSize;
        map.put("startRow", startRow);
        map.put("pageSize", pageSize);
        
        // 검색 조건 추가
        if (keyword != null && !keyword.trim().isEmpty()) {
            map.put("keyword", keyword.trim());
        }
        
        // 카테고리 필터 추가
        if (category != null && !category.trim().isEmpty()) {
            map.put("category_idx", category.trim());
        }
        
        // 정렬 조건 추가
        switch (sort) {
            case "newest":
                map.put("orderBy", "product_time DESC");
                break;
            case "price-low":
                map.put("orderBy", "product_price ASC");
                break;
            case "price-high":
                map.put("orderBy", "product_price DESC");
                break;
            case "rating":
                map.put("orderBy", "product_idx DESC");
                break;
            default: // popular
                map.put("orderBy", "product_cnt DESC, product_idx DESC");
                break;
        }
        
        // 데이터 조회
        int totalCount = product_dao.selectCount(map);
        List<ProductVo> list = product_dao.selectList(map);
        
        // 페이징 정보 계산
        int totalPage = (int) Math.ceil((double) totalCount / MyConstant.Product.BLOCK_LIST);
        int pageBlock = MyConstant.Product.BLOCK_PAGE;
        int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
        int endPage = Math.min(startPage + pageBlock - 1, totalPage);
        
        System.out.printf("조회된 상품 수: %d, 총 페이지: %d\n", list.size(), totalPage);
        
        // 모델에 데이터 추가
        model.addAttribute("list", list);
        model.addAttribute("keyword", keyword);
        model.addAttribute("category", category);
        model.addAttribute("sort", sort);
        model.addAttribute("view", view);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);

        System.out.println("=== [ProductController] return product/product_list ===");
        return "product/product_list";  
    }
    
    // 상품 상세 페이지
    @GetMapping("/product/detail")
    public String productDetail(@RequestParam("id") int product_idx, Model model) {
    	System.out.printf("\n");
        System.out.printf("=== [ProductController] productDetail() 상품 상세 조회: %d ===\n", product_idx);

        ProductVo product = product_dao.selectOne(product_idx);
        //이미지 강제로 조회
        System.out.printf("	상품 1개 조회 한 결과 => %s\n",product);
        
        String imageUrl = product_dao.selectMainImage(product_idx);
        product.setProduct_image_url(imageUrl);
        
        System.out.println("강제 설정한 이미지: " + imageUrl);
        System.out.println("조회된 상품명: " + product.getProduct_name());
        System.out.println("이미지 URL: " + product.getProduct_image_url());
        
        List<String> lowerdetailImages = product_dao.selectLowerDetailImages(product_idx);
        List<String> subImages = product_dao.selectUpperDetailImages(product_idx);
        System.out.println("디테일 이미지 개수: " + lowerdetailImages.size());
	
        for(String detail : lowerdetailImages) {
        	System.out.println("[" + detail +"]");
        }
        
        //상품 리뷰 가져오기
        List<OrderReviewPostVo> orderReviewPostVo=postDao.selectReviewPostList(product_idx);
        System.out.printf("		상품리뷰]orderReviewPostVo => %s\n",orderReviewPostVo);
        model.addAttribute("orderReviewPostVo",orderReviewPostVo);
        
        System.out.printf("내용 이미지 => %s\n",lowerdetailImages);
        System.out.printf("서브 이미지 => %s\n",subImages);
        System.out.printf("상세페이지 product => %s\n",product);
        model.addAttribute("product", product);
        model.addAttribute("subImages", subImages); 
        model.addAttribute("lowerdetailImages", lowerdetailImages); 
       
        
        
        
		/* 상품별 qna리스트 */
        // 세션에서 로그인 정보 가져오기
        Map<String, Object> map = new HashMap<String, Object>();
        MemVo user = (MemVo) session.getAttribute("user");
        
        // ✅ 로그인하지 않은 경우 - 로그인 안내만 표시
        if (user == null) {
            //model.addAttribute("needLogin", true);
            //return "redirect:/user/login";
        }else {
        	// 로그인한 사용자의 글만 조회
        	int mem_idx = user.getMem_idx();
        	String mem_roll = user.getMem_roll();
        	map.put("mem_idx", mem_idx);
        	map.put("mem_roll", mem_roll);
        	
        	model.addAttribute("userO", 1);
        }
        
        map.put("userinformation", 1);
        List<QnaVo> qna_list = qnaDao.selectProductQnaList(product_idx);
        
        System.out.println("QnA 목록 개수: " + qna_list.size());
        model.addAttribute("qna_list", qna_list);
        model.addAttribute("needLogin", false);
        model.addAttribute("product_idx", product_idx);
        
        
        
        System.out.printf("=== [ProductController] return : product/product_detail.jsp  ===\n");
        System.out.printf("\n");
        return "product/product_detail";
   }
    
    // 상품 상세페이지에서 메인 이미지랑 서브 이미지 수정 기능
    @ResponseBody
    @RequestMapping("/product/updateDetailImage")
    public Map<String, Object> updateDetailImage(
            @RequestParam("product_idx") int productIdx,
            @RequestParam("old_image_filename") String oldImageFilename,
            @RequestParam(value = "newMainImage", required = false) MultipartFile newMainImage,
            @RequestParam(value = "newSubImages", required = false) List<MultipartFile> newSubImages
    ) {
        Map<String, Object> result = new HashMap<>();
        try {
            // =========================
            // 1️ 메인 이미지 처리
            // =========================
            if (newMainImage != null && !newMainImage.isEmpty()) {
                // 기존 메인 이미지 삭제
                if (oldImageFilename != null && !oldImageFilename.isEmpty()) {
                    String realPath = application.getRealPath("/images/products_list");
                    Path oldFilePath = Paths.get(realPath, oldImageFilename);
                    Files.deleteIfExists(oldFilePath);
                }

                // 새 메인 이미지 저장
                String originName = newMainImage.getOriginalFilename();
                String ext = originName.substring(originName.lastIndexOf("."));
                String savedName = UUID.randomUUID().toString() + ext;

                String realPath = application.getRealPath("/images/products_list");
                File dir = new File(realPath);
                if (!dir.exists()) dir.mkdirs();

                newMainImage.transferTo(new File(realPath, savedName));

                // DB 업데이트 (메인 이미지 컬럼)
                ProductVo vo = new ProductVo();
                vo.setProduct_idx(productIdx);
                vo.setProduct_image_url(savedName);

                product_dao.updateProductImage(vo);
                result.put("mainImageUpdated", true);
                result.put("newMainFilename", savedName);
            }

            // =========================
            // 2️ 서브 이미지 처리
            // =========================
            if (newSubImages != null && !newSubImages.isEmpty()) {
                String subImagePath = application.getRealPath("/images/products_detail");
                File subDir = new File(subImagePath);
                if (!subDir.exists()) subDir.mkdirs();
                
            	// 기존 서브 이미지 삭제전 업로드되어있는 서브 이미지 파일 삭제처리
            	List<String> before_sub_images_name=product_dao.selectDetailImages(productIdx);
            	for(String before_sub_image_name:before_sub_images_name) {
            		File f=new File(application.getRealPath("/images/products_detail"),before_sub_image_name);
            		f.delete();
            	}
            	// 기존 서브 이미지 삭제처리
            	int res=product_dao.deleteProductSubImages(productIdx);
            	int level=2;
                ProductVo savedSubFiles = new ProductVo();
                savedSubFiles.setProduct_idx(productIdx);
                for (MultipartFile subFile : newSubImages) {
                    if (!subFile.isEmpty()) {
                        String originName = subFile.getOriginalFilename();
                        String ext = originName.substring(originName.lastIndexOf("."));
                        String savedName = UUID.randomUUID().toString() + ext;

                        subFile.transferTo(new File(subDir, savedName));
                        savedSubFiles.setProduct_image_url(savedName);
                        savedSubFiles.setProduct_image_level(level); // 1은 메인 2 3 4 5 는 서브 
                		res=res*product_dao.insertProductImage(savedSubFiles);
                		
                		level=level+1;

                    }
                }
                result.put("subImagesUpdated", true);
                result.put("newSubFilenames", savedSubFiles);
            }

            result.put("success", true);
            result.put("message", "이미지가 성공적으로 교체되었습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("success", false);
            result.put("message", "이미지 교체 중 오류가 발생했습니다: " + e.getMessage());
        }

        return result;
    }
    
    
    // 상품 상세페이지에서 내용 이미지 삭제처리
    @ResponseBody
    @RequestMapping("/product/deleteDetailContentImage")
    public Map<String, Object> deleteDetailContentImage(
            @RequestParam("contentImagesName") List<String> images   // 삭제할 이미지 이름 리스트
    ) {
        Map<String, Object> result = new HashMap<>();

        try {
            String realPath = application.getRealPath("/images/products_detail"); // 상세 이미지 경로

            for (String imageName : images) {
                if (imageName != null && !imageName.isEmpty()) {
                    Path filePath = Paths.get(realPath, imageName);
                    Files.deleteIfExists(filePath); // 실제 파일 삭제
                    // DB에서도 삭제
                    product_dao.deleteContentImage(imageName);
                }
            }

            result.put("success", true);
            result.put("message", "내용 이미지가 성공적으로 삭제되었습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("success", false);
            result.put("message", "내용 이미지 삭제 중 오류가 발생했습니다: " + e.getMessage());
        }

        return result; // JSON 반환
    }
    
}//end
