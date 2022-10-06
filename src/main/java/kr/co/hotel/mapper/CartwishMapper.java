package kr.co.hotel.mapper;

import java.util.ArrayList;

import kr.co.hotel.vo.DeliveryVO;
import kr.co.hotel.vo.GoodsVO;
import kr.co.hotel.vo.MemberVO;


public interface CartwishMapper {

	public void wish_del(String id);
	public void move_cart(String userid,String goodscode);
  
	public ArrayList<GoodsVO> cart(String userid);
    public void cart_del(String id);

    //구매관련
    public GoodsVO goods_order(String gcode);
    public MemberVO getmember(String userid);
    public DeliveryVO getDelivery(String userid);
    
    //배송
    public ArrayList<DeliveryVO> delivery_list(String userid);
    public void del_add_ok(DeliveryVO dvo);
    public void delivery_del(String id,String userid);
    public DeliveryVO delivery_update(String id);
    public void delivery_update_ok(DeliveryVO dvo);
}
