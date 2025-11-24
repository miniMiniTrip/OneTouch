package com.onetouch.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.onetouch.dao.ProductDao;
import com.onetouch.vo.ProductVo;

@Service
public class ProductImageService {

    @Autowired
    private ProductDao product_dao;

    // 이미지 저장 경로
    private final String UPLOAD_PATH = "src/main/webapp/images/";

    /**
     * 상품 상세 이미지 업로드
     */
    public boolean uploadImages(int product_idx, MultipartFile[] files) {
        try {
            for (MultipartFile file : files) {
                if (!file.isEmpty()) {
                    String fileName = generateFileName(file.getOriginalFilename());
                    saveFile(file, fileName);

                    ProductVo imageVo = new ProductVo();
                    imageVo.setProduct_image_url(fileName);
                    imageVo.setProduct_image_level(2); // 상세 이미지

                    product_dao.uploadImages(imageVo);  // DAO 메소드명과 일치
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
        Path uploadPath = Paths.get(UPLOAD_PATH);

        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }

        Path filePath = uploadPath.resolve(fileName);
        file.transferTo(filePath.toFile());
    }
}