package kr.co.hotel.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.hotel.mapper.AdminMapper;
import kr.co.hotel.mapper.CartwishMapper;

@Service
@Qualifier("cs")
public class CartwishServiceImpl implements CartwishService{
	
	@Autowired
	public CartwishMapper mapper;
	
}
