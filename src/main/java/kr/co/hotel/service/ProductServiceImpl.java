package kr.co.hotel.service;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import com.oreilly.servlet.MultipartRequest;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import kr.co.hotel.mapper.ProductMapper;
import kr.co.hotel.vo.CateVO;
import kr.co.hotel.vo.ProductVO;

@Service
@Qualifier("ps")
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductMapper mapper;

    @Override
    public String pro_write(Model model) {
        ArrayList<CateVO> list = mapper.pro_write();
        model.addAttribute("list", list);
       return "product/pro_write";
    }

    @Override
	public void getbunho(HttpServletRequest request, PrintWriter out) {
		 String code=request.getParameter("code");
		 Integer bunho=mapper.getbunho(code);
		 out.print(bunho);
	}

    @Override
	public String product_ok(HttpServletRequest request) {
	
		String path=request.getRealPath("/resources/img/product");
		int size=1024*1024*20;
		ProductVO pvo=new ProductVO();
		try
		{
		  MultipartRequest multi=new MultipartRequest(request,path,size,"utf-8",new DefaultFileRenamePolicy());
		  

		  pvo.setPcode(multi.getParameter("pcode"));
		  pvo.setPimg1(multi.getFilesystemName("pimg1"));
		  pvo.setPimg2(multi.getFilesystemName("pimg2"));
		  pvo.setPimg3(multi.getFilesystemName("pimg3"));
		  pvo.setCimg(multi.getFilesystemName("cimg"));
		  pvo.setTitle(multi.getParameter("title"));
		  pvo.setPrice(Integer.parseInt(multi.getParameter("price")));
		  pvo.setMade(multi.getParameter("made"));
		  pvo.setHalin(Integer.parseInt(multi.getParameter("halin")));
		  pvo.setSu(Integer.parseInt(multi.getParameter("su")));
		  pvo.setBaesong(Integer.parseInt(multi.getParameter("baesong")));
		  pvo.setBaeday(Integer.parseInt(multi.getParameter("baeday")));
		}
		catch(Exception e)
		{
            e.printStackTrace();
		}
		mapper.product_ok(pvo);
		return "/product/pro_list";
	}

    @Override
    public String pro_list(HttpServletRequest request, Model model) {
        String pcode=request.getParameter("pcode");
        ArrayList<ProductVO> list = mapper.pro_list(pcode);
        model.addAttribute("list", list);
        return "product/pro_list";
    }

    @Override
    public String pro_content(HttpServletRequest request, Model model) {
        String pcode=request.getParameter("pcode");
        ProductVO pvo = mapper.pro_content(pcode);
        model.addAttribute("pvo", pvo);
        return "/product/pro_content";
    }

	@Override
	public String pro_edit_list(HttpServletRequest request, Model model) {
		String pcode=request.getParameter("pcode");
		ArrayList<ProductVO> list = mapper.pro_edit_list(pcode);
		model.addAttribute("list", list);
		return "product/pro_edit_list";
	}
	@Override
	public String pro_edit(HttpServletRequest request, Model model) {
	    String pcode=request.getParameter("pcode");
	    ProductVO pvo=mapper.pro_edit(pcode);
	    model.addAttribute("pvo", pvo);
		System.out.println(pcode+"-------------------");
		return "/product/pro_edit";
	}
	@Override
	public String pro_edit_ok(HttpServletRequest request) {
		String path=request.getRealPath("/resources/img/product");
		int size=1024*1024*20;
		ProductVO pvo=new ProductVO();
		try
		{
		  MultipartRequest multi=new MultipartRequest(request,path,size,"utf-8",new DefaultFileRenamePolicy());
		  
		  pvo.setPcode(multi.getParameter("pcode"));
		  pvo.setPimg1(multi.getFilesystemName("pimg1"));
		  pvo.setPimg2(multi.getFilesystemName("pimg2"));
		  pvo.setPimg3(multi.getFilesystemName("pimg3"));
		  pvo.setCimg(multi.getFilesystemName("cimg"));
		  pvo.setTitle(multi.getParameter("title"));
		  pvo.setPrice(Integer.parseInt(multi.getParameter("price")));
		  pvo.setMade(multi.getParameter("made"));
		  pvo.setHalin(Integer.parseInt(multi.getParameter("halin")));
		  pvo.setSu(Integer.parseInt(multi.getParameter("su")));
		  pvo.setBaesong(Integer.parseInt(multi.getParameter("baesong")));
		  pvo.setBaeday(Integer.parseInt(multi.getParameter("baeday")));
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mapper.pro_edit_ok(pvo);
		return "/product/pro_edit_list";
	}
}



