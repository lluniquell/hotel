package kr.co.hotel.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hotel.service.BookService;
import kr.co.hotel.vo.BookVO;

@Controller
public class BookController {

	@Autowired
	@Qualifier("bs")
	private BookService service;
	
	@RequestMapping("/book/book")
	public String book()
	{
		return "/book/book";
	}
	
	@RequestMapping("/book/book1")
	public String book1(HttpServletRequest request, Model model)
	{
	
		return service.book1(request, model);
	}
	
	@RequestMapping("/book/book2")
	public String book2(BookVO bvo, Model model)
	{
	
		return service.book2(bvo, model);
	}
	
	@RequestMapping("/book/book3")
	public String book3(BookVO bvo, Model model, HttpSession session)
	{
	
		return service.book3(bvo, model, session);
	}
	
}
