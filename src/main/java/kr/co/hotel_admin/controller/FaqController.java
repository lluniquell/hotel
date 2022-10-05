package kr.co.hotel_admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import kr.co.hotel_admin.service.FaqService;

@Controller
public class FaqController {

	@Autowired
	@Qualifier("fs")
	private FaqService service;
}
