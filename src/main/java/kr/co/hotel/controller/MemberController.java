package kr.co.hotel.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hotel.service.MemberService;
import kr.co.hotel.vo.MemberVO;

@Controller
public class MemberController {
	@Autowired
	@Qualifier("ms")
	private MemberService service;
	
	
	// 회원가입부분
   @RequestMapping("/member/member_input")
   public String member_input()
   {
	   return "/member/member_input";
   }
   @RequestMapping("/member/member_input_ok")
   public String member_input_ok(MemberVO mvo)
   {
	   return service.member_input_ok(mvo);
   }
   @RequestMapping("/member/member_input_final")
   public String member_input_final()
   {
	   return "/member/member_input_final";
   }
   
   @RequestMapping("/member/check_userid")
   public void check_userid(HttpServletRequest request,PrintWriter out)
   {
	   service.check_userid(request,out);
   }
   
  // 로그인관련부분   
   @RequestMapping("/login/login")
   public String login(HttpServletRequest request,Model model)
   {
	   return service.login(request,model);
   }
   @RequestMapping("/login/login_ok")
   public String login_ok(MemberVO mvo,HttpSession session)
   {
	   return service.login_ok(mvo,session);
   }
   @RequestMapping("/logout")
   public String logout(HttpSession session)
   {
	   session.invalidate();
	   return "redirect:/main/index";
   }
   
   
   //아이디 ,비밀번호 찾기
   @RequestMapping("/login/userid_search")
   public String userid_search()
   {
	   return "/login/userid_search";
   }
   @RequestMapping("/login/pwd_search")
   public String pwd_search()
   {
	   return "/login/pwd_search";
   }
   
   //아이디 ,비밀번호 찾기 (아작스 부분 )
   @RequestMapping("/login/searching_userid")
    public void searching_userid(HttpServletRequest request,PrintWriter out)
    {
	   service.searching_userid(request,out);
    }
   @RequestMapping("/login/searching_pwd")
   public void searching_pwd(HttpServletRequest request,PrintWriter out)
   {
	   service.searching_pwd(request,out);
   }
   
   // 임시로 list 하나 만듬 
    @RequestMapping("list")
    public String list()
    {
    	return "list";
    }
    
    // mypage 부분
    
    @RequestMapping("/mypage/myinfo")
    public String myinfo(HttpSession session,Model model)
    {
    	return service.myinfo(session,model);
    }
    @RequestMapping("/mypage/pwd_change")
    public String pwd_change()
    {
    	return "/mypage/pwd_change";
    }
    @RequestMapping("/mypage/pwd_change_ok")
    public String pwd_change_ok(HttpServletRequest request,HttpSession session)
    {
    	return service.pwd_change_ok(request,session);
    }
    @RequestMapping("/mypage/my_update")
    public String my_update(HttpSession session,Model model)
    {
    	return service.my_update(session,model);
    }
    @RequestMapping("/mypage/my_update_ok")
    public String my_update_ok(MemberVO mvo,HttpSession session)
    {
    	return service.my_update_ok(mvo,session);
    }
    @RequestMapping("/mypage/member_out")
    public String member_out()
    {
    	return "/mypage/member_out";
    }
    @RequestMapping("/mypage/member_out_ok")    
    public String member_out(HttpSession session,HttpServletRequest request)
    {
    	return service.member_out_ok(session,request);
    }
    
    // qna 관련
    @RequestMapping("/mypage/my_qna")
    public String my_qna(HttpSession session,Model model)
    {
    	return service.my_qna(session,model);
    }
    @RequestMapping("/mypage/qna_content")
    public String qna_content(HttpServletRequest request,Model model)
    {
    	return service.qna_content(request,model);
    }
   
}
