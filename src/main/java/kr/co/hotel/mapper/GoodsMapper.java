package kr.co.hotel.mapper;

import java.util.ArrayList;

import kr.co.hotel.vo.PqnaVO;

public interface GoodsMapper {
    public String getptitle(String pcode); //상품 qna 상품 이름값
    public void pqna_write_ok(PqnaVO pvo); // 상품 qna 질문 작성 완료
    public ArrayList<PqnaVO> pqna_list(int index); //상품 qna 목록 ->  public ArrayList<PqnaVo> pqna_list(String pcode,int index);
    public int getchong_pqna(); // 상품 qna 목록 페이징(총페이지) //(pcode)
    public PqnaVO pqna_update(String id); // 상품 qna 수정
    public void pqna_update_ok(PqnaVO pvo);  // 상품 qna 수정 완료
    public void pqna_delete(String id); // 상품 qna 삭제 
    public void pqna_answer_ok(PqnaVO pvo); // 상품 qna 답변 완료
    public void qanswer_update_ok(PqnaVO pvo); // 상품 qna 답변  수정 완료
}
