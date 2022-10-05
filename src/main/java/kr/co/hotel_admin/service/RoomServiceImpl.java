package kr.co.hotel_admin.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.hotel_admin.mapper.RoomMapper;
import kr.co.hotel_admin.vo.RoomVO;

@Service
@Qualifier("rs")
public class RoomServiceImpl implements RoomService{

	@Autowired
	public RoomMapper mapper;

	@Override
	public String list(Model model) {
		ArrayList<RoomVO> list=mapper.list();
		model.addAttribute("list",list);
		return "/room/list";
	}

	@Override
	public String add_room() {

		return "/room/add_room";
	}

	@Override
	public String add_room_ok(RoomVO rvo) {
		mapper.add_room_ok(rvo);
		return "redirect:/room/list";
	}

	@Override
	public String update_room(RoomVO rvo, Model model) {
		RoomVO list=mapper.update_room(rvo);
		model.addAttribute("rvo",list);
		return "/room/update_room";
	}

	@Override
	public String del_room(RoomVO rvo) {
		mapper.del_room(rvo);
		return "redirect:/room/list";
	}
	
}
