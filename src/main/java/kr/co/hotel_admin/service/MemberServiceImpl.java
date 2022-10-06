package kr.co.hotel_admin.service;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.hotel_admin.mapper.MemberMapper;
import kr.co.hotel_admin.vo.CaskVO;
import kr.co.hotel_admin.vo.MemberVO;

@Service
@Qualifier("ms")
public class MemberServiceImpl implements MemberService{

	@Autowired
	public MemberMapper mapper;
	
	@Override
	public String member_list(HttpServletRequest request,Model model) {
		 
		int page,start,pstart,pend;
		  //현재페이지,그 페이지의 시작인덱스
		 if(request.getParameter("page")==null)
		    page=1;
		 else
			 page=Integer.parseInt(request.getParameter("page"));
		 
		 
		 start=(page-1)*10;
		 
		 pstart=page/10;
		 if(page%10 == 0) 
		      pstart--;  
		 
		 pstart=pstart*10+1;  
			pend=pstart+9;
			
		String sel;
			   if(request.getParameter("sel")==null)
				    sel="id"; // select 필드에 없는거 아무거나줌
			 
			   else
				   sel=request.getParameter("sel");
				
		String keyword;
			if(request.getParameter("keyword")==null)
				  keyword="";
			else
				keyword=request.getParameter("keyword");
        	
			
		int chong=mapper.getchong(sel, keyword);
		if(chong <pend)
			   pend=chong;
		
		
		
        // 상태누르면 바꾸는부분	    
		String state;
	     if(request.getParameter("state")==null)
	     {
	    	 state="";
	     }
	     else
	    	 state="and state="+request.getParameter("state");
	    	
		
	
		
		 ArrayList<MemberVO> list=mapper.member_list(sel,keyword,state,start);
          if(list.size()==0)
          {
        	  model.addAttribute("none","1");
          }
            
		   model.addAttribute("list",list);
		    model.addAttribute("page",page); // 현재페이지
			model.addAttribute("pstart",pstart);
			model.addAttribute("pend",pend);
			
			model.addAttribute("chong",chong); //총페이지
			
			model.addAttribute("sel",sel);
			model.addAttribute("keyword",keyword);
			model.addAttribute("state",request.getParameter("state"));
		return "/member/member_list";
	}

	@Override
	public String dobae() { // member_list 페이징잘되나 확인차 만든거 => 나중에 삭제
		
		String userid="testa";
		
		for(int i=1;i<=50;i++)
		{
		
			mapper.dobae(userid+i);
			
		}
		
		return "redirect:/member/member_list";
	}
    
	@Override
	public String member_content(HttpServletRequest request, Model model) {
		 String id=request.getParameter("id");
		 
		 MemberVO mvo=mapper.member_content(id);
		 
		 String memo=mvo.getMemo();
		 if(memo != null)
		 {
			 mvo.setMemo(memo.replace("\r\n", "<br>")); // 메모내용 띄어쓰기            
		 }
 
		 model.addAttribute("mvo",mvo);
		 model.addAttribute("page",request.getParameter("page"));
		 model.addAttribute("sel",request.getParameter("sel"));
		 model.addAttribute("keyword",request.getParameter("keyword"));
		 
		 return "/member/member_content";
	}
	
	@Override
	public String state_change(Model model) {
		
		ArrayList<MemberVO> list=mapper.state1_list();
		model.addAttribute("list",list);
		return "/member/state_change";
	}

	@Override
	public void check_userid(HttpServletRequest request, PrintWriter out) {
		 String userid=request.getParameter("userid");
		 int chk=mapper.check_userid(userid);
		out.print(chk);
	}
	
	@Override
	public String update_ok(MemberVO mvo) {
		int id=mvo.getId();
		String page=mvo.getPage();
		String sel=mvo.getSel();
		String keyword=mvo.getKeyword();
		mapper.update_ok(mvo);
		  
		return "redirect:/member/member_content?id="+id+"&page="+page+"&sel="+sel+"&keyword="+keyword+"&chk=1";
	}

	@Override
	public String member_delete(HttpServletRequest request) {
		String id=request.getParameter("id");
		mapper.member_delete(id);
		return "redirect:/member/member_list?del=1";
	}
 
	//qna관련
	@Override
	public String qna_list(Model model,HttpServletRequest request) 
	{
		String state; // qna_list에서 select태그 밸류  > 0= 답변대기 / 1=답변완료
		if(request.getParameter("state")==null)
		{
			state="0";
		}
		else
		{
			state=request.getParameter("state");
		}
		
		 ArrayList<CaskVO> list=mapper.qna_list(state);
		 model.addAttribute("list",list);
		 model.addAttribute("state",state);
		return "/member/qna_list";
	}

	@Override
	public String qna_content(HttpServletRequest request, Model model) {
		 String id=request.getParameter("id");
		 model.addAttribute("cvo",mapper.qna_content(id));
		return "/member/qna_content";
	}

	@Override
	public String qna_anwser_ok(CaskVO cvo) {
		  mapper.qna_anwser_ok(cvo);
		return "redirect:/member/qna_content?id="+cvo.getId();
	}

	
	
}
