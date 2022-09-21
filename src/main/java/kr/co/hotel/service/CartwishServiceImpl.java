package kr.co.hotel.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.hotel.mapper.AdminMapper;
import kr.co.hotel.mapper.CartwishMapper;
import kr.co.hotel.vo.GoodsVO;

@Service
@Qualifier("cs")
public class CartwishServiceImpl implements CartwishService{
	
	@Autowired
	public CartwishMapper mapper;

	@Override
	public String wish_del(HttpServletRequest request) {
		
     String[] id=request.getParameter("id").split(",");
     for(int i=0;i<id.length;i++)
     {
    	 mapper.wish_del(id[i]); 
     }
     
	 return "redirect:/mypage/wish";
	}

	@Override
	public String move_cart(HttpServletRequest request, HttpSession session) {
		 
		String userid=session.getAttribute("userid").toString();
		String[] goodscode=request.getParameter("goodscode").split(",");  
		for(int i=0;i<goodscode.length;i++)
		{
			
			mapper.move_cart(userid,goodscode[i]);
		}
		return "redirect:/mypage/wish";
	}

	@Override
	public String cart(HttpSession session, Model model) {
		
		String userid=session.getAttribute("userid").toString();
	     ArrayList<GoodsVO> list=mapper.cart(userid);
	     String str="";
	       for(int i=0;i<list.size();i++)
	       {
	    	   str=str+list.get(i).getPrice()+",";
	       }
	       model.addAttribute("str",str); //10000,20000,33333,23444, .. 이런형식
	    model.addAttribute("list",list);
	     return "/mypage/cart";
	}
	
}
