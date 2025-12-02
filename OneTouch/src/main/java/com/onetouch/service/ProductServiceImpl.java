package com.onetouch.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.onetouch.dao.HashtagDao;
import com.onetouch.dao.ProductDao;
import com.onetouch.vo.ProductVo;

import jakarta.servlet.ServletContext;

@Service
public class ProductServiceImpl implements ProductService {
    
    @Autowired
    ProductDao product_dao;
    
    @Autowired
    HashtagDao hashtag_dao;
    @Autowired
    ServletContext application;
    
    @Override
    @Transactional
    public int insert(ProductVo productVo) throws Exception {
        System.out.printf("[ProductServiceImpl-insert] 초기 productVo: %s\n", productVo);
        
        // 1. product 테이블에 상품 등록
        int res = product_dao.insert(productVo);
        System.out.printf("[ProductServiceImpl-insert] product 등록 후 productVo의 product_idx: %d\n", productVo.getProduct_idx());
        
        // 2. product_image 테이블에 이미지 등록
        res = res*product_dao.insertProductImage(productVo);
        System.out.printf("[ProductServiceImpl-insert] product_image 등록 완료\n");
        
        // 2-1.product_image 테이블에 레벨에 2부터 양수로 서브이미지 등록 
        String saveDirDetail = application.getRealPath("/images/products_detail");
        String sub_image_name="no_file";
        int level=2;
        if(productVo.getPhoto_sub()!=null) {
        	for(MultipartFile sub_image : productVo.getPhoto_sub()) {
        		sub_image_name=sub_image.getOriginalFilename();
        		File f=new File(saveDirDetail,sub_image_name);
        		if(f.exists()){
        			long tm =System.currentTimeMillis();
        			sub_image_name=String.format("%d_%s",tm,sub_image_name);
        			f = new File(saveDirDetail,sub_image_name);
        		}
        		
        		sub_image.transferTo(f);
        		productVo.setProduct_image_url(sub_image_name);
        		productVo.setProduct_image_level(level); // 1은 메인 2 3 4 5 는 서브 
        		res=res*product_dao.insertProductImage(productVo);
        		
        		level=level+1;
        	}
        }
        // 2-2. product_image 테이블에 레벨에 음수로 내용이미지 등록
        
        String content_image_name ="";
        level=-1;
        if(productVo.getPhoto_content()!=null) {
        	for(MultipartFile content_image:productVo.getPhoto_content()) {
        		content_image_name=content_image.getOriginalFilename();
        		File f =new File(saveDirDetail,content_image_name);
        		if(f.exists()){
        			long tm = System.currentTimeMillis();
        			content_image_name=String.format("%d_%s",tm,content_image_name);
        			f=new File(saveDirDetail,content_image_name);
        		}
        		content_image.transferTo(f);
        		productVo.setProduct_image_url(content_image_name);
        		productVo.setProduct_image_level(level);
        		res=res*product_dao.insertProductImage(productVo);
        		level=level-1;
        	}
        }
        
        
        // 3. 해시태그 처리
        if (productVo.getHashtag_list() != null && !productVo.getHashtag_list().isEmpty()) {
            System.out.printf("[ProductServiceImpl-insert] 해시태그 처리 시작: %d개\n", productVo.getHashtag_list().size());
            
            // 3-1. 해시태그 연결 등록
            Map<String, Object> params = new HashMap<>();
            params.put("product_idx", productVo.getProduct_idx());
            params.put("hashtag_list", productVo.getHashtag_list());
            
            int hashtagRes = hashtag_dao.insertProductHashtag(params);
            System.out.printf("[ProductServiceImpl-insert] 해시태그 연결 완료: %d개\n", hashtagRes);
        } else {
            System.out.println("[ProductServiceImpl-insert] 등록할 해시태그 없음");
        }
        
        return res;
    }
    
