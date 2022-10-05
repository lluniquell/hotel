package kr.co.hotel_admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.hotel_admin.mapper.AdminMapper;

@Service
@Qualifier("as")
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	public AdminMapper mapper;
	
}
