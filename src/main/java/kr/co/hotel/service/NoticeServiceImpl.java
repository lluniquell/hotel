package kr.co.hotel.service;

import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.hotel.mapper.NoticeMapper;
import kr.co.hotel.vo.NoticeVO;

@Service
@Qualifier("ns")
public class NoticeServiceImpl implements NoticeService{
    
	@Autowired
	private NoticeMapper mapper;

	@Override
	public String notice_list(Model model,HttpServletRequest request) {
		// 페이징 처리 추가 

		int page=Integer.parseInt(request.getParameter("page"));
		int index=(page-1)*10;

		int pstart,pend,chongpage;

		pstart=page/10;
		if(page%10==0) 
		  pstart=pstart-1;
		
		
		pstart=pstart*10+1;
		pend=pstart+9;

		// 검색할 필드와 검색단어 쿼리넘기기
		String sel,sword;
		if(request.getParameter("sel")==null)
		{
			sel="id";
			sword="";
		}
		else
		{
			sel=request.getParameter("sel");
			sword=request.getParameter("sword");
		}
		
		chongpage=mapper.getChongpage(sel,sword);
		
		if(pend>chongpage)
		{
		   pend=chongpage;
		}

		ArrayList<NoticeVO> notice_list=mapper.notice_list(sel,sword,index);
		model.addAttribute("notice_list", notice_list);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("chongpage", chongpage);
		model.addAttribute("page", page);
		model.addAttribute("sel", sel);
		model.addAttribute("sword", sword);
		
		return "/notice/notice_list";
	}

	@Override
	public String notice_readnum(HttpServletRequest request) {
		String id=request.getParameter("id");
		String page=request.getParameter("page");
		String sel=request.getParameter("sel");
		String sword=request.getParameter("sword");
		sword=URLEncoder.encode(sword);
		mapper.notice_readnum(id);

		return "redirect:/notice/notice_content?id="+id+"&page="+page+"&sel="+sel+"&sword="+sword;
	}

	@Override
	public String notice_content(Model model, HttpServletRequest request) {
		String id=request.getParameter("id");
		String page=request.getParameter("page");
		String sel=request.getParameter("sel");
		String sword=request.getParameter("sword");
	
		model.addAttribute("nvo", mapper.notice_content(id));
		model.addAttribute("page", page);
		model.addAttribute("sel", sel);
		model.addAttribute("sword", sword);
		return "/notice/notice_content";
	} 	
}