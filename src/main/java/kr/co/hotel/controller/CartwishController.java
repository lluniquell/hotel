package kr.co.hotel.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hotel.service.CartwishService;
import kr.co.hotel.vo.DeliveryVO;

@Controller
public class CartwishController {
	
	@Autowired
	@Qualifier("cs")
	private CartwishService service;
	
	@RequestMapping("/mypage/wish_del")
	public String wish_del(HttpServletRequest request)
	{
		return service.wish_del(request);
	}
	@RequestMapping("mypage/move_cart")
	public String move_cart(HttpServletRequest request,HttpSession session)
	{
		return service.move_cart(request,session);
	}
	@RequestMapping("mypage/cart")
	public String cart(HttpSession session,Model model)
	{
		return service.cart(session,model);				
	}
	@RequestMapping("mypage/cart_del")
	public String cart_del(HttpServletRequest request)
	{
		return service.cart_del(request);				
	}
	
	@RequestMapping("/mypage/goods_order")
	public String goods_order(HttpServletRequest request,Model model,HttpSession session)
	{
		return service.goods_order(request,model,session);
	}
	@RequestMapping("/mypage/delivery_list")
	public String delivery_list(HttpSession session,Model model)
	{
		return service.delivery_list(session,model);
	}
	@RequestMapping("/mypage/del_add_ok")
	public String del_add_ok(DeliveryVO dvo,HttpSession session)
	{
		return service.del_add_ok(dvo,session);
	}
	@RequestMapping("/mypage/delivery_del")
	public String delivery_del(HttpServletRequest request,HttpSession session)
	{
		return service.delivery_del(request,session);
	}
	@RequestMapping("/mypage/delivery_update")
	public String delivery_update(HttpServletRequest request,Model model)
	{
		return service.delivery_update(request,model);
	}
	@RequestMapping("/mypage/delivery_update_ok")
	public String delivery_update_ok(DeliveryVO dvo,HttpSession session)
	{
		return service.delivery_update_ok(dvo,session);
	}
}
