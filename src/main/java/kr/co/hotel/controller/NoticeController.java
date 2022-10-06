package kr.co.hotel.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hotel.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	@Qualifier("ns")
	private NoticeService service;

	@RequestMapping("/cus_notice/notice_list")
	public String notice_list(Model model,HttpServletRequest request) {

		return service.notice_list(model,request);
	}

	@RequestMapping("/cus_notice/notice_readnum")
	public String notice_readnum(HttpServletRequest request) {

		return service.notice_readnum(request);
	}

	@RequestMapping("/cus_notice/notice_content")
	public String notice_content(Model model,HttpServletRequest request) {

		return service.notice_content(model,request);
	}
}