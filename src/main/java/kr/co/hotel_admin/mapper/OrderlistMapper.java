package kr.co.hotel_admin.mapper;

import java.util.ArrayList;

import kr.co.hotel_admin.vo.OrderlistVO;

public interface OrderlistMapper {
	public ArrayList<OrderlistVO> list();
	public OrderlistVO content(OrderlistVO ovo);
}
