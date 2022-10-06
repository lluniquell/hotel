package kr.co.hotel.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hotel.service.ReviewService;

@Controller
public class ReviewController {

	@Autowired
	@Qualifier("rs")
	private ReviewService service;
	

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
}
