package kr.co.hotel_admin.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface ProductService {

    public String pro_write(Model model);
    public void getbunho(HttpServletRequest request,PrintWriter out);
    public String product_ok(HttpServletRequest request);
    public String pro_list(HttpServletRequest request,Model model);
    public String pro_content(HttpServletRequest request,Model model);
    public String pro_edit_list(HttpServletRequest request,Model model);
    public String pro_edit(HttpServletRequest request,Model model);
    public String pro_edit_ok(HttpServletRequest request);


}
