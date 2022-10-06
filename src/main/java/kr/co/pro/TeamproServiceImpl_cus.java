package kr.co.teampro.service;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
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

import kr.co.teampro.mapper.TeamproMapper;
import kr.co.teampro.vo.AnswerVo;
import kr.co.teampro.vo.FaqVo;
import kr.co.teampro.vo.HugiVo;
import kr.co.teampro.vo.PqnaVo;
import kr.co.teampro.vo.QnaVo;
import kr.co.teampro.vo.ReviewVo;
import kr.co.teampro.vo.TeamproVo;

@Service
@Qualifier("tps")
public class TeamproServiceImpl_cus implements TeamproService_cus {

	@Autowired
	private TeamproMapper tMapper;
	
	@Override  /*1:1문의 작성*/
	public String qna_write_ok(HttpSession session, QnaVo qvo)
	{
		tMapper.qna_write_ok(qvo);
		
		return "redirect:/cus_qna/qna_list";
	}
	
	@Override  /*1:1문의 목록*/
	public String qna_list(HttpSession session, Model model, HttpServletRequest request)
	{
		String userid=session.getAttribute("userid").toString();		
				
		// 문의 목록 페이징
		int page;
		if(request.getParameter("page") ==null)
			page=1;
		else
			page=Integer.parseInt(request.getParameter("page"));
		
		int index=(page-1)*10;
		int pstart,pend, chong;
		
		pstart=page/10;
		if(page%10 ==0)
			pstart=pstart-1;
		
		pstart=pstart*10+1;
		pend=pstart+9;
				
		chong=tMapper.getchong_cus(userid);		
		
		if(pend>chong)
			pend=chong;
				
		model.addAttribute("page", page);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("chong", chong);
		
		
		ArrayList<QnaVo> list=tMapper.qna_list_cus(userid,index);
		model.addAttribute("list", list);			
		
		return "/cus_qna/qna_list";
	}
	
	@Override /*1:1문의 본문 내용*/
	public String qna_content(HttpServletRequest request, Model model)
	{
		//  문의 내용 출력
		String id=request.getParameter("id");
	    QnaVo qvo=tMapper.qna_content(id);
	    qvo.setContent(qvo.getContent().replace("\r\n", "<br>"));	    
	    model.addAttribute("qvo", qvo);
		
	    // 답변 출력
        if(qvo.getState()==1) // 문의 상태 0 => 1
        {
        	AnswerVo avo=tMapper.qna_answer(id);
        	// qna_content에 바로 출력하기
    		model.addAttribute("avo", avo);
        }
        
		return "/cus_qna/qna_content";
	}
		
	@Override /*1:1문의 삭제*/
	public String qna_delete(HttpServletRequest request)
	{
		String id=request.getParameter("id");		
		tMapper.qna_delete(id);
		
		return "redirect:/cus_qna/qna_list";
	}
	
	@Override /*1:1문의 수정문*/
	public String qna_update(HttpServletRequest request, Model model)
	{
		String id=request.getParameter("id");
	    QnaVo qvo=tMapper.qna_content(id);
	    model.addAttribute("qvo", qvo);
	    
		return "/cus_qna/qna_update";
	}
	
	@Override /*1:1문의 수정 완료*/
	public String qna_update_ok(QnaVo qvo)
	{
		int id=qvo.getId();
		tMapper.qna_update_ok(qvo);
		
		return "redirect:/cus_qna/qna_content?id="+id;
	}
		
	
// faq 자주묻는 질문
		
