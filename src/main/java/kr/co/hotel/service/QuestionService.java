package kr.co.hotel.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.hotel.vo.AnswerVO;
import kr.co.hotel.vo.QnaVO;

public interface QuestionService {
	
	  /*1:1문의	*/
		// 문의 작성
		public String qna_write_ok(HttpSession session, QnaVO qvo); 
		// 문의 목록
		public String qna_list(HttpSession session, Model model, HttpServletRequest request);		
		// 문의 내용
		public String qna_content(HttpServletRequest request, Model model);
		// 문의 삭제
		public String qna_delete(HttpServletRequest request);
		// 문의 수정
		public String qna_update(HttpServletRequest request, Model model);
		public String qna_update_ok(QnaVO qvo);		
		// 문의 답변 작성
		public String qna_answer_ok(AnswerVO avo, HttpSession session, Model model);
		// 문의 답변 수정
		public String answer_update_ok(AnswerVO avo);
}
