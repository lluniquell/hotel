package kr.co.hotel.mapper;

import java.util.ArrayList;

import kr.co.hotel.vo.BookVO;

public interface BookMapper {
	public ArrayList<BookVO> book1(String checkin, String checkout, String person);
	
}
