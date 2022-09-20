package kr.co.hotel.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.hotel.mapper.AdminMapper;
import kr.co.hotel.mapper.OrderlistMapper;
import kr.co.hotel.vo.OrderlistVO;

@Service
@Qualifier("os")
public class OrderlistServiceImpl implements OrderlistService {

	@Autowired
	public OrderlistMapper mapper;

	@Override
	public String orderlist(HttpSession session, Model model) {
		String userid=session.getAttribute("userid").toString();
		ArrayList<OrderlistVO> olist=mapper.list(userid);
		
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
