package kr.co.hotel.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hotel.service.FaqService;
import kr.co.hotel.vo.FaqVO;

@Controller
public class FaqController {

	@Autowired
	@Qualifier("fs")
	private FaqService service;
	

/*faq 자주묻는 질문 */
		
	@RequestMapping("/cus_faq/faq_list") // faq 목록
	public String faq_list(Model model)
	{
		return service.faq_list(model);
	}
}
