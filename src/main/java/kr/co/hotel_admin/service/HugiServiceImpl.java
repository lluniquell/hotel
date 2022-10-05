package kr.co.hotel_admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.hotel_admin.mapper.HugiMapper;

@Service
@Qualifier("hs")
public class HugiServiceImpl implements HugiService{

	@Autowired
	public HugiMapper mapper;
}
