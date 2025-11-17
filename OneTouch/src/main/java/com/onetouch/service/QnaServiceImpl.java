package com.onetouch.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onetouch.dao.QnaDao;

@Service
public class QnaServiceImpl implements QnaService {

    @Autowired
    private QnaDao qnaDao;

 
    
    @Override
    public int updateAnswer(int qna_idx, String qna_answer_content) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("qna_idx", qna_idx);
        map.put("qna_answer_content", qna_answer_content);
        return qnaDao.updateAnswer(map);
    }
    
    // Service 구현체에 추가


    @Override
    public int deleteAnswer(int qnaIdx) {
        return qnaDao.deleteAnswerOnly(qnaIdx);
    }
}
