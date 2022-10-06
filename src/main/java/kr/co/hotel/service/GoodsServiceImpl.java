package kr.co.hotel.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.hotel.mapper.AdminMapper;
import kr.co.hotel.mapper.GoodsMapper;
import kr.co.hotel.vo.PqnaVO;

@Service
@Qualifier("gs")
public class GoodsServiceImpl implements GoodsService{
	
	@Autowired
	public GoodsMapper mapper;

	
/*상품 qna*/
	@Override// 상품 qna 작성
	public String pqna_write(HttpServletRequest request, Model model)
	{
		/*
		 product 체이블 생성 되면 활성화 하기  
		String pcode=request.getParameter("pcode");
		String ptitle=tMapper.getptitle(pcode);*/
		
		return "/mypage/pqna_write";
	}
	
	@Override // 상품 qna 질문 작성 완료
    public String pqna_write_ok(HttpSession session, PqnaVO pvo)
    {
		/* System.out.println(pvo.getBimil());*/
		/*String userid=session.getAttribute("userid").toString();*/
		String userid="userid";
		
		pvo.setUserid(userid);
		
		mapper.pqna_write_ok(pvo);
		
		return "redirect:/mypage/pqna_list";
		// redirect:/product/pro_content?pcode= +pcode
    }
	
	@Override
	public String pqna_list(HttpServletRequest request, Model model)
	{
		/*
		 String pcode=request.getParameter("pcode"); 꼭 다시 살려서 mapper에 반영
		 
		 ArrayList<PqnaVo> plist=tMapper.pqna_list(pcode); 
		 model.addAttribute("pcode", pcode);
		 
		  */ 
		/*System.out.println("123");
		System.out.println(request.getParameter("rpage"));
		System.out.println("456");*/
		String sct;
		if(request.getParameter("sct")==null)
			sct="0";
		else
		    sct=request.getParameter("sct");
		
		String rpage;
		if(request.getParameter("rpage")==null || request.getParameter("rpage")== "")
			rpage="1";
		else
		  rpage=request.getParameter("rpage");
		
		 int listup;
		 if(request.getParameter("listup")==null)
			  listup=1;
		 else
			 listup=Integer.parseInt(request.getParameter("listup"));
		
		/*System.out.println("123");
		System.out.println(rpage);
		System.out.println("456");*/
		
		int qpage,qindex,qpstart,qpend,qchong;
		if(request.getParameter("qpage")==null)
			qpage=1;
		else
			qpage=Integer.parseInt(request.getParameter("qpage"));
			
		qindex=(qpage-1)*10;
		
		qpstart=qpage/10;
		if(qpage%10==0)
			qpstart=qpstart-1;
		
		qpstart=qpstart*10+1;
		qpend=qpstart+9;
		
		qchong=mapper.getchong_pqna(); //(pcode) 
		
		if(qpend>qchong)
			qpend=qchong;
		
		model.addAttribute("qpage",qpage); 
		model.addAttribute("qpstart",qpstart);
		model.addAttribute("qpend",qpend);
		model.addAttribute("qchong",qchong);
		model.addAttribute("sct", sct);
		model.addAttribute("rpage", rpage);
		
		ArrayList<PqnaVO> plist=mapper.pqna_list(qindex);
		
		for(int i=0;i<plist.size();i++)
		{
		   plist.get(i).setQuestion(plist.get(i).getQuestion().replace("\r\n","<br>"));
		   
		   if(plist.get(i).getAnswer()!=null)
		    plist.get(i).setAnswer(plist.get(i).getAnswer().replace("\r\n","<br>"));
		   
		   plist.get(i).setUserid(plist.get(i).getUserid().substring(0,2)+"***");
		}
				
		model.addAttribute("plist", plist);
		
		return "mypage/pqna_list";
	}
	
	@Override // 상품 qna 수정
	public String pqna_update(HttpServletRequest request,Model model)
	{
		String id=request.getParameter("id");
		
		PqnaVO pvo=mapper.pqna_update(id);
		
		model.addAttribute("pvo", pvo);
		return "/mypage/pqna_update";
	}
	
	@Override // 상품 qna 질문 완료
	public String pqna_update_ok(PqnaVO pvo)
	{
		mapper.pqna_update_ok(pvo);
		return "redirect:/mypage/pqna_list";
	}
	
	@Override // 상품 qna 삭제
	public String pqna_delete(HttpServletRequest request)
	{
		String id=request.getParameter("id");
		
		mapper.pqna_delete(id);
		
		return "redirect:/mypage/pqna_list";
    }
	
	@Override // 상품 qna 답변
    public String pqna_answer(HttpServletRequest request,Model model)
    {
		String id=request.getParameter("id");
		PqnaVO pvo=mapper.pqna_update(id); //update 그대로 사용
		pvo.setQuestion(pvo.getQuestion().replace("\r\n", "<br>"));
		model.addAttribute("pvo", pvo);
		return "/mypage/pqna_answer";
    }
	
	@Override // 상품 qna 답변 완료
	public String pqna_answer_ok(PqnaVO pvo)
	{
		mapper.pqna_answer_ok(pvo);
		
		return "redirect:/mypage/pqna_list";
	}
	
	@Override // 상품 qna 답변 수정
	public String qanswer_update(HttpServletRequest request, Model model)
	{
		String id=request.getParameter("id");
		
		PqnaVO pvo=mapper.pqna_update(id); //update 그대로 사용
		pvo.setQuestion(pvo.getQuestion().replace("\r\n", "<br>"));
		
		model.addAttribute("pvo", pvo);
		return "/mypage/qanswer_update";
	}
	
	@Override // 상품 qna 답변 수정 완료
	public String qanswer_update_ok(PqnaVO pvo) // 상품 qna 답변 수정 완료
	{
		mapper.qanswer_update_ok(pvo);
		
		return "redirect:/mypage/pqna_list";
	}
}
