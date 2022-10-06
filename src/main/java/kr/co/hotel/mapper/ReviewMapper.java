package kr.co.hotel.mapper;

import java.util.ArrayList;

import kr.co.hotel.vo.ReviewVO;

public interface ReviewMapper {
    public void review_write_ok(ReviewVO rvo); // 리뷰 작성
    public int getchong_review(); // 리뷰 페이징 총페이지 //(pcode)
    public String getstarsu(int num); // 별점별 갯수
    public String getbeasu(int num);  // 배송 평가별 갯수
    public String getdesu(int num);  // 디자인 평가별 갯수
    public String getdusu(int num);  // 내구성 평가별 갯수
    public void review_state(int gid); // 리뷰 작성 상태로 바꾸기(구매 테이블)
    public ArrayList<ReviewVO> review_list(String aa,int index);  // 리뷰 리스트 -> 나중에 메개변수에 pcode넣어주기!!
    public int getcnt_review(); // 해당 상품 리뷰 총 갯수  // (String pcode) -> sql문도 #{param1}로 변경
    public Double getavg_review(); // 해당 상품 리뷰 별점 평균 // (String pcode) -> sql문도 #{param1}로 변경
    public ReviewVO review_update(String id); // 리뷰 수정
    public void review_update_ok(ReviewVO rvo); // 리뷰 수정 완료
    public String getfname_review(String id); //삭제할 파일 명
    public void review_delete(String id); // 리뷰 수정 완료
    public void goodup(String id); // 좋아요
}
