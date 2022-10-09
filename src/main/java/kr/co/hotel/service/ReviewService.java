package kr.co.hotel.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface ReviewService {
	/*상품 리뷰*/
	// 리뷰 작성
	public String review_write_ok(HttpSession session, HttpServletRequest request) throws Exception;
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
	
}
