package kr.co.hotel.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.hotel.vo.BookVO;

public interface BookService {

	public String book1(HttpServletRequest request, Model model);
	public String book2(BookVO bvo, Model model);
	public String book3(BookVO bvo, Model model, HttpSession session);
}