	@Override // faq 목록
	public String faq_list(Model model) 
	{
		ArrayList<FaqVo> alist=tMapper.faq_list();
		for(int i=0;i<alist.size();i++)
		{
			alist.get(i).setAnswer(alist.get(i).getAnswer().replace("\r\n","<br>"));
			alist.get(i).setQuestion(alist.get(i).getQuestion().replace("\r\n","<br>"));
		}
		
		ArrayList<FaqVo> rlist=tMapper.faq_re();
		for(int i=0;i<rlist.size();i++)
		{
			rlist.get(i).setAnswer(rlist.get(i).getAnswer().replace("\r\n","<br>"));
			rlist.get(i).setQuestion(rlist.get(i).getQuestion().replace("\r\n","<br>"));
		}
		
		ArrayList<FaqVo> slist=tMapper.faq_ser();
		for(int i=0;i<slist.size();i++)
		{
			slist.get(i).setAnswer(slist.get(i).getAnswer().replace("\r\n","<br>"));
			slist.get(i).setQuestion(slist.get(i).getQuestion().replace("\r\n","<br>"));
		}
		
		ArrayList<FaqVo> mlist=tMapper.faq_mem();
		for(int i=0;i<mlist.size();i++)
		{
			mlist.get(i).setAnswer(mlist.get(i).getAnswer().replace("\r\n","<br>"));
			mlist.get(i).setQuestion(mlist.get(i).getQuestion().replace("\r\n","<br>"));
		}
		
		ArrayList<FaqVo> elist=tMapper.faq_etc();
		for(int i=0;i<elist.size();i++)
		{
			elist.get(i).setAnswer(elist.get(i).getAnswer().replace("\r\n","<br>"));
			elist.get(i).setQuestion(elist.get(i).getQuestion().replace("\r\n","<br>"));
		}
		
		model.addAttribute("alist", alist);
		model.addAttribute("rlist", rlist);  /*rlist*/
		model.addAttribute("slist", slist);  /*slist*/
		model.addAttribute("mlist", mlist);  /*mlist*/
		model.addAttribute("elist", elist);  /*elist*/
		
		return "/cus_faq/faq_list";
	}
	
// 이용 후기
	@Override
	public String hugi_write(HttpServletRequest request, Model model)
	{
		// 예약한 방 타입구하기
	    String bid=request.getParameter("bid"); // 예약 id
	    
	    int grade=tMapper.getGrade(bid);
	    
	    model.addAttribute("grade", grade);
	    model.addAttribute("bid", bid);
		
		return "/cus_hugi/hugi_write";	
	}
	
	@Override  /*이용 후기 작성*/
	public String hugi_write_ok(HttpSession session, HttpServletRequest request) throws Exception
	{
		String path=request.getRealPath("resources/himg");
		int size=1024*1024*10;
		MultipartRequest multi=new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());
				
		String userid=session.getAttribute("userid").toString();
		String name=session.getAttribute("name").toString();
		String title=multi.getParameter("title");
		String content=multi.getParameter("content");
		int grade=Integer.parseInt(multi.getParameter("grade"));
		int bid=Integer.parseInt(multi.getParameter("bid"));
		int star=Integer.parseInt(multi.getParameter("star"));
		
		String fnames="";
	     
        Enumeration file=multi.getFileNames();
          
	    while(file.hasMoreElements())
	     {
	    	// System.out.println(file.nextElement().toString());
	        String fname=file.nextElement().toString();
		    fnames=fnames+multi.getFilesystemName(fname)+",";
	     }
	       
	    fnames=fnames.replace("null,", "");
        
        if(fnames.length()==0)  // 사진을 등록하지 않을 경우 호텔 로고가 들어감
        	fnames="logo.gif,";
        
        //System.out.println(fnames);
	 	
		HugiVo hvo=new HugiVo();
		hvo.setTitle(title);
		hvo.setName("name"); //name -> 섹션값 받으면 바꾸기
		hvo.setUserid("userid");  //userid  -> 섹션값 받으면 바꾸기
		hvo.setContent(content);
		hvo.setGrade(grade);
		hvo.setBid(bid);
		hvo.setFname(fnames);
		hvo.setStar(star);
		
		tMapper.hugi_write_ok(hvo);
		
