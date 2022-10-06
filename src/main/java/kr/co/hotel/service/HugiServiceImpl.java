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

import kr.co.hotel.mapper.HugiMapper;
import kr.co.hotel.vo.HugiVO;

@Service
@Qualifier("hs")
public class HugiServiceImpl implements HugiService{

	@Autowired
	public HugiMapper mapper;

	// 이용 후기
		@Override
		public String hugi_write(HttpServletRequest request, Model model)
		{
			// 예약한 방 타입구하기
		    String bid=request.getParameter("bid"); // 예약 id
		    
		    int grade=mapper.getGrade(bid);
		    
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
		 	
			HugiVO hvo=new HugiVO();
			hvo.setTitle(title);
			hvo.setName("name"); //name -> 섹션값 받으면 바꾸기
			hvo.setUserid("userid");  //userid  -> 섹션값 받으면 바꾸기
			hvo.setContent(content);
			hvo.setGrade(grade);
			hvo.setBid(bid);
			hvo.setFname(fnames);
			hvo.setStar(star);
			
			mapper.hugi_write_ok(hvo);
			
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
			
			chong=mapper.getchong_hugi_ad(); 
			
			if(pend>chong)
				pend=chong;
					
			ArrayList<HugiVO> hlist=mapper.hugi_list(index);
			
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
			
			chong=mapper.getchong_hugi_cus(userid); 
			
			if(pend>chong)
				pend=chong;
					
			ArrayList<HugiVO> hlist=mapper.hugi_list_cus(userid,index);
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
			mapper.hugi_readnum(id);
			
			return "redirect:/cus_hugi/hugi_content?id="+id;
		}
		
		@Override // 이용 후기 본문
		public String hugi_content(HttpServletRequest request, Model model)	
		{
			String id=request.getParameter("id");
			HugiVO hvo=mapper.hugi_content(id);
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
			HugiVO hvo=mapper.hugi_content(id);
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
		 	
			HugiVO hvo=new HugiVO();
			hvo.setId(id);
			hvo.setTitle(title);
			hvo.setContent(content);
			hvo.setFname(fnames);
			hvo.setStar(star);
			
			mapper.hugi_update_ok(hvo);
			
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
			String[] img=mapper.getfname(id).split(",");
			
			for(int i=0;i<img.length;i++)
			{
				if(img[i] != "logo.gif")
			     {
					 File ff=new File(path+"/"+img[i]);
					 if(ff.exists())
					  ff.delete();
			     }
			}
			
			mapper.hugi_delete(id);
			
			return "redirect:/cus_hugi/hugi_list";
		}
	
}
