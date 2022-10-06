package kr.co.hotel_admin.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.hotel_admin.vo.BookVO;

public interface BookService {

	public String list(HttpServletRequest request, BookVO bvo, Model model);
	public String sales(BookVO bvo, Model model);
	public String book1(HttpServletRequest request, Model model, HttpSession session);
	public String book2(BookVO bvo, Model model);
	public String book3(BookVO bvo, Model model, HttpSession session);
	public String book_view(HttpServletRequest request, Model model);
	public String book_cancel(HttpServletRequest request);
	public String pay_state_change(HttpServletRequest request);
}
