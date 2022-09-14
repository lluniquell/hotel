package kr.co.hotel.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.hotel.mapper.BookMapper;
import kr.co.hotel.vo.BookVO;

@Service
@Qualifier("bs")
public class BookServiceImpl implements BookService {

	@Autowired
	public BookMapper mapper;

	@Override
	public String book1(HttpServletRequest request, Model model) {
		 String[] date=request.getParameter("date").split("-");
		 String checkin=date[0];
		 String checkout=date[1];
		 String person=request.getParameter("person");
		 ArrayList<BookVO> list=mapper.book1(checkin,checkout,person);
		 System.out.println("book1구현");
		 model.addAttribute("list",list);
		 
		 return "/book/book1";
	}

	

	
}
