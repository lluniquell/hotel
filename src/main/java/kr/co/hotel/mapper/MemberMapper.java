package kr.co.hotel.mapper;

import java.util.ArrayList;

import kr.co.hotel.vo.CaskVO;
import kr.co.hotel.vo.MemberVO;

public interface MemberMapper {
 
	public void member_input_ok(MemberVO mvo);
	public int check_userid(String userid);
    public String get_userid(String name,String ymd);
    public String get_pwd(String userid,String name,String phone);
    
    public MemberVO login_ok(MemberVO mvo);
    public MemberVO myinfo(String userid);
    
    public String get_dbpwd(String userid,String pwd);
    public void pwd_change_ok(String userid,String pwd1);
    
    public void my_update_ok(MemberVO mvo);
    
    public int check_member(String userid,String pwd);
    public void member_state1(String userid);
    
    //qna관련
    public ArrayList<CaskVO> qna_list_cus(String userid);
}
