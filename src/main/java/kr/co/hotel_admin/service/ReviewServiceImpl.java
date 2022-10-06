package kr.co.hotel_admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.hotel_admin.mapper.AdminMapper;
import kr.co.hotel_admin.mapper.ReviewMapper;

@Service
@Qualifier("rs")
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	public ReviewMapper mapper;
	
}