    @Override
    @Transactional
    public int update(ProductVo productVo) throws Exception {
        System.out.printf("[ProductServiceImpl-update] 받은 productVo: %s\n", productVo);
        
        // 1. product 테이블 업데이트
        int res = 1;
        		res=res*product_dao.update(productVo);
        System.out.printf("[ProductServiceImpl-update] product 테이블 업데이트 결과: %d\n", res);
        
        // 2. 이미지가 변경된 경우만 product_image 업데이트
        if (productVo.getProduct_image_url() != null && !productVo.getProduct_image_url().isEmpty()) {
            System.out.printf("[ProductServiceImpl-update] 새 이미지 URL: %s\n", productVo.getProduct_image_url());
            // 기존이미지 이름 가져와서 서버에 파일 지우기
            ProductVo product_image_level1=product_dao.selectProductImageLevel1(productVo.getProduct_idx());
            String product_main_image_name=product_image_level1.getProduct_image_url();
            File f=new File(application.getRealPath("/images/products_list"),product_main_image_name);
            res = res*product_dao.updateProductImage(productVo);
            if(res==1 && productVo.getMain_image_url()!=null) {
            	System.out.printf("	메인이미지삭제\n");
            	f.delete();
            }
            System.out.printf("[ProductServiceImpl-update] product_image 테이블 업데이트 결과: %d\n", res);
        } else {
            System.out.println("[ProductServiceImpl-update] 이미지 변경 없음");
        }
        // 2-1 서브 이미지 변경
        if(productVo.getPhoto_sub()!=null&&productVo.getPhoto_sub().length>0&&!productVo.getPhoto_sub()[0].isEmpty()) {
        	// 기존 서브 이미지 삭제전 업로드되어있는 서브 이미지 파일 삭제처리
        	List<String> before_sub_images_name=product_dao.selectDetailImages(productVo.getProduct_idx());
        	for(String before_sub_image_name:before_sub_images_name) {
        		File f=new File(application.getRealPath("/images/products_detail"),before_sub_image_name);
        		f.delete();
        	}
        	// 기존 서브 이미지 삭제처리
        	res=res*product_dao.deleteProductSubImages(productVo.getProduct_idx());
        	// 서브 이미지 등록
        	String saveDirDetail = application.getRealPath("/images/products_detail");
            String sub_image_name="no_file";
            int level=2;
            if(productVo.getPhoto_sub()!=null) {
            	for(MultipartFile sub_image : productVo.getPhoto_sub()) {
            		sub_image_name=sub_image.getOriginalFilename();
            		File f=new File(saveDirDetail,sub_image_name);
            		if(f.exists()){
            			long tm =System.currentTimeMillis();
            			sub_image_name=String.format("%d_%s",tm,sub_image_name);
            			f = new File(saveDirDetail,sub_image_name);
            		}
            		
            		sub_image.transferTo(f);
            		productVo.setProduct_image_url(sub_image_name);
            		productVo.setProduct_image_level(level); // 1은 메인 2 3 4 5 는 서브 
            		res=res*product_dao.insertProductImage(productVo);
            		
            		level=level+1;
            	}
            }
        }
        
        // 2-2. 상품 내용 이미지 변경
        if(productVo.getPhoto_content()!=null&&productVo.getPhoto_content().length>0&&!productVo.getPhoto_content()[0].isEmpty()) {
        	// 기존 상품 내용 이미지 파일 삭제 처리
        	List<String> before_content_images_name=product_dao.selectLowerDetailImages(productVo.getProduct_idx());
        	for(String before_sub_image_name:before_content_images_name) {
        		File f=new File(application.getRealPath("/images/products_detail"),before_sub_image_name);
        		f.delete();
        	}
        	// 기존 상품 내용 이미지 삭제
        	product_dao.deleteProductContentImages(productVo.getProduct_idx());
        	String saveDirDetail = application.getRealPath("/images/products_detail");
            String content_image_name ="no_file";
            int level=-1;
            if(productVo.getPhoto_content()!=null) {
            	for(MultipartFile content_image:productVo.getPhoto_content()) {
            		content_image_name=content_image.getOriginalFilename();
            		File f =new File(saveDirDetail,content_image_name);
            		if(f.exists()){
            			long tm = System.currentTimeMillis();
            			content_image_name=String.format("%d_%s",tm,content_image_name);
            			f=new File(saveDirDetail,content_image_name);
            		}
            		content_image.transferTo(f);
            		productVo.setProduct_image_url(content_image_name);
            		productVo.setProduct_image_level(level);
            		res=res*product_dao.insertProductImage(productVo);
            		level=level-1;
            	}
            }
        }
        
        // 3. 해시태그 처리 (기존 연결 삭제 후 새로 등록)
        if (productVo.getHashtag_list() != null) {
            System.out.printf("[ProductServiceImpl-update] 해시태그 업데이트 시작: %d개\n", productVo.getHashtag_list().size());
            
            // 3-1. 기존 해시태그 연결 삭제
            hashtag_dao.deleteProductHashtagByProduct(productVo.getProduct_idx());
            System.out.println("[ProductServiceImpl-update] 기존 해시태그 연결 삭제 완료");
            
            // 3-2. 새 해시태그가 있으면 연결
            if (!productVo.getHashtag_list().isEmpty()) {
                Map<String, Object> params = new HashMap<>();
                params.put("product_idx", productVo.getProduct_idx());
                params.put("hashtag_list", productVo.getHashtag_list());
                
                int hashtagRes = hashtag_dao.insertProductHashtag(params);
                System.out.printf("[ProductServiceImpl-update] 새 해시태그 연결 완료: %d개\n", hashtagRes);
            } else {
                System.out.println("[ProductServiceImpl-update] 연결할 새 해시태그 없음");
            }
        }
        
        return res;
    }
    
