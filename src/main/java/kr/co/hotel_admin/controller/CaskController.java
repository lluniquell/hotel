package kr.co.hotel_admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hotel_admin.service.CaskService;
import kr.co.hotel_admin.vo.CaskVO;

@Controller
public class CaskController {

	@Autowired
	@Qualifier("cs")
	private CaskService service;
	
	@RequestMapping("/cus_qna/qna_write")
	public String qna_write()
	{
		return "/cus_qna/qna_write";
	}
	
	@RequestMapping("/cus_qna/qna_write_ok")
	public String qna_write_ok(HttpSession session, CaskVO cvo)
	{
		return service.qna_write_ok(session, cvo);
	}
	
	@RequestMapping("/cus_qna/qna_list")
	public String qna_list(HttpSession session, Model model, HttpServletRequest request)
	{
		return service.qna_list(session, model, request);
	}
	
	@RequestMapping("/cus_qna/qna_content")
	public String qna_content(HttpServletRequest request, Model model)
	{
		return service.qna_content(request, model);
	}
	
	@RequestMapping("/cus_qna/qna_delete")
	public String qna_delete(HttpServletRequest request)
	{
		return service.qna_delete(request);
	}
	
	@RequestMapping("/cus_qna/qna_update")
	public String qna_update(HttpServletRequest request, Model model)
	{
		return service.qna_update(request, model);
	}
	
	@RequestMapping("/cus_qna/qna_update_ok")
	public String qna_update_ok(CaskVO cvo)
	{
		return service.qna_update_ok(cvo);
	}
}
