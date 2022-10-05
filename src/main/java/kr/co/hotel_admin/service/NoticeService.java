package kr.co.hotel_admin.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface NoticeService {
    public String notice_list(Model model,HttpServletRequest request);
    public String notice_readnum(HttpServletRequest request);
    public String notice_content(Model model,HttpServletRequest request);
    public String notice_write_ok(HttpServletRequest request);
    public String notice_delete(HttpServletRequest request);
    public String notice_update(HttpServletRequest request,Model model);
    public String notice_update_ok(HttpServletRequest request);
    

}
