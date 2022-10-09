package kr.co.hotel.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import kr.co.hotel.vo.NoticeVO;

public interface NoticeService {
    public String notice_list(Model model,HttpServletRequest request);
    public String notice_readnum(HttpServletRequest request);
    public String notice_content(Model model,HttpServletRequest request);
}
