package kr.co.hotel_admin.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.hotel_admin.vo.OrderlistVO;

public interface OrderlistService {
	public String orderlist(Model model);
	public String content(OrderlistVO ovo, Model model);
}
