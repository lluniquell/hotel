package kr.co.teampro.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.teampro.vo.AnswerVo;
import kr.co.teampro.vo.FaqVo;
import kr.co.teampro.vo.PqnaVo;
import kr.co.teampro.vo.QnaVo;
import kr.co.teampro.vo.ReviewVo;
import kr.co.teampro.vo.TeamproVo;

public interface TeamproService_ad {

  /*1:1문의	*/
	
	// 문의 목록
	public String qna_list(HttpSession session, Model model, HttpServletRequest request);
	
	// 문의 내용
	public String qna_content(HttpServletRequest request, Model model);
	// 문의 삭제
	public String qna_delete(HttpServletRequest request);
	
	// 문의 답변 작성
	public String qna_answer_ok(AnswerVo avo, HttpSession session, Model model);
	// 문의 답변 수정
	public String answer_update_ok(AnswerVo avo);
	
/*faq 자주묻는 질문*/
	// faq 작성완룐
	public String faq_write_ok(HttpSession session,FaqVo fvo);
	// faq 목록
	public String faq_list(Model model); 
	// faq 수정
	public String faq_update(HttpServletRequest request, Model model);
	// faq 수정 완료
	public String faq_update_ok(FaqVo fvo);
	// faq 삭제
	public String faq_delete(HttpServletRequest request);
	
 /* 이용 후기 */

	// 이용 후기 목록
	public String hugi_list(HttpServletRequest request,  Model model); // (모두)
	// 이용 후기 조회수
	public String hugi_readnum(HttpServletRequest request);
	// 이용 후기 본문
	public String hugi_content(HttpServletRequest request, Model model);

	// 이용 후기 삭제
	public String hugi_delete(HttpServletRequest request);
	
/*상품 리뷰*/
	// 리뷰 목록
	public String review_list(HttpServletRequest request, Model model);
	// 리뷰 수정
	public String review_update(HttpServletRequest request, Model model);
	// 리뷰 수정 완료
	public String review_update_ok(HttpServletRequest request) throws Exception;
	// 리뷰 삭제
	public String review_delete(HttpServletRequest request);
	// 좋아요 
	public String goodup(HttpServletRequest request);
	
/*상품 qna*/
	// 상품 qna 질문 작성
	public String pqna_write(HttpServletRequest request, Model model);
	// 상품 qna 질문 작성 완료
	public String pqna_write_ok(HttpSession session, PqnaVo pvo);
	// 상품 qna 목록
	public String pqna_list(HttpServletRequest request, Model model);
	// 상품 qna 질문 수정
	public String pqna_update(HttpServletRequest request,Model model);
	// 상품 qna 질문 완료
	public String pqna_update_ok(PqnaVo pvo);
	// 상품 qna 삭제
	public String pqna_delete(HttpServletRequest request);
	// 상품 qna 답변
    public String pqna_answer(HttpServletRequest request,Model model);
    // 상품 qna 답변 완료
 	public String pqna_answer_ok(PqnaVo pvo);
    // 상품 qna 답변 수정
 	public String qanswer_update(HttpServletRequest request, Model model);
    // 상품 qna 답변 수정 완료
 	public String qanswer_update_ok(PqnaVo pvo);
}
