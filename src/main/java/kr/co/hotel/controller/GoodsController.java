package kr.co.hotel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import kr.co.hotel.service.GoodsService;

@Controller
public class GoodsController {

	@Autowired
	@Qualifier("gs")
	private GoodsService service;
}
