package kr.co.hotel.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.hotel.mapper.AdminMapper;
import kr.co.hotel.mapper.GoodsMapper;

@Service
@Qualifier("gs")
public class GoodsServiceImpl implements GoodsService{
	
	@Autowired
	public GoodsMapper mapper;
	
}
