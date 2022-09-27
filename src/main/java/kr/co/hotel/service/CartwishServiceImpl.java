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
import kr.co.hotel.vo.DeliveryVO;
import kr.co.hotel.vo.GoodsVO;
import kr.co.hotel.vo.MemberVO;



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

	@Override
	public String cart_del(HttpServletRequest request) {
		
		 String[] id=request.getParameter("id").split(",");
	     for(int i=0;i<id.length;i++)
		 {
	    	 mapper.cart_del(id[i]);
		 }
		 return "redirect:/mypage/cart";
	}

	
	// 상품구매    관련
	

	@Override
	public String goods_order(HttpServletRequest request, Model model, HttpSession session) {
		
		
		 // 해당상품의 정보를 뷰에 전달
				String[] gcode=request.getParameter("goodscode").split(",");
				String[] qty=request.getParameter("qty").split(",");
				String gchk=request.getParameter("gchk"); // gchk=1이면 wish통해서온것, 2이면 cart에서온것
				
				ArrayList<GoodsVO> list=new ArrayList<GoodsVO>();
				for(int i=0;i<gcode.length;i++)
				{
					GoodsVO gvo=mapper.goods_order(gcode[i]);	
				    gvo.setQty(Integer.parseInt(qty[i]));
					list.add(gvo);
				}
				model.addAttribute("gchk",gchk);
				model.addAttribute("list",list);
			
				
				// 회원정보
				String userid=session.getAttribute("userid").toString();
				MemberVO mvo=mapper.getmember(userid);
				model.addAttribute("mvo",mvo);
				
				// 배송지 정보 
				model.addAttribute("dvo",mapper.getDelivery(userid));
				
				return "/mypage/goods_order";
	}

	@Override
	public String delivery_list(HttpSession session, Model model) {
		String userid=session.getAttribute("userid").toString();
		ArrayList<DeliveryVO> dlist=mapper.delivery_list(userid);
		model.addAttribute("dlist",dlist);
		return "/mypage/delivery_list";
	}

	@Override
	public String del_add_ok(DeliveryVO dvo, HttpSession session) {
		
		String userid=session.getAttribute("userid").toString();
		dvo.setUserid(userid);
		
		mapper.del_add_ok(dvo);
		return "redirect:/mypage/delivery_list";
	}

	@Override
	public String delivery_update(HttpServletRequest request, Model model) {
		  
		String id=request.getParameter("id");
		model.addAttribute("dvo",mapper.delivery_update(id));  
		return "/mypage/delivery_update";
	}

	
}
