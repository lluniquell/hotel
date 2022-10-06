package kr.co.hotel_admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hotel_admin.service.RoomService;
import kr.co.hotel_admin.vo.RoomVO;

@Controller
public class RoomController {

	@Autowired
	@Qualifier("rs")
	private RoomService service;
	
	@RequestMapping("room/list")
	public String list(Model model)
	{
		return service.list(model);
	}
	
	@RequestMapping("room/add_room")
	public String add_room()
	{
		return service.add_room();
	}
	
	@RequestMapping("room/add_room_ok")
	public String add_room_ok(RoomVO rvo)
	{
		return service.add_room_ok(rvo);
	}
	
	@RequestMapping("room/update_room")
	public String update_room(RoomVO rvo, Model model)
	{
		return service.update_room(rvo, model);
	}
	
	@RequestMapping("room/del_room")
	public String del_room(RoomVO rvo)
	{
		return service.del_room(rvo);
	}
}
