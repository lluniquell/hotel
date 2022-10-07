package kr.co.hotel.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;


import kr.co.hotel.mapper.QuestionMapper;
import kr.co.hotel.vo.AnswerVO;
import kr.co.hotel.vo.QnaVO;

@Service
@Qualifier("qs")
public class QuestionServiceImpl implements QuestionService{
	
	@Autowired
	public QuestionMapper mapper;
	

	@Override  /*1:1문의 작성*/
	public String qna_write_ok(HttpSession session, QnaVO qvo)
	{
		mapper.qna_write_ok(qvo);
		
		return "redirect:/cus_qna/qna_list";
	}
	
	@Override  /*1:1문의 목록*/
	public String qna_list(HttpSession session, Model model, HttpServletRequest request)
	{
		String userid=session.getAttribute("userid").toString();		
				
		// 문의 목록 페이징
		int page;
		if(request.getParameter("page") ==null)
			page=1;
		else
			page=Integer.parseInt(request.getParameter("page"));
		
		int index=(page-1)*10;
		int pstart,pend, chong;
		
		pstart=page/10;
		if(page%10 ==0)
			pstart=pstart-1;
		
		pstart=pstart*10+1;
		pend=pstart+9;
				
		chong=mapper.getchong_cus(userid);		
		
		if(pend>chong)
			pend=chong;
				
		model.addAttribute("page", page);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("chong", chong);
		
		
		ArrayList<QnaVO> list=mapper.qna_list_cus(userid,index);
		model.addAttribute("list", list);			
		
		return "/cus_qna/qna_list";
	}
	
	@Override /*1:1문의 본문 내용*/
	public String qna_content(HttpServletRequest request, Model model)
	{
		//  문의 내용 출력
		String id=request.getParameter("id");
	    QnaVO qvo=mapper.qna_content(id);
	    qvo.setContent(qvo.getContent().replace("\r\n", "<br>"));	    
	    model.addAttribute("qvo", qvo);
		
	    // 답변 출력
        if(qvo.getState()==1) // 문의 상태 0 => 1
        {
        	AnswerVO avo=mapper.qna_answer(id);
        	// qna_content에 바로 출력하기
    		model.addAttribute("avo", avo);
        }
        
		return "/cus_qna/qna_content";
	}
		
	@Override /*1:1문의 삭제*/
	public String qna_delete(HttpServletRequest request)
	{
		String id=request.getParameter("id");		
		mapper.qna_delete(id);
		
		return "redirect:/cus_qna/qna_list";
	}
	
	@Override /*1:1문의 수정문*/
	public String qna_update(HttpServletRequest request, Model model)
	{
		String id=request.getParameter("id");
	    QnaVO qvo=mapper.qna_content(id);
	    model.addAttribute("qvo", qvo);
	    
		return "/cus_qna/qna_update";
	}
	
	@Override /*1:1문의 수정 완료*/
	public String qna_update_ok(QnaVO qvo)
	{
		int id=qvo.getId();
		mapper.qna_update_ok(qvo);
		
		return "redirect:/cus_qna/qna_content?id="+id;
	}

	
	
		
}
