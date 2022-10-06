package kr.co.hotel.mapper;

import java.util.ArrayList;

import kr.co.hotel.vo.FaqVO;

public interface FaqMapper {	
	public ArrayList<FaqVO> faq_list(); // faq 목록(all)
	public ArrayList<FaqVO> faq_re(); // faq 목록(예약)
	public ArrayList<FaqVO> faq_ser(); // faq 목록(서비스)
	public ArrayList<FaqVO> faq_mem(); // faq 목록(회원)
	public ArrayList<FaqVO> faq_etc(); // faq 목록(기타)
}
