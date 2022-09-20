package kr.co.hotel.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.hotel.vo.OrderlistVO;

public interface OrderlistService {
	public String orderlist(HttpSession session, Model model);
	public String content(OrderlistVO ovo, Model model);
}
