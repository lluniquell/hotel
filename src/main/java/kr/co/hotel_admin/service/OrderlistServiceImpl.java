package kr.co.hotel_admin.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.hotel_admin.mapper.OrderlistMapper;
import kr.co.hotel_admin.vo.OrderlistVO;

@Service
@Qualifier("os")
public class OrderlistServiceImpl implements OrderlistService {

	@Autowired
	public OrderlistMapper mapper;

	@Override
	public String orderlist(Model model) {
		
		ArrayList<OrderlistVO> olist=mapper.list();
		
		model.addAttribute("olist",olist);
		
		return "orderlist/list";
	}

	@Override
	public String content(OrderlistVO ovo, Model model) {
		OrderlistVO ovo1=mapper.content(ovo);
		
		model.addAttribute("ovo",ovo1);
		return "orderlist/content";
	}

}
