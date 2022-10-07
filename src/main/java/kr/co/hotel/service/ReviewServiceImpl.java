package kr.co.hotel.service;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


import kr.co.hotel.mapper.ReviewMapper;
import kr.co.hotel.vo.ReviewVO;

@Service
@Qualifier("rs")
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	public ReviewMapper mapper;

/*상품 리뷰*/
	@Override  //리뷰 작성 완료
	public String review_write_ok(HttpSession session, HttpServletRequest request) throws Exception
	{		
		String path=request.getRealPath("resources/rimg");
		int size=1024*1024*10;
		MultipartRequest multi=new MultipartRequest(request, path,size,"utf-8",new DefaultFileRenamePolicy());
		
		String userid=session.getAttribute("userid").toString();
		String title=multi.getParameter("title");
		String content=multi.getParameter("content");
		String pcode=multi.getParameter("pcode");
		int star=Integer.parseInt(multi.getParameter("star"));
		int gid=Integer.parseInt(multi.getParameter("gid"));
		int bea_ev=Integer.parseInt(multi.getParameter("bea_ev"));
		int de_ev=Integer.parseInt(multi.getParameter("de_ev"));
		int du_ev=Integer.parseInt(multi.getParameter("du_ev"));
		
		String fnames="";
		Enumeration file=multi.getFileNames();
		
		while(file.hasMoreElements())
		{
			String fname=file.nextElement().toString();
			fnames=fnames+multi.getFilesystemName(fname)+",";
		}
		
		fnames=fnames.replace("null,", "");
				
		ReviewVO rvo=new ReviewVO();
		rvo.setUserid(userid); //userid  -> 섹션값 받으면 바꾸기
		rvo.setTitle(title);
		rvo.setContent(content);
		rvo.setPcode(pcode);
		rvo.setStar(star);
		rvo.setGid(gid);
		rvo.setBea_ev(bea_ev);
		rvo.setDe_ev(de_ev);
		rvo.setDu_ev(du_ev);
		rvo.setFname(fnames);
		
		mapper.review_write_ok(rvo);
		mapper.review_state(gid); // 후기 달았다는 상태로 변환
		
		return "redirect:/mypage/review_list";
	}
	
	@Override  // 리뷰 목록
	public String review_list(HttpServletRequest request, Model model)
	{
		/*String pcode=request.getParameter("pcode");
		  model.addAttribute("pcode", pcode);*/
	     String sct;
		 if(request.getParameter("sct")==null)
			sct="0";
		 else
		    sct=request.getParameter("sct");
		 String qpage;
			if(request.getParameter("qpage")==null || request.getParameter("qpage")=="")
				qpage="1";
			else
			  qpage=request.getParameter("qpage");
		 int listup;
		 if(request.getParameter("listup")==null)
			  listup=1;
		 else
			 listup=Integer.parseInt(request.getParameter("listup"));
		 
		 int rpage;
		  if(request.getParameter("rpage")==null)
		   rpage=1;
		  else
		   rpage=Integer.parseInt(request.getParameter("rpage"));
		  
		  int rindex=(rpage-1)*10;
		  int rpstart, rpend, rchong;

		  rpstart=rpage/10;    
		  if(rpage%10 == 0)
		    rpstart=rpstart-1;

		  rpstart=rpstart*10+1;
		  rpend=rpstart+9; 
		 
		  rchong=mapper.getchong_review();  

		  if(rpend>rchong)
		    rpend=rchong;
		 
		  model.addAttribute("rpage",rpage); 
		  model.addAttribute("rpstart",rpstart);
		  model.addAttribute("rpend",rpend);
		  model.addAttribute("rchong",rchong);
		  model.addAttribute("sct",sct); 
		  model.addAttribute("qpage",qpage); 
		  
		String starsu="";
		for(int i=1;i<=5;i++)
		{
		   String ss=mapper.getstarsu(i);
		   starsu=starsu+ss+",";
		}
		
		String beasu="";
		String desu="";
		String dusu="";
		for(int i=0;i<3;i++)
		{
		   String bb=mapper.getbeasu(i);
		   beasu=beasu+bb+",";
		   String dde=mapper.getdesu(i);
		   //System.out.println(dde);
		   desu=desu+dde+",";
		   String ddu=mapper.getdusu(i);
		  // System.out.println(ddu);
		   dusu=dusu+ddu+",";
		}
		/*System.out.println(beasu);
		System.out.println(desu);
		System.out.println(dusu);*/
		
		String[] star=starsu.split(",");
		String[] bea=beasu.split(",");		
		String[] de=desu.split(",");
		String[] du=dusu.split(",");
		
		ReviewVO rsu=new ReviewVO();
		rsu.setB1(Integer.parseInt(bea[0]));
		rsu.setB2(Integer.parseInt(bea[1]));
		rsu.setB3(Integer.parseInt(bea[2]));
		
		rsu.setD1(Integer.parseInt(de[0]));
		rsu.setD2(Integer.parseInt(de[1]));
		rsu.setD3(Integer.parseInt(de[2]));
		
		rsu.setDu1(Integer.parseInt(du[0]));
		rsu.setDu2(Integer.parseInt(du[1]));
		rsu.setDu3(Integer.parseInt(du[2]));
		
		rsu.setS1(Integer.parseInt(star[0]));
		rsu.setS2(Integer.parseInt(star[1]));
		rsu.setS3(Integer.parseInt(star[2]));
		rsu.setS4(Integer.parseInt(star[3]));
		rsu.setS5(Integer.parseInt(star[4]));
		
		String aa="";
	    String[] fimg;
		String img="";
		
		if(listup==1)
		{
		  aa="";
		}
		else if(listup==2)
		{
			aa="star desc ,";
		}
		else if(listup==3)
		{
			aa="star asc ,";
		}
		model.addAttribute("listup", listup); 
		ArrayList<ReviewVO> rlist=mapper.review_list(aa,rindex);
 		  
		for(int i=0;i<rlist.size();i++)
		{
     	    fimg=rlist.get(i).getFname().split(",");
		    rlist.get(i).setFimgs(fimg);
		    rlist.get(i).setContent(rlist.get(i).getContent().replace("\r","<br>"));
		    rlist.get(i).setUserid(rlist.get(i).getUserid().substring(0,2)+"***");
		    img=img+rlist.get(i).getFname();
		 }
		    
		String[] imgs=img.split(",");
	    model.addAttribute("imgs",imgs);
		int imgcnt=imgs.length;
		model.addAttribute("imgcnt", imgcnt);
				
		/*aa="star desc ,";   
		ArrayList<ReviewVo> sulist=tMapper.review_list(aa,rindex);
		
		for(int i=0;i<sulist.size();i++)
		{
		  fimg=sulist.get(i).getFname().split(",");
		  sulist.get(i).setFimgs(fimg);
		  sulist.get(i).setContent(sulist.get(i).getContent().replace("\r\n","<br>"));
		  sulist.get(i).setUserid(sulist.get(i).getUserid().substring(0,2)+"***");
		}

		aa="star asc ,";   
		ArrayList<ReviewVo> sdlist=tMapper.review_list(aa,rindex);
		
		for(int i=0;i<sdlist.size();i++)
		{
		  fimg=sdlist.get(i).getFname().split(",");
		  sdlist.get(i).setFimgs(fimg);
		  sdlist.get(i).setContent(sdlist.get(i).getContent().replace("\r\n","<br>"));
		  sdlist.get(i).setUserid(sdlist.get(i).getUserid().substring(0,2)+"***");
		}*/
		  
		int cnt=mapper.getcnt_review(); // (pcode) -> sql문도 #{param1}로 변경
		double avg=mapper.getavg_review(); // (pcode) -> sql문도 #{param1}로 변경
		rsu.setCnt(cnt);
		rsu.setAvg(avg);
		  
		int avga=(int)Math.floor(avg);
		int avgb=0;
		if(avg-avga > 0)
		 avgb=1;
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("avga", avga);
		model.addAttribute("avgb", avgb);
		  
		double tot=cnt;
		double bper0=(100*(rsu.getB1()/tot));
		int bper1=(int)(450*(rsu.getB1()/tot));
		int bper2=(int)(450*(rsu.getB2()/tot));
		int bper3=(int)(450*(rsu.getB3()/tot));

		double dper0=(100*(rsu.getD1()/tot));
		int dper1=(int)(450*(rsu.getD1()/tot));
		int dper2=(int)(450*(rsu.getD2()/tot));
		int dper3=(int)(450*(rsu.getD3()/tot));

		double duper0=(100*(rsu.getDu1()/tot));
		int duper1=(int)(450*(rsu.getDu1()/tot));
		int duper2=(int)(450*(rsu.getDu2()/tot));
		int duper3=(int)(450*(rsu.getDu3()/tot));
		  
		int sper1=(int)(100*(rsu.getS1()/tot));
		int sper2=(int)(100*(rsu.getS2()/tot));
		int sper3=(int)(100*(rsu.getS3()/tot)); 
		int sper4=(int)(100*(rsu.getS4()/tot));
		int sper5=(int)(100*(rsu.getS5()/tot));
		
    	model.addAttribute("bper0",bper0); 
		model.addAttribute("bper1",bper1);
		model.addAttribute("bper2",bper2);
		model.addAttribute("bper3",bper3);
		  
		model.addAttribute("dper0",dper0);
		model.addAttribute("dper1",dper1);
		model.addAttribute("dper2",dper2);
		model.addAttribute("dper3",dper3);
		 
		model.addAttribute("duper0",duper0);
		model.addAttribute("duper1",duper1);
		model.addAttribute("duper2",duper2);
		model.addAttribute("duper3",duper3);

		model.addAttribute("sper1",sper1);
		model.addAttribute("sper2",sper2);
		model.addAttribute("sper3",sper3);
		model.addAttribute("sper4",sper4);
		model.addAttribute("sper5",sper5); 		
		
		model.addAttribute("rsu", rsu);
		model.addAttribute("rlist", rlist);
		//model.addAttribute("sulist", sulist);
		//model.addAttribute("sdlist", sdlist);
		return "/mypage/review_list";
	}
	
	@Override // 리뷰 수정
	public String review_update(HttpServletRequest request, Model model)
	{
		String id=request.getParameter("id");
		
		ReviewVO rvo=mapper.review_update(id);
		rvo.setFimgs(rvo.getFname().split(","));
		
		model.addAttribute("rvo", rvo);
		return "/mypage/review_update";
	}
	
	@Override // 리뷰 수정 완료
	public String review_update_ok(HttpServletRequest request) throws Exception
	{
		String path=request.getRealPath("/resources/rimg");
		int size=1024*1024*10;
		MultipartRequest multi=new MultipartRequest(request, path,size,"utf-8",new DefaultFileRenamePolicy());
		
		String fnames="";
		Enumeration file=multi.getFileNames();
		
		while(file.hasMoreElements())
		{
		  String fname=file.nextElement().toString();
		  fnames=fnames+multi.getFilesystemName(fname)+",";
		}
		
		fnames=fnames+multi.getParameter("str");
		fnames=fnames.replace("null ,", "");
				
		int id=Integer.parseInt(multi.getParameter("id"));
		String title=multi.getParameter("title");
		String content=multi.getParameter("content");		
		int star=Integer.parseInt(multi.getParameter("star"));
		int bea_ev=Integer.parseInt(multi.getParameter("bea_ev"));
		int de_ev=Integer.parseInt(multi.getParameter("de_ev"));
		int du_ev=Integer.parseInt(multi.getParameter("du_ev"));
		
		ReviewVO rvo=new ReviewVO();
		
		rvo.setId(id);
		rvo.setTitle(title);
		rvo.setContent(content);
		rvo.setStar(star);
		rvo.setBea_ev(bea_ev);
		rvo.setDe_ev(de_ev);
		rvo.setDu_ev(du_ev);
		rvo.setFname(fnames);
		
		mapper.review_update_ok(rvo);
		
		String[] del=multi.getParameter("del").split(","); 
		
		for(int i=0;i<del.length;i++)
		{
			File ff=new File(path+"/"+del[i]);
			if(ff.exists())
			 ff.delete();
		}
			
		return "redirect:/mypage/review_list";
	}
	
	@Override  // 리뷰 삭제
	public String review_delete(HttpServletRequest request)
	{
		String id=request.getParameter("id");
		String path=request.getRealPath("resources/rimg");
		String[] fimg=mapper.getfname_review(id).split(",");
				
		for(int i=0;i<fimg.length;i++)
		{
			File ff=new File(path+"/"+fimg[i]);
			if(ff.exists())
			  ff.delete();
		}
				
		mapper.review_delete(id);
		
		return "redirect:/mypage/review_list";
	}
	
	@Override	// 좋아요 
    public String goodup(HttpServletRequest request)
    {
		String rpage=request.getParameter("rpage");
		String qpage=request.getParameter("qpage");
		String listup=request.getParameter("listup");
		
		String id=request.getParameter("id");
		mapper.goodup(id);
		
		return "redirect:/mypage/review_list?rpage="+rpage+"&qpage="+qpage+"&sct=1&listup="+listup;
				
    }
}
