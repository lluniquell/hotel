package kr.co.hotel.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.hotel.vo.MemberVO;

public interface MemberService {

	public String member_input_ok(MemberVO mvo);
	public void check_userid(HttpServletRequest request,PrintWriter out);
	public void searching_userid(HttpServletRequest request,PrintWriter out);
	public void searching_pwd(HttpServletRequest request,PrintWriter out);
     
	public String login(HttpServletRequest request,Model model);
	public String login_ok(MemberVO mvo,HttpSession session);
   
	// mypage
	public String myinfo(HttpSession session,Model model);
	public String pwd_change_ok(HttpServletRequest request,HttpSession session);
	public String my_update(HttpSession session,Model model);
	public String my_update_ok(MemberVO mvo,HttpSession session);
	public String member_out_ok(HttpSession session,HttpServletRequest request);
	
/*	//1:1상담 qna부분
    public String my_qna(HttpSession session,Model model);
    public String qna_content(HttpServletRequest request,Model model);*/

	
    public String wish(HttpSession session,Model model);
    public String cart(HttpSession session,Model model);

}
