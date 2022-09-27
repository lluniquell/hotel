package kr.co.hotel.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Random;

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

	@Override
	public String goods_order_ok(OrderlistVO ovo, HttpSession session) {
		 
		String userid=session.getAttribute("userid").toString();
         ovo.setUserid(userid);
         
      // 주문번호생성 => 구입일+4자리
 		// 가장 높은 주문번호를 가져오기
         LocalDate now = LocalDate.now();
         String[] today=now.toString().split("-");
          
 		Integer number=mapper.getOrdercode(userid);
 		number++;  // 4자리로 변경
 		
       String num=number.toString();
		
		if(num.length()==1)
			num="000"+num;
		else if(num.length()==2)
		        num="00"+num;
			 else if(num.length()==3)
		             num="0"+num;
		
		String ordercode=today[0]+today[1]+today[2]+num;
		//      ordercode=   yyyy + mm + dd + num; 
		ovo.setOrdercode(ordercode);
         
		// 송장번호
		
		
         
		String[] gcode=ovo.getGoodscode().split(",");
		String[] imsi_qty=ovo.getImsi_qty().split(",");
		String[] imsi_price=ovo.getImsi_price().split(",");
		for(int i=0;i<gcode.length;i++)
		{
			ovo.setGoodscode(gcode[i]);
            ovo.setQty(Integer.parseInt(imsi_qty[i]));
            ovo.setTotalprice(Integer.parseInt(imsi_price[i]));
		    mapper.goods_order_ok(ovo);
		}
		
		return "redirect:/main/index";
	}

}
