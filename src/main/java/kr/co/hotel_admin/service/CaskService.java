package kr.co.hotel_admin.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.hotel_admin.vo.CaskVO;

public interface CaskService {

	public String qna_write_ok(HttpSession session, CaskVO cvo);
	public String qna_list(HttpSession session, Model model, HttpServletRequest request);
	public String qna_content(HttpServletRequest request, Model model);
	public String qna_delete(HttpServletRequest request);
	public String qna_update(HttpServletRequest request, Model model);
	public String qna_update_ok(CaskVO cvo);
}
