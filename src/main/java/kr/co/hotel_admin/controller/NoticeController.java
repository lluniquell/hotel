package kr.co.hotel_admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hotel_admin.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	@Qualifier("ns")
	private NoticeService service;

	@RequestMapping("/notice/notice_list")
	public String notice_list(Model model,HttpServletRequest request) {

		return service.notice_list(model,request);
	}

	@RequestMapping("/notice/notice_readnum")
	public String notice_readnum(HttpServletRequest request) {

		return service.notice_readnum(request);
	}

	@RequestMapping("/notice/notice_content")
	public String notice_content(Model model,HttpServletRequest request) {

		return service.notice_content(model,request);
	}
	@RequestMapping("/notice/notice_write")
	public String notice_write() {

		return "notice/notice_write";
	}
	@RequestMapping("/notice/notice_write_ok")
	public String notice_write_ok(HttpServletRequest request) {
         System.out.println(request);
		return service.notice_write_ok(request);
	}
	@RequestMapping("/notice/notice_delete")
	public String notice_delete(HttpServletRequest request) {

		return service.notice_delete(request);
	}
	@RequestMapping("/notice/notice_update")
	public String notice_update(HttpServletRequest request,Model model) {

		return service.notice_update(request,model);
	}
	@RequestMapping("/notice/notice_update_ok")
	public String notice_update_ok(HttpServletRequest request) {

		return service.notice_update_ok(request);
	}
	
}


