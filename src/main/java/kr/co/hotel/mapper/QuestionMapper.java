package kr.co.hotel.mapper;

import java.util.ArrayList;

import kr.co.hotel.vo.AnswerVO;
import kr.co.hotel.vo.QnaVO;

public interface QuestionMapper {
	public void qna_write_ok(QnaVO qvo); // 문의 작성	
	public ArrayList<QnaVO> qna_list_cus(String id, int index); // 문의 목록(회원)
	public int getchong_cus(String userid); // 문의 목록 페이징 : 총 페이지값 구하기(회원)	
	public QnaVO qna_content(String id); // 문의 내용
	public void qna_delete(String id); // 문의 삭제
	public void qna_update_ok(QnaVO qvo); // 문의 수정	
	public AnswerVO qna_answer(String id); // 문의 답변 불러오기
}
