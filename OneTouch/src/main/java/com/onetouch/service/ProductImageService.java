package com.onetouch.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.onetouch.dao.ProductDao;
import com.onetouch.vo.ProductVo;

import jakarta.servlet.ServletContext;

@Service
public class ProductImageService {

    @Autowired
    private ProductDao product_dao;
    @Autowired
    ServletContext servledtContext;

    // 이미지 저장 경로
    private final String UPLOAD_PATH = "/images/";

    /**
     * 상품 상세 이미지 업로드
     */
    public boolean uploadImages(int product_idx, MultipartFile[] files) {
        try {
        	List<ProductVo> vo =product_dao.selectProductImageProductIdxList(product_idx);
        	System.out.println("레벨:"+vo.size());
        	int level=-(vo.size())-1;
            for (MultipartFile file : files) {
                if (!file.isEmpty()) {
                	//파일이름 변환됨
                    String fileName = generateFileName(file.getOriginalFilename());
                    System.out.printf("파일이름 => %s\n",fileName);
                    saveFile(file, fileName);
                    ProductVo imageVo = new ProductVo();
                    imageVo.setProduct_image_url(fileName);
                    imageVo.setProduct_image_level(level); // 상세 이미지

                    imageVo.setProduct_idx(product_idx);
                    System.out.println(imageVo);
                    product_dao.uploadImages(imageVo);  // DAO 메소드명과 일치
                    level=level-1;
                }
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 메인 상품 이미지 수정
     */
    public boolean updateMainImage(int product_idx, MultipartFile newImage) {
        try {
            String newFileName = generateFileName(newImage.getOriginalFilename());
            saveFile(newImage, newFileName);

            product_dao.updateMainImage(product_idx, newFileName);  // DAO 메소드명과 일치
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 상세 이미지 수정
     */
    public boolean updateDetailImage(int product_image_idx, MultipartFile newImage) {
        try {
            String newFileName = generateFileName(newImage.getOriginalFilename());
            saveFile(newImage, newFileName);

            product_dao.updateDetailImage(product_image_idx, newFileName);  // DAO 메소드명과 일치
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 이미지 삭제
     */
    public boolean deleteImage(int product_image_idx) {
        try {
            product_dao.deleteImage(product_image_idx);  // DAO 메소드명과 일치
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 파일명 생성
     */
    private String generateFileName(String originalFileName) {
        String extension = "";
        if (originalFileName != null && originalFileName.contains(".")) {
            extension = originalFileName.substring(originalFileName.lastIndexOf("."));
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
        String dateStr = sdf.format(new Date());
        String uuid = UUID.randomUUID().toString().substring(0, 8);

        return "product_" + dateStr + "_" + uuid + extension;
    }

    /**
     * 파일 저장
     */
    private void saveFile(MultipartFile file, String fileName) throws IOException {
    	
        String realPath = servledtContext.getRealPath(UPLOAD_PATH);
    	Path uploadPath = Paths.get(realPath);
        System.out.printf("이미지 저장경로 => %s\n",uploadPath);
        
        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }

        Path filePath = uploadPath.resolve(fileName);
        file.transferTo(filePath.toFile());
    }
}