package com.onetouch.service.qna;

public interface QnaService {
	// 답변 등록
    int updateAnswer(int qna_idx, String qna_answer_content);
}
