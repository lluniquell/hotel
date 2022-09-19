package kr.co.hotel.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.hotel.mapper.AdminMapper;
import kr.co.hotel.mapper.QuestionMapper;

@Service
@Qualifier("qs")
public class QuestionServiceImpl implements QuestionService{
	
	@Autowired
	public QuestionMapper mapper;
	
}
