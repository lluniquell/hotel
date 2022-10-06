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
import kr.co.teampro.service.TeamproService_ad;
import kr.co.teampro.vo.AnswerVo;
import kr.co.teampro.vo.FaqVo;
import kr.co.teampro.vo.HugiVo;
import kr.co.teampro.vo.PqnaVo;
import kr.co.teampro.vo.QnaVo;
import kr.co.teampro.vo.ReviewVo;
import kr.co.teampro.vo.TeamproVo;

@Controller
public class TeamproController_ad {

	@Autowired
	@Qualifier("tps")
	private TeamproService_ad service; 
	
	
/*1:1 문의*/
	
	@RequestMapping("/ad_qna/qna_list") // 문의 목록 -> 관리자(전부), 회원(본인글만)
	public String qna_list(HttpSession session, Model model, HttpServletRequest request)
	{
		return service.qna_list(session, model, request);
	}
	
	@RequestMapping("/ad_qna/qna_content") // 문의 내용
	public String qna_content(HttpServletRequest request, Model model)
	{
		return service.qna_content(request, model);
	}
	
	@RequestMapping("/ad_qna/qna_delete") // 문의 삭제
	public String qna_delete(HttpServletRequest request)
	{
		return service.qna_delete(request);
	}
	
	@RequestMapping("/ad_qna/qna_answer_ok") // 문의 답변 저장
	public String qna_answer_ok(AnswerVo avo, HttpSession session, Model model)
	{
		return service.qna_answer_ok(avo, session, model);
	}
	 
	@RequestMapping("/ad_qna/answer_update_ok") // 문의 답변 수정
	public String answer_update_ok(AnswerVo avo)
	{
		return service.answer_update_ok(avo);
	}
	
/*faq 자주묻는 질문 */
	@RequestMapping("/ad_faq/faq_write")  // faq 작성
	public String faq_write()
	{
		return "/ad_faq/faq_write";
	}
	
	@RequestMapping("/ad_faq/faq_write_ok") // faq 작성 완료
	public String faq_write_ok(HttpSession session,FaqVo fvo)
	{
		return service.faq_write_ok(session, fvo); 
	}
	@RequestMapping("/ad_faq/faq_list") // faq 목록
	public String faq_list(Model model)
	{
		return service.faq_list(model);
	}
	
	@RequestMapping("/ad_faq/faq_update") // faq 수정
	public String faq_update(HttpServletRequest request, Model model)
	{
		return service.faq_update(request, model);		
	}
	
	@RequestMapping("/ad_faq/faq_update_ok") // faq 수정 완료
	public String faq_update_ok(FaqVo fvo)
	{
		return service.faq_update_ok(fvo);		
	}
	
	@RequestMapping("/ad_faq/faq_delete")
	public String faq_delete(HttpServletRequest request)
	{
		return service.faq_delete(request);
	}

/*이용 후기*/
	
	@RequestMapping("/ad_hugi/hugi_list") // 이용 후기 목록
	public String hugi_list(HttpServletRequest request, Model model)
	{
		return service.hugi_list(request, model);
	}
	
	@RequestMapping("/ad_hugi/hugi_readnum") // 이용 후기 조회수
	public String hugi_readnum(HttpServletRequest request)
	{
	   return service.hugi_readnum(request);	
	}
	
	@RequestMapping("/ad_hugi/hugi_content") // 이용 후기 내용
	public String hugi_content(HttpServletRequest request, Model model)
	{
		return service.hugi_content(request,model);
	}
	
	@RequestMapping("/ad_hugi/hugi_delete") // 이용 후기 삭제
	public String hugi_delete(HttpServletRequest request)
	{
	    return service.hugi_delete(request);	
	}
	
/*상품리뷰*/
		
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
