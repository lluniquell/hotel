package kr.co.hotel_admin.service;

import java.net.URLEncoder;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.hotel_admin.mapper.NoticeMapper;
import kr.co.hotel_admin.vo.NoticeVO;

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

	@Override
	public String notice_write_ok(HttpServletRequest request) {
		// 라이브러리를 이용하여 폼태그에 값을 가져오기
		String path=request.getRealPath("/resources/img/notice");
		int size=1024*1024*20;
		NoticeVO nvo=new NoticeVO();
		try
		{
		  MultipartRequest multi=new MultipartRequest(request,path,size,"utf-8",new DefaultFileRenamePolicy());
		  // 폼값 가져오기

		  nvo.setTitle(multi.getParameter("title"));
		  nvo.setContent(multi.getParameter("content"));
		  nvo.setFname(multi.getFilesystemName("fname"));
		  nvo.setState(Integer.parseInt(multi.getParameter("state")));
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		mapper.notice_write_ok(nvo);
		return "redirect:/notice/notice_list?page=1";
	}

	@Override
	public String notice_delete(HttpServletRequest request) {
		String id=request.getParameter("id");
		mapper.notice_delete(id);
		return "redirect:/notice/notice_list?page=1";
	}

	@Override
	public String notice_update(HttpServletRequest request,Model model) {
		
		String id=request.getParameter("id");
		model.addAttribute("nvo", mapper.notice_content(id));
		
		
		return "/notice/notice_update";
	}

	@Override
	public String notice_update_ok(HttpServletRequest request) {

		String path=request.getRealPath("/resources/img/notice");
		int size=1024*1024*20;
		NoticeVO nvo=new NoticeVO();
		try
		{
		  MultipartRequest multi=new MultipartRequest(request,path,size,"utf-8",new DefaultFileRenamePolicy());

		  nvo.setId(Integer.parseInt(multi.getParameter("id")));
		  nvo.setTitle(multi.getParameter("title"));
		  nvo.setContent(multi.getParameter("content"));
		  nvo.setFname(multi.getFilesystemName("fname"));
		  nvo.setState(Integer.parseInt(multi.getParameter("state")));
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		mapper.notice_update_ok(nvo);
		return "redirect:/notice/notice_list?page=1";
      
	   }	    	
}
