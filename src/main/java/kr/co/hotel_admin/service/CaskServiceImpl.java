package kr.co.hotel_admin.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.hotel_admin.mapper.CaskMapper;
import kr.co.hotel_admin.vo.CaskVO;

@Service
@Qualifier("cs")
public class CaskServiceImpl implements CaskService {

	@Autowired
	public CaskMapper mapper;
	
	@Override
	public String qna_write_ok(HttpSession session, CaskVO cvo)
	{
		mapper.qna_write_ok(cvo);
		
		return "redirect:/cus_qna/qna_list";
	}
	
	@Override
	public String qna_list(HttpSession session, Model model, HttpServletRequest request)
	{
		//String userid=session.getAttribute("userid").toString();
		String userid=request.getParameter("userid");
		/*나중에 세션값으로 userid state(관리자인가)를 받아서 조건문 변경하기*/
		if(userid!=null)/* 관리자가 아니라면*/ /*if(state == 1): 관리자가 state1이라는 가정하에*/
		{
		   ArrayList<CaskVO> list1=mapper.qna_list_cus(userid);
		   model.addAttribute("list", list1);
		}
		else
		{
		  ArrayList<CaskVO> list2=mapper.qna_list_ad();
		  model.addAttribute("list", list2);
		}			
		
		return "/cus_qna/qna_list";
	}
	
	@Override
	public String qna_content(HttpServletRequest request, Model model)
	{
		String id=request.getParameter("id");
		CaskVO cvo=mapper.qna_content(id);
	    cvo.setContent(cvo.getContent().replace("\r\n", "<br>"));	    
	    model.addAttribute("qvo", cvo);
		
		return "/cus_qna/qna_content";
	}
	
	@Override
	public String qna_delete(HttpServletRequest request)
	{
		String id=request.getParameter("id");		
		mapper.qna_delete(id);
		
		return "redirect:/cus_qna/qna_list";
	}
	
	@Override
	public String qna_update(HttpServletRequest request, Model model)
	{
		String id=request.getParameter("id");
		CaskVO cvo=mapper.qna_content(id);
	    model.addAttribute("qvo",cvo);
	    
		return "/cus_qna/qna_update";
	}
	
	@Override
	public String qna_update_ok(CaskVO cvo)
	{
		int id=cvo.getId();
		mapper.qna_update_ok(cvo);
		
		return "redirect:/cus_qna/qna_content?id="+id;
	}
}


