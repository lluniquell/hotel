package kr.co.hotel.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hotel.service.BookService;

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
		System.out.println("book1컨트럴러");
		return "/book/book1";
	}
	
	/*@RequestMapping("/book/book1")
	public String book1()
	{
		return "/book/book1";
	}*/
}
