package com.onetouch.vo;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Alias("QnaVo")  // ✅ MyBatis 별칭 설정
public class QnaVo {
    private int qna_idx;                // 게시판번호
    private int mem_idx;                // 회원 FK
    private String qna_title;           // 제목
    private String qna_content;         // 내용
    private int qna_category;           // 카테고리 (0: 상품, 1: 배송, 2: 교환/환불, 3: 기타, 4: FAQ, 5: 공지사항)
    private boolean qna_private;        // 비밀글 여부
    private boolean qna_answered;       // 답변 여부
    private String qna_answer_content;  // 답변 내용
    private int qna_delete;             // 삭제 여부 (0: 정상, 1: 유저 삭제, 2: 관리자 삭제)
    private Timestamp qna_time;         // 작성 시간
    private Timestamp qna_update;       // 수정 시간
    private Timestamp qna_answer_time;  // 답변 시간
    private String mem_name; 			// 회원이름
}
