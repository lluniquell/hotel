package kr.co.hotel.mapper;

import java.util.ArrayList;

import kr.co.hotel.vo.OrderlistVO;

public interface OrderlistMapper {
	public ArrayList<OrderlistVO> list(String userid);
	public OrderlistVO content(OrderlistVO ovo);

	public Integer getOrdercode(String id);
	public void goods_order_ok(OrderlistVO ovo);
}
