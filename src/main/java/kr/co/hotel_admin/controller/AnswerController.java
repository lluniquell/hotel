package kr.co.hotel_admin.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import kr.co.hotel_admin.service.AnswerService;

@Controller
public class AnswerController {

	@Autowired
	@Qualifier("as")
	private AnswerService service;
	
}
