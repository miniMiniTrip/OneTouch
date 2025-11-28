package com.onetouch.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.onetouch.dao.CategoryDao;
import com.onetouch.dao.HashtagDao;
import com.onetouch.dao.ProductDao;
import com.onetouch.service.ProductImageService;
import com.onetouch.service.ProductService;
import com.onetouch.vo.CategoryVo;
import com.onetouch.vo.HashtagVo;
import com.onetouch.vo.ProductVo;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/adminpage")
public class AdminProductController {

    @Autowired
    ProductDao product_dao;

    @Autowired
    CategoryDao category_dao;
    
    @Autowired
    HashtagDao hashtag_dao;

    @Autowired
    ServletContext application;
    
    @Autowired
    ProductService productService;
    
    @Autowired
    ProductImageService productImageService;
    

    // 통계 대시보드 페이지 추가
    @RequestMapping("/dashboard")
    public String adminDashboard() {
    	System.out.println("[AdminController] adminDashboard()");
    	return "/admin/dashboard";  
    }


 // 상품-> 관리자페이지로  url 변경 products->adminpage
 // 관리자 
    @RequestMapping("/product")
    public String adminProductList(
            @RequestParam(name = "keyword", required = false) String keyword,
            @RequestParam(name = "page", defaultValue = "1") int currentPage,
            @RequestParam(name = "pageSize", defaultValue = "10") int pageSize,
            Model model) {

    	 System.out.println("============= 디버깅 =============");
    	 System.out.println("입력된 keyword: [" + keyword + "]");
       
        Map<String, Object> map = new HashMap<>();
        
        // 페이징 계산
        int startRow = (currentPage - 1) * pageSize;
        map.put("startRow", startRow);
        map.put("pageSize", pageSize);

        if (keyword != null && !keyword.trim().isEmpty()) {
            map.put("keyword", keyword.trim());
            System.out.println("맵에 저장된 keyword: [" + map.get("keyword") + "]");
        }
        
        System.out.println("Map 내용: " + map);

        // 전체 상품 수 조회
        int totalCount = product_dao.selectCountAdmin(map);
        
        // 상품 목록 조회
        List<ProductVo> list = product_dao.selectListAdmin(map);
        
        List<CategoryVo> category_list = category_dao.selectList();
        
        // 해시태그 목록 조회 추가
        List<HashtagVo> hashtag_list = hashtag_dao.selectList();

        // 페이징 정보 계산
        int totalPage = (int) Math.ceil((double) totalCount / pageSize);
        
        // 페이지 블록 계산 (한 번에 표시할 페이지 번호 개수)
        int pageBlock = 5;
        int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
        int endPage = Math.min(startPage + pageBlock - 1, totalPage);

        System.out.printf("[AdminProductController-adminProductList()] 조회된 상품 수: %d, 총 페이지: %d\n", list.size(), totalPage);

        model.addAttribute("list", list);
        model.addAttribute("keyword", keyword);
        model.addAttribute("category_list", category_list);
        model.addAttribute("hashtag_list", hashtag_list); 
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);

