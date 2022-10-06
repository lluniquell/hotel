package kr.co.hotel.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hotel.service.QuestionService;
import kr.co.hotel.vo.AnswerVO;
import kr.co.hotel.vo.QnaVO;

@Controller
public class QuestionController {

	@Autowired
	@Qualifier("qs")
	private QuestionService service;
	

/*1:1 문의*/
	@RequestMapping("/cus_qna/qna_write")  // 문의 작성
	public String qna_write()
	{
		return "/cus_qna/qna_write";
	}
	
	@RequestMapping("/cus_qna/qna_write_ok") // 문의 저장
	public String qna_write_ok(HttpSession session, QnaVO qvo)
	{
		return service.qna_write_ok(session, qvo);
	}
	
	@RequestMapping("/cus_qna/qna_list") // 문의 목록 -> 관리자(전부), 회원(본인글만)
	public String qna_list(HttpSession session, Model model, HttpServletRequest request)
	{
		return service.qna_list(session, model, request);
	}
	
	@RequestMapping("/cus_qna/qna_content") // 문의 내용
	public String qna_content(HttpServletRequest request, Model model)
	{
		return service.qna_content(request, model);
	}
	
	@RequestMapping("/cus_qna/qna_delete") // 문의 삭제
	public String qna_delete(HttpServletRequest request)
	{
		return service.qna_delete(request);
	}
	
	@RequestMapping("/cus_qna/qna_update") // 문의 수정폼
	public String qna_update(HttpServletRequest request, Model model)
	{
		return service.qna_update(request, model);
	}
	
	@RequestMapping("/cus_qna/qna_update_ok") // 문의 수정
	public String qna_update_ok(QnaVO qvo)
	{
		return service.qna_update_ok(qvo);
	}
	
}
