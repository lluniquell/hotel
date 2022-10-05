package kr.co.hotel_admin.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hotel_admin.service.BookService;
import kr.co.hotel_admin.vo.BookVO;

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
	
	@RequestMapping("/book/list")
	public String list(HttpServletRequest request,BookVO bvo, Model model)
	{
		return service.list(request, bvo, model);
	}
	
	@RequestMapping("/book/sales")
	public String sales(BookVO bvo, Model model)
	{
		return service.sales(bvo, model);
	}
	
	@RequestMapping("/book/book1")
	public String book1(HttpServletRequest request, Model model, HttpSession session)
	{
	
		return service.book1(request, model,session);
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
	
	
	@RequestMapping("/book/book_view")
	public String book_view(HttpServletRequest request, Model model)
	{
	
		return service.book_view(request, model);
	}
	
	@RequestMapping("/book/book_cancel")
	public String book_cancel(HttpServletRequest request)
	{
	
		return service.book_cancel(request);
	}
	
	@RequestMapping("/book/pay_state_change")
	public String pay_state_change(HttpServletRequest request) {
		
		return service.pay_state_change(request);
	}
	
	
}
