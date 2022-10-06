package kr.co.teampro.controll;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.teampro.service.TeamproService;
import kr.co.teampro.service.TeamproService_cus;
import kr.co.teampro.vo.AnswerVo;
import kr.co.teampro.vo.FaqVo;
import kr.co.teampro.vo.HugiVo;
import kr.co.teampro.vo.PqnaVo;
import kr.co.teampro.vo.QnaVo;
import kr.co.teampro.vo.ReviewVo;
import kr.co.teampro.vo.TeamproVo;

@Controller
public class TeamproController_cus {

	@Autowired
	@Qualifier("tps")
	private TeamproService_cus service; 
	
	
/*1:1 문의*/
	@RequestMapping("/cus_qna/qna_write")  // 문의 작성
	public String qna_write()
	{
		return "/cus_qna/qna_write";
	}
	
	@RequestMapping("/cus_qna/qna_write_ok") // 문의 저장
	public String qna_write_ok(HttpSession session, QnaVo qvo)
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
	public String qna_update_ok(QnaVo qvo)
	{
		return service.qna_update_ok(qvo);
	}
		
	
/*faq 자주묻는 질문 */
		
	@RequestMapping("/cus_faq/faq_list") // faq 목록
	public String faq_list(Model model)
	{
		return service.faq_list(model);
	}

/*이용 후기*/
	@RequestMapping("/cus_hugi/hugi_write")  // 이용 후기 작성
	public String hugi_write(HttpServletRequest request, Model model)
	{
		return service.hugi_write(request,model);
	}	
	
	@RequestMapping("/cus_hugi/hugi_write_ok")  // 이용 후기 작성 완료
	public String hugi_write_ok(HttpSession session, HttpServletRequest request) throws Exception
	{
		return service.hugi_write_ok(session, request);
	}
	
	@RequestMapping("/cus_hugi/hugi_list") // 이용 후기 목록
	public String hugi_list(HttpServletRequest request, Model model)
	{
		return service.hugi_list(request, model);
	}
	@RequestMapping("/cus_hugi/hugi_list_cus") // 이용 후기 목록(개인)
	public String hugi_list_cus(HttpServletRequest request, HttpSession session, Model model)
	{
		return service.hugi_list_cus(request,session, model);
	}

	@RequestMapping("/cus_hugi/hugi_readnum") // 이용 후기 조회수
	public String hugi_readnum(HttpServletRequest request)
	{
	   return service.hugi_readnum(request);	
	}
	
	@RequestMapping("/cus_hugi/hugi_content") // 이용 후기 내용
	public String hugi_content(HttpServletRequest request, Model model)
	{
		return service.hugi_content(request,model);
	}
	
	@RequestMapping("/cus_hugi/hugi_update") // 이용 후기 수정
	public String hugi_update(HttpSession session, HttpServletRequest request, Model model)
	{
		return service.hugi_update(request, model);
	}
	
	@RequestMapping("/cus_hugi/hugi_update_ok") // 이용 후기 수정 완료
	public String hugi_update_ok(HttpServletRequest request) throws Exception
	{
		return service.hugi_update_ok(request);		
	}
	
	@RequestMapping("/cus_hugi/hugi_delete") // 이용 후기 삭제
	public String hugi_delete(HttpServletRequest request)
	{
	    return service.hugi_delete(request);	
	}
	
/*상품리뷰*/
	@RequestMapping("/mypage/review_write") // 리뷰 자성
	public String review(HttpServletRequest request, HttpSession session, Model model)
	{
		return "/mypage/review_write";
	}
	
	@RequestMapping("/mypage/review_write_ok") // 리뷰 작성 완료
	public String review_write_ok(HttpSession session, HttpServletRequest request) throws Exception
	{
		return service.review_write_ok(session,request);
	}
	
	@RequestMapping("/mypage/review_list") // 리뷰 목록 및 본문
	public String review_list(HttpServletRequest request, Model model)
	{
		return service.review_list(request, model);
	}
	
	@RequestMapping("/mypage/review_update") // 리뷰 수정
	public String review_update(HttpServletRequest request, Model model)
	{
		return service.review_update(request, model);
	}
	
	@RequestMapping("/mypage/review_update_ok") //리뷰 수정 완료
	public String review_update_ok(HttpServletRequest request) throws Exception
	{
		return service.review_update_ok(request);		
	}
	
	@RequestMapping("/mypage/review_delete")  //리뷰 삭제
	public String review_delete(HttpServletRequest request)
	{
	   return service.review_delete(request);			
	}
	
	@RequestMapping("/mypage/goodup") // 좋아요
	public String goodup(HttpServletRequest request)
	{
		return service.goodup(request);
	}
	
/* 상품 qna */
	@RequestMapping("/mypage/pqna_write") // 상품 qna 질문 작성
	public String pqna_write(HttpServletRequest request, Model model)
	{
		return service.pqna_write(request, model);
	}
	
	@RequestMapping("/mypage/pqna_write_ok") // 상품 qna 질문 작성 완료
	public String pqna_write_ok(HttpSession session, PqnaVo pvo)
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
	public String pqna_update_ok(PqnaVo pvo)
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
	public String pqna_answer_ok(PqnaVo pvo)
	{
		return service.pqna_answer_ok(pvo);
	}
	
	@RequestMapping("/mypage/qanswer_update") // 상품 qna 답변 수정
	public String qanswer_update(HttpServletRequest request, Model model)
	{
		return service.qanswer_update(request, model);
	}
	
	@RequestMapping("/mypage/qanswer_update_ok") // 상품 qna 답변 수정 완료
	public String qanswer_update_ok(PqnaVo pvo)
	{
		return service.qanswer_update_ok(pvo);
	}
}