		return "redirect:/cus_hugi/hugi_list";
	}
	
	@Override // 이용 후기 목록
	public String hugi_list(HttpServletRequest request,Model model)
	{		
	    int page,index,pstart,pend,chong;
		if(request.getParameter("page")==null)
			page=1;
		else
			page=Integer.parseInt(request.getParameter("page"));
			
		index=(page-1)*12;
		
		pstart=page/10;
		if(page%10==0)
			pstart=pstart-1;
		
		pstart=pstart*10+1;
		pend=pstart+9;
		
		chong=tMapper.getchong_hugi_ad(); 
		
		if(pend>chong)
			pend=chong;
				
		ArrayList<HugiVo> hlist=tMapper.hugi_list(index);
		
		for(int i=0;i<hlist.size();i++)
		{
			// 이름 별표
			String name=hlist.get(i).getName();
			char n1=name.charAt(0);
			char n2=name.charAt(name.length()-1);
			//System.out.println(n1+" "+n2);
			String n3="";
			for(int j=1;j<=name.length()-2;j++)
			  n3=n3+"*";
		
			String nn=n1+n3+n2;
			//System.out.println(nn);
			hlist.get(i).setName(nn);
			
			// 제목 나머지 ...(8자)
			if(hlist.get(i).getTitle().length()>15)
			{
			   String title=hlist.get(i).getTitle().substring(0, 15)+"···";
		       hlist.get(i).setTitle(title);
			}
			
			//System.out.println(nn+title);
		}
		
		model.addAttribute("hlist", hlist);
		model.addAttribute("page", page);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("chong", chong);		
		
		return "/cus_hugi/hugi_list";
	}
	
	@Override // 이용 후기 목록(개인)
	public String hugi_list_cus(HttpServletRequest request, HttpSession session, Model model)
	{
		String userid=session.getAttribute("userid").toString();	
		
		int page,index,pstart,pend,chong;
		if(request.getParameter("page")==null)
			page=1;
		else
			page=Integer.parseInt(request.getParameter("page"));
			
		index=(page-1)*12;
		
		pstart=page/10;
		if(page%10==0)
			pstart=pstart-1;
		
		pstart=pstart*10+1;
		pend=pstart+9;
		
		chong=tMapper.getchong_hugi_cus(userid); 
		
		if(pend>chong)
			pend=chong;
				
		ArrayList<HugiVo> hlist=tMapper.hugi_list_cus(userid,index);
        //System.out.println(hlist.size());
		for(int i=0;i<hlist.size();i++)
		{
			// 이름 별표
			String name=hlist.get(i).getName();
			char n1=name.charAt(0);
			char n2=name.charAt(name.length()-1);
			//System.out.println(n1+" "+n2);
			String n3="";
			for(int j=1;j<=name.length()-2;j++)
			  n3=n3+"*";
		
			String nn=n1+n3+n2;
			//System.out.println(nn);
			hlist.get(i).setName(nn);
			
			// 제목 나머지 ...(8자)
			if(hlist.get(i).getTitle().length()>15)
			{
			   String title=hlist.get(i).getTitle().substring(0, 15)+"···";
		       hlist.get(i).setTitle(title);
			}
			
			//System.out.println(nn+title);
		}
		
		model.addAttribute("hlist", hlist);
		model.addAttribute("page", page);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("chong", chong);
		
		return "/cus_hugi/hugi_list_cus";
	}
	
	@Override // 이용 후기 조회수
	public String hugi_readnum(HttpServletRequest request)
	{
		String id=request.getParameter("id");
		tMapper.hugi_readnum(id);
		
		return "redirect:/cus_hugi/hugi_content?id="+id;
	}
	
	@Override // 이용 후기 본문
	public String hugi_content(HttpServletRequest request, Model model)	
	{
		String id=request.getParameter("id");
		HugiVo hvo=tMapper.hugi_content(id);
		hvo.setContent(hvo.getContent().replace("\r\n","<br>"));
		hvo.setWriteday(hvo.getWriteday().replace("-","."));
		
		String[] fimg=hvo.getFname().split(",");
		
		String name=hvo.getName();
		char n1=name.charAt(0);
		char n2=name.charAt(name.length()-1);
		String n3="";
		for(int j=1;j<=name.length()-2;j++)
		  n3=n3+"*";
	
		String nn=n1+n3+n2;
		//System.out.println(nn);
		hvo.setName(nn);
				
		model.addAttribute("hvo", hvo);
		model.addAttribute("fimg", fimg);
		
		return "/cus_hugi/hugi_content";
	}
	
	@Override // 이용 후기 수정
	public String hugi_update(HttpServletRequest request, Model model)
	{
		String id=request.getParameter("id");
		HugiVo hvo=tMapper.hugi_content(id);
        hvo.setWriteday(hvo.getWriteday().replace("-","."));
		
		String[] fimg=hvo.getFname().split(",");
		
		model.addAttribute("hvo", hvo);
		model.addAttribute("fimg", fimg);
		
	    return "/cus_hugi/hugi_update";	
	}
	
	@Override // 이용 후기 수정 완료
	public String hugi_update_ok(HttpServletRequest request) throws Exception
	{
		String path=request.getRealPath("resources/himg");
		int size=1024*1024*10;
		MultipartRequest multi=new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());
				
		String fnames="";
	     
        Enumeration file=multi.getFileNames();
          
	    while(file.hasMoreElements())
	     {
	    	// System.out.println(file.nextElement().toString());
	        String fname=file.nextElement().toString();
		    fnames=fnames+multi.getFilesystemName(fname)+",";
	     }
		
	    fnames=fnames.replace("null,", "")+multi.getParameter("str");
	    
	    if(fnames.length()==0)  // 사진을 등록하지 않을 경우 호텔 로고가 들어감
        	fnames="logo.gif,";
	    
	    String title=multi.getParameter("title");
		String content=multi.getParameter("content");		
		int star=Integer.parseInt(multi.getParameter("star")); 
		int id=Integer.parseInt(multi.getParameter("id"));
	 	
		HugiVo hvo=new HugiVo();
		hvo.setId(id);
		hvo.setTitle(title);
		hvo.setContent(content);
		hvo.setFname(fnames);
		hvo.setStar(star);
		
		tMapper.hugi_update_ok(hvo);
		
		String[] del=multi.getParameter("del").split(",");
		
			for(int i=0;i<del.length;i++)
	 	      {
				 if(del[i] != "logo.gif")
			     {
					 File ff=new File(path+"/"+del[i]);
					 if(ff.exists())
					  ff.delete();
			     }
			     
	 	       }
		
		return "redirect:/cus_hugi/hugi_content?id="+id;
	}
	
	@Override // 이용 후기 삭제
	public String hugi_delete(HttpServletRequest request)
	{
		String id=request.getParameter("id");			
		
		String path=request.getRealPath("resources/himg");
		String[] img=tMapper.getfname(id).split(",");
		
		for(int i=0;i<img.length;i++)
		{
			if(img[i] != "logo.gif")
		     {
				 File ff=new File(path+"/"+img[i]);
				 if(ff.exists())
				  ff.delete();
		     }
		}
		
	    tMapper.hugi_delete(id);
		
		return "redirect:/cus_hugi/hugi_list";
	}

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
				
		ReviewVo rvo=new ReviewVo();
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
		
		tMapper.review_write_ok(rvo);
		tMapper.review_state(gid); // 후기 달았다는 상태로 변환
		
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
		 
		  rchong=tMapper.getchong_review();  

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
		   String ss=tMapper.getstarsu(i);
		   starsu=starsu+ss+",";
		}
		
		String beasu="";
		String desu="";
		String dusu="";
		for(int i=0;i<3;i++)
		{
		   String bb=tMapper.getbeasu(i);
		   beasu=beasu+bb+",";
		   String dde=tMapper.getdesu(i);
		   //System.out.println(dde);
		   desu=desu+dde+",";
		   String ddu=tMapper.getdusu(i);
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
		
		ReviewVo rsu=new ReviewVo();
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
		ArrayList<ReviewVo> rlist=tMapper.review_list(aa,rindex);
 		  
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
		  
		int cnt=tMapper.getcnt_review(); // (pcode) -> sql문도 #{param1}로 변경
		double avg=tMapper.getavg_review(); // (pcode) -> sql문도 #{param1}로 변경
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
		
		ReviewVo rvo=tMapper.review_update(id);
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
		
		ReviewVo rvo=new ReviewVo();
		
		rvo.setId(id);
		rvo.setTitle(title);
		rvo.setContent(content);
		rvo.setStar(star);
		rvo.setBea_ev(bea_ev);
		rvo.setDe_ev(de_ev);
		rvo.setDu_ev(du_ev);
		rvo.setFname(fnames);
		
		tMapper.review_update_ok(rvo);
		
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
		String[] fimg=tMapper.getfname_review(id).split(",");
				
		for(int i=0;i<fimg.length;i++)
		{
			File ff=new File(path+"/"+fimg[i]);
			if(ff.exists())
			  ff.delete();
		}
				
		tMapper.review_delete(id);
		
		return "redirect:/mypage/review_list";
	}
	
	@Override	// 좋아요 
    public String goodup(HttpServletRequest request)
    {
		String rpage=request.getParameter("rpage");
		String qpage=request.getParameter("qpage");
		String listup=request.getParameter("listup");
		
		String id=request.getParameter("id");
		tMapper.goodup(id);
		
		return "redirect:/mypage/review_list?rpage="+rpage+"&qpage="+qpage+"&sct=1&listup="+listup;
				
    }
	
	
