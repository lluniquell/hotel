package kr.co.hotel.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hotel.service.HugiService;

@Controller
public class HugiController {

	@Autowired
	@Qualifier("hs")
	private HugiService service;


/*이용 후기*/
	@RequestMapping("/cus_hugi/hugi_write")  // 이용 후기 작성
	public String hugi_write(HttpServletRequest request, Model model)
	{
		return service.hugi_write(request,model);
	}	
	
	@RequestMapping("/cus_hugi/hugi_write_ok")  // 이용 후기 작성 완료
	public String hugi_write_ok(HttpSession session, HttpServletRequest request) throws Exception
	{
		return service.hugi_write_ok(session, request);
	}
	
	@RequestMapping("/cus_hugi/hugi_list") // 이용 후기 목록
	public String hugi_list(HttpServletRequest request, Model model)
	{
		return service.hugi_list(request, model);
	}
	@RequestMapping("/cus_hugi/hugi_list_cus") // 이용 후기 목록(개인)
	public String hugi_list_cus(HttpServletRequest request, HttpSession session, Model model)
	{
		return service.hugi_list_cus(request,session, model);
	}

	@RequestMapping("/cus_hugi/hugi_readnum") // 이용 후기 조회수
	public String hugi_readnum(HttpServletRequest request)
	{
	   return service.hugi_readnum(request);	
	}
	
	@RequestMapping("/cus_hugi/hugi_content") // 이용 후기 내용
	public String hugi_content(HttpServletRequest request, Model model)
	{
		return service.hugi_content(request,model);
	}
	
	@RequestMapping("/cus_hugi/hugi_update") // 이용 후기 수정
	public String hugi_update(HttpSession session, HttpServletRequest request, Model model)
	{
		return service.hugi_update(request, model);
	}
	
	@RequestMapping("/cus_hugi/hugi_update_ok") // 이용 후기 수정 완료
	public String hugi_update_ok(HttpServletRequest request) throws Exception
	{
		return service.hugi_update_ok(request);		
	}
	
	@RequestMapping("/cus_hugi/hugi_delete") // 이용 후기 삭제
	public String hugi_delete(HttpServletRequest request)
	{
	    return service.hugi_delete(request);	
	}
	
}