        return "admin/product/product_list_form";
    }
    
    // Ajax - 단일 상품 정보 조회
    @GetMapping("/product/get")
    @ResponseBody
    public ProductVo getProduct(@RequestParam int product_idx) {
        System.out.printf("[AdminProductController-getProduct()] product_idx: %d\n", product_idx);
        
        ProductVo vo = product_dao.selectOne(product_idx);
        System.out.printf("[AdminProductController-getProduct()] 조회된 상품: %s\n", vo);
        
        return vo;
    }

    // 상품등록
    @PostMapping("/product/insert")
    public String insert(ProductVo productVo, 
                        @RequestParam(name = "photo") MultipartFile photo,
//                        @RequestParam(name = "photo_sub") MultipartFile[] photo_sub,
//                        @RequestParam(name = "photo_content") MultipartFile[] photo_content,
                        @RequestParam(name = "hashtag_idx_list", required = false) List<Integer> hashtag_idx_list,
                        @RequestParam(name = "hashtag_names", required = false) List<String> hashtag_names,
                        RedirectAttributes ra) throws Exception {
        
    	System.out.printf("	[AdminProductController] insert()\n");
//    	System.out.printf("		photo_sub => %s\n",photo_sub);
//    	System.out.printf("		photo_content => %s\n",photo_content);
        System.out.printf("insert] 받은 productVo: %s\n", productVo);
        System.out.printf("insert] 받은 해시태그 idx 목록: %s\n", hashtag_idx_list);
        
        String saveDirMain = application.getRealPath("/images/products_list");
        String product_image_url = "no_file";
        
        //메인 이미지 파일 저장
        if (photo != null && !photo.isEmpty()) {
            String filename = photo.getOriginalFilename();
            System.out.printf("insert] 원본 파일명: %s\n", filename);
            
            File f = new File(saveDirMain, filename);
            
            if (f.exists()) {
                long tm = System.currentTimeMillis();
                filename = String.format("%d_%s", tm, filename);
                f = new File(saveDirMain, filename);
            }
            
            photo.transferTo(f);
            product_image_url = filename;
        }
        productVo.setProduct_image_level(1);
        productVo.setProduct_image_url(product_image_url);
        
        //상품 내용 \n <=> <br> 
        if (productVo.getProduct_comment() != null) {
            String product_comment = productVo.getProduct_comment().replaceAll("\n", "<br>");
            productVo.setProduct_comment(product_comment);
        }
        
        List<Integer> finalHashtagIdxList = new ArrayList<>();
        
        // 직접 입력한 해시태그 처리
        if(hashtag_names != null && !hashtag_names.isEmpty()) {
        	System.out.printf("insert]직접 입력 해시태그 처리 시작 : %d개 \n", hashtag_names.size());
        	
        	List<HashtagVo> existingHashtags = hashtag_dao.selectByNames(hashtag_names);
        	List<String> existingNames = new ArrayList<>();
        	for(HashtagVo hVo : existingHashtags) {
        		String name = hVo.getHashtag_name();
        		existingNames.add(name);
        	}
        	System.out.printf("insert]존재하는 해시태그: %s \n", existingNames);
        	
        	for (HashtagVo existing : existingHashtags) {
        		finalHashtagIdxList.add(existing.getHashtag_idx());
        	}
        	
        	
        	List<String> newHashtagNames = new ArrayList<>(); 
        	for(String name : hashtag_names) {
        		if(!existingNames.contains(name)) { //해시태그 네임이 존재하지 않는 경우
        			newHashtagNames.add(name); //newhashtagnames 리스트에 추가
        		}
        	}
        	
        	if (!newHashtagNames.isEmpty()) {
        		System.out.printf("insert]새로 생성할 해시태그 : %s \n", newHashtagNames);
        		hashtag_dao.insert(hashtag_names);
        		
        		List<HashtagVo> newCreate = hashtag_dao.selectByNames(newHashtagNames);
        		for(HashtagVo created : newCreate) {
        			finalHashtagIdxList.add(created.getHashtag_idx());
        		}
        	}
        }//if : hashtag_names != null
        
        // 체크박스 해시태그 처리
        if (hashtag_idx_list != null && !hashtag_idx_list.isEmpty()) {
           finalHashtagIdxList.addAll(hashtag_idx_list);
        }
        
        //최종 해시태그 처리
        if (!finalHashtagIdxList.isEmpty()) {
        	List<HashtagVo> hashtag_list = new ArrayList<>();
        	for(Integer hashtag_idx : finalHashtagIdxList) {
        		HashtagVo hashtagVo = new HashtagVo();
        		hashtagVo.setHashtag_idx(hashtag_idx);
        		hashtag_list.add(hashtagVo);
        	}
        	productVo.setHashtag_list(hashtag_list);
        	System.out.printf("insert]최종 해시태그 설정 수 : %d \n", hashtag_list.size());
        } else {
        	productVo.setHashtag_list(new ArrayList<>());
        	System.out.println("insert]해시태그 없음");
        }
        
        System.out.printf("insert] 최종 productVo: %s\n", productVo);
        
        //상품 insert
        int res = productService.insert(productVo);
        System.out.printf("insert] insert 결과: %d\n", res);
        
        ra.addFlashAttribute("msg", res == 1 ? "상품이 등록되었습니다." : "상품 등록에 실패했습니다.");
        
        return "redirect:/adminpage/product"; 
    }

    // 상품 수정
    @PostMapping("/product/update")
    public String update(ProductVo vo, 
                        @RequestParam("photo") MultipartFile photo,
                        @RequestParam(name = "hashtag_idx_list", required = false) List<Integer> hashtag_idx_list,
                        @RequestParam(name = "hashtag_names", required = false) List<String> hashtag_names,
                        HttpServletRequest request) throws Exception {
        
        System.out.printf("update] 받은 vo: %s\n", vo);
        System.out.printf("update] 받은 해시태그 idx 목록: %s\n", hashtag_idx_list);
        
        if (photo != null && !photo.isEmpty()) {
            String uploadPath = application.getRealPath("/images/");
            String fileName = System.currentTimeMillis() + "_" + photo.getOriginalFilename();
            
            System.out.printf("update] 새 파일명: %s\n", fileName);
            
            File file = new File(uploadPath, fileName);
            photo.transferTo(file);
            vo.setProduct_image_url(fileName);
        }
        
        if (vo.getProduct_comment() != null) {
            String product_comment = vo.getProduct_comment().replaceAll("\n", "<br>");
            vo.setProduct_comment(product_comment);
        }
        
        List<Integer> finalHashtagIdxList = new ArrayList<>();
        
        // 직접입력 해시태그 처리
        if (hashtag_names !=null && !hashtag_names.isEmpty()) {
        	System.out.printf("update]직접 입력 해시태그 처리 시작 : %d개 \n", hashtag_names.size());
        	
        	List<HashtagVo> existingHashtags = hashtag_dao.selectByNames(hashtag_names);
        	List<String> existingNames = new ArrayList<>();
        	for(HashtagVo hVo : existingHashtags) {
        		String name = hVo.getHashtag_name();
        		existingNames.add(name);
        	}
        	System.out.printf("update]존재하는 해시태그 : %s \n", existingNames);
        	
        	for(HashtagVo existing : existingHashtags) {
        		finalHashtagIdxList.add(existing.getHashtag_idx());
        	}
        	
        	List<String> newHashtagNames = new ArrayList<>();
        	for(String name : hashtag_names) {
        		if(!existingNames.contains(name)){
        			newHashtagNames.add(name);
        		}
        	}
        	
        	if(!newHashtagNames.isEmpty()) {
        		System.out.printf("update] 새로 생성할 해시태그 : %s \n", newHashtagNames);
        		hashtag_dao.insert(hashtag_names);
        		
        		List<HashtagVo> newCreate = hashtag_dao.selectByNames(newHashtagNames);
        		for(HashtagVo created : newCreate) {
        			finalHashtagIdxList.add(created.getHashtag_idx());
        		}
        	}
        	
        }
        
        // 체크박스 해시태그 처리
        if (hashtag_idx_list != null && !hashtag_idx_list.isEmpty()) {
        	finalHashtagIdxList.addAll(hashtag_idx_list);
        }
        	
        //최종처리
        if(!finalHashtagIdxList.isEmpty()) {
            List<HashtagVo> hashtag_list = new ArrayList<>();
            for (Integer hashtag_idx : finalHashtagIdxList) {
                HashtagVo hashtagVo = new HashtagVo();
                hashtagVo.setHashtag_idx(hashtag_idx);
                hashtag_list.add(hashtagVo);
            }
            vo.setHashtag_list(hashtag_list);
            System.out.printf("[AdminProductController-update()] 설정된 해시태그 개수: %d\n", hashtag_list.size());
        } else {
            // null이면 빈 리스트로 설정 (기존 해시태그 모두 삭제)
            vo.setHashtag_list(new ArrayList<>());
            System.out.println("[AdminProductController-update()] 해시태그 없음 - 기존 연결 모두 삭제 예정");
        }
        
        System.out.printf("[AdminProductController-update()] 최종 vo: %s\n", vo);
        
        int res = productService.update(vo);
        System.out.printf("[AdminProductController-update()] update 결과: %d\n", res);
       
        return "redirect:/adminpage/product";
    }

    // 단일 삭제
    @GetMapping("/product/delete")
    public String delete(@RequestParam int product_idx) {
        System.out.printf("[AdminProductController-delete()] 삭제할 product_idx: %d\n", product_idx);
        
        int res = productService.delete(product_idx);
        System.out.printf("[AdminProductController-delete()] 삭제 결과: %d\n", res);
        
        return "redirect:/adminpage/product";
    }

    // 다중 삭제
    @PostMapping("/product/delete_batch")
    public String deleteBatch(@RequestParam List<Integer> product_idx_list) {
        System.out.printf("[AdminProductController-deleteBatch()] 삭제할 목록: %s\n", product_idx_list);
        
        int res = productService.deleteBatch(product_idx_list);
        System.out.printf("[AdminProductController-deleteBatch()] 삭제 결과: %d\n", res);
        
        return "redirect:/adminpage/product";
    }
    
 // 재고용  vo별로도 만들지 않았으니 주의!! 헷갈리지마!!!!
 // 재고 등록 처리
    @PostMapping("/product/remain/insert") //(form 없음 ajax 목적지)
    @ResponseBody
    public Map<String, Object> insertRemain(@RequestParam int product_idx,
                                           @RequestParam String remain_name,
                                           @RequestParam int remain_cnt) {  // remain_regdate 제거

        System.out.printf("[AdminProductController-insertRemain()] product_idx: %d, remain_name: %s, remain_cnt: %d\n",
                         product_idx, remain_name, remain_cnt);

        Map<String, Object> result = new HashMap<>();

        try {
            // 1. 재고 이력 등록용 ProductVo 생성
            ProductVo remainVo = new ProductVo(); //재고용
            remainVo.setProduct_idx(product_idx);
            remainVo.setRemain_name(remain_name);
            remainVo.setRemain_cnt(remain_cnt);

            int insertResult = product_dao.insertRemain(remainVo);  // 재고 전용 메서드 사용

            if (insertResult > 0) {
                // 2. 기존 상품의 재고 수량 업데이트
                ProductVo productVo = product_dao.selectOne(product_idx);
                if (productVo != null) {
                    int newCnt = productVo.getProduct_cnt() + remain_cnt;
                    productVo.setProduct_cnt(newCnt);

                    int updateResult = productService.update(productVo);
                    System.out.printf("[AdminProductController-insertRemain()] 상품 재고 업데이트 결과: %d, 새로운 재고: %d\n",
                                     updateResult, newCnt);

                    result.put("success", true);
                    result.put("message", "재고가 성공적으로 등록되었습니다.");
                    result.put("newCnt", newCnt);
                } else {
                    result.put("success", false);
                    result.put("message", "상품 정보를 찾을 수 없습니다.");
                }
            } else {
                result.put("success", false);
                result.put("message", "재고 등록에 실패했습니다.");
            }

        } catch (Exception e) {
            System.out.printf("[AdminProductController-insertRemain()] 오류 발생: %s\n", e.getMessage());
            result.put("success", false);
            result.put("message", "재고 등록 중 오류가 발생했습니다: " + e.getMessage());
        }

        return result;
    }

    // 특정 상품의 재고 이력 조회
    @GetMapping("/product/remain/list")//(form 없음 ajax 목적지)
    @ResponseBody
    public List<ProductVo> getRemainList(@RequestParam int product_idx) {
        System.out.printf("[AdminProductController-getRemainList()] product_idx: %d\n", product_idx);

        List<ProductVo> list = product_dao.selectRemainListByProduct(product_idx);  
        System.out.printf("[AdminProductController-getRemainList()] 조회된 재고이력 수: %d\n", list.size());

        return list;
    }
    
    
    
    //*******************상품 상세*******************************
    
    // 상세 이미지 업로드
    @PostMapping("/uploadImages")
    @ResponseBody
    public Map<String, Object> insertProductImage(
            @RequestParam("product_idx") int product_idx,
            @RequestParam("productImages") MultipartFile[] files) {
    	System.out.println("	[AdminProductController-@ResponseBody] insertProductImage()");
    	System.out.printf("			product_idx => %d\n",product_idx);
        Map<String, Object> response = new HashMap<>();
        
        try {
            boolean result = productImageService.uploadImages(product_idx, files);
            System.out.println(result);
            response.put("success", result);
            response.put("message", result ? "업로드 성공" : "업로드 실패");
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "서버 오류: " + e.getMessage());
        }

        System.out.println("	[AdminProductController-@ResponseBody] return : response;");
        return response;
    }

    // 메인 이미지 수정
    @PostMapping("/updateMainImage")
    @ResponseBody
    public Map<String, Object>  updateMainProductImage(
            @RequestParam("product_idx") int product_idx,
            @RequestParam("newImage") MultipartFile newImage) {

        Map<String, Object> response = new HashMap<>();

        try {
            boolean result = productImageService.updateMainImage(product_idx, newImage);
            response.put("success", result);
            response.put("message", result ? "수정 성공" : "수정 실패");
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "서버 오류: " + e.getMessage());
        }

        return response;
    }

    // 인덱스로 상세 이미지 수정
    @PostMapping("/updateDetailImage")
    @ResponseBody
    public Map<String, Object> updateDetailImageByIdx(
            @RequestParam("product_image_idx") int product_image_idx,
            @RequestParam("newImage") MultipartFile newImage) {

        Map<String, Object> response = new HashMap<>();

        try {
            boolean result = productImageService.updateDetailImage(product_image_idx, newImage);
            response.put("success", result);
            response.put("message", result ? "수정 성공" : "수정 실패");
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "서버 오류: " + e.getMessage());
        }

        return response;
    }

    // 인덱스로 이미지 삭제
    @PostMapping("/deleteImage")
    @ResponseBody
    public Map<String, Object> deleteImageByIdx(@RequestBody Map<String, Integer> request) {

        Map<String, Object> response = new HashMap<>();

        try {
            int product_image_idx = request.get("product_image_idx");
            boolean result = productImageService.deleteImage(product_image_idx);
            response.put("success", result);
            response.put("message", result ? "삭제 성공" : "삭제 실패");
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "서버 오류: " + e.getMessage());
        }

        return response;
    }
    
	    
	    
    
    
}//end controller