    @Override
    @Transactional
    public int delete(int product_idx) {
        System.out.printf("[ProductServiceImpl-delete] 삭제할 product_idx: %d\n", product_idx);
        
        // 1. 해시태그 연결 먼저 삭제 (CASCADE가 없는 경우 대비)
        hashtag_dao.deleteProductHashtagByProduct(product_idx);
        System.out.println("[ProductServiceImpl-delete] 해시태그 연결 삭제 완료");
        
        // 2. 상품 이미지 서버에 업로드된 파일 삭제처리
        List<ProductVo> imagesNameList=product_dao.selectProductImageListName(product_idx);
        for(ProductVo image:imagesNameList) {
        	if(image.getProduct_image_level()==1) {
        		String saveDirDetail = application.getRealPath("/images/products_list");
        		
        		File f = new File(saveDirDetail,image.getProduct_image_url());
        		if(f.exists()) {
        		f.delete();
        		}
        	}else {
        		String saveDirDetail = application.getRealPath("/images/products_detail");
        		File f = new File(saveDirDetail,image.getProduct_image_url());
        		if(f.exists()) {
        			f.delete();
        		}
        		
        	}
        }
        
        // 2-1. 상품 삭제 (CASCADE 설정으로 product_image도 자동 삭제됨)
        int res = product_dao.delete(product_idx);
        System.out.printf("[ProductServiceImpl-delete] 삭제 결과: %d\n", res);
        
        return res;
    }
    
    @Override
    @Transactional
    public int deleteBatch(List<Integer> product_idx_list) {
        System.out.printf("[ProductServiceImpl-deleteBatch] 삭제할 product_idx 목록: %s\n", product_idx_list);
        
        // 1. 각 상품의 해시태그 연결 삭제
        for (Integer product_idx : product_idx_list) {
            hashtag_dao.deleteProductHashtagByProduct(product_idx);
        }
        System.out.println("[ProductServiceImpl-deleteBatch] 모든 해시태그 연결 삭제 완료");
        
        // 2. 상품 일괄 삭제 (CASCADE 설정으로 product_image도 자동 삭제됨)
        int res = product_dao.deleteProductRemain(product_idx_list);
        res = res*product_dao.deleteBatch(product_idx_list);
        System.out.printf("[ProductServiceImpl-deleteBatch] 삭제된 개수: %d\n", res);
        
        return res;
    }
}
