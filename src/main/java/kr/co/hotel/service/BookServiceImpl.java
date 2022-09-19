package kr.co.hotel.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

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
	public String book1(HttpServletRequest request, Model model, HttpSession session) {
		
		if(session.getAttribute("userid")!=null) 
		{
			String[] date=request.getParameter("date").split("-");
			 String checkin=date[0];
			 String checkout=date[1];
			 String person=request.getParameter("person");

			 ArrayList<RoomVO> blist=mapper.book1(checkin,checkout,person);
			 model.addAttribute("blist",blist);	

			 model.addAttribute("checkin",checkin);
			 model.addAttribute("checkout",checkout);
			 model.addAttribute("person",person);
			 return "/book/book1";
		} 
		else
		{		 
		 return "redirect:/login/login";
		}
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
		String sales=bvo.getCheckin();
		Integer code=mapper.getCode(sales);
		code=code+1;
		String code1="";
		if((int)(Math.log10(code)+1)==1) {
			code1="0"+code;
		} else {
			code1=code.toString();
		}
		String salsecode=sales+code1;
		bvo.setSalescode(Integer.parseInt(salsecode));
		mapper.makebook(bvo);
		bvo=mapper.book3(salsecode);
	
		model.addAttribute("bvo",bvo);
		
		return "/book/book3";
	}

	@Override
	public String list(Model model, HttpSession session) {
		String userid=session.getAttribute("userid").toString();
		ArrayList<BookVO> blist=mapper.list(userid);
		
		model.addAttribute("blist",blist);
		
		Calendar cal=Calendar.getInstance();
		String YY=Integer.toString(cal.get(Calendar.YEAR));
		String MM=Integer.toString(cal.get(Calendar.MONTH)+1);
		String DD=Integer.toString(cal.get(Calendar.DATE));
		String today=YY+"-"+MM+"-"+DD;			
		model.addAttribute("today",today);		

			
		return "/book/list";
	}

	@Override
	public String book_view(HttpServletRequest request, Model model) {
		String salescode=request.getParameter("salescode");
		BookVO bvo=mapper.book3(salescode);
		
		model.addAttribute("bvo",bvo);
		
		return "/book/book_view";
	}

	@Override
	public String book_cancel(HttpServletRequest request) {
		String salescode=request.getParameter("salescode");
		mapper.book_cancel(salescode);
		
		return "/book/list";
	}

	

	
}
