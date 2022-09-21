package kr.co.hotel.mapper;

import java.util.ArrayList;

import kr.co.hotel.vo.GoodsVO;

public interface CartwishMapper {

	public void wish_del(String id);
	public void move_cart(String userid,String goodscode);
  
	public ArrayList<GoodsVO> cart(String userid);
}
