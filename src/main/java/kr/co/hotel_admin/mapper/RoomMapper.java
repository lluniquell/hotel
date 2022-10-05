package kr.co.hotel_admin.mapper;

import java.util.ArrayList;

import kr.co.hotel_admin.vo.RoomVO;

public interface RoomMapper {
	public ArrayList<RoomVO> list();
	public void add_room_ok(RoomVO rvo);
	public RoomVO update_room(RoomVO rvo);
	public void del_room(RoomVO rvo);
}
