package com.onetouch.controller.qna;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onetouch.dao.QnaDao;
import com.onetouch.service.QnaService;

@Service
public class QnaServiceImpl implements QnaService {
    
    @Autowired
    private QnaDao qnaDao;
    
    public int updateAnswer(int qna_idx, String qna_answer_content) {
        Map<String, Object> map = new HashMap<>();
        map.put("qna_idx", qna_idx);
        map.put("qna_answer_content", qna_answer_content);
        
        return qnaDao.updateAnswer(map);
    }
}