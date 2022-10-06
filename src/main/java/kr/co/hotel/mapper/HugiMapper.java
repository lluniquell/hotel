package kr.co.hotel.mapper;

import java.util.ArrayList;

import kr.co.hotel.vo.HugiVO;

public interface HugiMapper {
	
	public int getGrade(String bid); // 예약방의 grade구하기
	public void hugi_write_ok(HugiVO hvo); // 이용 후기 작성
	public ArrayList<HugiVO> hugi_list(int index); // 이용 후기 목록
	public int getchong_hugi_ad(); // 이용 후기 목록 페이지
	public ArrayList<HugiVO> hugi_list_cus(String userid,int index); // 이용 후기 목록 (개인)
	public int getchong_hugi_cus(String userid); // 이용 후기 목록 페이지 (개인)
	public void hugi_readnum(String id); // 이용 후기 조회수
    public HugiVO hugi_content(String id);  // 이용 후기 본문
    public void hugi_update_ok(HugiVO hvo); // 이용 후기 수정 완료
    public String getfname(String id); // 이용 후기 파일명 가져오기
    public void hugi_delete(String id); // 이용 후기 삭제
}
