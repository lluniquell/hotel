package kr.co.hotel.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.hotel.mapper.FaqMapper;
import kr.co.hotel.vo.FaqVO;

@Service
@Qualifier("fs")
public class FaqServiceImpl implements FaqService{

	@Autowired
	public FaqMapper mapper;
	

	// faq 자주묻는 질문
			
		@Override // faq 목록
		public String faq_list(Model model) 
		{
			ArrayList<FaqVO> alist=mapper.faq_list();
			for(int i=0;i<alist.size();i++)
			{
				alist.get(i).setAnswer(alist.get(i).getAnswer().replace("\r\n","<br>"));
				alist.get(i).setQuestion(alist.get(i).getQuestion().replace("\r\n","<br>"));
			}
			
			ArrayList<FaqVO> rlist=mapper.faq_re();
			for(int i=0;i<rlist.size();i++)
			{
				rlist.get(i).setAnswer(rlist.get(i).getAnswer().replace("\r\n","<br>"));
				rlist.get(i).setQuestion(rlist.get(i).getQuestion().replace("\r\n","<br>"));
			}
			
			ArrayList<FaqVO> slist=mapper.faq_ser();
			for(int i=0;i<slist.size();i++)
			{
				slist.get(i).setAnswer(slist.get(i).getAnswer().replace("\r\n","<br>"));
				slist.get(i).setQuestion(slist.get(i).getQuestion().replace("\r\n","<br>"));
			}
			
			ArrayList<FaqVO> mlist=mapper.faq_mem();
			for(int i=0;i<mlist.size();i++)
			{
				mlist.get(i).setAnswer(mlist.get(i).getAnswer().replace("\r\n","<br>"));
				mlist.get(i).setQuestion(mlist.get(i).getQuestion().replace("\r\n","<br>"));
			}
			
			ArrayList<FaqVO> elist=mapper.faq_etc();
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
}
