package kr.co.teampro.mapper;

import java.util.ArrayList;

import org.springframework.ui.Model;

import kr.co.teampro.vo.AnswerVo;
import kr.co.teampro.vo.FaqVo;
import kr.co.teampro.vo.HugiVo;
import kr.co.teampro.vo.PqnaVo;
import kr.co.teampro.vo.QnaVo;
import kr.co.teampro.vo.ReviewVo;
import kr.co.teampro.vo.TeamproVo;

public interface TeamproMapper_cus {
	
	public void qna_write_ok(QnaVo qvo); // 문의 작성
	
	public ArrayList<QnaVo> qna_list_cus(String id, int index); // 문의 목록(회원)
	public int getchong_cus(String userid); // 문의 목록 페이징 : 총 페이지값 구하기(회원)
	
	public QnaVo qna_content(String id); // 문의 내용
	public void qna_delete(String id); // 문의 삭제
	public void qna_update_ok(QnaVo qvo); // 문의 수정
	
	public AnswerVo qna_answer(String id); // 문의 답변 불러오기
	
	
	public ArrayList<FaqVo> faq_list(); // faq 목록(all)
	public ArrayList<FaqVo> faq_re(); // faq 목록(예약)
	public ArrayList<FaqVo> faq_ser(); // faq 목록(서비스)
	public ArrayList<FaqVo> faq_mem(); // faq 목록(회원)
	public ArrayList<FaqVo> faq_etc(); // faq 목록(기타)

	
	
	public int getGrade(String bid); // 예약방의 grade구하기
	public void hugi_write_ok(HugiVo hvo); // 이용 후기 작성
	public ArrayList<HugiVo> hugi_list(int index); // 이용 후기 목록
	public int getchong_hugi_ad(); // 이용 후기 목록 페이지
	public ArrayList<HugiVo> hugi_list_cus(String userid,int index); // 이용 후기 목록 (개인)
	public int getchong_hugi_cus(String userid); // 이용 후기 목록 페이지 (개인)
	public void hugi_readnum(String id); // 이용 후기 조회수
    public HugiVo hugi_content(String id);  // 이용 후기 본문
    public void hugi_update_ok(HugiVo hvo); // 이용 후기 수정 완료
    public String getfname(String id); // 이용 후기 파일명 가져오기
    public void hugi_delete(String id); // 이용 후기 삭제
   
    
    
    public void review_write_ok(ReviewVo rvo); // 리뷰 작성
    public int getchong_review(); // 리뷰 페이징 총페이지 //(pcode)
    public String getstarsu(int num); // 별점별 갯수
    public String getbeasu(int num);  // 배송 평가별 갯수
    public String getdesu(int num);  // 디자인 평가별 갯수
    public String getdusu(int num);  // 내구성 평가별 갯수
    public void review_state(int gid); // 리뷰 작성 상태로 바꾸기(구매 테이블)
    public ArrayList<ReviewVo> review_list(String aa,int index);  // 리뷰 리스트 -> 나중에 메개변수에 pcode넣어주기!!
    public int getcnt_review(); // 해당 상품 리뷰 총 갯수  // (String pcode) -> sql문도 #{param1}로 변경
    public Double getavg_review(); // 해당 상품 리뷰 별점 평균 // (String pcode) -> sql문도 #{param1}로 변경
    public ReviewVo review_update(String id); // 리뷰 수정
    public void review_update_ok(ReviewVo rvo); // 리뷰 수정 완료
    public String getfname_review(String id); //삭제할 파일 명
    public void review_delete(String id); // 리뷰 수정 완료
    public void goodup(String id); // 좋아요
    
    public String getptitle(String pcode); //상품 qna 상품 이름값
    public void pqna_write_ok(PqnaVo pvo); // 상품 qna 질문 작성 완료
    public ArrayList<PqnaVo> pqna_list(int index); //상품 qna 목록 ->  public ArrayList<PqnaVo> pqna_list(String pcode,int index);
    public int getchong_pqna(); // 상품 qna 목록 페이징(총페이지) //(pcode)
    public PqnaVo pqna_update(String id); // 상품 qna 수정
    public void pqna_update_ok(PqnaVo pvo);  // 상품 qna 수정 완료
    public void pqna_delete(String id); // 상품 qna 삭제 
    public void pqna_answer_ok(PqnaVo pvo); // 상품 qna 답변 완료
    public void qanswer_update_ok(PqnaVo pvo); // 상품 qna 답변  수정 완료
    
	
}
