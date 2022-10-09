package kr.co.hotel.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface HugiService {

	 /* 이용 후기 */
		// 이용 후기 작성
		public String hugi_write(HttpServletRequest request, Model model);
		// 이용 후기 작성 완료
		public String hugi_write_ok(HttpSession session, HttpServletRequest request) throws Exception;
		// 이용 후기 목록
		public String hugi_list(HttpServletRequest request,  Model model); // (모두)
		public String hugi_list_cus(HttpServletRequest request, HttpSession session, Model model); // (개인)
		// 이용 후기 조회수
		public String hugi_readnum(HttpServletRequest request);
		// 이용 후기 본문
		public String hugi_content(HttpServletRequest request, Model model);		
		// 이용 후기 수정
		public String hugi_update(HttpServletRequest request, Model model);
		// 이용 후기 수정 완료
		public String hugi_update_ok(HttpServletRequest request) throws Exception;	
		// 이용 후기 삭제
		public String hugi_delete(HttpServletRequest request);
}
