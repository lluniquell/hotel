package kr.co.hotel_admin.mapper;

import java.util.ArrayList;

import kr.co.hotel_admin.vo.CateVO;
import kr.co.hotel_admin.vo.ProductVO;

public interface ProductMapper {
    
    public ArrayList<CateVO> pro_write();
    public Integer getbunho(String code);
    public void product_ok(ProductVO pvo);
    public ArrayList<ProductVO> pro_list(String pcode);
    public ProductVO pro_content(String pcode);
    public ArrayList<ProductVO> pro_edit_list(String pcode);
    public ProductVO pro_edit(String pcode);
    public void pro_edit_ok(ProductVO pvo);

    

}
