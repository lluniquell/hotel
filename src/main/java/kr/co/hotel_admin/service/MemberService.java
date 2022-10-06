package kr.co.hotel_admin.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import kr.co.hotel_admin.vo.CaskVO;
import kr.co.hotel_admin.vo.MemberVO;

public interface MemberService {
 
	public String member_list(HttpServletRequest request,Model model);
    public String dobae();
    public String member_content(HttpServletRequest request,Model model);
	public String state_change(Model model);
	public void check_userid(HttpServletRequest request,PrintWriter out);
    public String update_ok(MemberVO mvo);
    public String member_delete(HttpServletRequest request);

    //qna관련
    public String qna_list(Model model,HttpServletRequest request);
    public String qna_content(HttpServletRequest request,Model model);
    public String qna_anwser_ok(CaskVO cvo);

}
