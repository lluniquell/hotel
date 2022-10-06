package kr.co.hotel_admin.controller;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.PrintWriter;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import kr.co.hotel_admin.service.ProductService;

@Controller
public class ProductController {

    @Autowired
    @Qualifier("ps")
    private ProductService service;

    @RequestMapping("/product/pro_write")
    public String pro_write(Model model) {
        return service.pro_write(model);
    }

    @RequestMapping("/product/getbunho")
	public void bunho(HttpServletRequest request,PrintWriter out)
	{
		service.getbunho(request,out);
	}

	@RequestMapping("/product/product_ok")
	public String product_ok(HttpServletRequest request)
	{
		return service.product_ok(request);
	}

    @RequestMapping("/product/pro_list")
    public String pro_list(HttpServletRequest request,Model model) {
        return service.pro_list(request,model);
    }

    @RequestMapping("/product/pro_content")
    public String pro_content(HttpServletRequest request,Model model) {
        return service.pro_content(request,model);
    }

    @RequestMapping("/product/pro_edit_list")
    public String pro_edit_list(HttpServletRequest request,Model model) {
        return service.pro_edit_list(request,model);
    }
    @RequestMapping("/product/pro_edit")
    public String pro_edit(HttpServletRequest request,Model model) {
        return service.pro_edit(request,model);
    }
    @RequestMapping("/product/pro_edit_ok")
    public String pro_edit_ok(HttpServletRequest request) {
        return service.pro_edit_ok(request);
    }


}