/*상품 qna*/
	@Override// 상품 qna 작성
	public String pqna_write(HttpServletRequest request, Model model)
	{
		/*
		 product 체이블 생성 되면 활성화 하기  
		String pcode=request.getParameter("pcode");
		String ptitle=tMapper.getptitle(pcode);*/
		
		return "/mypage/pqna_write";
	}
	
	@Override // 상품 qna 질문 작성 완료
    public String pqna_write_ok(HttpSession session, PqnaVo pvo)
    {
		/* System.out.println(pvo.getBimil());*/
		/*String userid=session.getAttribute("userid").toString();*/
		String userid="userid";
		
		pvo.setUserid(userid);
		
		tMapper.pqna_write_ok(pvo);
		
		return "redirect:/mypage/pqna_list";
		// redirect:/product/pro_content?pcode= +pcode
    }
	
	@Override
	public String pqna_list(HttpServletRequest request, Model model)
	{
		/*
		 String pcode=request.getParameter("pcode"); 꼭 다시 살려서 mapper에 반영
		 
		 ArrayList<PqnaVo> plist=tMapper.pqna_list(pcode); 
		 model.addAttribute("pcode", pcode);
		 
		  */ 
		/*System.out.println("123");
		System.out.println(request.getParameter("rpage"));
		System.out.println("456");*/
		String sct;
		if(request.getParameter("sct")==null)
			sct="0";
		else
		    sct=request.getParameter("sct");
		
		String rpage;
		if(request.getParameter("rpage")==null || request.getParameter("rpage")== "")
			rpage="1";
		else
		  rpage=request.getParameter("rpage");
		
		 int listup;
		 if(request.getParameter("listup")==null)
			  listup=1;
		 else
			 listup=Integer.parseInt(request.getParameter("listup"));
		
		/*System.out.println("123");
		System.out.println(rpage);
		System.out.println("456");*/
		
		int qpage,qindex,qpstart,qpend,qchong;
		if(request.getParameter("qpage")==null)
			qpage=1;
		else
			qpage=Integer.parseInt(request.getParameter("qpage"));
			
		qindex=(qpage-1)*10;
		
		qpstart=qpage/10;
		if(qpage%10==0)
			qpstart=qpstart-1;
		
		qpstart=qpstart*10+1;
		qpend=qpstart+9;
		
		qchong=tMapper.getchong_pqna(); //(pcode) 
		
		if(qpend>qchong)
			qpend=qchong;
		
		model.addAttribute("qpage",qpage); 
		model.addAttribute("qpstart",qpstart);
		model.addAttribute("qpend",qpend);
		model.addAttribute("qchong",qchong);
		model.addAttribute("sct", sct);
		model.addAttribute("rpage", rpage);
		
		ArrayList<PqnaVo> plist=tMapper.pqna_list(qindex);
		
		for(int i=0;i<plist.size();i++)
		{
		   plist.get(i).setQuestion(plist.get(i).getQuestion().replace("\r\n","<br>"));
		   
		   if(plist.get(i).getAnswer()!=null)
		    plist.get(i).setAnswer(plist.get(i).getAnswer().replace("\r\n","<br>"));
		   
		   plist.get(i).setUserid(plist.get(i).getUserid().substring(0,2)+"***");
		}
				
		model.addAttribute("plist", plist);
		
		return "mypage/pqna_list";
	}
	
	@Override // 상품 qna 수정
	public String pqna_update(HttpServletRequest request,Model model)
	{
		String id=request.getParameter("id");
		
		PqnaVo pvo=tMapper.pqna_update(id);
		
		model.addAttribute("pvo", pvo);
		return "/mypage/pqna_update";
	}
	
	@Override // 상품 qna 질문 완료
	public String pqna_update_ok(PqnaVo pvo)
	{
		tMapper.pqna_update_ok(pvo);
		return "redirect:/mypage/pqna_list";
	}
	
	@Override // 상품 qna 삭제
	public String pqna_delete(HttpServletRequest request)
	{
		String id=request.getParameter("id");
		
		tMapper.pqna_delete(id);
		
		return "redirect:/mypage/pqna_list";
    }
	
	@Override // 상품 qna 답변
    public String pqna_answer(HttpServletRequest request,Model model)
    {
		String id=request.getParameter("id");
		PqnaVo pvo=tMapper.pqna_update(id); //update 그대로 사용
		pvo.setQuestion(pvo.getQuestion().replace("\r\n", "<br>"));
		model.addAttribute("pvo", pvo);
		return "/mypage/pqna_answer";
    }
	
	@Override // 상품 qna 답변 완료
	public String pqna_answer_ok(PqnaVo pvo)
	{
		tMapper.pqna_answer_ok(pvo);
		
		return "redirect:/mypage/pqna_list";
	}
	
	@Override // 상품 qna 답변 수정
	public String qanswer_update(HttpServletRequest request, Model model)
	{
		String id=request.getParameter("id");
		
		PqnaVo pvo=tMapper.pqna_update(id); //update 그대로 사용
		pvo.setQuestion(pvo.getQuestion().replace("\r\n", "<br>"));
		
		model.addAttribute("pvo", pvo);
		return "/mypage/qanswer_update";
	}
	
	@Override // 상품 qna 답변 수정 완료
	public String qanswer_update_ok(PqnaVo pvo) // 상품 qna 답변 수정 완료
	{
		tMapper.qanswer_update_ok(pvo);
		
		return "redirect:/mypage/pqna_list";
	}
	
}
