package kr.co.hotel_admin.controller;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hotel_admin.service.OrderlistService;
import kr.co.hotel_admin.vo.OrderlistVO;

@Controller
public class OrderlistController {

	@Autowired
	@Qualifier("os")
	private OrderlistService service;
	
	@RequestMapping("orderlist/list")
	public String orderlist(Model model)
	{
		return service.orderlist(model);
	}
	
	@RequestMapping("orderlist/content")
	public String content(OrderlistVO ovo, Model model)
	{
		return service.content(ovo, model);
	}
}
