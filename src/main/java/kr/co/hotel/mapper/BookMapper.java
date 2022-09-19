package kr.co.hotel.mapper;

import java.util.ArrayList;

import kr.co.hotel.vo.BookVO;
import kr.co.hotel.vo.RoomVO;

public interface BookMapper {	
	public ArrayList<RoomVO> book1(String checkin, String checkout, String person);
	public RoomVO book2(BookVO bvo);
	public void makebook(BookVO bvo);
	public Integer getCode(String sales);
	public BookVO book3(String salescode);
	public ArrayList<BookVO> list(String userid);
	public void book_cancel(String salescode);
}
