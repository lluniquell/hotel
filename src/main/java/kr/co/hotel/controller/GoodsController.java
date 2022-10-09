package kr.co.hotel.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hotel.service.GoodsService;
import kr.co.hotel.vo.PqnaVO;
import kr.co.hotel.vo.QnaVO;

@Controller
public class GoodsController {

	@Autowired
	@Qualifier("gs")
	private GoodsService service;


/* 상품 qna */
	@RequestMapping("/mypage/pqna_write") // 상품 qna 질문 작성
	public String pqna_write(HttpServletRequest request, Model model)
	{
		return service.pqna_write(request, model);
	}
	
	@RequestMapping("/mypage/pqna_write_ok") // 상품 qna 질문 작성 완료
	public String pqna_write_ok(HttpSession session, PqnaVO pvo)
	{		
		return service.pqna_write_ok(session, pvo);
	}
	
	@RequestMapping("/mypage/pqna_list") // 상품 qna 목록
	public String pqna_list(HttpServletRequest request, Model model)
	{		
		return service.pqna_list(request, model);
	}
	
	@RequestMapping("/mypage/pqna_update") // 상품 qna 질문 수정
	public String pqna_update(HttpServletRequest request,Model model)
	{
		return service.pqna_update(request,model);
	}
	
	@RequestMapping("/mypage/pqna_update_ok") // 상품 qna 질문 완료
	public String pqna_update_ok(PqnaVO pvo)
	{
		return service.pqna_update_ok(pvo);
	}
	
	@RequestMapping("/mypage/pqna_delete") // 상품 qna 삭제
	public String pqna_delete(HttpServletRequest request)
	{
		return service.pqna_delete(request);
	}
	
	@RequestMapping("/mypage/pqna_answer")  // 상품 qna 답변
	public String pqna_answer(HttpServletRequest request,Model model)
	{
		return service.pqna_answer(request,model);
	}
	
	@RequestMapping("/mypage/pqna_answer_ok") // 상품 qna 답변 완료
	public String pqna_answer_ok(PqnaVO pvo)
	{
		return service.pqna_answer_ok(pvo);
	}
	
	@RequestMapping("/mypage/qanswer_update") // 상품 qna 답변 수정
	public String qanswer_update(HttpServletRequest request, Model model)
	{
		return service.qanswer_update(request, model);
	}
	
	@RequestMapping("/mypage/qanswer_update_ok") // 상품 qna 답변 수정 완료
	public String qanswer_update_ok(PqnaVO pvo)
	{
		return service.qanswer_update_ok(pvo);
	}
}
