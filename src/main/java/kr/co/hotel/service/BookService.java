package kr.co.hotel.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface BookService {

	public String book1(HttpServletRequest request, Model model);
}
