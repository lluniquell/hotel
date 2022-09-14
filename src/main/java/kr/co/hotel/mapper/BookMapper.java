package kr.co.hotel.mapper;

import java.util.ArrayList;

import kr.co.hotel.vo.BookVO;
import kr.co.hotel.vo.RoomVO;

public interface BookMapper {
	public ArrayList<BookVO> book1(String checkin, String checkout, String person);
	public RoomVO book2(BookVO bvo);
	public void book3(BookVO bvo);
}
