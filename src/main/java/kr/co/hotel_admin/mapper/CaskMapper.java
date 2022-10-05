package kr.co.hotel_admin.mapper;

import java.util.ArrayList;

import kr.co.hotel_admin.vo.CaskVO;

public interface CaskMapper {
	
	public void qna_write_ok(CaskVO cvo);
	public ArrayList<CaskVO> qna_list_cus(String id);
	public ArrayList<CaskVO> qna_list_ad();
	public CaskVO qna_content(String id);
	public void qna_delete(String id);
	public void qna_update_ok(CaskVO cvo);

}
