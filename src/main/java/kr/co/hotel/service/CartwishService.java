package kr.co.hotel.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface CartwishService {

	public String wish_del(HttpServletRequest request);
	public String move_cart(HttpServletRequest request,HttpSession session);
	
	public String cart(HttpSession session,Model model);
	public String cart_del(HttpServletRequest request);

	//구매관련
	public String goods_order(HttpServletRequest request,Model model,HttpSession session);


}
