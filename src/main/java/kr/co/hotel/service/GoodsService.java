package kr.co.hotel.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.hotel.vo.PqnaVO;

public interface GoodsService {


/*상품 qna*/
	// 상품 qna 질문 작성
	public String pqna_write(HttpServletRequest request, Model model);
	// 상품 qna 질문 작성 완료
	public String pqna_write_ok(HttpSession session, PqnaVO pvo);
	// 상품 qna 목록
	public String pqna_list(HttpServletRequest request, Model model);
	// 상품 qna 질문 수정
	public String pqna_update(HttpServletRequest request,Model model);
	// 상품 qna 질문 완료
	public String pqna_update_ok(PqnaVO pvo);
	// 상품 qna 삭제
	public String pqna_delete(HttpServletRequest request);
	// 상품 qna 답변
    public String pqna_answer(HttpServletRequest request,Model model);
    // 상품 qna 답변 완료
 	public String pqna_answer_ok(PqnaVO pvo);
    // 상품 qna 답변 수정
 	public String qanswer_update(HttpServletRequest request, Model model);
    // 상품 qna 답변 수정 완료
 	public String qanswer_update_ok(PqnaVO pvo);
}
