package com.onetouch.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.onetouch.vo.QnaVo;

@Mapper
public interface QnaDao {

    // 1️⃣ 전체 문의글 목록
    List<QnaVo> selectQnaList(int mem_idx);

    // 2️⃣ 특정 문의글 상세보기
    QnaVo selectQnaDetail(int qna_idx);
//----------------------------------------------------------------------------------

	
    
//    // 등록 후 몇 건이 처리됐는지 반환
     int insertQna(QnaVo vo);

     int updateQna(QnaVo vo);

	 int deleteQna(int qna_idx);
    }


