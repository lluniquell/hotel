package kr.co.hotel.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.hotel.vo.DeliveryVO;

public interface CartwishService {

	public String wish_del(HttpServletRequest request);
	public String move_cart(HttpServletRequest request,HttpSession session);
	
	public String cart(HttpSession session,Model model);
	public String cart_del(HttpServletRequest request);

	//구매관련
	public String goods_order(HttpServletRequest request,Model model,HttpSession session);
	
	//배송
	
	public String delivery_list(HttpSession session,Model model);		
	public String del_add_ok(DeliveryVO dvo,HttpSession session);		
	public String delivery_del(HttpServletRequest request,HttpSession session);		
	public String delivery_update(HttpServletRequest request,Model model);		
	public String delivery_update_ok(DeliveryVO dvo,HttpSession session);


}
