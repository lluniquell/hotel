package kr.co.hotel.mapper;

import java.util.ArrayList;

import kr.co.hotel.vo.BookVO;
import kr.co.hotel.vo.RoomVO;

public interface BookMapper {
	public ArrayList<RoomVO> exceptroom(String checkin, String checkout, String person);
	public ArrayList<RoomVO> book1();
	public RoomVO book2(BookVO bvo);
	public void makebook(BookVO bvo);
	public Integer getCode(String sales);
	public BookVO book3(String salescode);
}
