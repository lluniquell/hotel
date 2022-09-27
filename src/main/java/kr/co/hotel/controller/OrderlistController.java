package kr.co.hotel.controller;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hotel.service.OrderlistService;
import kr.co.hotel.vo.OrderlistVO;

@Controller
public class OrderlistController {

	@Autowired
	@Qualifier("os")
	private OrderlistService service;
	
	@RequestMapping("orderlist/list")
	public String orderlist(HttpSession session, Model model)
	{
		return service.orderlist(session, model);
	}
	
	@RequestMapping("orderlist/content")
	public String content(OrderlistVO ovo, Model model)
	{
		return service.content(ovo, model);
	}
	
	@RequestMapping("/mypage/goods_order_ok")
	public String goods_order_ok(OrderlistVO ovo,HttpSession session)
	{
		return service.goods_order_ok(ovo,session);
	}
}
