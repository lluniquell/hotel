package kr.co.hotel.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.hotel.mapper.BookMapper;
import kr.co.hotel.vo.BookVO;
import kr.co.hotel.vo.RoomVO;

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
	
		 model.addAttribute("list",list);
		 model.addAttribute("checkin",checkin);
		 model.addAttribute("checkout",checkout);
		 model.addAttribute("person",person);
		 return "/book/book1";
	}

	@Override
	public String book2(BookVO bvo, Model model) {
		
		RoomVO rvo=mapper.book2(bvo);
		model.addAttribute("rvo",rvo);
		model.addAttribute("bvo",bvo);
		
		return "/book/book2";
	}

	@Override
	public String book3(BookVO bvo, Model model, HttpSession session) {
		String userid=session.getAttribute("userid").toString();
		bvo.setUserid(userid);
		//salescode
		mapper.book3(bvo);
		return null;
	}

	

	
}
